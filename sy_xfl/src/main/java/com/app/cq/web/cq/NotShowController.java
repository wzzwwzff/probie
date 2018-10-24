package com.app.cq.web.cq;


import com.app.common.model.DataDict;
import com.app.common.service.DataDictService;
import com.app.cq.service.NotStatisticsService;
import com.google.common.collect.Maps;
import com.sqds.utils.Collections3;
import com.sqds.web.ParamUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/cq/notShow/*")
public class NotShowController {
    @Autowired
    private DataDictService dataDictService;
    @Autowired
    private NotStatisticsService notStatisticsService;

    /**
     * 入户情况公示
     * @param request
     * @param modelMap
     */
    @RequestMapping("rhNotShow")
    public void rhNotShow(HttpServletRequest request, ModelMap modelMap){
        List<DataDict> dataDictList = this.dataDictService.getDataDictList("非宅组别");
        String groupArray = "";
        if (Collections3.isNotEmpty(dataDictList)){
            for (DataDict dataDict : dataDictList) {
                groupArray = groupArray + "'" + dataDict.getAttributeName() + "',";
            }
        }
        modelMap.addAttribute("groupArray",groupArray);
    }


    //得到非宅数据（入户，签约）
    @RequestMapping("dataTable")
    public void dataTable(HttpServletRequest request,ModelMap modelMap){
        String type = ParamUtils.getString(request,"type","");
        String paramName = "";
        String paramDate = "";
        if (type.equals("qy")){
            paramName = "qyState";
            paramDate = "qyDate";
        }
        List<Map> list = notStatisticsService.getData(paramName,paramDate);
        Map<String,Map> map = new HashMap<>();
        if (list!=null && list.size()>0){
            for (Map m:list){
                String groupCode = String.valueOf(m.get("groupCode"));
                map.put(groupCode,m);
            }
        }
        List<DataDict> dataDictList = dataDictService.getDataDictList("非宅组别");
        if (type.equals("rh")){
            List<DataDict> dataDictLjList = dataDictService.getDataDictList("非宅累计入户");
            if (dataDictLjList.get(0).getAttributeColor() != null && !dataDictLjList.get(0).getAttributeColor().equals("")){
                for (int i = 0; i <dataDictLjList.size() ; i++) {
                    try {
                        String attributeValue = dataDictLjList.get(i).getAttributeValue();
                        String attributeColor = dataDictLjList.get(i).getAttributeColor();
                        if (map.get(attributeValue) == null){
                            Map map1 = new HashMap();
                            map.put(attributeValue,map1);
                        }
                        map.get(attributeValue).put("signCount",attributeColor);
                    }catch (NullPointerException nul){
                        System.out.println("有空指针");
                    }
                }
            }
        }
        if (type.equals("qy")){
            if (dataDictList != null && dataDictList.size()>0) {
                for (int i = 0; i < dataDictList.size(); i++) {
                    try {
                        String attributeValue = dataDictList.get(i).getAttributeValue();
                        if (map.get(attributeValue) == null){
                            Map map1 = new HashMap();
                            map1.put("signCount",0);
                            map1.put("allCount",0);
                            map.put(attributeValue,map1);
                        }
                        Object signCount = map.get(attributeValue).get("signCount");
                        String s = String.valueOf(signCount);
                        dataDictList.get(i).setAttributeColor(s);
                    } catch (NullPointerException nul) {
                        System.out.println("有空指针");
                    }
                }
            }
        }
        modelMap.addAttribute("dataDictList",dataDictList);
        modelMap.addAttribute("map",map);
        modelMap.addAttribute("type",type);
    }


    /**
     * 获取所有组别累计入户数量
     *
     */
    @RequestMapping("getRhJson2")
    @ResponseBody
    public Map getRhJson2() {
        Map<String,Integer> resultMap = this.notStatisticsService.getCountByGroup();
        List<DataDict> dataDictList = dataDictService.getDataDictList("非宅组别");
        List<DataDict> dataDictLjList = dataDictService.getDataDictList("非宅累计入户");
        Integer total = 0;
        Integer familyCount = 0;
        for (int i = 0; i <dataDictList.size() ; i++) {
            total += Integer.valueOf(dataDictList.get(i).getAttributeColor());
        }
        if (dataDictLjList.get(0).getAttributeColor() == null || dataDictLjList.get(0).getAttributeColor().equals("")){
            familyCount = resultMap.get("familyCount");
        }else {
            for (int i = 0; i <dataDictLjList.size() ; i++) {
                familyCount += Integer.valueOf(dataDictLjList.get(i).getAttributeColor());
            }
        }
        Map<String, String> map = Maps.newHashMap();
        map.put("type", "pie");
        map.put("name", "百分比");
        map.put("data", "[[\"已入户\"," + familyCount + "],[\"未入户\"," + String.valueOf(total - familyCount) + "]]");
        return map;
    }


    /**
     * 获取各片区各组入户数据
     */
    @RequestMapping("getRhJson1")
    @ResponseBody
    public List getRhJson1(){
        List list = new ArrayList();
        Map map1 = Maps.newHashMap();
        Map map2 = Maps.newHashMap();

        String rhTotalStr = "";
        String noRhTotalStr = "";
        String rhStr = "";
        String noRhStr = "";

        List<DataDict> dataDictList = this.dataDictService.getDataDictList("非宅组别");
        List<DataDict> dataDictLjList = dataDictService.getDataDictList("非宅累计入户");

        Map<String,Integer> resultMap = this.notStatisticsService.getGroupCount();
        Integer rhCount = 0;
        if (dataDictLjList.get(0).getAttributeColor() == null || dataDictLjList.get(0).getAttributeColor().equals("")) {
                for (int i = 0; i <dataDictList.size() ; i++) {
                    String groupCode = String.valueOf(dataDictList.get(i).getAttributeValue());
                    rhCount = resultMap.get(groupCode) == null ? 0 : resultMap.get(groupCode);
                    if (dataDictList.get(i).getAttributeValue().equals(groupCode)){
                         noRhStr = (Integer.valueOf(dataDictList.get(i).getAttributeColor()) - rhCount) <= 0 ? "0" : String.valueOf((Integer.valueOf(dataDictList.get(i).getAttributeColor()) - rhCount));
                    }
                    rhStr = rhCount.toString();
                    rhTotalStr += rhStr + ",";
                    noRhTotalStr += noRhStr + ",";
                }
        }else {
            for (int i = 0; i < dataDictLjList.size(); i++) {
                rhStr = dataDictLjList.get(i).getAttributeColor();
                rhTotalStr += rhStr + ",";
                for (int j = 0; j <dataDictList.size() ; j++) {
                    if (dataDictList.get(j).getAttributeValue().equals(dataDictLjList.get(i).getAttributeValue())){
                        noRhStr = (Integer.valueOf(dataDictList.get(j).getAttributeColor()) - Integer.valueOf(rhStr)) <= 0 ? "0" : String.valueOf((Integer.valueOf(dataDictList.get(j).getAttributeColor()) - Integer.valueOf(rhStr)));
                    }
                }
                noRhTotalStr += noRhStr + ",";
            }
        }
        map1.put("name", "未入户");
        map1.put("data", "[" + noRhTotalStr.substring(0, noRhTotalStr.length() - 1) + "]");
        map2.put("name", "已入户");
        map2.put("data", "[" + rhTotalStr.substring(0, rhTotalStr.length() - 1) + "]");
        list.add(map1);
        list.add(map2);
        return list;
    }

    /**
     * 签约情况公示
     * @param request
     * @param modelMap
     */
    @RequestMapping("signNotShow")
    public void signNotShow(HttpServletRequest request,ModelMap modelMap){
        this.rhNotShow(request,modelMap);
    }

    /**
     * 获取各组别签约数据
     */
    @RequestMapping("getSignJson1")
    @ResponseBody
    public List getSignJson1(){
        List list = new ArrayList();
        Map map1 = Maps.newHashMap();
        Map map2 = Maps.newHashMap();

        String signTotalStr = "";
        String noSignTotalStr = "";
        String signStr;
        String noSignStr;

        Map<String, Map> resMap = this.notStatisticsService.getStatisticsByGroup();
        List<DataDict> dataDictList = this.dataDictService.getDataDictList("非宅组别");
            for (int i = 0; i <dataDictList.size() ; i++) {
                String groupCode = dataDictList.get(i).getAttributeValue();
                if (resMap.get(groupCode) == null){
                    signStr = "0";
                    noSignStr = "0";
                }else {
                    Integer signCount = resMap.get(groupCode).get("signCount") == null ? 0 : Integer.valueOf(resMap.get(groupCode).get("signCount").toString());
                    Integer noSignCount = resMap.get(groupCode).get("noSignCount") == null ? 0 : Integer.valueOf(resMap.get(groupCode).get("noSignCount").toString());
                    signStr = signCount.toString();
                    noSignStr = noSignCount.toString();
                }
                signTotalStr += signStr + ",";
                noSignTotalStr += noSignStr + ",";
            }
        map1.put("name", "未签约");
        map1.put("data", "[" + noSignTotalStr.substring(0, noSignTotalStr.length() - 1) + "]");
        map2.put("name", "已签约");
        map2.put("data", "[" + signTotalStr.substring(0, signTotalStr.length() - 1) + "]");
        list.add(map1);
        list.add(map2);
        return list;
    }


    /**
     * 获取所有片区累计签约数量
     */
    @RequestMapping("getSignJson2")
    @ResponseBody
    public Map getSignJson2() {
        Map<String,Integer> resultMap = this.notStatisticsService.getCountByGroup();
        Integer familyCount = resultMap.get("familyCount");
        Integer signCount = resultMap.get("signCount");
        Map<String, String> map = Maps.newHashMap();
        map.put("type", "pie");
        map.put("name", "百分比");
        map.put("data", "[[\"已签约\"," + signCount + "],[\"未签约\"," + String.valueOf(familyCount - signCount) + "]]");
        return map;
    }
}
