package com.app.cq.service;

import com.app.cq.model.Project;
import com.sqds.hibernate.HibernateDao;
import com.sqds.page.PageInfo;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 项目业务层
 * Created by ZYK on 2018/3/14.
 */
@Service
public class ProjectService extends HibernateDao<Project> {

    /**
     * 获取项目列表
     * zyk
     * 2018-03-14
     * @param pageInfo
     * @return
     */
    public PageInfo<Project> getProjectList (PageInfo<Project> pageInfo){
        return this.list(pageInfo,"from Project p order by p.projectCode");
    }

    /**
     * 获取项目列表
     * zyk
     * 2018-03-14
     * @return
     */
    public List<Project> getProjectList(){
        return this.list("from Project p order by p.projectCode");
    }
}
