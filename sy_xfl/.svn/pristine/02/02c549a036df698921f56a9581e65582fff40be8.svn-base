package com.app.cq.service;

import com.app.cq.model.HistoryInfo;
import com.sqds.hibernate.HibernateDao;
import com.sqds.page.PageInfo;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HistoryInfoService extends HibernateDao<HistoryInfo> {

    public PageInfo<HistoryInfo> historyInfoList(PageInfo<HistoryInfo> pageInfo , int familyId, int type){
        String hql = " from HistoryInfo h where h.familyId=? and h.type=? order by h.doDate desc,h.id";
        return this.list(pageInfo,hql,familyId,type);
    }

    public PageInfo<HistoryInfo> listByFamilyId(PageInfo<HistoryInfo> pageInfo,Integer familyId){
        String hql = " from HistoryInfo h where h.familyId = ? order by h.doDate desc,h.id";
        return this.list(pageInfo,hql,familyId);
    }
}
