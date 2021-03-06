package com.app.cq.web.cq;

import com.app.common.model.DataDict;
import com.app.common.service.DataDictService;
import com.app.cq.model.Education;
import com.app.cq.model.Family;
import com.app.cq.service.EducationService;
import com.app.cq.service.FamilyService;
import com.app.cq.utils.HttpClientUtil;
import com.sqds.page.PageInfo;
import com.sqds.utils.StringUtils;
import com.sqds.web.ParamUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Controller
@RequestMapping("/cq/education/*")
public class EducationCheckController {
    @Autowired
    private EducationService educationService;
    @Autowired
    private FamilyService familyService;
    @Autowired
    private DataDictService dataDictService;

    /**
     * 获取html
     * @throws IOException
     * @throws InterruptedException
     */
    public String getHTML(HttpServletRequest request,String educationCode) throws IOException, InterruptedException {
            String html = HttpClientUtil.getWebPage("https://www.chsi.com.cn/xlcx/bg.do?vcode=" + educationCode);
            if(html.indexOf("请输入验证码以继续当前操作") > 0){
                System.out.println(html);
                String regex = "(?is)name='capachatok'.*?value='(.*?)'.*?cap=(.*?)'";
                Pattern pattern = Pattern.compile(regex);
                Matcher matcher = pattern.matcher(html);

                if(matcher.find()){
                    String capachatok = matcher.group(1);
                    String cap = matcher.group(2);
                    System.out.println(capachatok);
                    System.out.println(cap);

                    String html1 = HttpClientUtil.getWebPage("https://www.chsi.com.cn/capachaimg.jpg?cap="+cap);

                    Thread.sleep(1000);
                    String html2 = HttpClientUtil.getWebPage("https://www.chsi.com.cn/xlcx/yzm.do?capachatok="+capachatok+"&cap="+cap);
                    System.out.println(html2);
                    System.out.println("=====================");

                    Thread.sleep(2000);
                    return html2;
                }
            }else {
                return html;
            }
        return html;
    }

    /**
     * 判断学历核验错误原因
     */
    public boolean judge(Family family,Education education){
        boolean a = true;
        String educationTrouble = "";
        String name = education.getName();
        String learning = education.getLearning();
        String level = education.getLevel();

        if (!StringUtils.getNotNullString(family.getName()).equals(name)){
            a=false;
            educationTrouble += "姓名不一致(学信网名称为：" + name + "),";
        }

        List<DataDict> educationLevels = dataDictService.getDataDictList("学历层次");
        Integer levelCheck = 0;
        String levelCheckName = "";
        for (DataDict dataDict : educationLevels){
            if (dataDict.getAttributeName().equals(level)){
                levelCheck = Integer.valueOf(dataDict.getAttributeValue());
                levelCheckName = dataDict.getAttributeName();
            }
        }

        if (StringUtils.getNotNullString(family.getName()).equals(name) && StringUtils.getNotNullString(family.getLearning()).contains("全日制")){
            a=true;
        }
        //学习形式不包含全日制的复核不通过
        if(!StringUtils.getNotNullString(family.getLearning()).contains("全日制")){
            a=false;
            educationTrouble += "学习形式填写有误请核验,";
        }else if (!StringUtils.getNotNullString(family.getLearning()).equals(learning.equals("普通全日制") ? "全日制" : learning)){
            a=false;
            educationTrouble += "学习形式有误(学信网学习形式为：" + learning + "),";
        }

        if (levelCheck != family.getEducation()){
            a=false;
            educationTrouble += "学历层次不一致(学信网学历层次为：" + levelCheckName + ")";
        }

        if (educationTrouble.endsWith(",")){
            educationTrouble = educationTrouble.substring(0,educationTrouble.length()-1);
        }

        family.setEducationTrouble(educationTrouble);
        if (a == true){
            family.setEducationStatus(2);
            family.setEducationTrouble("");
        }
        if (a == false){
            family.setEducationStatus(3);
        }
        if (family.getEducationStatus() == 1){
            family.setEducationTrouble("");
        }
        this.familyService.save(family);
        return a;
    }

    /**
     * 解析html
     */
    @RequestMapping("handleHTML")
    @ResponseBody
    public Map handleHTML(HttpServletRequest request){
        PageInfo<Family> pageInfo = new PageInfo<Family>();
        pageInfo.setPageSize(Integer.MAX_VALUE);
        Map<String,String> map = new HashMap<>();
        //将学历在线验证码为空的家庭改为学历未复核
        PageInfo<Family> pageInfo1 = this.familyService.listEducationNull(pageInfo, request);
        for (Family family:pageInfo1.getResult()) {
            family.setEducationStatus(1);
            this.familyService.save(family);
        }
        String projectName1 = ParamUtils.getString(request, "projectName", "");
        String type = ParamUtils.getString(request, "type", "");

        if (!projectName1.equals("")){
            pageInfo = familyService.listEducationCheckByProject(pageInfo,request,projectName1);
        }else {
            pageInfo = familyService.listEducationCheck(pageInfo, request);
        }

        if (type.equals("unEducation")){//只更新审核不通过状态的成员
            pageInfo = familyService.listUnEducationCheck(pageInfo,request);
        }

        List<Family> result = pageInfo.getResult();
        for (int i = 0; i <result.size() ; i++) {
            String html = null;
            String educationCode = result.get(i).getEducationCode();
            String projectName = result.get(i).getProjectName();
            Family family = this.familyService.findByEducationCode(educationCode,projectName);
            Education education = this.educationService.findByFId(family.getId());
            //判断在线验证码是否够12位数
            if(educationCode.trim().length() == 12){
                try {
                    html = this.getHTML(request,educationCode.trim());
                } catch (IOException e) {
                    e.printStackTrace();
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                Document doc = Jsoup.parse(html);

                String title = doc.title(); // "An example link"
                if (title.contains("教育部学籍在线验证报告")){
                    family.setEducationTrouble("此在线验证码为学籍验证码！请提供学历验证码");
                    family.setEducationStatus(3);
                    familyService.save(family);
                    continue;
                }

                String text = doc.body().text(); // "An example link"
                if (text.contains("此在线验证码无效")){
                    family.setEducationTrouble("此在线验证码无效！请提供正确验证码");
                    family.setEducationStatus(3);
                    familyService.save(family);
                    continue;
                }
                if (text.contains("过期")){
                    family.setEducationTrouble("此在线验证码过期！请提供正确验证码");
                    family.setEducationStatus(3);
                    familyService.save(family);
                    continue;
                }
                if (text.contains("在线验证报告已关闭")){
                    family.setEducationTrouble("在线验证报告已关闭，无法在线验证");
                    family.setEducationStatus(3);
                    familyService.save(family);
                    continue;
                }
                education = education == null ? new Education() : education;
                this.educationService.saveEducationFromHTML(text,family,education);
                this.judge(family,education);
            }else {
                family.setEducationStatus(3);
                family.setEducationTrouble("在线验证码长度有误");
                this.familyService.save(family);
            }
        }
        map.put("message","本次共核验学历状态" + pageInfo.getResult().size() + "条!");
        return map;
    }
}
