package com.app.cq.utils;

import com.app.common.service.DataDictService;
import com.app.cq.model.Family;
import com.app.cq.model.FamilyPerson;
import com.app.cq.service.FamilyPersonService;
import com.app.cq.service.FamilyService;
import com.google.common.collect.Maps;
import com.sqds.exception.SqdsException;
import com.sqds.utils.DateUtils;
import com.sqds.web.Servlets;
import org.apache.commons.beanutils.BeanUtils;
import org.springframework.web.context.WebApplicationContext;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.math.BigDecimal;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**********************8
 * 
 */
public class VirtualCalcUtils {

    private static DataDictService dataDictService;
    private static FamilyService familyService;
    private static Map<String, String> bzMap = Maps.newHashMap();
    private static Boolean ifReward = false;
    private static Boolean ifOneReward = false;

    /**
     * 计算方法
     */
    public synchronized static Family calc(Family family,Integer type) {
        WebApplicationContext webApplicationContext = Servlets.getWebApplicationContext();
        familyService = (FamilyService) webApplicationContext.getBean(FamilyService.class);
        dataDictService = (DataDictService) webApplicationContext.getBean(DataDictService.class);
        bzMap = dataDictService.getMapByParentAttributeNameForName("协议费用标准");
        Family family1 = new Family();
        if (family == null) {
            return family1;
        }

        family1.setType(type);
        ifReward = rewardYes(family);  //是否在奖励期内签约
        ifOneReward = oneRewardYes(family);  //是否在第一个奖励期内签约

        calcResetArea(family,family1);  //定向安置房面积、人口

//        //计算定额装修补助费
//        calDezxbzf(family,family1);
        //计算搬家补助费
        calBjbzFee(family,family1);
        //移机费计算
        calcYjMoney(family,family1);
        //人员安置补助费
        calRyazFee(family,family1);
       //安置房补助
        calAzfbzFee(family,family1);
        //生活补助
        calShbzFee(family,family1);
        //独生子女补助费
        calOnlyOneFee(family,family1);
        //提前搬家奖
        calTqbjf(family,family1);
        //临时周转租房补助费
        calLszzfFee(family,family1);
        //计算大病、残疾、低保补助费
        calcShknMoney(family,family1);
//        //计算装修补助费
//        calRealZxbzFee(family,family1);
        //合法利用奖
        calConfirmFee(family,family1);
        //停产停业
        calTctyfFee(family,family1);
        try {
            //计算总计
            calcAllMoney(family,family1);
        } catch (Exception e) {
            throw new SqdsException("计算出错，请重试！");
        }

        return family1;
    }


    /*************************
     * 计算安置面积
     * @param family
     */
    private static void calcResetArea(Family family,Family family1) {
        WebApplicationContext webApplicationContext = Servlets.getWebApplicationContext();
        Integer personOne = family.getPersonOne(); //独生子女
        Integer personNo = family.getPersonNo();  //大龄未婚
        Integer personPregnancy = family.getPersonPregnancy();//怀孕人数
        Integer personNum = family.getPersonNum();//家庭成员总人数

        BigDecimal area = new BigDecimal(bzMap.get("安置房选房面积"));
        BigDecimal bili = new BigDecimal(bzMap.get("安置面积比例"));
        BigDecimal addArea1 = new BigDecimal(bzMap.get("未婚"));
        BigDecimal addArea2 = new BigDecimal(bzMap.get("怀孕"));

        BigDecimal houseArea = new BigDecimal("0");
        if (family1.getType() != null && family1.getType() == 1) {
            houseArea = BigDecimalUtils.getBigDecimalAndIntegerMultiply(area, personNum).setScale(2,BigDecimal.ROUND_HALF_UP);
            BigDecimal houseAddArea1 = BigDecimalUtils.getBigDecimalAndIntegerMultiply(addArea1, personNo).setScale(2,BigDecimal.ROUND_HALF_UP);
            //去掉怀孕的安置面积
//            BigDecimal houseAddArea2 = BigDecimalUtils.getBigDecimalAndIntegerMultiply(addArea2, personPregnancy).setScale(2,BigDecimal.ROUND_HALF_UP);
//            houseArea = BigDecimalUtils.getSum(houseArea, houseAddArea1, houseAddArea2);
            houseArea = BigDecimalUtils.getSum(houseArea, houseAddArea1);
        } else {
             BigDecimal confirmArea= family.getConfirmArea();
            if(family.getFamilyCode().equals("414")){
                confirmArea=new BigDecimal(192);
            }
            houseArea = BigDecimalUtils.getBigDecimalAndBigDecimalMultiply(confirmArea, bili).setScale(2, BigDecimal.ROUND_HALF_UP);
        }

        family1.setHouseControlArea(houseArea);
        family1.setPersonNum(personNum);
        family1.setPersonOne(personOne);
        family1.setPersonNo(personNo);
        family1.setPersonPregnancy(personPregnancy);
   }

//    /**
//     * 计算定额装修补助费
//     *
//     * @param family
//     */
//    private static void calDezxbzf(Family family,Family family1) {
//        BigDecimal zxbz = new BigDecimal(bzMap.get("定额装修补助"));
//        BigDecimal dezxbzbf = BigDecimalUtils.getBigDecimalAndBigDecimalMultiply(zxbz,BigDecimalUtils.getNotNull(family.getBuildArea()));
//        family1.setDezxbzf(dezxbzbf);
//    }


    /**
     * 计算搬家补助费
     * @param family
     */
    private static void calBjbzFee(Family family,Family family1){
        BigDecimal bjbzFee = new BigDecimal(bzMap.get("搬家补助费"));
        family1.setBjbzFee(bjbzFee);

    }

    /**
     * 计算移机费
     *
     * @param family
     */
    private static void calcYjMoney(Family family,Family family1) {
        //从数据字典中取出各移机的单价费用
        BigDecimal ktFee = new BigDecimal(bzMap.get("空调移机费"));
        BigDecimal rsqFee = new BigDecimal(bzMap.get("热水器迁移费"));
        BigDecimal yxFee = new BigDecimal(bzMap.get("有线电视迁移费"));
        BigDecimal kdFee = new BigDecimal(bzMap.get("宽带移机费"));
        BigDecimal dhFee = new BigDecimal(bzMap.get("电话移机费"));

        BigDecimal ktMoney = BigDecimalUtils.getBigDecimalAndIntegerMultiply(ktFee, family.getAirConditionerNum()).setScale(2,BigDecimal.ROUND_HALF_UP);
        BigDecimal rsqMoney = BigDecimalUtils.getBigDecimalAndIntegerMultiply(rsqFee, family.getWaterHeaterNum()).setScale(2,BigDecimal.ROUND_HALF_UP);
        BigDecimal yxMoney = BigDecimalUtils.getBigDecimalAndIntegerMultiply(yxFee, family.getTvNum()).setScale(2,BigDecimal.ROUND_HALF_UP);
        BigDecimal kdMoney = BigDecimalUtils.getBigDecimalAndIntegerMultiply(kdFee, family.getBroadbandNum()).setScale(2,BigDecimal.ROUND_HALF_UP);
        BigDecimal dhMoney = BigDecimalUtils.getBigDecimalAndIntegerMultiply(dhFee, family.getTelephoneNum()).setScale(2,BigDecimal.ROUND_HALF_UP);

        family1.setYjfSumFee(BigDecimalUtils.getSum(ktMoney, rsqMoney, yxMoney, kdMoney, dhMoney));

    }

    /**
     *  计算人员安置补助费
     * @param family
     */
    private static void calRyazFee(Family family,Family family1){
        BigDecimal ryazMoney = new BigDecimal(bzMap.get("人员安置补助费"));
        BigDecimal rybzFee=BigDecimalUtils.getBigDecimalAndBigDecimalMultiply(new BigDecimal(family.getPersonNum()),ryazMoney).setScale(2,BigDecimal.ROUND_HALF_UP);
        if(!ifReward){//奖励期外独生子女补助费,人员安置补助费0
            rybzFee=new BigDecimal(0);
        }
        family1.setRybzFee(rybzFee);
    }

    /**
     * 计算安置房补助费
     * @param family
     */
   private static void calAzfbzFee(Family family,Family family1){
       BigDecimal azfbzMoney = new BigDecimal(bzMap.get("安置房补助"));
       BigDecimal azfbzFee=new BigDecimal(0);
       if(family1.getType()==1){  //按人均50安置补偿
           azfbzFee=BigDecimalUtils.getBigDecimalAndBigDecimalMultiply(azfbzMoney,BigDecimalUtils.getNotNull(family1.getHouseControlArea())).setScale(2,BigDecimal.ROUND_HALF_UP);
           if(!ifReward){//按人口安置的奖励期外安置房补助0
               azfbzFee=new BigDecimal(0);
           }
       }
       family1.setAzfbzFee(azfbzFee);
   }

    /**
     *计算生活补助费
     * @param family
     */
    private static void calShbzFee(Family family,Family family1){
        BigDecimal shbzMoney = new BigDecimal(bzMap.get("生活补助"));

        BigDecimal area =family1.getHouseControlArea();
        if(family.getFamilyCode().equals("414")&&family1.getType()==2){
            area=new BigDecimal("134.4");
        }
        BigDecimal shbzFee=BigDecimalUtils.getBigDecimalAndBigDecimalMultiply(shbzMoney,area).setScale(2,BigDecimal.ROUND_HALF_UP);
        if(!ifReward){//奖励期外独生子女补助费,人员安置补助费0
            shbzFee=new BigDecimal(0);
        }
        family1.setShbzFee(shbzFee);
    }

    /**
     * 停产停业补助费
     * @param family
     */
    private static void calTctyfFee(Family family,Family family1) {
        if (family.getIsBussess() == 2) { //营业
            family1.setTctyfFee(family.getTctyfFee());
            BigDecimal businessArea = BigDecimalUtils.getNotNull(family.getBussessArea());
            if (family.getIsDutyFree() == 2) { //免税
                BigDecimal tctyf = new BigDecimal(bzMap.get("免税停产停业补助费"));
                BigDecimal tctyfFee = BigDecimalUtils.getBigDecimalAndBigDecimalMultiply(tctyf, businessArea).setScale(2,BigDecimal.ROUND_HALF_UP);
                family1.setTctyfFee(tctyfFee);
            } else {  //不免税
                BigDecimal tctyf = new BigDecimal(bzMap.get("不免税停产停业补助费"));
                BigDecimal tctyfFee = BigDecimalUtils.getBigDecimalAndBigDecimalMultiply(tctyf, businessArea).setScale(2,BigDecimal.ROUND_HALF_UP); //停产停业上限
                BigDecimal tctyfFee1 = BigDecimalUtils.getNotNull(family1.getTctyfFee());  //拆迁填写的
                if (tctyfFee1.compareTo(tctyfFee) > 0) {
                    family1.setTctyfFee(tctyfFee);
                }
            }
        } else {//不营业
            family1.setTctyfFee(null);
        }
    }

    /**
     * 独生子女补助费
     * @param family
     */
    private static void calOnlyOneFee(Family family,Family family1){
        Integer personOne = Integers.getNotNull(family.getPersonOne());
        BigDecimal onlyMoney = new BigDecimal(bzMap.get("独生子女补助费"));
        BigDecimal onlyFee=BigDecimalUtils.getBigDecimalAndBigDecimalMultiply(new BigDecimal(String.valueOf(personOne)),onlyMoney);
        if(!ifReward){//奖励期外独生子女补助费
            onlyFee=new BigDecimal(0);
        }
        family1.setOnlyFee(onlyFee);
    }
    /**
     * 计算大病、残疾、低保补助费
     *
     * @param family
     */
    private static void calcShknMoney(Family family,Family family1) {
        if (ifReward){
            //从数据字典中取出大病、残疾、低保补助费单价费用
            BigDecimal cjdbFee = new BigDecimal(bzMap.get("残疾、低保补助费"));
            BigDecimal dabFee = new BigDecimal(bzMap.get("大病补助费"));
            BigDecimal cjMoney = BigDecimalUtils.getBigDecimalAndIntegerMultiply(cjdbFee, Integers.getNotNull(family.getCjNum())).setScale(2,BigDecimal.ROUND_HALF_UP);
            BigDecimal dbMoney = BigDecimalUtils.getBigDecimalAndIntegerMultiply(cjdbFee, Integers.getNotNull(family.getDbNum())).setScale(2,BigDecimal.ROUND_HALF_UP);
            BigDecimal dabMoney = BigDecimalUtils.getBigDecimalAndIntegerMultiply(dabFee, Integers.getNotNull(family.getDabNum())).setScale(2,BigDecimal.ROUND_HALF_UP);
            family1.setCjMoney(cjMoney);
            family1.setDbMoney(dbMoney);
            family1.setDabMoney(dabMoney);
            family1.setShknMoney(BigDecimalUtils.getSum(cjMoney, dbMoney,dabMoney));
        }else{
            family1.setCjMoney(new BigDecimal("0"));
            family1.setDbMoney(new BigDecimal("0"));
            family1.setDabMoney(new BigDecimal("0"));
            family1.setShknMoney(new BigDecimal("0"));
        }
    }


    /**
     *提前搬家奖
     * @param family
     */
    private static void calTqbjf(Family family,Family family1){
        BigDecimal tqbj = new BigDecimal(bzMap.get("提前搬家奖"));
        BigDecimal qian = new BigDecimal(bzMap.get("比例递减"));
        BigDecimal tqbjFee=BigDecimalUtils.getBigDecimalAndBigDecimalMultiply(tqbj,BigDecimalUtils.getNotNull(family.getConfirmArea())).setScale(2,BigDecimal.ROUND_HALF_UP);
        if(!ifOneReward){//从16日递减
            BigDecimal subFee=BigDecimalUtils.getBigDecimalAndBigDecimalMultiply(tqbjFee,qian).setScale(2,BigDecimal.ROUND_HALF_UP);
            tqbjFee=tqbjFee.subtract(BigDecimalUtils.getBigDecimalAndIntegerMultiply(subFee,getOneDay(family))).setScale(2,BigDecimal.ROUND_HALF_UP);
        }
        if(!ifReward){
            tqbjFee=new BigDecimal(0);
        }
        family1.setTqbjfFee(tqbjFee);
    }

    /**
     * 临时周转租房补助费
     * @param family
     */
    private static void calLszzfFee(Family family,Family family1){
        BigDecimal lsazMoney = new BigDecimal(bzMap.get("临时周转费"));
        BigDecimal month = new BigDecimal(bzMap.get("临时周转月"));
        BigDecimal lsazf=month.multiply(lsazMoney);
        BigDecimal lsazFee=BigDecimalUtils.getBigDecimalAndBigDecimalMultiply(new BigDecimal(String.valueOf(family.getPersonNum())),lsazf).setScale(2,BigDecimal.ROUND_HALF_UP);
        family1.setLsazfFee(lsazFee);
    }

//    /**
//     * 计算装修补助费
//     * @param family
//     */
//    private static void calRealZxbzFee(Family family,Family family1){
//        BigDecimal zxbzf = BigDecimalUtils.getNotNull(family.getZxbzf());
//        BigDecimal dezxbzf = BigDecimalUtils.getNotNull(family.getDezxbzf());
//        BigDecimal realZxbzfFee = null;
//        if (zxbzf.compareTo(dezxbzf)>=0){
//            realZxbzfFee = zxbzf;
//        }else{
//            realZxbzfFee = dezxbzf;
//        }
//        family1.setRealZxbzFee(realZxbzfFee);
//    }

    /**
     * 合法利用奖
     *
     * @param family
     */
    private static void calConfirmFee(Family family,Family family1) {
        BigDecimal hflyFee = new BigDecimal(bzMap.get("合法利用奖"));
        if (family.getIsGiveup() == 2) {//是否包含未经审批房屋重置成新价  1不包含 2包含
            hflyFee = new BigDecimal(0);
        }
        if (!ifReward) {//奖励期外合法利用奖0
            hflyFee = new BigDecimal(0);
        }
        family1.setConfirmFee(hflyFee);
    }

    /**
     * 得到差的天数
     */
    public static Integer getOneDay(Family family) {
        Map<String, String> jlqMap = dataDictService.getMapByParentAttributeNameForName("奖励期时间");
        String startDate = jlqMap.get("第一奖励期结束时间");
        Date currentDate = family.getQyDate() == null ? new Date() : family.getQyDate();

        Calendar startDateC = Calendar.getInstance();
        Calendar currentDateC = Calendar.getInstance();

        startDateC.setTime(DateUtils.string2date(startDate));
        currentDateC.setTime(currentDate);


        int result = currentDateC.get(Calendar.DAY_OF_YEAR) - startDateC.get(Calendar.DAY_OF_YEAR);
        if (result >= 0) {
            return result;
        } else {
            return 0;
        }
    }

    /**
     * 判断是否是奖励期内
     *
     * @param family
     */
    public static boolean rewardYes(Family family) {
        //判断是否为奖励期内
        Map<String, String> jlqMap = dataDictService.getMapByParentAttributeNameForName("奖励期时间");
        String endDate = jlqMap.get("签约结束时间");
        Date signDate = family.getQyDate() != null ? family.getQyDate() : new Date();

        Calendar endDateC = Calendar.getInstance();
        Calendar signDateC = Calendar.getInstance();

        endDateC.setTime(DateUtils.string2date(endDate));
        signDateC.setTime(DateUtils.string2date(DateUtils.date2string(signDate)));

        if (signDateC.compareTo(endDateC) < 0) {//奖励期内
            return true;
        } else {
            return false;
        }

    }

    /**
     * 判断是否是奖励期内前十六天
     *
     * @param family
     */
    public static boolean oneRewardYes(Family family) {
        //判断是否为奖励期内
        Map<String, String> jlqMap = dataDictService.getMapByParentAttributeNameForName("奖励期时间");
        String endDate = jlqMap.get("第一奖励期结束时间");
        Date signDate = family.getQyDate() != null ? family.getQyDate() : new Date();

        Calendar endDateC = Calendar.getInstance();
        Calendar signDateC = Calendar.getInstance();

        endDateC.setTime(DateUtils.string2date(endDate));
        signDateC.setTime(signDate);

        if (signDateC.compareTo(endDateC) <= 0) {
            return true;
        } else {
            return false;
        }

    }

    /**
     * 计算补偿总金额
     *
     * @param family
     */
    private static void calcAllMoney(Family family,Family family1) throws IllegalAccessException, NoSuchMethodException, InvocationTargetException {
        Field[] fields = family.getClass().getDeclaredFields();
        String property = "";
        BigDecimal sum = new BigDecimal(0);
        family1.setInqwFee(family.getInqwFee());
        family1.setOutqwFee(family.getOutqwFee());
        family1.setFswFee(family.getFswFee());
        family1.setRealZxbzFee(family.getRealZxbzFee());
        family1.setFhbcfFee(family.getFhbcfFee());
        family1.setKtjFee(family.getKtjFee());
        family1.setZfknFee(family.getZfknFee());
        family1.setOtherfFee(family.getOtherfFee());
        for (Field field : fields) {
            property = field.getName();
            if (property.endsWith("Fee")) {
                Object value = BeanUtils.getProperty(family1, property);
                if (value != null) {
                    sum = sum.add(BigDecimalUtils.getNotNull(new BigDecimal(String.valueOf(value))).setScale(2, BigDecimal.ROUND_HALF_UP));
                    System.out.println(property + "：" + String.valueOf(value));
                }
            }
        }

        family1.setBcSumTatal(sum);
    }

}