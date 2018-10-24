package com.app.cq.service;

import com.alibaba.fastjson.JSON;
import com.app.cq.en.CheckState;
import com.app.cq.model.BackInfo;
import com.app.cq.model.Family;
import com.app.cq.model.FamilyPerson;
import com.app.cq.utils.GetCurrentUser;
import com.app.cq.utils.Precondition;
import com.sqds.hibernate.HibernateDao;
import com.sqds.page.PageInfo;
import com.sqds.web.ParamUtils;
import com.sqds.web.Servlets;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 * Created by jmdf on 2017/11/2.
 */
@Service
public class BackInfoService extends HibernateDao<BackInfo> {
    @Resource
    private FamilyService familyService;
    @Resource
    private FamilyPersonService familyPersonService;
    @Resource
    private ActionInfoService actionInfoService;

    /**
     * 退回数据列表
     */
    public PageInfo<BackInfo> dataBackList(PageInfo<BackInfo> pageInfo) {
        return this.list(pageInfo,"from BackInfo order by backDate desc");
    }

    //初审退回
    public void saveBackData(HttpServletRequest request) {
        Integer familyId = ParamUtils.getInteger(request, "familyId", 0);
        String problem = ParamUtils.getString(request, "problem", "");
        String company = ParamUtils.getString(request, "company", "");
        Family family = this.familyService.get(familyId);
        Precondition.checkAjaxArguement(family != null, "0001", "该数据有错！");
        //设置family表的退回状态
        if (company.contains("拆迁数据")){
            Precondition.checkAjaxArguement(family.getCqState() > 1,"0002","拆迁数据未上报，不用退回");
            family.setCqState(0);
        }
        if(company.contains("评估数据")){
            Precondition.checkAjaxArguement(family.getPgState() > 1,"0003","评估数据未上报，不用退回");
            family.setPgState(0);
        }
        if(company.contains("测绘数据")){
            Precondition.checkAjaxArguement(family.getChState() > 1,"0004","测绘数据未上报，不用退回");
            family.setChState(0);
        }
        family.setCheckState(CheckState.FIRSTBACK.getIndex());

        this.familyService.save(family);
        //保存一条退回数据的记录
        BackInfo backInfo = new BackInfo();
        backInfo.setFamily(family);
        backInfo.setGrouping(family.getGroupCode());
        backInfo.setFamilyNum(family.getFamilyCode());
        backInfo.setName(family.getName());
        backInfo.setAddress(family.getAddress());
        backInfo.setBackDate(new Date());
        backInfo.setBackPerson(GetCurrentUser.getLoginUser(request).getUsername());
        backInfo.setBackIp(GetCurrentUser.getIpAddr(request));
        List<FamilyPerson> familyPersonList = familyPersonService.listByFamilyId(familyId);
        backInfo.setReason(problem);
        backInfo.setType("数据初审");
        backInfo.setCompany(company);
        backInfo.setPersonData(JSON.toJSONString(familyPersonList));
        backInfo.setData(JSON.toJSONString(family));
        this.save(backInfo);
        String operateType = "初审退回";
        actionInfoService.saveActionInfo(family,operateType);
    }

    //预审退回
    public void saveBackDataSec(HttpServletRequest request) {
        Integer familyId = ParamUtils.getInteger(request, "familyId", 0);
        String problem = ParamUtils.getString(request, "problem", "");
        Family family = this.familyService.get(familyId);
        Precondition.checkAjaxArguement(family != null, "0001", "该数据有错！");
        Precondition.checkAjaxArguement(family.getCheckState()>=CheckState.FIRSTCHECK.getIndex(),"0002","数据未初审通过，不用退回");
        //预审退回后，审核状态变为初审通过
        family.setCheckState(CheckState.SECONDBACK.getIndex());
        this.familyService.save(family);
        //保存一条退回数据的记录
        BackInfo backInfo = new BackInfo();
        backInfo.setFamily(family);
        backInfo.setGrouping(family.getGroupCode());
        backInfo.setFamilyNum(family.getFamilyCode());
        backInfo.setName(family.getName());
        backInfo.setAddress(family.getAddress());
        backInfo.setBackDate(new Date());
        backInfo.setBackPerson(GetCurrentUser.getLoginUser(request).getUsername());
        backInfo.setBackIp(GetCurrentUser.getIpAddr(request));
        List<FamilyPerson> familyPersonList = familyPersonService.listByFamilyId(familyId);
        backInfo.setReason(problem);
        backInfo.setType("数据预审");
        backInfo.setCompany(null);
        backInfo.setPersonData(JSON.toJSONString(familyPersonList));
        backInfo.setData(JSON.toJSONString(family));
        this.save(backInfo);

        String operateType = "预审退回";
        actionInfoService.saveActionInfo(family,operateType);
    }

    //找到该户家庭所有退回记录
    public PageInfo<BackInfo> listByFamilyId(PageInfo<BackInfo> pageInfo,int familyId) {
        String hql = "from BackInfo b where b.family.id = "+familyId +" order by b.backDate desc";
        return this.list(pageInfo,hql);
    }

    /**
     * 删除family对应的记录
     * @param familyId
     */
    public void deleteByFamilyId(int familyId) {
        String hql="delete BackInfo where familyId=?";
        getSession().createQuery(hql).setInteger(0,familyId).executeUpdate();
    }
}
