package com.app.cq.web.cq;

import com.app.cq.model.House;
import com.app.cq.model.Project;
import com.app.cq.service.HouseService;
import com.app.cq.service.ProjectService;
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
import java.util.Map;

/**
 * 项目、房源管理
 * Created by ZYK on 2018/3/14.
 */
@Controller
@RequestMapping("/cq/house/*")
public class HouseController {

    @Autowired
    private ProjectService projectService;
    @Autowired
    private HouseService houseService;

    /**
     * 项目地块管理列表
     * zyk
     * 2018-03-14
     * @param request
     * @param modelMap
     */
    @RequestMapping("projectList")
    public void projectList(HttpServletRequest request, ModelMap modelMap) {
        PageInfo<Project> pageInfo = new PageInfo<Project>();
        Servlets.initPageInfo(request, pageInfo);
        pageInfo.setPageSize(Integer.MAX_VALUE);
        pageInfo = this.projectService.getProjectList(pageInfo);
        modelMap.addAttribute("pageInfo", pageInfo);
    }

    /**
     * 项目登记或修改
     *zyk
     * 2018-03-14
     * @param request
     * @param modelMap
     */
    @RequestMapping("projectForm")
    public void projectForm(HttpServletRequest request, ModelMap modelMap) {
        Integer projectId = ParamUtils.getInt(request,"projectId",0);
        Project project = this.projectService.get(projectId);
        if (project == null) {
            project = new Project();
        }
        modelMap.addAttribute("project", project);
    }

    /**
     * 保存项目信息
     * zyk
     * 2018-03-14
     * @param request
     */
    @RequestMapping("projectSave")
    public String projectSave(HttpServletRequest request) {
        Integer projectId = ParamUtils.getInt(request,"projectId",0);
        Project project = this.projectService.get(projectId);
        if (project == null) {
            project = new Project();
        }
        Servlets.bind(request,project);
        this.projectService.save(project);
        return "redirect:projectList?" + request.getAttribute("searchParams");
    }

    /**
     * 房源管理列表
     * zyk
     * 2018-03-14
     * @param request
     * @param modelMap
     */
    @RequestMapping("houseList")
    public void houseList(HttpServletRequest request, ModelMap modelMap) {
        Integer projectId = ParamUtils.getInt(request, "projectId", 0);
        Project project = this.projectService.get(projectId);
        PageInfo<House> pageInfo = new PageInfo<House>();
        Servlets.initPageInfo(request, pageInfo);
        pageInfo = this.houseService.getHouseListByProjectId(pageInfo,project.getId());
        modelMap.addAttribute("project", project);
        modelMap.addAttribute("pageInfo", pageInfo);
    }

    /**
     * 删除某一房源
     * @param request
     * @return
     */
    @RequestMapping("deleteHouse")
    @ResponseBody
    public Map deleteHouse(HttpServletRequest request){
        Map map = Maps.newHashMap();
        Integer houseId = ParamUtils.getInt(request, "houseId", 0);
        House house = this.houseService.get(houseId);
        if (house.getHouseStatus() != 1){
            map.put("success","false");
            map.put("message","该房源已被选，不能删除！");
            return map;
        }
        this.houseService.delete(house.getId());
        map.put("success","true");
        map.put("message","删除成功！");
        return map;
    }

    /**
     * 房源登记或修改
     *zyk
     * 2018-03-14
     * @param request
     * @param modelMap
     */
    @RequestMapping("houseForm")
    public void houseForm(HttpServletRequest request, ModelMap modelMap) {
        Integer houseId = ParamUtils.getInt(request,"houseId",0);
        Integer projectId = ParamUtils.getInt(request,"projectId",0);
        Project project = this.projectService.get(projectId);
        House house = this.houseService.getHouse(houseId);
        if (house == null) {
            house = new House();
        }
        modelMap.addAttribute("project", project);
        modelMap.addAttribute("house", house);
    }

    /**
     * 保存房源信息
     *
     * @param request
     */
    @RequestMapping("houseSave")
    public String houseSave(HttpServletRequest request) {
        Integer projectId = ParamUtils.getInt(request, "projectId", 0);
        Integer houseId = ParamUtils.getInt(request,"houseId",0);
        Project project = projectService.get(projectId);
        House house = houseService.get(houseId);
        if (house == null) {
            house = new House();
        }
        Servlets.bind(request, house);
        house.setProject(project);
        houseService.save(house);
        return "redirect:houseList?projectId=" + project.getId();
    }
}
