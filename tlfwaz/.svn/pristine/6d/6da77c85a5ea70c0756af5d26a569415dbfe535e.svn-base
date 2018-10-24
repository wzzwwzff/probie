package com.app.cq.service;

import com.app.cq.model.Project;
import com.sqds.hibernate.HibernateDao;
import com.sqds.web.Servlets;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by jmdf on 2018/9/5.
 */
@Service
public class ProjectService extends HibernateDao<Project>{
    @Autowired
    private AreaService areaService;

    /**
     * 保存项目和地块
     *
     * @param request
     * @param project
     */
    public void saveProjectAndArea(HttpServletRequest request, Project project) {
        Servlets.bind(request,project);
        this.save(project);
        this.areaService.saveArea(request, project);
    }

    /**
     * 删除入户信息及其关联信息 ^_^
     *
     * @param id
     */
    public void deleteByProjectId(int id) {
        Project project = this.get(id);
        if (project != null) {
            this.delete(id);
        }
    }

    public List<Project> getProjectList() {
        return this.list("from Project p order by p.id");
    }

    /**
     * 根据名称
     * @param projectName
     * @return
     */
    public Project getProjectByName(String projectName){
        String hql = "from Project where projectName = ?";
        return this.findUnique(hql,projectName);
    }
}
