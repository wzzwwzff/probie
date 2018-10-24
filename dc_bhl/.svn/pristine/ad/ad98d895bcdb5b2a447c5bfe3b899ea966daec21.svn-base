package com.app.cq.service;

import com.app.cq.model.HistoryFamily;
import com.google.common.collect.Lists;
import com.sqds.hibernate.HibernateDao;
import com.sqds.page.PageInfo;
import com.sqds.web.ParamUtils;
import com.sqds.web.Servlets;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by lsh on 2018/5/7.
 * 历时签约家庭业务层
 */
@Service
public class HistoryFamilyService extends HibernateDao<HistoryFamily>{

    @Autowired
    private HistoryFamilyPersonService historyFamilyPersonService;
    @Autowired
    private HistoryFamilyHouseService historyFamilyHouseService;

    /**
     * 得到历史签约家庭
     * @param pageInfo
     * @return
     */
    public PageInfo<HistoryFamily> getFamilyList(PageInfo<HistoryFamily> pageInfo){
        return this.list(pageInfo,"from HistoryFamily f order by f.familyCode");
    }

    /**
     * 家庭编号查重
     * @param familyCode
     * @param historyFamilyId
     * @return
     */
    public HistoryFamily checkRepeat(String familyCode, Integer historyFamilyId) {
        return findUnique("from HistoryFamily where familyCode = ? and id <> ?", familyCode, historyFamilyId);
    }

    /**
     * 保存历史家庭信息
     * @param request
     */
    public synchronized void historyFamilySave(HttpServletRequest request){
        Integer historyFamilyId = ParamUtils.getInt(request, "historyFamilyId", 0);
        HistoryFamily historyFamily = this.get(historyFamilyId);
        if (historyFamily == null){
            historyFamily = new HistoryFamily();
        }
        Servlets.bind(request, historyFamily);
        this.save(historyFamily);
        //保存家庭成员信息
        String[] personIdArray = ParamUtils.getStringParameters(request, "hfp_id");   //id
        String[] personTypeArray = ParamUtils.getStringParameters(request, "hfp_type");   //类别
        String[] personNameArray = ParamUtils.getStringParameters(request, "hfp_name");   //姓名
        String[] personIdCardArray = ParamUtils.getStringParameters(request, "hfp_idCard");   //身份证号
        List<String[]> personDataList = Lists.newArrayList();
        personDataList.add(0, personIdArray);
        personDataList.add(1, personTypeArray);
        personDataList.add(2, personNameArray);
        personDataList.add(3, personIdCardArray);
        this.historyFamilyPersonService.saveHistoryFamilyPerson(personDataList,historyFamily.getId());

        //保存安置房源信息
        String[] houseIdArray = ParamUtils.getStringParameters(request, "fh_id");   //id
        String[] projectNameArray = ParamUtils.getStringParameters(request, "fh_projectName");   //项目名称
        String[] buildNumArray = ParamUtils.getStringParameters(request, "fh_buildNum");   //楼号
        String[] unitNumArray = ParamUtils.getStringParameters(request, "fh_unitNum");   //单元
        String[] houseNumArray = ParamUtils.getStringParameters(request, "fh_houseNum");   //房号
        String[] houseTypeArray = ParamUtils.getStringParameters(request, "fh_houseType");   //居室
        String[] houseHoldArray = ParamUtils.getStringParameters(request, "fh_houseHold");   //户型
        String[] buildAreaArray = ParamUtils.getStringParameters(request, "fh_buildArea");   //建筑面积
        List<String[]> houseDataList = Lists.newArrayList();
        houseDataList.add(0,houseIdArray);
        houseDataList.add(1,projectNameArray);
        houseDataList.add(2,buildNumArray);
        houseDataList.add(3,unitNumArray);
        houseDataList.add(4,houseNumArray);
        houseDataList.add(5,houseTypeArray);
        houseDataList.add(6,houseHoldArray);
        houseDataList.add(7,buildAreaArray);
        this.historyFamilyHouseService.saveHistoryFamilyHouse(houseDataList,historyFamily.getId());
    }
}
