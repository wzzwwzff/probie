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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**********************8
 * 
 */
public class CalcUtils {

    private static DataDictService dataDictService;
    private static FamilyService familyService;
    private static Map<String, String> bzMap = Maps.newHashMap();
    private static Boolean ifReward = false;
    private static Boolean ifOneReward = false;

    /**
     * 计算方法
     */
    public synchronized static void calc(Family family) {
        WebApplicationContext webApplicationContext = Servlets.getWebApplicationContext();
        familyService = (FamilyService) webApplicationContext.getBean(FamilyService.class);
        dataDictService = (DataDictService) webApplicationContext.getBean(DataDictService.class);
        bzMap = dataDictService.getMapByParentAttributeNameForName("协议费用标准");
        if (family == null) {
            return;
        }

        ifReward = rewardYes(family);  //是否在奖励期内签约
        ifOneReward = oneRewardYes(family);  //是否在第一个奖励期内签约



        //系统计算时
        if (family.getJsType() == null || family.getJsType() == 2){
            calcResetArea(family);  //定向安置房面积、人口
//        //计算定额装修补助费
//        calDezxbzf(family);
            //计算区位补偿价
            calQwMoney(family);
            //计算搬家补助费
            calBjbzFee(family);
            //移机费计算
            calcYjMoney(family);
            //人员安置补助费
            calRyazFee(family);
            //安置房补助
            calAzfbzFee(family);
            //生活补助
            calShbzFee(family);
            //提前搬家奖
            calTqbjf(family);
            //空地奖
//            calcKdMoney(family);
//        //计算装修补助费
//        calRealZxbzFee(family);
            //合法利用奖
            calConfirmFee(family);

            System.out.println("系统计算******************************");
        }
        try {
            //计算总计
            calcAllMoney(family);
        } catch (Exception e) {
            throw new SqdsException("计算出错，请重试！");
        }
        //计算安置认购款
        calAZMoney(family);
        //临时周转租房补助费
        calLszzfFee(family);
        //独生子女补助费
        calOnlyOneFee(family);
        //停产停业
//        calTctyfFee(family);
        //计算大病、残疾、低保补助费
        calcShknMoney(family);
        calcPgCountMoney(family);

        familyService.save(family);
    }


    /*************************
     * 计算安置面积
     * @param family
     */
    private static void calcResetArea(Family family) {
        WebApplicationContext webApplicationContext = Servlets.getWebApplicationContext();
        FamilyPersonService familyPersonService = (FamilyPersonService) webApplicationContext.getBean(FamilyPersonService.class);
        List<FamilyPerson> persons = familyPersonService.listByFamilyId(family.getId());//所有家庭人员
        List<FamilyPerson> azPersons = familyPersonService.getAzFamilyPerson(family.getId());//安置人员
        Integer personOne = familyPersonService.getPersonOneNum(persons); //独生子女
        Integer personNo = familyPersonService.getPersonNoNum(azPersons);  //大龄未婚
        Integer personPregnancy = familyPersonService.getPersonPregnancyNum(azPersons);//怀孕人数
        Integer personNum = familyPersonService.getPersonNum(azPersons);//家庭成员总人数

        BigDecimal area = new BigDecimal(bzMap.get("安置房选房面积"));
        BigDecimal bili = new BigDecimal(bzMap.get("安置面积比例"));
        BigDecimal addArea1 = new BigDecimal(bzMap.get("未婚"));
        BigDecimal addArea2 = new BigDecimal(bzMap.get("怀孕"));

        BigDecimal houseArea = new BigDecimal("0");
        if (family.getType() != null && family.getType() == 1) {
            houseArea = BigDecimalUtils.getBigDecimalAndIntegerMultiply(area, personNum).setScale(0,BigDecimal.ROUND_HALF_UP);
            BigDecimal houseAddArea1 = BigDecimalUtils.getBigDecimalAndIntegerMultiply(addArea1, personNo).setScale(0,BigDecimal.ROUND_HALF_UP);
//            BigDecimal houseAddArea2 = BigDecimalUtils.getBigDecimalAndIntegerMultiply(addArea2, personPregnancy).setScale(2,BigDecimal.ROUND_HALF_UP);
//            houseArea = BigDecimalUtils.getSum(houseArea, houseAddArea1, houseAddArea2);
            houseArea = BigDecimalUtils.getSum(houseArea,houseAddArea1);
        } else {
            houseArea = BigDecimalUtils.getBigDecimalAndBigDecimalMultiply(family.getConfirmArea(), bili).setScale(2, BigDecimal.ROUND_HALF_UP);
        }

        family.setHouseControlArea(houseArea);
        family.setPersonNum(personNum);
        family.setPersonOne(personOne);
        family.setPersonNo(personNo);
        family.setPersonPregnancy(personPregnancy);
   }

//    /**
//     * 计算定额装修补助费
//     *
//     * @param family
//     */
//    private static void calDezxbzf(Family family) {
//        BigDecimal zxbz = new BigDecimal(bzMap.get("定额装修补助"));
//        BigDecimal dezxbzbf = BigDecimalUtils.getBigDecimalAndBigDecimalMultiply(zxbz,BigDecimalUtils.getNotNull(family.getBuildArea()));
//        family.setDezxbzf(dezxbzbf);
//    }

    /**
     * 计算区位补偿价
     * @param family
     */
    private static void calQwMoney(Family family) {
        BigDecimal qw = new BigDecimal(bzMap.get("宅基地面积控制标准费"));
        BigDecimal qw2 = qw.multiply(new BigDecimal("0.5"));
        BigDecimal controlArea = BigDecimalUtils.getNotNull(family.getControlArea());
        if(controlArea.compareTo(new BigDecimal(200))<0&&family.getFamilyCode().equals("414")){
            controlArea=new BigDecimal(200);
        }
        BigDecimal outControlArea = BigDecimalUtils.getNotNull(family.getOutControlArea());
        BigDecimal inqwFee = RoundUtils.sswr1(BigDecimalUtils.getBigDecimalAndBigDecimalMultiply(qw,controlArea));
        BigDecimal outqwFee = RoundUtils.sswr1(BigDecimalUtils.getBigDecimalAndBigDecimalMultiply(qw2,outControlArea));
        BigDecimal qwMoney = RoundUtils.sswr1(BigDecimalUtils.getSum(inqwFee,outqwFee));
        family.setInqwFee(inqwFee);
        family.setOutqwFee(outqwFee);
        family.setQwMoney(qwMoney);
    }


    /**
     * 计算搬家补助费
     * @param family
     */
    private static void calBjbzFee(Family family){
        BigDecimal bjbzFee = new BigDecimal(bzMap.get("搬家补助费"));
        if(family.getFamilyCode().equals("521-1")||family.getFamilyCode().equals("218-1")||family.getFamilyCode().equals("308-1")){
            bjbzFee=new BigDecimal(0);
        }
        family.setBjbzFee(bjbzFee);

    }

    /**
     * 计算移机费
     *
     * @param family
     */
    private static void calcYjMoney(Family family) {
        //从数据字典中取出各移机的单价费用
        BigDecimal ktFee = new BigDecimal(bzMap.get("空调移机费"));
        BigDecimal rsqFee = new BigDecimal(bzMap.get("热水器迁移费"));
        BigDecimal yxFee = new BigDecimal(bzMap.get("有线电视迁移费"));
        BigDecimal kdFee = new BigDecimal(bzMap.get("宽带移机费"));
        BigDecimal dhFee = new BigDecimal(bzMap.get("电话移机费"));

        BigDecimal ktMoney = BigDecimalUtils.getBigDecimalAndIntegerMultiply(ktFee, family.getAirConditionerNum()).setScale(0,BigDecimal.ROUND_HALF_UP);
        BigDecimal rsqMoney = BigDecimalUtils.getBigDecimalAndIntegerMultiply(rsqFee, family.getWaterHeaterNum()).setScale(0,BigDecimal.ROUND_HALF_UP);
        BigDecimal yxMoney = BigDecimalUtils.getBigDecimalAndIntegerMultiply(yxFee, family.getTvNum()).setScale(0,BigDecimal.ROUND_HALF_UP);
        BigDecimal kdMoney = BigDecimalUtils.getBigDecimalAndIntegerMultiply(kdFee, family.getBroadbandNum()).setScale(0,BigDecimal.ROUND_HALF_UP);
        BigDecimal dhMoney = BigDecimalUtils.getBigDecimalAndIntegerMultiply(dhFee, family.getTelephoneNum()).setScale(0,BigDecimal.ROUND_HALF_UP);

        family.setYjfSumFee(BigDecimalUtils.getSum(ktMoney, rsqMoney, yxMoney, kdMoney, dhMoney));

    }

    /**
     *  计算人员安置补助费
     * @param family
     */
    private static void calRyazFee(Family family){
        BigDecimal ryazMoney = new BigDecimal(bzMap.get("人员安置补助费"));
        BigDecimal rybzFee=BigDecimalUtils.getBigDecimalAndBigDecimalMultiply(new BigDecimal(family.getPersonNum()),ryazMoney).setScale(0,BigDecimal.ROUND_HALF_UP);
        if(!ifReward){//奖励期外独生子女补助费,人员安置补助费0
            rybzFee=new BigDecimal(0);
        }
        family.setRybzFee(rybzFee);
    }

    /**
     * 计算安置房补助费
     * @param family
     */
   private static void calAzfbzFee(Family family){
       BigDecimal azfbzMoney = new BigDecimal(bzMap.get("安置房补助"));
       BigDecimal azfbzFee=new BigDecimal(0);
       if(family.getType()==1){  //按人均50安置补偿
           azfbzFee=BigDecimalUtils.getBigDecimalAndBigDecimalMultiply(azfbzMoney,BigDecimalUtils.getNotNull(family.getHouseControlArea())).setScale(0,BigDecimal.ROUND_HALF_UP);
           if(!ifReward){//按人口安置的奖励期外安置房补助0
               azfbzFee=new BigDecimal(0);
           }
       }
       family.setAzfbzFee(azfbzFee);
   }

    /**
     *计算生活补助费
     * @param family
     */
    private static void calShbzFee(Family family){
        BigDecimal shbzMoney = new BigDecimal(bzMap.get("生活补助"));
        BigDecimal shbzFee=BigDecimalUtils.getBigDecimalAndBigDecimalMultiply(shbzMoney,BigDecimalUtils.getNotNull(family.getHouseControlArea())).setScale(0,BigDecimal.ROUND_HALF_UP);
        if(!ifReward){//奖励期外独生子女补助费,人员安置补助费0
            shbzFee=new BigDecimal(0);
        }
        family.setShbzFee(shbzFee);
    }

    /**
     * 停产停业补助费
     * @param family
     */
    private static void calTctyfFee(Family family) {
        if (family.getIsBussess() == 2) { //营业
            BigDecimal businessArea = BigDecimalUtils.getNotNull(family.getBussessArea());
            if (family.getIsDutyFree() == 2) { //免税
                BigDecimal tctyf = new BigDecimal(bzMap.get("免税停产停业补助费"));
                BigDecimal tctyfFee = BigDecimalUtils.getBigDecimalAndBigDecimalMultiply(tctyf, businessArea).setScale(0,BigDecimal.ROUND_HALF_UP);
                family.setTctyfFee(tctyfFee);
            } else {  //不免税
                BigDecimal tctyf = new BigDecimal(bzMap.get("不免税停产停业补助费"));
                BigDecimal tctyfFee = BigDecimalUtils.getBigDecimalAndBigDecimalMultiply(tctyf, businessArea).setScale(0,BigDecimal.ROUND_HALF_UP); //停产停业上限
                BigDecimal tctyfFee1 = BigDecimalUtils.getNotNull(family.getTctyfFee());  //拆迁填写的
                if (tctyfFee1.compareTo(tctyfFee) > 0) {
                    family.setTctyfFee(tctyfFee);
                }
            }
        } else {//不营业
            family.setTctyfFee(null);
        }
    }

    /**
     * 独生子女补助费
     * @param family
     */
    private static void calOnlyOneFee(Family family){
        Integer personOne = /*Integers.getNotNull(*/family.getPersonOne()/*)*/;
        BigDecimal onlyMoney = new BigDecimal(bzMap.get("独生子女补助费"));
        BigDecimal onlyFee=BigDecimalUtils.getBigDecimalAndBigDecimalMultiply(new BigDecimal(String.valueOf(personOne)),onlyMoney);
        if(!ifReward){//奖励期外独生子女补助费
            onlyFee=new BigDecimal(0);
        }
        family.setOnlyFee(onlyFee);
    }
    /**
     * 计算大病、残疾、低保补助费
     *
     * @param family
     */
    private static void calcShknMoney(Family family) {
        if (ifReward){
            //从数据字典中取出大病、残疾、低保补助费单价费用
            BigDecimal cjdbFee = new BigDecimal(bzMap.get("残疾、低保补助费"));
            BigDecimal dabFee = new BigDecimal(bzMap.get("大病补助费"));
            BigDecimal cjMoney = BigDecimalUtils.getBigDecimalAndIntegerMultiply(cjdbFee, Integers.getNotNull(family.getCjNum())).setScale(0,BigDecimal.ROUND_HALF_UP);
            BigDecimal dbMoney = BigDecimalUtils.getBigDecimalAndIntegerMultiply(cjdbFee, Integers.getNotNull(family.getDbNum())).setScale(0,BigDecimal.ROUND_HALF_UP);
            BigDecimal dabMoney = BigDecimalUtils.getBigDecimalAndIntegerMultiply(dabFee, Integers.getNotNull(family.getDabNum())).setScale(0,BigDecimal.ROUND_HALF_UP);
            family.setCjMoney(cjMoney);
            family.setDbMoney(dbMoney);
            family.setDabMoney(dabMoney);
            family.setShknMoney(BigDecimalUtils.getSum(cjMoney, dbMoney,dabMoney));
        }else{
            family.setCjMoney(new BigDecimal("0"));
            family.setDbMoney(new BigDecimal("0"));
            family.setDabMoney(new BigDecimal("0"));
            family.setShknMoney(new BigDecimal("0"));
        }
    }

    /**
     * 计算空地奖
     *
     * @param family
     */
    private static void calcKdMoney(Family family) {
        BigDecimal ktjFee = new BigDecimal(bzMap.get("空地奖"));

        BigDecimal area =BigDecimalUtils.getNotNull(family.getConfirmArea()).subtract(BigDecimalUtils.getNotNull(family.getBuildArea())) ;

        family.setKtjFee(ktjFee.multiply(area).setScale(0,BigDecimal.ROUND_HALF_UP));

    }

    /**
     *提前搬家奖
     * @param family
     */
    private static void calTqbjf(Family family){
        BigDecimal tqbj = new BigDecimal(bzMap.get("提前搬家奖"));
        BigDecimal qian = new BigDecimal(bzMap.get("比例递减"));
        BigDecimal tqbjFee=BigDecimalUtils.getBigDecimalAndBigDecimalMultiply(tqbj,BigDecimalUtils.getNotNull(family.getConfirmArea())).setScale(0,BigDecimal.ROUND_HALF_UP);
        if(!ifOneReward){//从16日递减
            BigDecimal subFee=BigDecimalUtils.getBigDecimalAndBigDecimalMultiply(tqbjFee,qian).setScale(0,BigDecimal.ROUND_HALF_UP);
            tqbjFee=tqbjFee.subtract((BigDecimalUtils.getBigDecimalAndIntegerMultiply(subFee, getOneDay(family))).setScale(0, BigDecimal.ROUND_HALF_UP));

        }
        if (!ifReward){//签约期外
            tqbjFee = new BigDecimal(0);
        }

        family.setTqbjfFee(tqbjFee);
    }

    /**
     * 临时周转租房补助费
     * @param family
     */
    private static void calLszzfFee(Family family){
        BigDecimal lsazMoney = new BigDecimal(bzMap.get("临时周转费"));
        BigDecimal month = new BigDecimal(bzMap.get("临时周转月"));
        Integer chaMonth = getOneMonth(family);
        if (family.getAzHouseAreaTotal() == null || family.getAzHouseAreaTotal().compareTo(new BigDecimal(0)) == 0){
            month = new BigDecimal(4);
        }else {
            if (BigDecimalUtils.jian(month,new BigDecimal(chaMonth)).compareTo(new BigDecimal(4)) < 0){
                month = new BigDecimal(4);
            }else {
                month = BigDecimalUtils.jian(month,new BigDecimal(chaMonth));
            }
        }
        BigDecimal lsazf=month.multiply(lsazMoney);
        BigDecimal lsazFee=BigDecimalUtils.getBigDecimalAndBigDecimalMultiply(new BigDecimal(String.valueOf(family.getPersonNum())),lsazf).setScale(0,BigDecimal.ROUND_HALF_UP);
        family.setLsazfFee(lsazFee);
    }

    /**
     * 得到差的月份
     */
    public static Integer getOneMonth(Family family) {
        Map<String, String> jlqMap = dataDictService.getMapByParentAttributeNameForName("奖励期时间");
        String endDate = jlqMap.get("签约结束时间");
        Date currentDate = family.getQyDate() == null ? new Date() : family.getQyDate();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");

        Calendar endDateC = Calendar.getInstance();
        Calendar currentDateC = Calendar.getInstance();

        try {
            endDateC.setTime(simpleDateFormat.parse(endDate));
            String cur = simpleDateFormat.format(currentDate);
            currentDateC.setTime(simpleDateFormat.parse(cur));
        } catch (ParseException e) {
        }

        int result = currentDateC.get(Calendar.MONTH) - endDateC.get(Calendar.MONTH) + (currentDateC.get(Calendar.YEAR) - endDateC.get(Calendar.YEAR)) * 12;

        if (result >= 0) {
            return result;
        } else {
            return 0;
        }
    }

    /**
     * 计算评估合计
     * @param family
     */
    private static void calcPgCountMoney(Family family){
        BigDecimal realPgFee =BigDecimalUtils.getSum(family.getInqwFee(),family.getOutqwFee(),
                family.getFswFee(),family.getKtjFee(),family.getRealZxbzFee(),family.getFhbcfFee());

        family.setPgAllCount(realPgFee);
    }

    /**
     * 合法利用奖
     *
     * @param family
     */
    private static void calConfirmFee(Family family) {
        BigDecimal hflyFee = new BigDecimal(bzMap.get("合法利用奖"));
        if (family.getIsGiveup() == 2) {//是否包含未经审批房屋重置成新价  1不包含 2包含
            hflyFee = new BigDecimal(0);
        }
        if (!ifReward) {//奖励期外合法利用奖0
            hflyFee = new BigDecimal(0);
        }
        family.setConfirmFee(hflyFee);
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
     * 判断是否是第一奖励期16天内
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
    private static void calcAllMoney(Family family) throws IllegalAccessException, NoSuchMethodException, InvocationTargetException {
        Field[] fields = family.getClass().getDeclaredFields();
        String property = "";
        BigDecimal sum = new BigDecimal(0);
        for (Field field : fields) {
            property = field.getName();
            if (property.endsWith("Fee")) {
                Object value = BeanUtils.getProperty(family, property);
                if (value != null) {
                    sum = sum.add(BigDecimalUtils.getNotNull(new BigDecimal(String.valueOf(value))).setScale(0, BigDecimal.ROUND_HALF_UP));
                    System.out.println(property + "：" + String.valueOf(value));
                }
            }
        }
        sum = sum.subtract(BigDecimalUtils.getNotNull(family.getLsazfFee())).subtract(BigDecimalUtils.getNotNull(family.getOnlyFee())).subtract(BigDecimalUtils.getNotNull(family.getTctyfFee())).subtract(BigDecimalUtils.getNotNull(family.getZfknFee())).subtract(BigDecimalUtils.getNotNull(new BigDecimal(family.getIsLandFee())));

        family.setBcSumTatal(sum);
    }

    /**
     * 计算安置房认购款
     */
    private static void calAZMoney(Family family){
        BigDecimal azHouseAreaTotal = family.getAzHouseAreaTotal();
        family.setHouseTotal(BigDecimalUtils.getBigDecimalAndIntegerMultiply(azHouseAreaTotal,2100));
    }

}
