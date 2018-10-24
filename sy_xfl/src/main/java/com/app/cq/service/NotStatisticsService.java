package com.app.cq.service;

import com.app.cq.en.ShowState;
import com.app.cq.model.NotFamily;
import com.google.common.collect.Maps;
import com.sqds.hibernate.HibernateDao;
import com.sqds.utils.Collections3;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class NotStatisticsService extends HibernateDao<NotFamily> {

    //得到今日签约（入户），累计签约（入户）
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
        sql = sql + " from notFamily f where f.isLive="+ ShowState.DISPLAY.getIndex()+" and delState = 1 group by groupCode";
        return this.getSession().createSQLQuery(sql).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
    }


    /**
     * 通过组别获取总家庭数、已签约家庭数
     *
     * @return
     */
    public Map<String, Integer> getCountByGroup() {
        StringBuffer sql = new StringBuffer("select count(id) as familyCount,sum(case when qyState = 2 then 1 else 0 end) as signCount");
        sql.append(" from notFamily where isLive="+ ShowState.DISPLAY.getIndex()+" and delState = 1 ");
        List<Map> mapList = (List<Map>) this.getSession().createSQLQuery(sql.toString()).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
        Map<String, Integer> resultMap = Maps.newHashMap();
        if (Collections3.isNotEmpty(mapList)) {
            for (Map map : mapList) {
                Integer familyCount = map.get("familyCount") == null ? 0 : Integer.valueOf(map.get("familyCount").toString());
                Integer signCount = map.get("signCount") == null ? 0 : Integer.valueOf(map.get("signCount").toString());
                resultMap.put("familyCount", familyCount);
                resultMap.put("signCount", signCount);
            }
        }
        return resultMap;
    }


    /**
     * 获取组别，每个组别的家庭数量
     *
     * @return
     */
    public Map<String, Integer> getGroupCount() {
        String sql = "select groupCode,count(id) as familyCount from notFamily  where isLive="+ ShowState.DISPLAY.getIndex()+"  and delState = 1 group by groupCode order by groupCode ";
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
     * 组别，签约状态，数量
     *
     * @return
     */
    public Map<String, Map> getStatisticsByGroup() {
        Map<String, Map> resultMap = Maps.newLinkedHashMap();
        StringBuffer sql = new StringBuffer("select groupCode,count(id) as familyCount,");
        sql.append("SUM(case when qyState = 1 then 1 else 0 end) as noSignCount,");
        sql.append("SUM(case when qyState = 2 then 1 else 0 end) as signCount");
        sql.append(" from notFamily where isLive="+ ShowState.DISPLAY.getIndex()+"  and delState = 1 group by groupCode order by groupCode");
        List<Map> list = (List<Map>) this.getSession().createSQLQuery(sql.toString()).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
        if (Collections3.isNotEmpty(list)) {
            for (Map map : list) {
                String groupCode = map.get("groupCode").toString();
                resultMap.put(groupCode, map);
            }
        }
        return resultMap;
    }


}
