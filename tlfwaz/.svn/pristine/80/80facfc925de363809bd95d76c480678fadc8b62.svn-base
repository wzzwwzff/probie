package com.app.cq.utils;

import com.app.cq.model.Family;
import com.app.cq.model.House;
import com.sqds.utils.StringUtils;

import java.math.BigDecimal;
import java.util.List;

/**
 * 选房限制
 * Created by jmdf on 2018/9/19.
 */
public class ChooseHouseUtils {

    public static boolean levelLimit(Family family, House house, List<House> houseList) {
        Boolean result = false;
        int index = 0;
        //应选面积
        BigDecimal gfArea = BigDecimals.getNotNull(family.getGfArea());
        gfArea = gfArea.add(new BigDecimal("30"));
        BigDecimal area = BigDecimals.getNotNull(house.getBuildArea());

        if (houseList == null || houseList.size() == 0) {
            if ((gfArea.compareTo(area) > -1)) {
                result = true;
            }

        } else {
            //已选房面积
            BigDecimal allArea = new BigDecimal(0);
            for (House sHouse : houseList) {
                BigDecimal sArea = new BigDecimal(StringUtils.getNotNullDecimal(sHouse.getBuildArea()));
                allArea = allArea.add(sArea);
                index = index + 1;
            }
            index = index + 1;
            allArea = allArea.add(area);

            if ((gfArea.compareTo(allArea) > -1)) {
                result = true;
            }
        }

        return result;
    }
}
