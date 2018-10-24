package com.app.cq.utils;

import com.app.cq.model.Project;
import com.app.cq.service.ProjectService;
import com.sqds.spring.SpringUtils;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by jmdf on 2018/9/6.
 */
public final class ProjectUtils {
    private ProjectUtils() {
    }

    public static List<Project> getProjectList(HttpServletRequest request) {
        ProjectService projectService = (ProjectService) SpringUtils.getWebApplicationContext(request).getBean("projectService");
        List projectList = projectService.getProjectList();
        return projectList;
    }
}
