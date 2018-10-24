package com.app.cq.service;

import com.app.cq.model.Project;
import com.sqds.hibernate.HibernateDao;
import org.hibernate.SQLQuery;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by jmdf on 2018/8/9.
 */
@Service
public class ProjectService extends HibernateDao<Project>{

    /**
     * 获取项目名称
     */
    public List<String> getProjectCount() {
        String sql = "select projectName from project group by id order by id ";
        List<String> mapList =  this.getSession().createSQLQuery(sql).list();
        return mapList;
    }

    /**
     * 根据项目名称查项目id
     */
    public Project getProject(String projectName) {
        String hql = "from Project p WHERE p.projectName=?";
        Project project = (Project)getSession().createQuery(hql).setParameter(0, projectName).uniqueResult();
        return project;
    }

    /**
     * 判断项目下是否存在房源
     */
    public Integer isExistHouse(Integer projectId) {
        String sql="select count(1) from house h where h.projectId="+projectId;
        SQLQuery query = getSession().createSQLQuery(sql);
        int count=((Number)query.uniqueResult()).intValue();
        return count;
    }

}
