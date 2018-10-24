package com.app.cq.web.cq.jfManager;

import com.app.common.model.DataDict;
import com.app.common.service.DataDictService;
import com.app.cq.model.Family;
import com.app.cq.model.House;
import com.app.cq.model.Project;
import com.app.cq.service.FamilyService;
import com.app.cq.service.HouseService;
import com.app.cq.service.ProjectService;
import com.google.common.collect.Maps;
import com.sqds.exception.SqdsException;
import com.sqds.page.PageInfo;
import com.sqds.utils.Collections3;
import com.sqds.utils.pdf.PdfDocumentGenerator;
import com.sqds.web.ParamUtils;
import com.sqds.web.Servlets;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/cq/jfManager/*")
public class JfManagerController {

    @Autowired
    private FamilyService familyService;
    @Autowired
    private DataDictService dataDictService;
    @Autowired
    private ProjectService projectService;
    @Autowired
    private HouseService houseService;

    /**
     * 交房列表
     * @param request
     * @param modelMap
     */
    @RequestMapping("list")
    public void list(HttpServletRequest request, ModelMap modelMap){
        PageInfo<Family> pageInfo = new PageInfo<>();
        Servlets.initPageInfo(request,pageInfo);
        pageInfo = this.familyService.getJfList(pageInfo);
        modelMap.addAttribute("pageInfo",pageInfo);
    }

    /**
     * 交房表单
     * @param request
     * @param modelMap
     */
    @RequestMapping("form")
    public void form(HttpServletRequest request,ModelMap modelMap){
        Integer familyId = ParamUtils.getInt(request,"familyId",0);
        Family family = this.familyService.get(familyId);
        if (family == null){
            throw new SqdsException("家庭不存在请核查");
        }
        modelMap.addAttribute("family",family);
    }


    /**
     * 交房保存
     * @param request
     * @return
     */
    @RequestMapping("save")
    public String save(HttpServletRequest request){
        this.familyService.saveJf(request);
        //计算方法
        return "redirect:list?" + request.getAttribute("searchParams");
    }

    /**
     * 交房验收单
     *
     * @param request
     * @param model
     */
    @RequestMapping("printJfFrame")
    public void printJfFrame(HttpServletRequest request, ModelMap model) { //得到id
        Integer familyId = ParamUtils.getInt(request, "familyId", 0);
        Family family = this.familyService.get(familyId);
        model.addAttribute("family", family);
    }

    /**
     * 打印交房验收单
     * @param request
     */
    @RequestMapping("printJfPDF")
    public void printJfPDF(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Integer familyId = ParamUtils.getInt(request, "familyId", 0);
        Family family = familyService.get(familyId);

        String template = null;
        if (family == null) {
            throw new SqdsException("家庭信息不存在！");
        } else {
            Map map = Maps.newHashMap();
            String bdCode = family.getBdCode();
            List<DataDict> bdList = dataDictService.getDataDictList("分指");
            String bdCodeName = "";
            for (int i = 0; i <bdList.size() ; i++) {
                if (bdList.get(i).getAttributeValue().equals(bdCode)){
                    bdCodeName = bdList.get(i).getAttributeName();
                }
            }


            DataDict dataDict = dataDictService.getDataDict("访问地址");
            String url1 = "";
            if (family.getLastCheckStatus() != 2) {
                url1 = dataDict.getAttributeValue() + "/static/image/bg.jpg";//添加水印
            }

            int houseListSize = houseService.getHouseListByFamilyId(familyId).size();

            String jfSub = null;
                jfSub = family.getJfDate().toString();

            String year = jfSub.substring(0, 4);
            String month = jfSub.substring(5, 7);
            String day = jfSub.substring(8, 10);
            String hour = jfSub.substring(11,13);


            map.put("hour", hour);
            map.put("day", day);
            map.put("month", month);
            map.put("year", year);
            map.put("houseListSize", houseListSize);
            map.put("url1", url1);
            map.put("bdCodeName", bdCodeName);
            map.put("family", family);
            template = "printJf.html";
            PdfDocumentGenerator pdfDocumentGenerator = new PdfDocumentGenerator();
            OutputStream outputStream = null;
            try {
                outputStream = response.getOutputStream();
                pdfDocumentGenerator.generate(template, map, outputStream);
            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                try {
                    outputStream.flush();
                    outputStream.close();
//                    response.reset();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }

    //房源销控查看
    @RequestMapping("housePic")
    public void housePic(){

    }

    /**
     * 房源配组ztree项目楼号获取
     *
     * @param request
     */
    @RequestMapping("dataJson")
    @ResponseBody
    public List dataJson(HttpServletRequest request) {

        List<Project> projectList = projectService.listAll();//项目
        //按照组别封装数据为json格式
        List<Map> jsonList = new ArrayList<Map>();

        for (int i = 0; i < projectList.size(); i++) {
            Map<String, Object> m = new LinkedHashMap<String, Object>();
            m.put("name", projectList.get(i).getProjectName());
            List childrenList = houseService.getHouseNumInfo(projectList.get(i).getId());
            List<Map> list = new ArrayList<Map>();
            for (int j = 0; j < childrenList.size(); j++) {
                Map map = new HashMap();
                map.put("id", projectList.get(i).getId());
                map.put("name", childrenList.get(j) + "号楼");
                //Object[] objects=(Object[])childrenList.get(j);
                //map.put("name", objects[1] + "号楼");
                //map.put("houseId", objects[0]);
                map.put("icon", "/static/plugin/zTree_v3-master/css/zTreeStyle/img/diy/1_close.png");
                list.add(map);
            }
            m.put("children", list);
            m.put("open", true);
            jsonList.add(m);
        }
        return jsonList;
    }


    /**
     * 加载楼盘图
     *
     * @param request
     * @param modelMap
     */
    @RequestMapping("housePicChooses")
    public void housePicChooses(HttpServletRequest request, ModelMap modelMap, int id, String buildNum){
        Integer projectId = id;
        Project project = this.projectService.get(projectId);

        Map<String, String> houseTypeDataDictMap = this.dataDictService.getMapByParentAttributeNameForValue("房屋户型");
        List<String> unitList = this.houseService.distinctUnit(project.getId(), buildNum);// 获取所有单元
        // 各个单元的最大房号<单元号，最大房号>
        Map<String, String> maxRoomByUnitMap = this.houseService.getMaxRoomByUnit(project.getId(), buildNum);
        // 最大楼层
        int maxFloor = this.houseService.getMaxFloor(project.getId(), buildNum);
        // 所有房源
        List<House> houseList = this.houseService.listHouse(project.getId(), buildNum);
        Map<String, House> houseMap = new HashMap<String, House>();// <单元-房号:house>
        if (Collections3.isNotEmpty(houseList) && houseList.size() > 0) {
            for (House house : houseList) {
                String code = house.getUnitNum() + "-" + house.getHouseNum();
                houseMap.put(code, house);
            }
        }
        //单元  房号  居室
        Map<String, Map<String, String>> houseTypeMap = this.houseService.getHouseTypeByProjectIdAndBuildNum(project.getId(), buildNum);
        List<DataDict> flagList = dataDictService.getDataDictList("房屋状态");
        List<DataDict> typeList = dataDictService.getDataDictList("房屋户型");
        Map<String, DataDict> flagMap = Maps.newLinkedHashMap();
        Map<String, String> typeMap = Maps.newLinkedHashMap();
        if (Collections3.isNotEmpty(flagList)) {
            for (DataDict dataDict : flagList) {
                flagMap.put(dataDict.getAttributeValue(), dataDict);
            }
        }
        if (Collections3.isNotEmpty(typeList)) {
            for (DataDict dataDict : typeList) {
                typeMap.put(dataDict.getAttributeValue(), dataDict.getAttributeColor());
            }
        }
        modelMap.addAttribute("project", project);
        modelMap.addAttribute("buildNum", buildNum);
        modelMap.addAttribute("unitList", unitList);
        modelMap.addAttribute("maxRoomByUnitMap", maxRoomByUnitMap);
        modelMap.addAttribute("maxFloor", maxFloor);
        modelMap.addAttribute("houseMap", houseMap);
        modelMap.addAttribute("houseTypeMap", houseTypeMap);
        modelMap.addAttribute("houseTypeDataDictMap", houseTypeDataDictMap);
        modelMap.addAttribute("flagMap", flagMap);
        modelMap.addAttribute("typeMap", typeMap);
    }


    //房源配组信息回显
    @RequestMapping("houseMsg")
    public void houseMsg(HttpServletRequest request, ModelMap modelMap){
        Integer houseId = ParamUtils.getInt(request, "houseId", 0);
        House house = this.houseService.get(houseId);
        modelMap.addAttribute("house", house);

        Integer projectId = ParamUtils.getInt(request, "projectId", 0);
        Project project = this.projectService.get(projectId);
        modelMap.addAttribute("project", project);
    }

}
