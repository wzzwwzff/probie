package com.app.cq.service;

import com.alibaba.fastjson.JSON;
import com.app.cq.model.Family;
import com.app.cq.model.FamilyPerson;
import com.app.cq.model.HistoryInfo;
import com.app.cq.model.House;
import com.app.cq.utils.GetCurrentUser;
import com.sqds.hibernate.HibernateDao;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 * Created by lsh on 2018/5/7.
 * 历史数据记录表业务层
 */
@Service
public class HistoryInfoService extends HibernateDao<HistoryInfo>{

    /**
     * 根据某一家庭id获取该家庭所有历史记录倒序
     * @param familyId
     * @return
     */
    public List<HistoryInfo> listByFamilyId(Integer familyId){
        return this.list("from HistoryInfo h where h.familyId = ? order by h.operateDate desc,h.id",familyId);
    }
    /**
     * 根据某一家庭id获取该家庭所有历史记录
     * @param familyId
     * @return
     */
    public List<HistoryInfo> listByFamilyId1(Integer familyId){
        return this.list("from HistoryInfo h where h.familyId = ? order by h.operateDate,h.id",familyId);
    }


    /**
     * 查出所有无orderflag
     * @return
     */
    public List<HistoryInfo> listNotOrderFlag(){
        return this.list("from HistoryInfo h where h.orderFlag is null order by h.operateDate desc,h.id");
    }

    /**
     * 根据某一家庭id获取该家庭所有历史记录
     * @param familyId
     * @return
     */
    public HistoryInfo getByOrderFlag(Integer familyId,Integer orderFlag){
        return this.findUnique("from HistoryInfo h where h.familyId = ? and h.orderFlag = ? order by h.operateDate desc,h.id",familyId,orderFlag);
    }

    /**
     * 历史记录保存
     * @param request
     * @param family
     * @param familyPersonList
     */
    public synchronized void histroySave(HttpServletRequest request, Family family, List<FamilyPerson> familyPersonList,Integer type){
        Integer orderFlag = 1;
        List<HistoryInfo> historyInfoList = this.listByFamilyId(family.getId());
        if(historyInfoList.size() > 0){
            orderFlag = historyInfoList.size() + 1;
        }

        //保存修改记录
        HistoryInfo historyInfo = new HistoryInfo();
        historyInfo.setFamilyId(family.getId());//家庭表Id
        historyInfo.setData(JSON.toJSONString(family));//家庭表信息
        historyInfo.setFamilyPersonData(JSON.toJSONString(familyPersonList));//家庭成员信息
        historyInfo.setOperatePerson(GetCurrentUser.getLoginUser(request).getRealName());//操作人姓名
        historyInfo.setComputerId(GetCurrentUser.getIpAddr(request));//操作人IP地址
        historyInfo.setOperateDate(new Date());
        historyInfo.setType(type.toString());
        historyInfo.setOrderFlag(orderFlag);
        this.save(historyInfo);
    }
}
