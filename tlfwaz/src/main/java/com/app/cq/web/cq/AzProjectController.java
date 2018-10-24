package com.app.cq.web.cq;

import com.app.cq.exception.Precondition;
import com.app.cq.model.AzProject;
import com.app.cq.model.House;
import com.app.cq.service.AzProjectService;
import com.app.cq.service.HouseService;
import com.app.cq.utils.ReadExcel;
import com.google.common.collect.Maps;
import com.sqds.page.PageInfo;
import com.sqds.web.ParamUtils;
import com.sqds.web.Servlets;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 安置项目管理
 * Created by jmdf on 2018/9/5.
 */
@Controller
@RequestMapping("/cq/azProject/*")
public class AzProjectController {

    @Autowired
    private AzProjectService azProjectService;
    @Autowired
    private HouseService houseService;

    /**
     * 安置项目列表展示
     *
     * @param request
     * @param modelMap
     */
    @RequestMapping("azProjectList")
    public void azProjectList(HttpServletRequest request, ModelMap modelMap) {
        PageInfo<AzProject> pageInfo = new PageInfo<>();
        Servlets.initPageInfo(request, pageInfo);
        pageInfo = this.azProjectService.list(pageInfo);
        modelMap.addAttribute("pageInfo", pageInfo);
    }

    /**
     * 安置项目登记或修改
     *
     * @param request
     * @param modelMap
     */
    @RequestMapping("azProjectForm")
    public void azProjectForm(HttpServletRequest request, ModelMap modelMap) {
        Integer projectId = ParamUtils.getInt(request, "projectId", 0);
        AzProject project = this.azProjectService.get(projectId);
        if (project == null) {
            project = new AzProject();
        }
        modelMap.addAttribute("project", project);
    }

    /**
     * 保存项目信息
     *
     * @param request
     */
    @RequestMapping("azProjectSave")
    public String azProjectSave(HttpServletRequest request) {
        Integer projectId = ParamUtils.getInt(request, "projectId", 0);
        AzProject project = this.azProjectService.get(projectId);
        //是空就是新增，不为空就是修改
        if (project == null) {
            project = new AzProject();
        }
        Servlets.bind(request, project);
        this.azProjectService.save(project);
        return "redirect:azProjectList?" + request.getAttribute("searchParams");
    }

    /**
     * 安置项目查看
     *
     * @param request
     * @param modelMap
     */
    @RequestMapping("azProjectView")
    public void azProjectView(HttpServletRequest request, ModelMap modelMap) {
        Integer projectId = ParamUtils.getInt(request, "projectId", 0);
        AzProject project = this.azProjectService.get(projectId);
        Precondition.checkSqdsArguement(project != null,"未找到数据");
        modelMap.addAttribute("project", project);
    }

    /**
     * 删除安置项目信息
     *
     * @param request
     * @return
     */
    @RequestMapping("delazProject")
    @ResponseBody
    public Map delazProject(HttpServletRequest request) {
        Map map = Maps.newHashMap();

        Integer projectId = ParamUtils.getInt(request, "projectId", 0);
        //判断项目下是否有房源
        Integer count = this.azProjectService.isExistHouse(projectId);
        if(count>0){
            map.put("result", 2);
        }else{
            this.azProjectService.delete(projectId);
            map.put("result", 1);
        }
        return map;
    }

    /**
     * 房源信息列表
     *
     * @param request
     * @param modelMap
     */
    @RequestMapping("azHouseList")
    public void azHouseList(HttpServletRequest request, ModelMap modelMap) {
        Integer projectId = ParamUtils.getInt(request, "projectId", 0);
        modelMap.addAttribute("projectId", projectId);
        AzProject project = this.azProjectService.get(projectId);

        PageInfo<House> pageInfo = new PageInfo<>();
        Servlets.initPageInfo(request, pageInfo);
        pageInfo = this.houseService.houseList(pageInfo,projectId);

        modelMap.addAttribute("project", project);
        modelMap.addAttribute("pageInfo", pageInfo);
    }

    /**
     * 房源登记或修改
     *
     * @param request
     * @param modelMap
     */
    @RequestMapping("azhouseForm")
    public void azhouseForm(HttpServletRequest request, ModelMap modelMap) {
        Integer projectId = ParamUtils.getInt(request, "projectId", 0);
        Integer houseId = ParamUtils.getInt(request, "houseId", 0);
        AzProject project = azProjectService.get(projectId);
        House house = houseService.get(houseId);

        if (house == null || house.getId() == null) {
            house = new House();
            if (project != null) {
                house.setAzProject(project);
            }
        }
        modelMap.addAttribute("project", project);
        modelMap.addAttribute("house", house);
    }
    /**
     * 房源信息查看
     *
     * @param request
     * @param modelMap
     */
    @RequestMapping("azhouseView")
    public void azhouseView(HttpServletRequest request, ModelMap modelMap) {
        Integer projectId = ParamUtils.getInt(request, "projectId", 0);
        Integer houseId = ParamUtils.getInt(request, "houseId", 0);
        AzProject project = azProjectService.get(projectId);
        House house = houseService.get(houseId);

        if (house == null || house.getId() == null) {
            house = new House();
            if (project != null) {
                house.setAzProject(project);
            }
        }
        modelMap.addAttribute("project", project);
        modelMap.addAttribute("house", house);
    }

    /**
     * 保存房源信息
     *
     * @param request
     */
    @RequestMapping("azhouseSave")
    public String azhouseSave(HttpServletRequest request) {
        Integer projectId = ParamUtils.getInt(request, "projectId", 0);
        Integer houseId = ParamUtils.getInt(request, "houseId", 0);
        AzProject project = azProjectService.get(projectId);
        House house = houseService.get(houseId);

        if (house == null) {
            house = new House();
        }
        Servlets.bind(request, house);
        house.setAzProject(project);
        houseService.save(house);

        return "redirect:azHouseList?projectId=" + projectId;
    }

    /**
     * 删除房源信息
     *
     * @param request
     * @return
     */
    @RequestMapping("delazHouse")
    public String delazHouse(HttpServletRequest request) {
        Integer houseId = ParamUtils.getInt(request, "houseId", 0);
        House house = this.houseService.get(houseId);
        if (houseId != 0) {
            this.houseService.delete(house.getId());
        }
        return "redirect:azHouseList?projectId="+house.getAzProject().getId();
    }

    /**
     * 批量导入房源页面跳转
     * @param request
     * @param modelMap
     */
    @RequestMapping("plHouse")
    public void plHouse(HttpServletRequest request , ModelMap modelMap){
        Integer projectId = ParamUtils.getInt(request, "projectId", 0);
        AzProject project = this.azProjectService.get(projectId);
        modelMap.addAttribute("project",project);
    }

    /**
     * 房源批量导入保存
     * @param request
     * @throws IOException
     */
    @RequestMapping("plHouseSave")
    public String plHouseSave(HttpServletRequest request) throws Exception {
        //获取项目名
        Integer projectId = ParamUtils.getInt(request, "projectId", 0);
        AzProject project = this.azProjectService.get(projectId);

        //上传文件
        byte[] filePath = Servlets.uploadFile(request,"file");
        InputStream excelInputStream = new ByteArrayInputStream(filePath);
        List list = ReadExcel.read(excelInputStream,0,true);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();

        for (int i = 0; i < list.size() ; i++) {
            if (i > 0){
                List row = (List) list.get(i);
                if (!"".equals((String)row.get(0))) {
                    House house = new House();

                    String buildNum = (String)row.get(1);       //楼号
                    String unitNum = (String) row.get(2);       //单元号
                    String houseNum = (String) row.get(3);      //房间号
                    String hhouseType = (String) row.get(4);          //居室
                    Integer houseType = 0;
                    if(hhouseType.equals("一居室")){
                        houseType = 1;
                    }else if(hhouseType.equals("二居室")){
                        houseType = 3;
                    }else if(hhouseType.equals("三居室")){
                        houseType = 4;
                    }
                    String buildArea = (String) row.get(5);          //建筑面积
                    String price = (String) row.get(6);              //单价
                    String houseStatus = (String) row.get(7);          //房屋状态
                    Integer state = 1;
                    if (houseStatus.equals("未选")){
                        state = 1;
                    }else if (houseStatus.equals("已选")){
                        state = 2;
                    }else if (houseStatus.equals("伪选")){
                        state = 3;
                    }
                    String hPerson = (String) row.get(8);            //购房人
                    String hIdCard = (String) row.get(9);            //购房人身份证号
                    String memo = (String) row.get(10);            //备注

                    house.setBuildNum(buildNum);
                    house.setUnitNum(unitNum);
                    house.setHouseNum(houseNum);
                    house.setHouseType(houseType);
                    if(buildArea != null && buildArea != ""){
                        house.setBuildArea(new BigDecimal(buildArea));
                    }
                    if(price != null && price != ""){
                        house.setPrice(new BigDecimal(price));
                    }
                    house.setHouseStatus(state);
                    house.sethPerson(hPerson);
                    house.sethIdCard(hIdCard);
                    house.setMemo(memo);
                    house.setAzProject(project);
                    house.setOpDate(date);

                    this.houseService.save(house);
                }
            }
        }
        return "redirect:azHouseList?projectId="+projectId;
    }

    /**
     * 批量导入房源实测建筑面积页面跳转
     */
    @RequestMapping("updateHouse")
    public void updateHouse(HttpServletRequest request , ModelMap modelMap){
        Integer projectId = ParamUtils.getInt(request, "projectId", 0);
        AzProject project = this.azProjectService.get(projectId);
        modelMap.addAttribute("project",project);
    }

    /**
     * 房源实测建筑面积批量导入保存
     */
    @RequestMapping("updateHouseSave")
    public String updateHouseSave(HttpServletRequest request) throws Exception {
        //获取项目名
        Integer projectId = ParamUtils.getInt(request, "projectId", 0);
        AzProject project = this.azProjectService.get(projectId);

        //上传文件
        byte[] filePath = Servlets.uploadFile(request,"file");
        InputStream excelInputStream = new ByteArrayInputStream(filePath);
        List list = ReadExcel.read(excelInputStream,0,true);

        for (int i = 0; i < list.size() ; i++) {
            if (i > 0){
                List row = (List) list.get(i);
                if (!"".equals((String)row.get(0))) {
                    String buildNum = (String)row.get(1);       //楼号
                    String unitNum = (String) row.get(2);       //单元号
                    String houseNum = (String) row.get(3);      //房间号
//                    String buildArea = (String) row.get(4);          //实测建筑面积
                    String houseNumAll = (String) row.get(4);          //原房源房间号
                    House house = this.houseService.getHouseByAll(project.getId(), buildNum, unitNum, houseNum);
                    Precondition.checkAjaxArguement(house != null, "0012", "房源信息错误");
//                    if(buildArea != null && !buildArea.equals("")){
//                        house.setSjBuildArea(new BigDecimal(buildArea));
//                    }
                    //批量更新原来定的984套为平移房号
                    if(houseNumAll != null && !houseNumAll.equals("")){
                        house.setHouseNumAll(houseNumAll);
                        house.setIsSpecial(1);
                    }
                    this.houseService.save(house);
                }
            }
        }
        return "redirect:azHouseList?projectId="+projectId;
    }

}
