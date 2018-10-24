package com.app.cq.service;

import com.app.cq.model.*;
import com.app.common.model.DataDict;
import com.app.common.service.DataDictService;
import com.google.common.collect.Maps;
import com.sqds.hibernate.HibernateDao;
import com.sqds.page.PageInfo;
import com.sqds.utils.Collections3;
import com.sqds.web.ParamUtils;
import org.apache.logging.log4j.util.Strings;
import org.hibernate.Query;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import javax.servlet.http.HttpServletRequest;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;

@Service
public class StatisticsService extends HibernateDao {

    @Autowired
    private ProjectService projectService;
    @Autowired
    private DataDictService dataDictService;

    /**
     * 获取项目名称，每个项目的家庭数量
     *
     * @return
     */
    public Map<String, String> getFamilyCount() {
        String sql = "select projectName,count(id) as familyCount from family where projectName <> '' and projectName is not null group by projectName order by projectName ";
        List<Object[]> mapList = (List<Object[]>) this.getSession().createSQLQuery(sql).list();
        Map<String, String> resultMap = Maps.newLinkedHashMap();
        if (Collections3.isNotEmpty(mapList)) {
            for (int i = 0; i <mapList.size() ; i++) {
                String projectName = mapList.get(i)[0].toString();
                String familyCount = mapList.get(i)[1].toString();
                resultMap.put(projectName,familyCount);
            }
        }
        return resultMap;
    }
    /**
     * 获取项目名称，每个项目的合同数量
     *
     * @return
     */
    public Map<String, String> getContractCount() {
        String sql = "select projectId,count(id) as projectCount from contract group by projectId order by projectId ";
        List<Object[]> mapList = (List<Object[]>) this.getSession().createSQLQuery(sql).list();
        Map<String, String> resultMap = Maps.newLinkedHashMap();
        if (Collections3.isNotEmpty(mapList)) {
            for (int i = 0; i <mapList.size() ; i++) {
                Integer projectId = (Integer) mapList.get(i)[0];
                String projectName = projectService.get(projectId).getProjectName();
                String familyCount = mapList.get(i)[1].toString();
                resultMap.put(projectName,familyCount);
            }
        }
        return resultMap;
    }

    /**
     * 根据项目和居室分组获取项目名称，居室，套数
     *
     * @return
     */
    public Map<String, Map> getHouseCount() {
        String sql = "select projectId,houseType,count(id) as houseCount from house group by houseType,projectId order by houseType,projectId ";
        List<Object[]> mapList = (List<Object[]>) this.getSession().createSQLQuery(sql).list();
        Map<String, Map> resultMap = Maps.newLinkedHashMap();
        Integer holdHouseType = null;
        if (Collections3.isNotEmpty(mapList)) {
            Map<Integer, BigInteger> resultMap1 = Maps.newLinkedHashMap();
            for (int i = 0; i <mapList.size() ; i++) {
                Integer projectId = (Integer) mapList.get(i)[0];
                Integer houseType = (Integer) mapList.get(i)[1];
                BigInteger houseCount = (BigInteger) mapList.get(i)[2];
                String houseTypeName = "";
                List<DataDict> houseTypeDataDictList = dataDictService.getDataDictList("居室");
                for (DataDict dataDict:houseTypeDataDictList) {
                    if (houseType == Integer.valueOf(dataDict.getAttributeValue())){
                        houseTypeName = dataDict.getAttributeName();
                    }
                }
                if (holdHouseType != null && houseType != holdHouseType){
                    resultMap1 = Maps.newLinkedHashMap();
                }
                resultMap1.put(projectId,houseCount);
                holdHouseType = houseType;
                resultMap.put(houseTypeName,resultMap1);
            }
        }
        return resultMap;
    }

    /**
     * 分类统计柱状图
     *
     * @return
     */
    public List<Map<String,String>> getprojectName() {
        String sql = "SELECT projectName,\n" +
                "sum(case when familyType = 1 OR familyType = 2 OR familyType = 3 OR familyType = 4 OR familyType = 5 OR familyType = 6 then 1 ELSE 0 end) as familyType,\n" +
                "sum(case when thisArea = 1 or thisArea = 2 then 1 ELSE 0 end) as thisArea,\n" +
                "sum(case when thisPark = 1 or thisPark = 2 then 1 ELSE 0 end) as thisPark,\n" +
                "sum(case when education = 1 or education = 2 or education = 3 then 1 ELSE 0 end) as education,\n" +
                "sum(case when firstOrNot = 1 or firstOrNot = 2 then 1 ELSE 0 end) as firstOrNot\n" +
                "FROM `family` GROUP BY projectName";
        List<Map<String,String>> mapList =  this.getSession().createSQLQuery(sql).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
        return mapList;
    }

    /**
     * 分类统计柱状图
     *
     * @return
     */
    public Map<String, String> getFenlei() {
        String sql = "SELECT projectName,"+
                "sum(case when familyType = 1 then 1 ELSE 0 end) as familyType1,"+
                "sum(case when familyType = 2 then 1 ELSE 0 end) as familyType2,"+
                "sum(case when familyType = 3 then 1 ELSE 0 end) as familyType3,"+
                "sum(case when familyType = 4 then 1 ELSE 0 end) as familyType4,"+
                "sum(case when familyType = 5 then 1 ELSE 0 end) as familyType5 "+
                "FROM `family` GROUP BY projectName";
        List<Map> mapList =  this.getSession().createSQLQuery(sql).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
        Map<String, String> resultMap = Maps.newLinkedHashMap();
        if (Collections3.isNotEmpty(mapList)) {
            StringBuffer familyType1 = new StringBuffer("[");
            StringBuffer familyType2 = new StringBuffer("[");
            StringBuffer familyType3 = new StringBuffer("[");
            StringBuffer familyType4 = new StringBuffer("[");
            StringBuffer familyType5 = new StringBuffer("[");
            for (int i = 0; i <mapList.size() ; i++) {
                familyType1.append("" + mapList.get(i).get("familyType1") + ",");
                familyType2.append("" + mapList.get(i).get("familyType2") + ",");
                familyType3.append("" + mapList.get(i).get("familyType3") + ",");
                familyType4.append("" + mapList.get(i).get("familyType4") + ",");
                familyType5.append("" + mapList.get(i).get("familyType5") + ",");
            }
            familyType1.deleteCharAt(familyType1.lastIndexOf(","));
            familyType1.append("]");
            familyType2.deleteCharAt(familyType2.lastIndexOf(","));
            familyType2.append("]");
            familyType3.deleteCharAt(familyType3.lastIndexOf(","));
            familyType3.append("]");
            familyType4.deleteCharAt(familyType4.lastIndexOf(","));
            familyType4.append("]");
            familyType5.deleteCharAt(familyType5.lastIndexOf(","));
            familyType5.append("]");
            resultMap.put("本市户籍",familyType1.toString());
            resultMap.put("持有效证",familyType2.toString());
            resultMap.put("驻京部队现役军人或武警",familyType3.toString());
            resultMap.put("缴社保",familyType4.toString());
            resultMap.put("缴个税",familyType5.toString());
        }
        return resultMap;
    }

    /**
     * 是否本区按项目分组
     * @return
     */
    public Map<String, String> getThisArea() {
        String sql = "SELECT projectName,"+
                "sum(case when thisArea = 1 then 1 ELSE 0 end) as yesthisArea,"+
                "sum(case when thisArea = 2 then 1 ELSE 0 end) as nothisArea "+
                "FROM `family` GROUP BY projectName";
        List<Map> mapList =  this.getSession().createSQLQuery(sql).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
        Map<String, String> resultMap = Maps.newLinkedHashMap();
        if (Collections3.isNotEmpty(mapList)) {
            StringBuffer yesthisArea = new StringBuffer("[");
            StringBuffer nothisArea = new StringBuffer("[");
            for (int i = 0; i <mapList.size() ; i++) {
                yesthisArea.append("" + mapList.get(i).get("yesthisArea") + ",");
                nothisArea.append("" + mapList.get(i).get("nothisArea") + ",");
            }
            yesthisArea.deleteCharAt(yesthisArea.lastIndexOf(","));
            yesthisArea.append("]");
            nothisArea.deleteCharAt(nothisArea.lastIndexOf(","));
            nothisArea.append("]");
            resultMap.put("是本区",yesthisArea.toString());
            resultMap.put("不是本区",nothisArea.toString());
        }
        return resultMap;
    }
    /**
     * 是否园区按项目分组
     * @return
     */
    public Map<String, String> getThisPark() {
        String sql = "SELECT projectName,"+
                "sum(case when thisPark = 1 then 1 ELSE 0 end) as yesthisPark,"+
                "sum(case when thisPark = 2 then 1 ELSE 0 end) as nothisPark "+
                "FROM `family` GROUP BY projectName";
        List<Map> mapList =  this.getSession().createSQLQuery(sql).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
        Map<String, String> resultMap = Maps.newLinkedHashMap();
        if (Collections3.isNotEmpty(mapList)) {
            StringBuffer yesthisPark = new StringBuffer("[");
            StringBuffer nothisPark = new StringBuffer("[");
            for (int i = 0; i <mapList.size() ; i++) {
                yesthisPark.append("" + mapList.get(i).get("yesthisPark") + ",");
                nothisPark.append("" + mapList.get(i).get("nothisPark") + ",");
            }
            yesthisPark.deleteCharAt(yesthisPark.lastIndexOf(","));
            yesthisPark.append("]");
            nothisPark.deleteCharAt(nothisPark.lastIndexOf(","));
            nothisPark.append("]");
            resultMap.put("是园区",yesthisPark.toString());
            resultMap.put("不是园区",nothisPark.toString());
        }
        return resultMap;
    }
    /**
     * 是否园区按项目分组
     * @return
     */
    public Map<String, String> getEducation() {
        String sql = "SELECT projectName,"+
                "sum(case when education = 1 then 1 ELSE 0 end) as education1,"+
                "sum(case when education = 2 then 1 ELSE 0 end) as education2, "+
                "sum(case when education = 3 then 1 ELSE 0 end) as education3 "+
                "FROM `family` GROUP BY projectName";
        List<Map> mapList =  this.getSession().createSQLQuery(sql).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
        Map<String, String> resultMap = Maps.newLinkedHashMap();
        if (Collections3.isNotEmpty(mapList)) {
            StringBuffer education1 = new StringBuffer("[");
            StringBuffer education2 = new StringBuffer("[");
            StringBuffer education3 = new StringBuffer("[");
            for (int i = 0; i <mapList.size() ; i++) {
                education1.append("" + mapList.get(i).get("education1") + ",");
                education2.append("" + mapList.get(i).get("education2") + ",");
                education3.append("" + mapList.get(i).get("education3") + ",");
            }
            education1.deleteCharAt(education1.lastIndexOf(","));
            education1.append("]");
            education2.deleteCharAt(education2.lastIndexOf(","));
            education2.append("]");
            education3.deleteCharAt(education3.lastIndexOf(","));
            education3.append("]");
            resultMap.put("本科",education1.toString());
            resultMap.put("硕士研究生",education2.toString());
            resultMap.put("博士研究生",education3.toString());
        }
        return resultMap;
    }

    /**
     * 是否优先组按项目分组
     * @return
     */
    public Map<String, String> getFirstOrNot() {
        String sql = "SELECT projectName,"+
                "sum(case when firstOrNot = 1 then 1 ELSE 0 end) as yesfirstOrNot,"+
                "sum(case when firstOrNot = 2 then 1 ELSE 0 end) as nofirstOrNot "+
                "FROM `family` GROUP BY projectName";
        List<Map> mapList =  this.getSession().createSQLQuery(sql).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
        Map<String, String> resultMap = Maps.newLinkedHashMap();
        if (Collections3.isNotEmpty(mapList)) {
            StringBuffer yesfirstOrNot = new StringBuffer("[");
            StringBuffer nofirstOrNot = new StringBuffer("[");
            for (int i = 0; i <mapList.size() ; i++) {
                yesfirstOrNot.append("" + mapList.get(i).get("yesfirstOrNot") + ",");
                nofirstOrNot.append("" + mapList.get(i).get("nofirstOrNot") + ",");
            }
            yesfirstOrNot.deleteCharAt(yesfirstOrNot.lastIndexOf(","));
            yesfirstOrNot.append("]");
            nofirstOrNot.deleteCharAt(nofirstOrNot.lastIndexOf(","));
            nofirstOrNot.append("]");
            resultMap.put("优先组",yesfirstOrNot.toString());
            resultMap.put("普通组",nofirstOrNot.toString());
        }
        return resultMap;
    }

    /**
     * 获取项目名称，每个项目的影像文件数量
     *
     * @return
     */
    public Map<String, String> getVideoCount() {
        String sql = "select p.projectId,count(f.id) from projectfile p INNER JOIN projectfile f on p.id = f.parentId where p.projectId is not null GROUP BY p.projectId ORDER BY p.projectId";
        List<Object[]> mapList = (List<Object[]>) this.getSession().createSQLQuery(sql).list();
        Map<String, String> resultMap = Maps.newLinkedHashMap();
        if (Collections3.isNotEmpty(mapList)) {
            for (int i = 0; i <mapList.size() ; i++) {
                Integer projectId = (Integer) mapList.get(i)[0];
                String projectName = this.projectService.get(projectId).getProjectName();
                String fileCount = mapList.get(i)[1].toString();
                resultMap.put(projectName,fileCount);
            }
        }
        return resultMap;
    }
    /**
     * 核验情况统计
     *
     * @return
     */
    public Map<String, Map<String,List<String>>> getCheckStatistics() {
        String sql = "SELECT projectName,familyType,count(id)," +
                "sum(case when houseStatus = 1 and socialStatus = 1 and marriageStatus = 1 and ageStatus = 1 and educationStatus = 1 and otherStatus = 1 then 1 ELSE 0 end) as notCheck," +
                "sum(case when houseStatus = 3 then 1 ELSE 0 end) as houseCheck," +
                "sum(case when socialStatus = 3 then 1 ELSE 0 end) as socialCheck," +
                "sum(case when marriageStatus = 3 then 1 ELSE 0 end) as marriageCheck," +
                "sum(case when ageStatus = 3 then 1 ELSE 0 end) as ageCheck," +
                "sum(case when educationStatus = 3 then 1 ELSE 0 end) as educationCheck," +
                "sum(case when otherStatus = 3 then 1 ELSE 0 end) as otherCheck," +
                "sum(case when houseStatus = 2 and socialStatus = 2 and marriageStatus = 2 and ageStatus = 2 and educationStatus = 2 and otherStatus = 2 then 1 ELSE 0 end) as Checked " +
                "FROM family GROUP BY projectName,familyType ORDER BY projectName,familyType";
        List<Map> mapList =  this.getSession().createSQLQuery(sql).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
        Map<String, Map<String,List<String>>> resultMap = Maps.newLinkedHashMap();
        if (Collections3.isNotEmpty(mapList)) {
            for (int i = 0; i <mapList.size() ; i++) {
                String projectName = String.valueOf(mapList.get(i).get("projectName"));
                String familyTypeId = String.valueOf(mapList.get(i).get("familyType"));
                String totalCount = String.valueOf(mapList.get(i).get("count(id)"));
                String notCheck = String.valueOf(mapList.get(i).get("notCheck"));
                String houseCheck = String.valueOf(mapList.get(i).get("houseCheck"));
                String socialCheck = String.valueOf(mapList.get(i).get("socialCheck"));
                String marriageCheck = String.valueOf(mapList.get(i).get("marriageCheck"));
                String ageCheck = String.valueOf(mapList.get(i).get("ageCheck"));
                String educationCheck = String.valueOf(mapList.get(i).get("educationCheck"));
                String otherCheck = String.valueOf(mapList.get(i).get("otherCheck"));
                String checked = String.valueOf(mapList.get(i).get("Checked"));
                Map<String,List<String>> resultMap1 = resultMap.get(projectName) == null ? new LinkedHashMap<String,List<String>>() : resultMap.get(projectName);
                List<String> resultList = new ArrayList<>();
                resultList.add(totalCount);
                resultList.add(notCheck);
                resultList.add(houseCheck);
                resultList.add(socialCheck);
                resultList.add(marriageCheck);
                resultList.add(ageCheck);
                resultList.add(educationCheck);
                resultList.add(otherCheck);
                resultList.add(checked);
                resultMap1.put(familyTypeId,resultList);
                resultMap.put(projectName,resultMap1);
            }
        }
        return resultMap;
    }

    /**
     * 核验情况总计
     *
     * @return
     */
    public Map<String, String> getCheckStatisticsTotal() {
        String sql = "select count(id)," +
                "sum(case when houseStatus = 1 and socialStatus = 1 and marriageStatus = 1 and ageStatus = 1 and educationStatus = 1 and otherStatus = 1 then 1 ELSE 0 end) as notCheck," +
                "sum(case when houseStatus = 3 then 1 ELSE 0 end) as houseCheck," +
                "sum(case when socialStatus = 3 then 1 ELSE 0 end) as socialCheck," +
                "sum(case when marriageStatus = 3 then 1 ELSE 0 end) as marriageCheck," +
                "sum(case when ageStatus = 3 then 1 ELSE 0 end) as ageCheck," +
                "sum(case when educationStatus = 3 then 1 ELSE 0 end) as educationCheck," +
                "sum(case when otherStatus = 3 then 1 ELSE 0 end) as otherCheck," +
                "sum(case when houseStatus = 2 and socialStatus = 2 and marriageStatus = 2 and ageStatus = 2 and educationStatus = 2 and otherStatus = 2 then 1 ELSE 0 end) as Checked " +
                "FROM family";
        List<Map> mapList =  this.getSession().createSQLQuery(sql).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
        Map<String,String> resultMap = Maps.newLinkedHashMap();
        for (int i = 0; i <mapList.size() ; i++) {
            String totalCount = String.valueOf(mapList.get(i).get("count(id)"));
            String notCheck = String.valueOf(mapList.get(i).get("notCheck"));
            String houseCheck = String.valueOf(mapList.get(i).get("houseCheck"));
            String socialCheck = String.valueOf(mapList.get(i).get("socialCheck"));
            String marriageCheck = String.valueOf(mapList.get(i).get("marriageCheck"));
            String ageCheck = String.valueOf(mapList.get(i).get("ageCheck"));
            String educationCheck = String.valueOf(mapList.get(i).get("educationCheck"));
            String otherCheck = String.valueOf(mapList.get(i).get("otherCheck"));
            String checked = String.valueOf(mapList.get(i).get("Checked"));
            resultMap.put("totalCount",totalCount);
            resultMap.put("notCheck",notCheck);
            resultMap.put("houseCheck",houseCheck);
            resultMap.put("socialCheck",socialCheck);
            resultMap.put("marriageCheck",marriageCheck);
            resultMap.put("ageCheck",ageCheck);
            resultMap.put("educationCheck",educationCheck);
            resultMap.put("otherCheck",otherCheck);
            resultMap.put("checked",checked);
        }

        return resultMap;
    }

    /**
     * 合同情况统计
     *
     * @return
     */
    public Map<String, Map<String,List<String>>> getContractStatistics() {
        String sql = "select f.projectName projectName,f.familyType familyType,count(*) count,"+
                "sum(case when c.status=1	then 1 else 0 end) counttype1,"+
                "sum(case when c.status=2	then 1 else 0 end) counttype2,"+
                "sum(case when c.status=3	then 1 else 0 end) counttype3,"+
                "sum(case when c.status=4	then 1 else 0 end) counttype4 "+
        "from family f INNER JOIN contract c WHERE f.id = c.familyId GROUP BY f.projectName,f.familyType ORDER BY f.projectName,f.familyType";
        List<Map> mapList =  this.getSession().createSQLQuery(sql).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
        Map<String, Map<String,List<String>>> resultMap = Maps.newLinkedHashMap();
        if (Collections3.isNotEmpty(mapList)) {
            for (int i = 0; i <mapList.size() ; i++) {
                String projectName = String.valueOf(mapList.get(i).get("projectName"));
                String familyTypeId = String.valueOf(mapList.get(i).get("familyType"));
                String Count = String.valueOf(mapList.get(i).get("count"));
                String counttype1 = String.valueOf(mapList.get(i).get("counttype1"));
                String counttype2 = String.valueOf(mapList.get(i).get("counttype2"));
                String counttype3 = String.valueOf(mapList.get(i).get("counttype3"));
                String counttype4 = String.valueOf(mapList.get(i).get("counttype4"));
                Map<String,List<String>> resultMap1 = resultMap.get(projectName) == null ? new LinkedHashMap<String,List<String>>() : resultMap.get(projectName);
                List<String> resultList = new ArrayList<>();
                resultList.add(Count);
                resultList.add(counttype1);
                resultList.add(counttype2);
                resultList.add(counttype3);
                resultList.add(counttype4);
                resultMap1.put(familyTypeId,resultList);
                resultMap.put(projectName,resultMap1);
            }
        }
        return resultMap;
    }

    /**
     * 合同情况总计
     *
     * @return
     */
    public Map<String, String> getContractStatisticsTotal() {
        String sql = "select count(*) count,"+
                "sum(case when c.status=1	then 1 else 0 end) counttype1,"+
                "sum(case when c.status=2	then 1 else 0 end) counttype2,"+
                "sum(case when c.status=3	then 1 else 0 end) counttype3,"+
                "sum(case when c.status=4	then 1 else 0 end) counttype4 "+
        "from family f INNER JOIN contract c WHERE f.id = c.familyId";
        List<Map> mapList =  this.getSession().createSQLQuery(sql).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
        Map<String,String> resultMap = Maps.newLinkedHashMap();
        for (int i = 0; i <mapList.size() ; i++) {
            String totalCount = String.valueOf(mapList.get(i).get("count"));
            String counttype1 = String.valueOf(mapList.get(i).get("counttype1"));
            String counttype2 = String.valueOf(mapList.get(i).get("counttype2"));
            String counttype3 = String.valueOf(mapList.get(i).get("counttype3"));
            String counttype4 = String.valueOf(mapList.get(i).get("counttype4"));
            resultMap.put("totalCount",totalCount);
            resultMap.put("counttype1",counttype1);
            resultMap.put("counttype2",counttype2);
            resultMap.put("counttype3",counttype3);
            resultMap.put("counttype4",counttype4);
        }

        return resultMap;
    }
    /**
     * 房源总计
     *
     * @return
     */
    public List getZongTotal() {
        String sql = "SELECT sum(case when houseType = 1 then 1 ELSE 0 end) as fTotalCount,sum(case when houseType = 1 then IFNULL(buildArea,0) else 0 end) as fTotalArea,sum(case when houseType = 1 and `status` = 1 then 1 ELSE 0 end) as fCanCount,SUM(case when houseType = 1 and `status` = 1 then IFNULL(buildArea,0) else 0 end) as fCanArea,sum(case when houseType = 1 and `status` > 1 then 1 ELSE 0 end) as fCanedCount,sum(case when houseType = 1 and `status` > 1 then IFNULL(buildArea,0) ELSE 0 end) as fCanedArea,sum(case when houseType = 2 then 1 ELSE 0 end) as sTotalCount,sum(IFNULL(buildArea,0)) as sTotalArea,sum(case when houseType = 2 and `status` = 1 then 1 ELSE 0 end) as sCanCount,SUM(case when houseType = 2 and `status` = 1 then IFNULL(buildArea,0) else 0 end) as sCanArea,sum(case when houseType = 2 and `status` > 1 then 1 ELSE 0 end) as sCanedCount,sum(case when houseType = 2 and `status` > 1 then IFNULL(buildArea,0) ELSE 0 end) as sCanedArea,sum(case when houseType = 3 then 1 ELSE 0 end) as tTotalCount,sum(IFNULL(buildArea,0)) as tTotalArea,sum(case when houseType = 3 and `status` = 1 then 1 ELSE 0 end) as tCanCount,SUM(case when houseType = 3 and `status` = 1 then IFNULL(buildArea,0) else 0 end) as tCanArea,sum(case when houseType = 3 and `status` > 1 then 1 ELSE 0 end) as tCanedCount,sum(case when houseType = 3 and `status` > 1 then IFNULL(buildArea,0) ELSE 0 end) as tCanedArea FROM `house`";
        List<Map> mapList =  this.getSession().createSQLQuery(sql).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
        List resultList = new ArrayList<>();
        if (Collections3.isNotEmpty(mapList)) {
            for (int i = 0; i <mapList.size() ; i++) {
                BigDecimal fTotalCount = (BigDecimal) mapList.get(i).get("fTotalCount");
                BigDecimal fTotalArea = (BigDecimal) mapList.get(i).get("fTotalArea");
                BigDecimal fCanCount = (BigDecimal) mapList.get(i).get("fCanCount");
                BigDecimal fCanArea = (BigDecimal) mapList.get(i).get("fCanArea");
                BigDecimal fCanedCount = (BigDecimal) mapList.get(i).get("fCanedCount");
                BigDecimal fCanedArea = (BigDecimal) mapList.get(i).get("fCanedArea");
                BigDecimal sTotalCount = (BigDecimal) mapList.get(i).get("sTotalCount");
                BigDecimal sTotalArea = (BigDecimal) mapList.get(i).get("sTotalArea");
                BigDecimal sCanCount = (BigDecimal) mapList.get(i).get("sCanCount");
                BigDecimal sCanArea = (BigDecimal) mapList.get(i).get("sCanArea");
                BigDecimal sCanedCount = (BigDecimal) mapList.get(i).get("sCanedCount");
                BigDecimal sCanedArea = (BigDecimal) mapList.get(i).get("sCanedArea");
                BigDecimal tTotalCount = (BigDecimal) mapList.get(i).get("tTotalCount");
                BigDecimal tTotalArea = (BigDecimal) mapList.get(i).get("tTotalArea");
                BigDecimal tCanCount = (BigDecimal) mapList.get(i).get("tCanCount");
                BigDecimal tCanArea = (BigDecimal) mapList.get(i).get("tCanArea");
                BigDecimal tCanedCount = (BigDecimal) mapList.get(i).get("tCanedCount");
                BigDecimal tCanedArea = (BigDecimal) mapList.get(i).get("tCanedArea");

                resultList.add(fTotalCount);
                resultList.add(fTotalArea);
                resultList.add(fCanCount);
                resultList.add(fCanArea);
                resultList.add(fCanedCount);
                resultList.add(fCanedArea);
                resultList.add(sTotalCount);
                resultList.add(sTotalArea);
                resultList.add(sCanCount);
                resultList.add(sCanArea);
                resultList.add(sCanedCount);
                resultList.add(sCanedArea);
                resultList.add(tTotalCount);
                resultList.add(tTotalArea);
                resultList.add(tCanCount);
                resultList.add(tCanArea);
                resultList.add(tCanedCount);
                resultList.add(tCanedArea);
            }
        }

        return resultList;
    }
    /**
     * 房源合计
     *
     * @return
     */
    public Map<String, List> getHouseZongTotal() {
        String sql = "SELECT projectId,sum(case when houseType = 1 then 1 ELSE 0 end) as fTotalCount,sum(case when houseType = 1 then IFNULL(buildArea,0) else 0 end) as fTotalArea,sum(case when houseType = 1 and `status` = 1 then 1 ELSE 0 end) as fCanCount,SUM(case when houseType = 1 and `status` = 1 then IFNULL(buildArea,0) else 0 end) as fCanArea,sum(case when houseType = 1 and `status` > 1 then 1 ELSE 0 end) as fCanedCount,sum(case when houseType = 1 and `status` > 1 then IFNULL(buildArea,0) ELSE 0 end) as fCanedArea,sum(case when houseType = 2 then 1 ELSE 0 end) as sTotalCount,sum(IFNULL(buildArea,0)) as sTotalArea,sum(case when houseType = 2 and `status` = 1 then 1 ELSE 0 end) as sCanCount,SUM(case when houseType = 2 and `status` = 1 then IFNULL(buildArea,0) else 0 end) as sCanArea,sum(case when houseType = 2 and `status` > 1 then 1 ELSE 0 end) as sCanedCount,sum(case when houseType = 2 and `status` > 1 then IFNULL(buildArea,0) ELSE 0 end) as sCanedArea,sum(case when houseType = 3 then 1 ELSE 0 end) as tTotalCount,sum(IFNULL(buildArea,0)) as tTotalArea,sum(case when houseType = 3 and `status` = 1 then 1 ELSE 0 end) as tCanCount,SUM(case when houseType = 3 and `status` = 1 then IFNULL(buildArea,0) else 0 end) as tCanArea,sum(case when houseType = 3 and `status` > 1 then 1 ELSE 0 end) as tCanedCount,sum(case when houseType = 3 and `status` > 1 then IFNULL(buildArea,0) ELSE 0 end) as tCanedArea FROM `house` GROUP BY projectId ORDER BY projectId";
        List<Map> mapList =  this.getSession().createSQLQuery(sql).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
        Map<String, List> resultMap = Maps.newLinkedHashMap();
        if (Collections3.isNotEmpty(mapList)) {
            for (int i = 0; i <mapList.size() ; i++) {
                Integer projectId = (Integer) mapList.get(i).get("projectId");
                Project project = this.projectService.get(projectId);
                String projectName = project.getProjectName();
                BigDecimal fTotalCount = (BigDecimal) mapList.get(i).get("fTotalCount");
                BigDecimal fTotalArea = (BigDecimal) mapList.get(i).get("fTotalArea");
                BigDecimal fCanCount = (BigDecimal) mapList.get(i).get("fCanCount");
                BigDecimal fCanArea = (BigDecimal) mapList.get(i).get("fCanArea");
                BigDecimal fCanedCount = (BigDecimal) mapList.get(i).get("fCanedCount");
                BigDecimal fCanedArea = (BigDecimal) mapList.get(i).get("fCanedArea");
                BigDecimal sTotalCount = (BigDecimal) mapList.get(i).get("sTotalCount");
                BigDecimal sTotalArea = (BigDecimal) mapList.get(i).get("sTotalArea");
                BigDecimal sCanCount = (BigDecimal) mapList.get(i).get("sCanCount");
                BigDecimal sCanArea = (BigDecimal) mapList.get(i).get("sCanArea");
                BigDecimal sCanedCount = (BigDecimal) mapList.get(i).get("sCanedCount");
                BigDecimal sCanedArea = (BigDecimal) mapList.get(i).get("sCanedArea");
                BigDecimal tTotalCount = (BigDecimal) mapList.get(i).get("tTotalCount");
                BigDecimal tTotalArea = (BigDecimal) mapList.get(i).get("tTotalArea");
                BigDecimal tCanCount = (BigDecimal) mapList.get(i).get("tCanCount");
                BigDecimal tCanArea = (BigDecimal) mapList.get(i).get("tCanArea");
                BigDecimal tCanedCount = (BigDecimal) mapList.get(i).get("tCanedCount");
                BigDecimal tCanedArea = (BigDecimal) mapList.get(i).get("tCanedArea");

                List resultList = new ArrayList<>();
                resultList.add(fTotalCount);
                resultList.add(fTotalArea);
                resultList.add(fCanCount);
                resultList.add(fCanArea);
                resultList.add(fCanedCount);
                resultList.add(fCanedArea);
                resultList.add(sTotalCount);
                resultList.add(sTotalArea);
                resultList.add(sCanCount);
                resultList.add(sCanArea);
                resultList.add(sCanedCount);
                resultList.add(sCanedArea);
                resultList.add(tTotalCount);
                resultList.add(tTotalArea);
                resultList.add(tCanCount);
                resultList.add(tCanArea);
                resultList.add(tCanedCount);
                resultList.add(tCanedArea);
                resultMap.put(projectName,resultList);
            }
        }

        return resultMap;
    }
    /**
     * 房源情况
     *
     * @return
     */
    public Map<String, Map<String,List>> getHouseStatisticsTotal() {
        String sql = "SELECT projectId,buildArea,buildNum,sum(case when houseType = 1 then 1 ELSE 0 end) as fTotalCount,sum(case when houseType = 1 then IFNULL(buildArea,0) else 0 end) as fTotalArea,sum(case when houseType = 1 and `status` = 1 then 1 ELSE 0 end) as fCanCount,SUM(case when houseType = 1 and `status` = 1 then IFNULL(buildArea,0) else 0 end) as fCanArea,sum(case when houseType = 1 and `status` > 1 then 1 ELSE 0 end) as fCanedCount,sum(case when houseType = 1 and `status` > 1 then IFNULL(buildArea,0) ELSE 0 end) as fCanedArea,sum(case when houseType = 2 then 1 ELSE 0 end) as sTotalCount,sum(IFNULL(buildArea,0)) as sTotalArea,sum(case when houseType = 2 and `status` = 1 then 1 ELSE 0 end) as sCanCount,SUM(case when houseType = 2 and `status` = 1 then IFNULL(buildArea,0) else 0 end) as sCanArea,sum(case when houseType = 2 and `status` > 1 then 1 ELSE 0 end) as sCanedCount,sum(case when houseType = 2 and `status` > 1 then IFNULL(buildArea,0) ELSE 0 end) as sCanedArea,sum(case when houseType = 3 then 1 ELSE 0 end) as tTotalCount,sum(IFNULL(buildArea,0)) as tTotalArea,sum(case when houseType = 3 and `status` = 1 then 1 ELSE 0 end) as tCanCount,SUM(case when houseType = 3 and `status` = 1 then IFNULL(buildArea,0) else 0 end) as tCanArea,sum(case when houseType = 3 and `status` > 1 then 1 ELSE 0 end) as tCanedCount,sum(case when houseType = 3 and `status` > 1 then IFNULL(buildArea,0) ELSE 0 end) as tCanedArea FROM `house` GROUP BY projectId,buildNum ORDER BY projectId,buildNum";
        List<Map> mapList =  this.getSession().createSQLQuery(sql).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
        Map<String, Map<String,List>> resultMap = Maps.newLinkedHashMap();
        if (Collections3.isNotEmpty(mapList)) {
            for (int i = 0; i <mapList.size() ; i++) {
                Integer projectId = (Integer) mapList.get(i).get("projectId");
                Project project = this.projectService.get(projectId);
                String projectName = project.getProjectName();
                String buildNum = String.valueOf(mapList.get(i).get("buildNum"));
                BigDecimal fTotalCount = (BigDecimal) mapList.get(i).get("fTotalCount");
                BigDecimal fTotalArea = (BigDecimal) mapList.get(i).get("fTotalArea");
                BigDecimal fCanCount = (BigDecimal) mapList.get(i).get("fCanCount");
                BigDecimal fCanArea = (BigDecimal) mapList.get(i).get("fCanArea");
                BigDecimal fCanedCount = (BigDecimal) mapList.get(i).get("fCanedCount");
                BigDecimal fCanedArea = (BigDecimal) mapList.get(i).get("fCanedArea");
                BigDecimal sTotalCount = (BigDecimal) mapList.get(i).get("sTotalCount");
                BigDecimal sTotalArea = (BigDecimal) mapList.get(i).get("sTotalArea");
                BigDecimal sCanCount = (BigDecimal) mapList.get(i).get("sCanCount");
                BigDecimal sCanArea = (BigDecimal) mapList.get(i).get("sCanArea");
                BigDecimal sCanedCount = (BigDecimal) mapList.get(i).get("sCanedCount");
                BigDecimal sCanedArea = (BigDecimal) mapList.get(i).get("sCanedArea");
                BigDecimal tTotalCount = (BigDecimal) mapList.get(i).get("tTotalCount");
                BigDecimal tTotalArea = (BigDecimal) mapList.get(i).get("tTotalArea");
                BigDecimal tCanCount = (BigDecimal) mapList.get(i).get("tCanCount");
                BigDecimal tCanArea = (BigDecimal) mapList.get(i).get("tCanArea");
                BigDecimal tCanedCount = (BigDecimal) mapList.get(i).get("tCanedCount");
                BigDecimal tCanedArea = (BigDecimal) mapList.get(i).get("tCanedArea");

                Map<String,List> resultMap1 = resultMap.get(projectName) == null ? new LinkedHashMap<String,List>() : resultMap.get(projectName);
                List resultList = new ArrayList<>();
                resultList.add(fTotalCount);
                resultList.add(fTotalArea);
                resultList.add(fCanCount);
                resultList.add(fCanArea);
                resultList.add(fCanedCount);
                resultList.add(fCanedArea);
                resultList.add(sTotalCount);
                resultList.add(sTotalArea);
                resultList.add(sCanCount);
                resultList.add(sCanArea);
                resultList.add(sCanedCount);
                resultList.add(sCanedArea);
                resultList.add(tTotalCount);
                resultList.add(tTotalArea);
                resultList.add(tCanCount);
                resultList.add(tCanArea);
                resultList.add(tCanedCount);
                resultList.add(tCanedArea);
                resultMap1.put(buildNum,resultList);
                resultMap.put(projectName,resultMap1);
            }
        }

        return resultMap;
    }

    /**
     * 综合统计查询方法
     *
     * @param pageInfo
     */
    public PageInfo<Family> getListForCompositeSearch(PageInfo<Family> pageInfo, HttpServletRequest request) {
        StringBuffer hql = new StringBuffer("select f from Family f,House h,Contract c where 1=1 ");   //and len(f.idCode) = 10
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

                    hql.append(" and " + columnName + " in (" + value + ")");
                }
            }
        }
        hql.append("and f.id=c.family.id AND c.house.id=h.id order by f.projectName ");
        return this.list(pageInfo, hql.toString());
    }

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
     * 综合统计查询方法
     *
     * @param pageInfo
     */
    public PageInfo<Contract> getListForSearch(PageInfo<Contract> pageInfo, HttpServletRequest request) {
        StringBuffer hql = new StringBuffer(" from Contract c inner join fetch c.family f where 1 = 1");   //and len(f.idCode) = 10
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

                    hql.append(" and " + columnName + " in (" + value + ")");
                }
            }
        }
        hql.append(" order by c.familyCode ");
        return this.list(pageInfo, hql.toString());
    }


    /**
     * 分类统计
     *
     * @return
     */
    public Map<String,List<String>> getFenLeiCount() {
        String sql = "SELECT projectName,count(*) countTotal," +
                "sum(case when familyType = 1 then 1 else 0 end) as family1," +
                "sum(case when familyType = 2 then 1 else 0 end) as family2," +
                "sum(case when familyType = 3 then 1 else 0 end) as family3," +
                "sum(case when familyType = 4 then 1 else 0 end) as family4," +
                "sum(case when familyType = 5 then 1 else 0 end) as family5," +
                "sum(case when thisArea = 1 then 1 else 0 end) as isThisArea," +
                "sum(case when thisArea = 0 then 1 else 0 end) as notThisArea," +
                "sum(case when thisPark = 1 then 1 else 0 end) as isThisPark," +
                "sum(case when thisPark = 2 then 1 else 0 end) as notThisPark," +
                "sum(case when education = 1 then 1 else 0 end) as benKe," +
                "sum(case when education = 2 then 1 else 0 end) as shuoshi," +
                "sum(case when education = 3 then 1 else 0 end) as boshi," +
                "sum(case when firstOrNot = 1 then 1 else 0 end) as isyouxian," +
                "sum(case when firstOrNot = 2 then 1 else 0 end) as notyouxian, " +
                "sum(case when houseStatus = 1 and socialStatus = 1 and marriageStatus = 1 and ageStatus = 1 and educationStatus = 1 and otherStatus = 1 then 1 ELSE 0 end) as notCheck," +
                "sum(case when houseStatus = 3 then 1 ELSE 0 end) as houseCheck," +
                "sum(case when socialStatus = 3 then 1 ELSE 0 end) as socialCheck," +
                "sum(case when marriageStatus = 3 then 1 ELSE 0 end) as marriageCheck," +
                "sum(case when ageStatus = 3 then 1 ELSE 0 end) as ageCheck," +
                "sum(case when educationStatus = 3 then 1 ELSE 0 end) as educationCheck," +
                "sum(case when otherStatus = 3 then 1 ELSE 0 end) as otherCheck," +
                "sum(case when houseStatus = 2 and socialStatus = 2 and marriageStatus = 2 and ageStatus = 2 and educationStatus = 2 and otherStatus = 2 then 1 ELSE 0 end) as Checked " +
                "FROM `family` GROUP BY projectName ORDER BY projectName";
        List<Map> mapList =  this.getSession().createSQLQuery(sql).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
        Map<String,List<String>> resultMap = Maps.newLinkedHashMap();
        if (Collections3.isNotEmpty(mapList)) {
            for (int i = 0; i <mapList.size() ; i++) {
                String projectName = String.valueOf(mapList.get(i).get("projectName"));
                String countTotal = String.valueOf(mapList.get(i).get("countTotal"));
                String family1 = String.valueOf(mapList.get(i).get("family1"));
                String family2 = String.valueOf(mapList.get(i).get("family2"));
                String family3 = String.valueOf(mapList.get(i).get("family3"));
                String family4 = String.valueOf(mapList.get(i).get("family4"));
                String family5 = String.valueOf(mapList.get(i).get("family5"));
                String thisArea = String.valueOf(mapList.get(i).get("isThisArea"));
                String notThisArea = String.valueOf(mapList.get(i).get("notThisArea"));
                String isThisPark = String.valueOf(mapList.get(i).get("isThisPark"));
                String notThisPark = String.valueOf(mapList.get(i).get("notThisPark"));
                String benKe = String.valueOf(mapList.get(i).get("benKe"));
                String shuoshi = String.valueOf(mapList.get(i).get("shuoshi"));
                String boshi = String.valueOf(mapList.get(i).get("boshi"));
                String isyouxian = String.valueOf(mapList.get(i).get("isyouxian"));
                String notyouxian = String.valueOf(mapList.get(i).get("notyouxian"));
                String notCheck = String.valueOf(mapList.get(i).get("notCheck"));
                String houseCheck = String.valueOf(mapList.get(i).get("houseCheck"));
                String socialCheck = String.valueOf(mapList.get(i).get("socialCheck"));
                String marriageCheck = String.valueOf(mapList.get(i).get("marriageCheck"));
                String ageCheck = String.valueOf(mapList.get(i).get("ageCheck"));
                String educationCheck = String.valueOf(mapList.get(i).get("educationCheck"));
                String otherCheck = String.valueOf(mapList.get(i).get("otherCheck"));
                String Checked = String.valueOf(mapList.get(i).get("Checked"));
                List<String> resultList = new ArrayList<>();
                resultList.add(countTotal);
                resultList.add(family1);
                resultList.add(family2);
                resultList.add(family3);
                resultList.add(family4);
                resultList.add(family5);
                resultList.add(thisArea);
                resultList.add(notThisArea);
                resultList.add(isThisPark);
                resultList.add(notThisPark);
                resultList.add(benKe);
                resultList.add(shuoshi);
                resultList.add(boshi);
                resultList.add(isyouxian);
                resultList.add(notyouxian);
                resultList.add(notCheck);
                resultList.add(houseCheck);
                resultList.add(socialCheck);
                resultList.add(marriageCheck);
                resultList.add(ageCheck);
                resultList.add(educationCheck);
                resultList.add(otherCheck);
                resultList.add(Checked);
                resultMap.put(projectName,resultList);
            }
        }
        return resultMap;
    }

    /**
     * 分类统计合计
     * @return
     */
    public List<String> getFenLeiTotalCount() {
        String sql = "SELECT count(*) total, " +
                "sum(case when familyType = 1 then 1 else 0 end) as family1," +
                "sum(case when familyType = 2 then 1 else 0 end) as family2," +
                "sum(case when familyType = 3 then 1 else 0 end) as family3," +
                "sum(case when familyType = 4 then 1 else 0 end) as family4," +
                "sum(case when familyType = 5 then 1 else 0 end) as family5," +
                "sum(case when thisArea = 1 then 1 else 0 end) as isThisArea," +
                "sum(case when thisArea = 0 then 1 else 0 end) as notThisArea," +
                "sum(case when thisPark = 1 then 1 else 0 end) as isThisPark," +
                "sum(case when thisPark = 2 then 1 else 0 end) as notThisPark," +
                "sum(case when education = 1 then 1 else 0 end) as benKe," +
                "sum(case when education = 2 then 1 else 0 end) as shuoshi," +
                "sum(case when education = 3 then 1 else 0 end) as boshi," +
                "sum(case when firstOrNot = 1 then 1 else 0 end) as isyouxian," +
                "sum(case when firstOrNot = 2 then 1 else 0 end) as notyouxian, " +
                "sum(case when houseStatus = 1 and socialStatus = 1 and marriageStatus = 1 and ageStatus = 1 and educationStatus = 1 and otherStatus = 1 then 1 ELSE 0 end) as notCheck," +
                "sum(case when houseStatus = 3 then 1 ELSE 0 end) as houseCheck," +
                "sum(case when socialStatus = 3 then 1 ELSE 0 end) as socialCheck," +
                "sum(case when marriageStatus = 3 then 1 ELSE 0 end) as marriageCheck," +
                "sum(case when ageStatus = 3 then 1 ELSE 0 end) as ageCheck," +
                "sum(case when educationStatus = 3 then 1 ELSE 0 end) as educationCheck," +
                "sum(case when otherStatus = 3 then 1 ELSE 0 end) as otherCheck," +
                "sum(case when houseStatus = 2 and socialStatus = 2 and marriageStatus = 2 and ageStatus = 2 and educationStatus = 2 and otherStatus = 2 then 1 ELSE 0 end) as Checked " +
                "FROM `family`";
        List<Map> mapList =  this.getSession().createSQLQuery(sql).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
        List<String> resultList = new ArrayList<>();
        if (Collections3.isNotEmpty(mapList)) {
            for (int i = 0; i <mapList.size() ; i++) {
                String total = String.valueOf(mapList.get(i).get("total"));
                String family1 = String.valueOf(mapList.get(i).get("family1"));
                String family2 = String.valueOf(mapList.get(i).get("family2"));
                String family3 = String.valueOf(mapList.get(i).get("family3"));
                String family4 = String.valueOf(mapList.get(i).get("family4"));
                String family5 = String.valueOf(mapList.get(i).get("family5"));
                String thisArea = String.valueOf(mapList.get(i).get("isThisArea"));
                String notThisArea = String.valueOf(mapList.get(i).get("notThisArea"));
                String isThisPark = String.valueOf(mapList.get(i).get("isThisPark"));
                String notThisPark = String.valueOf(mapList.get(i).get("notThisPark"));
                String benKe = String.valueOf(mapList.get(i).get("benKe"));
                String shuoshi = String.valueOf(mapList.get(i).get("shuoshi"));
                String boshi = String.valueOf(mapList.get(i).get("boshi"));
                String isyouxian = String.valueOf(mapList.get(i).get("isyouxian"));
                String notyouxian = String.valueOf(mapList.get(i).get("notyouxian"));
                String notCheck = String.valueOf(mapList.get(i).get("notCheck"));
                String houseCheck = String.valueOf(mapList.get(i).get("houseCheck"));
                String socialCheck = String.valueOf(mapList.get(i).get("socialCheck"));
                String marriageCheck = String.valueOf(mapList.get(i).get("marriageCheck"));
                String ageCheck = String.valueOf(mapList.get(i).get("ageCheck"));
                String educationCheck = String.valueOf(mapList.get(i).get("educationCheck"));
                String otherCheck = String.valueOf(mapList.get(i).get("otherCheck"));
                String Checked = String.valueOf(mapList.get(i).get("Checked"));
                resultList.add(total);
                resultList.add(family1);
                resultList.add(family2);
                resultList.add(family3);
                resultList.add(family4);
                resultList.add(family5);
                resultList.add(thisArea);
                resultList.add(notThisArea);
                resultList.add(isThisPark);
                resultList.add(notThisPark);
                resultList.add(benKe);
                resultList.add(shuoshi);
                resultList.add(boshi);
                resultList.add(isyouxian);
                resultList.add(notyouxian);
                resultList.add(notCheck);
                resultList.add(houseCheck);
                resultList.add(socialCheck);
                resultList.add(marriageCheck);
                resultList.add(ageCheck);
                resultList.add(educationCheck);
                resultList.add(otherCheck);
                resultList.add(Checked);
            }
        }
        return resultList;
    }

    /**
     * 弃房率统计
     *
     * @return
     */
    public Map<String,List<String>> getdiscardingHouseCount() {
        String sql = "SELECT b.projectName projectName, "+
                "sum(case when b.houseStatus = 2 and b.socialStatus = 2 and b.marriageStatus = 2 and b.ageStatus = 2 and b.educationStatus = 2 and b.otherStatus = 2 then 1 ELSE 0 end) as Checked,"+
                "(SELECT MAX(CAST(a.shakingResult AS UNSIGNED)) FROM family a WHERE a.projectName = p.projectName) maxNum,"+
                "p.number number from family b,project p WHERE b.projectName=p.projectName GROUP BY b.projectName";
        List<Map> mapList =  this.getSession().createSQLQuery(sql).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
        Map<String,List<String>> resultMap = Maps.newLinkedHashMap();
        if (Collections3.isNotEmpty(mapList)) {
            DecimalFormat df = new DecimalFormat("#.00");
            for (int i = 0; i <mapList.size() ; i++) {
                String projectName = String.valueOf(mapList.get(i).get("projectName"));
                String Checked = String.valueOf(mapList.get(i).get("Checked"));
                String maxNum = String.valueOf(mapList.get(i).get("maxNum"));
                String number = String.valueOf(mapList.get(i).get("number"));
                String discarding = "0";
                if (maxNum.equals("0") || number.equals("0") || maxNum == null || maxNum.equals("") || number.equals("")){
                }else{
                    double num = Integer.parseInt(maxNum) - Integer.parseInt(number);
                    double num1 = Integer.parseInt(maxNum);
                    discarding = df.format(num/num1*100);
                }
                List<String> resultList = new ArrayList<>();
                resultList.add(Checked);
                resultList.add(maxNum);
                resultList.add(number);
                resultList.add(discarding);

                resultMap.put(projectName,resultList);
            }
        }
        return resultMap;
    }
    /**
     * 弃房率合计
     *
     * @return
     */
    public List<String> getdiscardingHouseTotalCount() {
        String sql = "SELECT b.projectName projectName, "+
                "sum(case when b.houseStatus = 2 and b.socialStatus = 2 and b.marriageStatus = 2 and b.ageStatus = 2 and b.educationStatus = 2 and b.otherStatus = 2 then 1 ELSE 0 end) as Checked,"+
                "(SELECT MAX(CAST(a.shakingResult AS UNSIGNED)) FROM family a WHERE a.projectName = p.projectName) maxNum,"+
                "p.number number from family b,project p WHERE b.projectName=p.projectName GROUP BY b.projectName";
        List<Map> mapList =  this.getSession().createSQLQuery(sql).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
        List<String> resultList = new ArrayList<>();
        double Checked=0;
        double maxNum=0;
        double number=0;
        double discarding=0;
        DecimalFormat decimalFormat = new DecimalFormat("###################.###########");
        if (Collections3.isNotEmpty(mapList)) {
            DecimalFormat df = new DecimalFormat("#.00");
            for (int i = 0; i <mapList.size() ; i++) {
                Checked = Checked + Double.parseDouble(mapList.get(i).get("Checked").toString());
                maxNum = maxNum + Double.parseDouble(mapList.get(i).get("maxNum").toString());
                number = number + Double.parseDouble(mapList.get(i).get("number").toString());
            }
            if (maxNum!=0 && number!=0){
                discarding = Double.parseDouble(df.format((maxNum-number)/maxNum*100));
            }
        }
        if (discarding < 0){
            discarding=0;
        }
        resultList.add(decimalFormat.format(Checked));
        resultList.add(decimalFormat.format(maxNum));
        resultList.add(decimalFormat.format(number));
        resultList.add(String.valueOf(discarding));
        return resultList;
    }

    /**
     * 得到所有家庭成员<主表uuid,List<家庭成员>>
     *
     * @return
     */
    public Map<Integer, List<FamilyPerson>> getFamilyPersonMap() {
        String hql = "from FamilyPerson fp inner join fetch fp.family f order by f.id,fp.id";
        Query query = this.getSession().createQuery(hql);
        List<FamilyPerson> familyPersonList = query.list();
        Map<Integer, List<FamilyPerson>> familyPersonMap = Maps.newLinkedHashMap();
        if (Collections3.isNotEmpty(familyPersonList)) {
            for (FamilyPerson familyPerson : familyPersonList) {
                List<FamilyPerson> itemList = familyPersonMap.get(familyPerson.getFamily().getId()) == null ? new ArrayList<FamilyPerson>() : familyPersonMap.get(familyPerson.getFamily().getId());
                itemList.add(familyPerson);
                familyPersonMap.put(familyPerson.getFamily().getId(), itemList);
            }
        }
        return familyPersonMap;
    }

    /**
     * 得到所有入户/房源<主表id,List<家庭成员>>
     *
     * @return
     */
    public Map<Integer, List<Contract>> getHouseMap() {
        String hql = "from Contract c inner join fetch c.house order by c.id";
        Query query = this.getSession().createQuery(hql);
        List<Contract> houseList = query.list();
        Map<Integer, List<Contract>> familyPersonMap = Maps.newLinkedHashMap();
        if (Collections3.isNotEmpty(houseList)) {
            for (Contract contract : houseList) {
                List<Contract> itemList = familyPersonMap.get(contract.getId()) == null ? new ArrayList<Contract>() : familyPersonMap.get(contract.getId());
                itemList.add(contract);
                familyPersonMap.put(contract.getId(), itemList);
            }
        }
        return familyPersonMap;
    }

}
