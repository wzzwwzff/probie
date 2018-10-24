package com.app.cq.service;

import com.app.cq.model.HistoryFamily;
import com.app.cq.model.HistoryFamilyHouse;
import com.sqds.hibernate.HibernateDao;
import com.sqds.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;

/**
 * Created by ZYK on 2018/5/23.
 */
@Service
public class HistoryFamilyHouseService extends HibernateDao<HistoryFamilyHouse>{

    @Autowired
    private HistoryFamilyService historyFamilyService;

    /**
     * 根据family id取得这个所有安置房源信息
     *
     * @param historyFamilyId
     * @return
     */
    public List<HistoryFamilyHouse> getHouseListByHistoryFamilyId(Integer historyFamilyId) {
        return list("from HistoryFamilyHouse fh where fh.historyFamily.id = ? order by fh.id", historyFamilyId);
    }

    /**
     * 保存历史签约安置房源
     * @param list
     * @param historyFamilyId
     */
    public synchronized void saveHistoryFamilyHouse(List<String[]> list, Integer historyFamilyId){
        HistoryFamily historyFamily = this.historyFamilyService.get(historyFamilyId);
        String[] houseIdArray = list.get(0);
        if (houseIdArray != null && houseIdArray.length > 0) {
            String[] projectNameArray = list.get(1);
            String[] buildNumArray = list.get(2);
            String[] unitNumArray = list.get(3);
            String[] houseNumArray = list.get(4);
            String[] houseTypeArray = list.get(5);
            String[] houseHoldArray = list.get(6);
            String[] buildAreaArray = list.get(7);
            for (int i = 0; i < houseIdArray.length; i++) {
                if (StringUtils.isEmpty(projectNameArray[i]) && StringUtils.isNotEmpty(houseIdArray[i])) {
                    this.delete(Integer.valueOf(houseIdArray[i]));
                } else if (StringUtils.isNotEmpty(projectNameArray[i])) {
                    HistoryFamilyHouse historyFamilyHouse = new HistoryFamilyHouse();
                    if (StringUtils.isNotEmpty(houseIdArray[i])) {
                        historyFamilyHouse = this.get(Integer.valueOf(houseIdArray[i]));
                    }
                    historyFamilyHouse.setProjectName(projectNameArray[i]);   //项目名称
                    historyFamilyHouse.setBuildNum(buildNumArray[i]);   //楼号
                    historyFamilyHouse.setUnitNum(unitNumArray[i]);   //单元
                    historyFamilyHouse.setHouseNum(houseNumArray[i]);   //房号
                    historyFamilyHouse.setHouseType(houseTypeArray[i]);   //居室
                    historyFamilyHouse.setHouseHold(houseHoldArray[i]);   //户型
                    if (StringUtils.isNotEmpty(buildAreaArray[i])){
                        historyFamilyHouse.setBuildArea(new BigDecimal(buildAreaArray[i]));   //建筑面积
                    }
                    historyFamilyHouse.setHistoryFamily(historyFamily);
                    this.save(historyFamilyHouse);
                }
            }
        }
    }
}
