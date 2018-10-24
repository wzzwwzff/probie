package com.app.cq.service;

import com.alibaba.fastjson.JSON;
import com.app.cq.model.Contract;
import com.app.cq.model.Family;
import com.app.cq.model.FamilyPerson;
import com.app.cq.model.HistoryInfo;
import com.app.cq.utils.GetCurrentUser;
import com.sqds.hibernate.HibernateDao;
import com.sqds.page.PageInfo;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 * Created by jmdf on 2018/8/9.
 */
@Service
public class HistoryInfoService extends HibernateDao<HistoryInfo>{

    public PageInfo<HistoryInfo> listByFamilyId(PageInfo<HistoryInfo> pageInfo,Integer familyId){
        return this.list(pageInfo,"from HistoryInfo h where h.familyId = ? order by h.operateDate desc,h.id",familyId);
    }

    public List<HistoryInfo> listByFamilyId(Integer familyId){
        return this.list("from HistoryInfo h where h.familyId = ? order by h.operateDate desc,h.id",familyId);
    }

    /**
     * 通过家庭id和排序号得到某条记录
     * @param familyId
     * @param orderFlag
     * @return
     */
    public HistoryInfo getHistoryByOrderFlag(Integer familyId,Integer orderFlag){
        return this.findUnique("from HistoryInfo where familyId = ? and orderFlag = ?",familyId,orderFlag);
    }

    /**
     *历史记录保存
     * @param request
     * @param family
     * @param familyPersonList
     * @param contractList
     * @param dataPhase
     */
    public synchronized void saveHistoryInfo(HttpServletRequest request, Family family, List<FamilyPerson> familyPersonList , List<Contract> contractList, Integer dataPhase){
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
        historyInfo.setContractData(JSON.toJSONString(contractList));//合同信息
        historyInfo.setOperatePerson(GetCurrentUser.getLoginUser(request).getRealName());//操作人姓名
        historyInfo.setOperateIp(GetCurrentUser.getIpAddr(request));//操作人IP地址
        historyInfo.setOperateDate(new Date());
        historyInfo.setDataPhase(dataPhase);//阶段
        historyInfo.setOrderFlag(orderFlag);//记录的条数
        this.save(historyInfo);

    }
}
