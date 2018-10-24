package com.app.cq.service;

import com.app.cq.model.ActionInfo;
import com.app.cq.model.Family;
import com.app.cq.model.HistoryInfo;
import com.app.cq.utils.GetCurrentUser;
import com.sqds.hibernate.HibernateDao;
import com.sqds.page.PageInfo;
import com.sqds.web.Servlets;
import org.springframework.stereotype.Service;

import javax.servlet.Servlet;
import java.util.Date;
import java.util.List;

@Service
public class ActionInfoService extends HibernateDao<ActionInfo> {

    /**
     * 删除family对应的记录
     * @param familyId
     */
    public void deleteByFamilyId(int familyId) {
        String hql="delete ActionInfo where familyId=?";
        getSession().createQuery(hql).setInteger(0,familyId).executeUpdate();
    }

    public PageInfo<ActionInfo> historyInfoList(PageInfo<ActionInfo> pageInfo , int familyId, int type){
        String hql = " from ActionInfo h where h.familyId=? and h.type=? order by h.doDate desc,h.id";
        return this.list(pageInfo,hql,familyId,type);
    }

    public PageInfo<ActionInfo> listByFamilyId(PageInfo<ActionInfo> pageInfo,Integer familyId){
        String hql = " from ActionInfo a where a.family.id=? order by a.doDate desc,a.id";
        return this.list(pageInfo,hql,familyId);
    }

    //保存操作记录
    public void saveActionInfo(Family family, String operateType) {
        ActionInfo actionInfo = new ActionInfo();
        actionInfo.setOperateType(operateType);
        actionInfo.setPerson(GetCurrentUser.getLoginUser(Servlets.getRequest()).getRealName());
        actionInfo.setComputerId(GetCurrentUser.getIpAddr(Servlets.getRequest()));
        actionInfo.setDoDate(new Date());
        actionInfo.setFamily(family);
        this.save(actionInfo);
    }
}
