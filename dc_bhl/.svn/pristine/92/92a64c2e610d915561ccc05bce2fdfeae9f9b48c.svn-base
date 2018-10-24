package com.app.cq.map;

import com.google.common.collect.Maps;

import java.util.Map;

/**
 * 导出集体土地excel时使用的map
 * Created by lsh on 2017/7/27.
 */
public class FamilyExcelMap {

    /**
     * 入户基础信息Map
     * @return
     */
    public static Map familyMap(){
        Map map = Maps.newLinkedHashMap();
        map.put("familyCode","编号");
        map.put("bdCode","分指");
        map.put("groupCode","组别");
        map.put("name","被拆迁人");
        map.put("tel","联系电话");
        map.put("idCard","身份证号");
        map.put("marryStatus","婚姻状况");
        map.put("address","地址门牌");
        map.put("houseType","房屋产别");
        map.put("houseCompany","产权单位");
        map.put("houseStyle","房屋类型");
        map.put("houseNum","间数");
        map.put("useArea","使用面积");
        map.put("buildArea","建筑面积");
        map.put("houseUse","用途");
        map.put("businessCode","营业执照号");
//        map.put("businessArea","营业面积");
        map.put("zjHouseNum","自建房间数");
        map.put("zjHouseArea","自建房面积");
        map.put("houseStatus","是否有标准自建");
        map.put("dhNum","电话");
        map.put("ktNum","空调");
        map.put("yxNum","有线电视");
        map.put("kdNum","宽带");
        map.put("rsqNum","热水器");
        map.put("dbNum","低保");
        map.put("cjNum","残疾");
        map.put("dabNum","大病");
        map.put("lowNum","低收入家庭救助");
        map.put("armyNum","现役军人");
        map.put("fgFee","房改售房代扣款");
        map.put("summary","备注");
        return map;
    }

    /**
     * 方案信息
     * @return
     */
    public static Map xyInfoMap(){
        Map map = Maps.newLinkedHashMap();
        map.put("pgCompany","评估公司名称");
        map.put("houseMoney","房屋价值补偿");
        map.put("fitPgMoney","装修补偿");
        map.put("houseNewMoney","重置成新价");
        map.put("yjMoney","设备移机费");
        map.put("ktFee","空调费");
        map.put("dhFee","电话费");
        map.put("tvFee","有线电视费");
        map.put("rsqFee","热水器费");
        map.put("kdFee","宽带费");
        map.put("cjFee","残疾费");
        map.put("dbFee","低保费");
        map.put("dabFee","大病费");
        map.put("lowFee","低收入补助费");
        map.put("armyFee","军人补助费");
        return map;
    }


    /**
     * 签约、交房信息
     * @return
     */
    public static Map signMap(){
        Map map = Maps.newLinkedHashMap();
        map.put("bcType","补偿方式");
        map.put("signStatus","签约状态");
        map.put("signNum","签约顺序号");
        map.put("signDate","签约时间");
        map.put("signPerson","签约操作人");
        map.put("jfStatus","交房状态");
        map.put("jfDate","交房时间");
        map.put("jfMemo","交房备注");
        return map;
    }

    /**
     * 其他信息
     * @return
     */
    public static Map otherMap(){
        Map map = Maps.newLinkedHashMap();
        map.put("sureStatus","数据确认状态");
        map.put("firstCheckStatus","审计初审状态");
        map.put("lastCheckStatus","审计终审状态");
        map.put("familyPerson","家庭成员");
//        map.put("houseInfo","选房信息");//房源信息放最后
        return map;
    }


    /**
     * 标题Map
     * @return
     */
    public static Map<String,Map> jspShowMap(){
        Map map = Maps.newLinkedHashMap();
        map.put("入户信息",familyMap());
//        map.put("方案信息",xyInfoMap());
//        map.put("签约、交房信息",signMap());
        map.put("其他信息",otherMap());
        return map;
    }


    /**
     * 总Map
     * @return
     */
    public static Map excelMap(){
        Map map = Maps.newLinkedHashMap();
        map.putAll(familyMap());
//        map.putAll(signMap());
//        map.putAll(xyInfoMap());
        map.putAll(otherMap());
        return map;
    }
}
