package com.app.cq.map;

import com.google.common.collect.Maps;

import java.util.Map;

/**
 * 综合导出excel时使用的map
 * Created by lsh on 2017/7/27.
 */
public class ContractExcelMap {

    /**
     * 申请家庭信息Map
     *
     * @return
     */
    public static Map familyMap() {
        Map map = Maps.newLinkedHashMap();
        map.put("f_projectName", "项目名称");
        map.put("f_familyCode", "申请编号");
        map.put("f_name", "申请人");
        map.put("f_idCard", "身份证号");
        map.put("f_familyPerson", "家庭成员");
        map.put("f_currentAddres", "通讯地址");
        map.put("f_phone", "联系电话");
        map.put("f_address", "户籍所在地");
        map.put("f_workUnit", "工作地");
        map.put("f_marryStatus", "婚姻状况");
        map.put("f_age", "年龄");
        map.put("f_cardType", "证件类型");
        map.put("f_applyDate", "申请日期");
        map.put("f_exSpouseName", "前配偶姓名");
        map.put("f_exCardType", "前配偶证件类型");
        map.put("f_exIdCard", "前配偶证件号码");
        map.put("f_divorceDate", "离婚日期");
        map.put("f_contactName", "联系人姓名");
        map.put("f_postCode", "邮编");
        map.put("f_memo", "备注");
        map.put("f_familyType", "家庭类型");
        map.put("f_residencePermit", "工作居住证类型");
        map.put("f_handleType", "办理使用证件类型");
        map.put("f_handleCard", "办理使用证件号码");
        map.put("f_residencePermitCode", "工作居住证编号");
        map.put("f_startDate", "有效期开始日期");
        map.put("f_endDate", "有效期截止日期");
        map.put("f_armyType", "军官（警官）证件");
        map.put("f_armyIdCard", "军警证件号码");
        map.put("f_registerCode", "暂住证/居住证、登记卡编号");
        map.put("f_houseSituation", "住房情况");
        map.put("f_incomeSituation", "收入情况");
        map.put("f_shakingBatch", "摇号批次");
        map.put("f_shakingCode", "摇号编号");
        map.put("f_shakingGroup", "摇号组别");
        map.put("f_shakingResult", "摇号结果");
        map.put("f_education", "学历层次");
        map.put("f_educationCode", "学历证书在线验证码");
        map.put("f_learning", "学习形式");
        map.put("f_job", "职务");
        map.put("f_continuity", "社保是否符合连续缴纳12个月要求");
        map.put("f_unit", "工作单位");
        map.put("f_unitPerson", "单位联系人");
        map.put("f_unitPhone", "单位联系电话");
        map.put("f_count", "家庭人口数");
        map.put("f_houseStatus", "住房审核状态");
        map.put("f_socialStatus", "社保审核状态");
        map.put("f_marriageStatus", "婚姻审核状态");
        map.put("f_ageStatus", "年龄审核状态");
        map.put("f_educationStatus", "学历审核状态");
        map.put("f_otherStatus", "其他审核状态");
        map.put("f_seniorityStatus", "资格复核状态");
        map.put("f_signStatus", "签约状态");
        map.put("f_dataStatus", "数据状态");
        map.put("f_thisArea", "京籍是否是本区");
//        map.put("f_nothisArea", "京籍非本区");
        map.put("f_firstOrNot", "是否优先组");
        map.put("f_thisPark", "是否园区");
        map.put("f_educationTrouble", "学历复核不通过原因");
//        map.put("f_nofirstOrNot", "非优先组");
        return map;
    }

    /**
     * 合同信息
     *
     * @return
     */
    public static Map baseInfoMap() {
        Map map = Maps.newLinkedHashMap();
        map.put("contractCode", "合同编号");
        map.put("person", "经办人");
        map.put("signDate", "合同签订时间");
        map.put("status", "合同状态");
        map.put("price", "销售价格");
        map.put("propertyRight", "产权比例");
        map.put("name", "产权人姓名");
        map.put("idCard", "产权人身份证号");
        map.put("status", "数据状态");
        map.put("operatePerson", "锁定人员");
        map.put("operateDate", "锁定日期");
        map.put("memo", "备注");
        map.put("operateMemo", "操作备注");
        map.put("reason", "退回原因");
        map.put("h_rentName", "分配后租房人/转售人姓名");
        map.put("h_rentIdCard", "分配后租房人/转售人身份证号");
        map.put("h_rentDate", "分配后出租日期/转售日期/回购日期");
        map.put("h_status", "分配状态");
        map.put("h_houseNum", "房间号");
        map.put("h_buildArea", "建筑面积");
        return map;
    }

    /**
     * 标题Map
     *
     * @return
     */
    public static Map<String, Map> jspShowMap() {
        Map map = Maps.newLinkedHashMap();
        map.put("申请家庭信息", familyMap());
        map.put("合同信息", baseInfoMap());
        return map;
    }

    /**
     * 总Map
     *
     * @return
     */
    public static Map excelMap() {
        Map map = Maps.newLinkedHashMap();
        map.putAll(familyMap());
        map.putAll(baseInfoMap());
        return map;
    }
}
