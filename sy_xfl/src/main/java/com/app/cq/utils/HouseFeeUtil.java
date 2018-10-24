package com.app.cq.utils;

import com.google.common.collect.Lists;

import java.math.BigDecimal;
import java.util.List;

public class HouseFeeUtil {



    private List<HouseModel> houseModelList = Lists.newArrayList();

    private HouseFeeUtil(){

    }

    public HouseFeeUtil(BigDecimal oldHouseArea){
        BigDecimal area1 = oldHouseArea.multiply(new BigDecimal("1.4"));
        BigDecimal area2 = oldHouseArea.multiply(new BigDecimal("2.0")).subtract(area1);
        houseModelList.add(new HouseModel("1:1.4比例置换",area1, Global.HOUSE_1_4_PRICE));
        houseModelList.add(new HouseModel("1.4:2.0比例置换",area2, Global.HOUSE_2_0_PRICE));
    }

    public List<HouseModel> result(BigDecimal houseArea){
        List<HouseModel> list = Lists.newArrayList();

        result(houseArea,list);

        BigDecimal totalArea = new BigDecimal("0");
        for(HouseModel houseModel : list){
            totalArea = totalArea.add(houseModel.getArea());
        }

        if(houseArea.compareTo(totalArea)>0){
            list.add(new HouseModel("超过2.0部分",houseArea.subtract(totalArea),Global.HOUSE_THAN_2_0_PRICE ));
        }


        for(HouseModel houseModel : list){
            System.out.println(houseModel.toString());
        }

        return list;
    }

    private void result(BigDecimal houseArea,List<HouseModel> result){
        for(HouseModel houseModel : houseModelList){
            if(houseModel.getArea().compareTo(BigDecimal.ZERO)<0){
                continue;
            }

            BigDecimal tempArea = houseModel.getArea().subtract(houseArea);

            if(tempArea.compareTo(BigDecimal.ZERO)>0){
                result.add(new HouseModel(houseModel.getStand(),houseArea, houseModel.getPrice()));
                houseModel.setArea(houseModel.getArea().subtract(houseArea));
                break;
            }else{
                if(tempArea.abs().compareTo(houseArea)<0){
                    result.add(new HouseModel(houseModel.getStand(),houseModel.getArea(), houseModel.getPrice()));
                    houseModel.setArea(BigDecimal.ZERO);

                    if(tempArea.compareTo(BigDecimal.ZERO)<0) {
                        result(tempArea.abs(), result);
                        break;
                    }else{
                        break;
                    }
                }
            }
        }

    }

}
