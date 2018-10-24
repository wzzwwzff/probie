package com.app.cq.service;

import com.app.cq.model.ActionInfo;
import com.app.cq.model.Family;
import com.app.cq.utils.GetCurrentUser;
import com.sqds.hibernate.HibernateDao;
import com.sqds.page.PageInfo;
import com.sqds.web.Servlets;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * Created by jmdf on 2018/8/9.
 */
@Service
public class ActionInfoService extends HibernateDao<ActionInfo>{

    public PageInfo<ActionInfo> listByFamilyId(PageInfo<ActionInfo> pageInfo, Integer familyId){
        String hql = " from ActionInfo a where a.family.id=? order by a.operateDate desc,a.id";
        return this.list(pageInfo,hql,familyId);
    }

    /**
     * 保存操作记录
     * @param family
     * @param operateType
     */
    public void saveActionInfo(Family family, String operateType) {
        ActionInfo actionInfo = new ActionInfo();
        actionInfo.setOperateType(operateType);
        actionInfo.setOperatePerson(GetCurrentUser.getLoginUser(Servlets.getRequest()).getRealName());
        actionInfo.setOperateIp(GetCurrentUser.getIpAddr(Servlets.getRequest()));
        actionInfo.setOperateDate(new Date());
        actionInfo.setFamily(family);
        this.save(actionInfo);
    }

    /**
     * 根据familyId删除
     * @param familyId
     */
    public void deleteByFamilyId(int familyId){
        String hql="delete ActionInfo where family=?";
        getSession().createQuery(hql).setInteger(0,familyId).executeUpdate();
    }
}
