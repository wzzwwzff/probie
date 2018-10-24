package com.app.cq.service;

import com.app.cq.en.ShowState;
import com.app.cq.model.Family;
import com.google.common.collect.Maps;
import com.sqds.hibernate.HibernateDao;
import com.sqds.page.PageInfo;
import com.sqds.utils.Collections3;
import com.sqds.utils.StringUtils;
import com.sqds.web.ParamUtils;
import org.apache.logging.log4j.util.Strings;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * Created by ZYK on 2018/2/4.
 */
@Service
public class StatisticsService extends HibernateDao<Family> {

    private String getParamString(String param) {
        String[] array = param.split(",");
        StringBuffer paramSb = new StringBuffer();
        for (String s : array) {
            paramSb.append("'" + s + "'").append(",");
        }
        paramSb.deleteCharAt(paramSb.lastIndexOf(","));
        return paramSb.toString();
    }

    /**
     * 查询条件的处理
     *
     * @param request
     * @return
     */
    private String getSearchString(HttpServletRequest request) {
        StringBuffer resultString = new StringBuffer();
        Enumeration<String> paramsArray = request.getParameterNames();
        while (paramsArray.hasMoreElements()) {
            String name = paramsArray.nextElement();
            String value = ParamUtils.getString(request, name, "");
            //多选的处理
            if (name.endsWith("Array")) {
                if (Strings.isNotEmpty(value)) {
                    if (name.indexOf("_string") > 0) {
                        value = this.getParamString(value);
                    }
                    String newName = name.substring(name.indexOf("_") + 1);
                    String columnName = newName.substring(0, newName.indexOf("_"));
                    resultString.append(" and f." + columnName + " in (" + value + ")");
                }
            }
            //大于小于的处理
            if (name.indexOf("_ge") > 0) {
                if (StringUtils.isNotEmpty(value)) {
                    String gtName = name.substring(name.lastIndexOf("_") + 1);
                    resultString.append(" and " + gtName + ">='" + value + "'");
                }
            }
            if (name.indexOf("_le") > 0) {
                if (StringUtils.isNotEmpty(value)) {
                    String gtName = name.substring(name.lastIndexOf("_") + 1);
                    resultString.append(" and " + gtName + "<='" + value + "'");
                }
            }
            //单选的处理
            if (name.indexOf("_status") > 0) {
                if (StringUtils.isNotEmpty(value)) {
                    String oneName = name.substring(name.lastIndexOf("_") + 1);
                    resultString.append(" and " + oneName + "=" + value);
                }
            }

            //单选框的处理

            if (name.indexOf("like") > 0) {
                if (StringUtils.isNotEmpty(value)) {
                    String inputName = name.substring(name.lastIndexOf("_") + 1);
                    resultString.append(" and " + inputName + " like '%" + value + "%'");
                }
            }
        }
        return resultString.toString();
    }

    /**
     * 综合统计查询方法
     *
     * @param pageInfo
     */
    public PageInfo<Family> getListForCompositeSearch(PageInfo<Family> pageInfo, HttpServletRequest request) {
        StringBuffer hql = new StringBuffer(" from Family f where 1 = 1 ");
        Enumeration<String> paramsArray = request.getParameterNames();
        while (paramsArray.hasMoreElements()) {
            String name = paramsArray.nextElement();
            if (name.endsWith("Array")) {
                String value = ParamUtils.getString(request, name, "");
                if (Strings.isNotEmpty(value)) {
                    if (name.indexOf("_string") > 0) {
                        value = this.getParamString(value);
                    }

                    String newName = name.substring(name.indexOf("_") + 1);
                    String columnName = newName.substring(0, newName.indexOf("_"));
                    hql.append(" and f." + columnName + " in (" + value + ")");
                }
            }
        }
        hql.append(" order by f.groupCode,familyCode ");
        return this.list(pageInfo, hql.toString());
    }

    /**
     * 获取组别，每个组别的家庭数量
     *
     * @return
     */
    public Map<String, Integer> getGroupCount() {
        String sql = "select groupCode,count(id) as familyCount from family  where isLive="+ ShowState.DISPLAY.getIndex()+"  group by groupCode order by groupCode ";
        List<Map> mapList = (List<Map>) this.getSession().createSQLQuery(sql).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
        Map<String, Integer> resultMap = Maps.newLinkedHashMap();
        if (Collections3.isNotEmpty(mapList)) {
            for (Map map : mapList) {
                String groupCode = map.get("groupCode").toString();
                Integer familyCount = map.get("familyCount") == null ? 0 : Integer.valueOf(map.get("familyCount").toString());
                resultMap.put(groupCode, familyCount);
            }
        }
        return resultMap;
    }


    /**
     * 获取组别，每个组别,每天的家庭数量
     *
     * @return
     */
    public Map<String, Integer> getGroupTodayCount() {
        String sql = "select groupCode,CONVERT(varchar(10), addDate,23) as familyDay,count(id) as familyCount from family   where isLive="+ ShowState.DISPLAY.getIndex()+" group by groupCode,CONVERT(varchar(10), addDate,23) order by CONVERT(varchar(10), addDate,23),groupCode ";
        List<Map> mapList = (List<Map>) this.getSession().createSQLQuery(sql).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
        Map<String, Integer> resultMap = Maps.newLinkedHashMap();
        if (Collections3.isNotEmpty(mapList)) {
            for (Map map : mapList) {
                String groupCode = map.get("groupCode").toString();
                String familyDay = map.get("familyDay").toString();
                Integer familyCount = map.get("familyCount") == null ? 0 : Integer.valueOf(map.get("familyCount").toString());
                resultMap.put(groupCode+familyDay, familyCount);
            }
        }
        return resultMap;
    }
    /**
     * 片区，签约状态，数量
     *
     * @return
     */
    public Map<String, Map> getStatisticsByGroup() {
        Map<String, Map> resultMap = Maps.newLinkedHashMap();
        StringBuffer sql = new StringBuffer("select groupCode,count(id) as familyCount,");
        sql.append("SUM(case when qyState = 1 then 1 else 0 end) as noSignCount,");
        sql.append("SUM(case when qyState = 2 then 1 else 0 end) as signCount,");
        sql.append("SUM(case when jfState = 2 then 1 else 0 end) as jfCount,");
        sql.append("SUM(case when jfState = 1 then 1 else 0 end) as noJfCount,");
        sql.append("SUM(case when ccState = 2 then 1 else 0 end) as ccCount,");
        sql.append("SUM(case when ccState = 1 then 1 else 0 end) as noCcCount ");
        sql.append("from family   where isLive="+ ShowState.DISPLAY.getIndex()+"  group by groupCode order by groupCode");
        List<Map> list = (List<Map>) this.getSession().createSQLQuery(sql.toString()).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
        if (Collections3.isNotEmpty(list)) {
            for (Map map : list) {
                String groupCode = map.get("groupCode").toString();
                resultMap.put(groupCode, map);
            }
        }
        return resultMap;
    }

    /**
     * 通过组别获取总家庭数、已签约、已交房、已拆除家庭数
     *
     * @return
     */
    public Map<String, Integer> getCountByGroup() {
        StringBuffer sql = new StringBuffer("select count(id) as familyCount,sum(case when qyState = 2 then 1 else 0 end) as signCount,");
        sql.append("sum(case when jfState = 2 then 1 else 0 end) as jfCount,");
        sql.append("sum(case when ccState = 2 then 1 else 0 end) as ccCount from family   where isLive="+ ShowState.DISPLAY.getIndex()+" ");
        List<Map> mapList = (List<Map>) this.getSession().createSQLQuery(sql.toString()).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
        Map<String, Integer> resultMap = Maps.newHashMap();
        if (Collections3.isNotEmpty(mapList)) {
            for (Map map : mapList) {
                Integer familyCount = map.get("familyCount") == null ? 0 : Integer.valueOf(map.get("familyCount").toString());
                Integer signCount = map.get("signCount") == null ? 0 : Integer.valueOf(map.get("signCount").toString());
                Integer jfCount = map.get("jfCount") == null ? 0 : Integer.valueOf(map.get("jfCount").toString());
                Integer ccCount = map.get("ccCount") == null ? 0 : Integer.valueOf(map.get("ccCount").toString());
                resultMap.put("familyCount", familyCount);
                resultMap.put("signCount", signCount);
                resultMap.put("jfCount", jfCount);
                resultMap.put("ccCount", ccCount);
            }
        }
        return resultMap;
    }


    //签约，交房，拆除情况统计
    public Map<String,Map<String,String>> qkTj(String date){
        String sql = "select groupCode,"+
                "sum(case when datediff(d,addDate,'" + date + "') >= 0 then 1 else 0 end) as allCount," +  //截至当日已经登记的总户数
                "sum(case when qyState = 2 and datediff(d,qyDate,'" + date + "') >= 0 then 1 else 0 end) as qyCount," +  //截至当日已签约户数
                "sum(case when qyState = 2 and datediff(d,qyDate,'" + date + "') = 0 then 1 else 0 end) as todayQyCount," +   //当日已签约户数

                "sum(case when jfState = 2 and datediff(d,jfDate,'" + date + "') >= 0 then 1 else 0 end) as jfCount," +  //截至当日已交房户数
                "sum(case when jfState = 2 and datediff(d,jfDate,'" + date + "') = 0 then 1 else 0 end) as todayJfCount," +   //当日已交房户数

                "sum(case when ccState = 2 and datediff(d,ccDate,'" + date + "') >= 0 then 1 else 0 end) as ccCount," +  //截至当日已拆除户数
                "sum(case when ccState = 2 and datediff(d,ccDate,'" + date + "') = 0 then 1 else 0 end) as todayCcCount" +   //当日已拆除户数
                " from family";

        sql = sql + " group by groupCode order by groupCode";
        List<Map> list = this.getSession().createSQLQuery(sql).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
        Map<String, Map<String, String>> map = new HashMap<>();
        if (list != null) {
            for (Map<String, String> value : list) {
                String groupCode = String.valueOf(value.get("groupCode"));
                map.put(groupCode, value);
            }
        }
        return map;
    }

    //签约情况统计
    public Map<String,Map<String, Map<String, String>>> qyqkSignMap(String date) {
        String sql = "select groupCode,type," +
                "sum(case when datediff(d,addDate,'" + date + "') >= 0 then 1 else 0 end) as allCount," +  //截至当日已经登记的总户数
                "sum(case when qyState = 2 and datediff(d,qyDate,'" + date + "') >= 0 then 1 else 0 end) as qyCount," +  //截至当日已签约户数
                "sum(case when qyState = 2 and datediff(d,qyDate,'" + date + "') = 0 then 1 else 0 end) as todayQyCount" +   //当日已签约户数
                " from family";
        sql = sql + " group by groupCode,type order by groupCode,type";
        List<Map> list = this.getSession().createSQLQuery(sql).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
        Map<String,Map<String, Map<String, String>>> map = new HashMap<>();
        if (list != null) {
            for (Map value : list) {
                String groupCode = String.valueOf(value.get("groupCode"));
                String type = String.valueOf(value.get("type"));
                Map<String,Map<String,String>> valueMap = map.get(groupCode) == null ? new HashMap<String, Map<String, String>>():map.get(groupCode);
                valueMap.put(type,value);
                Map<String,Map<String,String>> allMap = map.get("all") == null?new HashMap<String, Map<String, String>>():map.get("all");
                for (Object key:value.keySet()){
                    if (String.valueOf(key).endsWith("Count")){
                        Map<String,String> allValueMap = allMap.get(type) == null?new HashMap<String, String>():allMap.get(type);
                        Integer pa = allValueMap.get(key) == null?0:Integer.valueOf(allValueMap.get(key));
                        pa = pa+Integer.valueOf(String.valueOf(value.get(key)));
                        allValueMap.put(String.valueOf(key),String.valueOf(pa));
                        allMap.put(type,allValueMap);
                    }
                }
                map.put("all",allMap);
                map.put(groupCode, valueMap);
            }
        }
        return map;
    }

    //交房情况统计
    public Map<String, Map<String, String>> jfqkSignMap(String date) {
        String sql = "select groupCode," +
                "sum(case when datediff(d,addDate,'" + date + "') >= 0 then 1 else 0 end) as allCount," +  //截至当日已经登记的总户数
                "sum(case when datediff(d,addDate,'" + date + "') >= 0 then isnull(buildArea,0)+isnull(outBuildArea,0) else 0 end) as allArea," +  //截至当日已经登记的总建面

                "sum(case when jfState = 2 and datediff(d,jfDate,'" + date + "') >= 0 then 1 else 0 end) as jfCount," +  //截至当日已交房户数
                "sum(case when jfState = 2 and datediff(d,jfDate,'" + date + "') >= 0 then isnull(buildArea,0)+isnull(outBuildArea,0) else 0 end) as jfArea," +  //截至当日已交房建面
                "sum(case when jfState = 2 and datediff(d,jfDate,'" + date + "') = 0 then 1 else 0 end) as todayJfCount," +   //当日已交房户数
                "sum(case when jfState = 2 and datediff(d,jfDate,'" + date + "') = 0 then isnull(buildArea,0)+isnull(outBuildArea,0) else 0 end) as todayJfArea" +   //当日已交房建面

                " from family";
        sql = sql + " group by groupCode order by groupCode";
        List<Map> list = this.getSession().createSQLQuery(sql).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
        Map<String, Map<String, String>> map = new HashMap<>();
        if (list != null) {
            for (Map<String, String> value : list) {
                String groupCode = String.valueOf(value.get("groupCode"));
                map.put(groupCode, value);
            }
        }
        return map;
    }

    //拆除情况统计
    public Map<String, Map<String, String>> ccqkSignMap(String date) {
        String sql = "select groupCode," +
                "sum(case when datediff(d,addDate,'" + date + "') >= 0 then 1 else 0 end) as allCount," +  //截至当日已经登记的总户数
                "sum(case when datediff(d,addDate,'" + date + "') >= 0 then isnull(buildArea,0)+isnull(outBuildArea,0) else 0 end) as allArea," +  //截至当日已经登记的总户数

                "sum(case when ccState = 2 and datediff(d,ccDate,'" + date + "') >= 0 then 1 else 0 end) as ccCount," +  //截至当日已拆除户数
                "sum(case when ccState = 2 and datediff(d,ccDate,'" + date + "') >= 0 then isnull(buildArea,0)+isnull(outBuildArea,0) else 0 end) as ccArea," +  //截至当日已拆除户数
                "sum(case when ccState = 2 and datediff(d,ccDate,'" + date + "') = 0 then 1 else 0 end) as todayCcCount," +   //当日已拆除户数
                "sum(case when ccState = 2 and datediff(d,ccDate,'" + date + "') = 0 then isnull(buildArea,0)+isnull(outBuildArea,0) else 0 end) as todayCcArea" +   //当日已拆除户数
                " from family";
        sql = sql + " group by groupCode order by groupCode";
        List<Map> list = this.getSession().createSQLQuery(sql).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
        Map<String, Map<String, String>> map = new HashMap<>();
        if ((list != null)) {
            for (Map<String, String> value : list) {
                String groupCode = String.valueOf(value.get("groupCode"));
                map.put(groupCode, value);
            }
        }
        return map;
    }
    //未签约情况统计
    public Map<String,Map<String,String>> wqyCx(String date){
        String sql = "select groupCode," +
                "count(*) as allCount," +
                "sum(case when qyState = 1 then 1 else 0 end) as allWqyCount" +
                " from family";
        sql = sql + " group by groupCode order by groupCode";
        List<Map> list = this.getSession().createSQLQuery(sql).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
        Map<String,Map<String,String>> map = new HashMap<>();
        if (list!=null){
            for (Map<String,String> value : list){
                String groupCode =String.valueOf(value.get("groupCode"));
                map.put(groupCode,value);
            }
        }
        return map;
    }

    //未交房情况统计
    public Map<String,Map<String,String>> wjfCx(String date){
        String sql = "select groupCode," +
                "count(*) as allCount," +
                "sum(isnull(buildArea,0)+isnull(outBuildArea,0)) as allArea," +
                "sum(case when jfState = 1 then 1 else 0 end) as allWjfCount," +
                "sum(case when jfState = 1 then isnull(buildArea,0)+isnull(outBuildArea,0) else 0 end) as allWjfArea" +
                " from family";
        sql=sql +" group by groupCode order by groupCode";
        List<Map> list = this.getSession().createSQLQuery(sql).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
        Map<String,Map<String,String>> map =new HashMap<>();
        if (list!=null){
            for (Map<String,String> value :list){
                String groupCode =String.valueOf(value.get("groupCode"));
                map.put(groupCode,value);
            }
        }
        return  map;
    }
    //综合情况统计   评估复核，拆迁复核，测绘复核，签约，交房，拆除,结算
    public Map<String,Map<String,String>> zhTj(String date){
        String sql="select groupCode,"+
                "count(*) as allCount," +
                "sum(case when pgState >= 2 then 1 else 0 end) as pgCount," +
                "sum(case when cqState >= 2 then 1 else 0 end) as cqCount," +
                "sum(case when chState >= 2 then 1 else 0 end) as chCount," +
                "sum(case when qyState = 2 then 1 else 0 end) as qyCount," +
                "sum(case when jfState = 2 then 1 else 0 end) as jfCount," +
                "sum(case when ccState = 2 then 1 else 0 end) as ccCount," +
                "sum(case when jsState = 2 then 1 else 0 end) as jsCount" +
                " from family";
        sql=sql +" group by groupCode order by groupCode";
        List<Map> list = this.getSession().createSQLQuery(sql).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
        Map<String,Map<String,String>> map =new HashMap<>();
        if (list!=null){
            for (Map<String,String> value :list){
                String groupCode =String.valueOf(value.get("groupCode"));
                map.put(groupCode,value);
            }
        }
        return map;

    }

    //得到已选房户数（选房顺序号不为空）
    public Integer getXFCount() {
        String sql = "select count(*) from Family where firstXFNum is not null and secondXFNum is not null and thirdXFNum is not null and isLive="+ ShowState.DISPLAY.getIndex()+"";
        return this.findLong(sql).intValue();
    }

    //得到已选房数据倒序（选房顺序号不为空）
    public PageInfo<Family> xfNumberShow(PageInfo<Family> pageInfo) {
        String sql = "from Family f where firstXFNum is not null and secondXFNum is not null and thirdXFNum is not null and f.isLive="+ ShowState.DISPLAY.getIndex()+" order by jfNumber desc";
        return this.list(pageInfo,sql);
    }
    //得到已选房数据正序（选房顺序号不为空）
    public PageInfo<Family> xfNumberShowUp(PageInfo<Family> pageInfo) {
        String sql = "from Family f where firstXFNum is not null and secondXFNum is not null and thirdXFNum is not null and f.isLive="+ ShowState.DISPLAY.getIndex()+" order by jfNumber";
        return this.list(pageInfo,sql);
    }


    //得到已交房户数（交房顺序号不为空）
    public Integer getJfCount() {
        String sql = "select count(*) from Family where jfNumber is not null and jfNumber > 0";
        return this.findLong(sql).intValue();
    }
    //得到已交房数据（交房顺序号不为空）
    public PageInfo<Family> jfNumberShow(PageInfo<Family> pageInfo) {
        String sql = "from Family f where jfNumber is not null and jfNumber > 0 order by jfNumber desc";
        return this.list(pageInfo,sql);
    }


    //得到交房数量，今日交房数量
    public List getJfMessage() {
        String sql="select COUNT(*) as allCount,SUM(case when f.jfNumber is not null and DATEDIFF(DAY,f.jfDate,GETDATE())=0 then 1 else 0 end) as todayJf, " +
                "SUM(case when f.jfNumber is not null then 1 else 0 end) as jf "+
                "from Family f ";
        List list = this.getSession().createSQLQuery(sql).list();
        return list;
    }

    //得到选房数量，今日选房数量
    public List getXFMessage() {
        String sql="select COUNT(*) as allCount,SUM(case when f.jfNumber is not null and DATEDIFF(DAY,f.jfDate,GETDATE())=0 then 1 else 0 end) as todayJf, " +
                "SUM(case when f.jfNumber is not null then 1 else 0 end) as jf "+
                "from Family f ";
        List list = this.getSession().createSQLQuery(sql).list();
        return list;
    }

    //得到签约数量，今日签约数量
    public List getQyMessage() {
        String sql="select COUNT(*) as allCount,SUM(case when f.qyState = 2 and DATEDIFF(DAY,f.qyDate,GETDATE())=0 then 1 else 0 end) as todaySign, " +
                "SUM(case when f.qyState = 2 then 1 else 0 end) as sign "+
                "from Family f ";
        List list = this.getSession().createSQLQuery(sql).list();
        return list;
    }


    //得到今日签约（入户，拆除，交房），累计签约（入户，拆除，交房）
    public List<Map> getData(String paramName, String paramDate) {
        String sql = "select groupCode ," ;
        if (paramName.equals("")) {
            sql = sql + "count(*) as signCount," +
                    "sum(case when DATEDIFF(DAY,f.addDate,GETDATE())=0 then 1 else 0 end) as todayCount";
        }else {
            sql = sql + "count(*) as allCount," +
                     "sum(case when "+paramName+" = 2 then 1 else 0 end ) as signCount," +
                    "sum(case when DATEDIFF(DAY,f."+paramDate+",GETDATE())=0 and "+paramName+" = 2 then 1 else 0 end) as todayCount";
        }
        sql = sql + " from family f where f.isLive="+ ShowState.DISPLAY.getIndex()+"   group by groupCode";
        return this.getSession().createSQLQuery(sql).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
    }

    //签约日报表
    public Map<String, Map<String, Map<String, Integer>>> dailySign() {
        String sql = "select \n" +
                "YEAR(qyDate) as year,MONTH(qyDate) as month,f.groupCode,DAY(qyDate) as day,COUNT(*) as sign \n" +
                "from family f where qyState = 2\n" +
                "group by YEAR(qyDate),MONTH(qyDate),f.groupCode,DAY(qyDate)\n" +
                "order by YEAR(qyDate) desc,MONTH(qyDate) desc,DAY(qyDate) desc,f.groupCode";

        Map<String, Map<String, Map<String, Integer>>> map = new LinkedHashMap<>();
        List list = getSession().createSQLQuery(sql.toString()).list();
        if (list != null && list.size() > 0) {
            for (Object o : list) {
                Object[] os = (Object[]) o;
                String year = String.valueOf(os[0]);
                String month = String.valueOf(os[1]);
                String groupCode = String.valueOf(os[2]);
                String day = String.valueOf(os[3]);

                String yearMonth = year+"年"+month+"月";
                Map<String,Map<String,Integer>> yearMonthMap = map.get(yearMonth) == null?new LinkedHashMap<String, Map<String, Integer>>():map.get(yearMonth);

                Map<String,Integer> groupCodeMap = yearMonthMap.get(groupCode) == null?new LinkedHashMap<String, Integer>():yearMonthMap.get(groupCode);
                Integer sign = Integer.valueOf(String.valueOf(os[4]));
                groupCodeMap.put(day,sign);

                //小计
                Map<String,Integer> allMap = yearMonthMap.get("小计") == null?new LinkedHashMap<String, Integer>():yearMonthMap.get("小计");
                Integer all = allMap.get(day)==null?0:allMap.get(day);
                all = all+sign;
                allMap.put(day,all);
                yearMonthMap.put("小计",allMap);
                yearMonthMap.put(groupCode,groupCodeMap);
                map.put(yearMonth,yearMonthMap);
            }
        }
        return map;
    }

    //得到总户数和签约户数
    public List getSignList() {
        String sql = "select count(*) as allCount,sum(case when qyState =2 then 1 else 0 end) as signCount from family";
        return this.getSession().createSQLQuery(sql).list();
    }

    /**********************************88
     *入户的每一天
     * @return
     */
    public  List  getDistinctDate(){
        String sql = "select distinct  CONVERT(varchar(10), addDate,23),addDate from family order by addDate desc";
        return this.getSession().createSQLQuery(sql).list();

    }

}
