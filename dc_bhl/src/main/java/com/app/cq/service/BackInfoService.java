package com.app.cq.service;

import com.app.cq.model.BackInfo;
import com.sqds.hibernate.HibernateDao;
import com.sqds.page.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by lsh on 2018/5/7.
 * 初审退回业务层
 */
@Service
public class BackInfoService extends HibernateDao<BackInfo> {
    @Autowired
    private FamilyService familyService;

    /**
     * 通过联合查询backInfo
     * @return
     */
    public BackInfo getHouse(Integer backId) {
        return this.findUnique(" from BackInfo f left join fetch f.family fy where f.id = ? ", backId);
    }

    /**
     * 获取列表
     * @param pageInfo
     * @return
     */
    public PageInfo<BackInfo> getList(PageInfo<BackInfo> pageInfo){
        String hql = "from BackInfo f left join fetch f.family fy where 1=1 order by f.backDate desc,f.id,fy.id";
        return list(pageInfo,hql);
    }

}
