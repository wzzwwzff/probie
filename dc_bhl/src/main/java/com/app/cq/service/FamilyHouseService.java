package com.app.cq.service;

import com.app.cq.model.Family;
import com.app.cq.model.FamilyHouse;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.sqds.hibernate.HibernateDao;
import com.sqds.page.PageInfo;
import com.sqds.utils.Collections3;
import com.sqds.web.ParamUtils;
import com.sqds.web.Servlets;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by lsh on 2018/5/7.
 * 标准自建房业务层
 */
@Service
public class FamilyHouseService extends HibernateDao<FamilyHouse>{

    @Autowired
    private FamilyService familyService;
    @Autowired
    private FamilyHousePersonService familyHousePersonService;

    /**
     * 根据family id取得这个所有标准自建房信息
     *
     * @param familyId
     * @return
     */
    public List<FamilyHouse> getFamilyHouseListByFamilyId(Integer familyId) {
        return list("from FamilyHouse fh where fh.family.id = ? order by fh.id", familyId);
    }

    /**
     * 标准自建房保存
     * @param request
     * @return
     */
    public synchronized Map<String,String> familyHouseSave(HttpServletRequest request){
        Map<String,String> map = Maps.newHashMap();
        Integer familyId = ParamUtils.getInt(request, "familyId", 0);
        Integer familyHouseId = ParamUtils.getInt(request, "familyHouseId", 0);
        Family family = this.familyService.get(familyId);
        FamilyHouse familyHouse = this.get(familyHouseId);
        if (familyHouse == null){
            familyHouse = new FamilyHouse();
        }
        Servlets.bind(request, familyHouse);
        familyHouse.setFamily(family);
        this.save(familyHouse);
        //保存家庭成员信息
        String[] personIdArray = ParamUtils.getStringParameters(request, "p_id");   //id
        String[] personNameArray = ParamUtils.getStringParameters(request, "p_name");   //姓名
        String[] personIdCardArray = ParamUtils.getStringParameters(request, "p_idCard");   //身份证号
        String[] personRelationArray = ParamUtils.getStringParameters(request, "p_relation");   //关系
        List<String[]> list = Lists.newArrayList();
        list.add(0, personIdArray);
        list.add(1, personNameArray);
        list.add(2, personIdCardArray);
        list.add(3, personRelationArray);
        this.familyHousePersonService.saveFamilyHousePerson(list,familyHouse.getId());
        map.put("success","true");
        map.put("message","保存成功！");
        map.put("familyId",family.getId().toString());
        map.put("familyHouseId",familyHouse.getId().toString());
        return map;
    }

    /**
     * 删除标准自建房及其家庭成员信息
     * @param request
     */
    public synchronized void deleteFamilyHouse(HttpServletRequest request){
        Integer familyHouseId = ParamUtils.getInt(request, "familyHouseId", 0);
        FamilyHouse familyHouse = this.get(familyHouseId);
        this.familyHousePersonService.deletePersonByFamilyHouseId(familyHouse.getId());
        this.delete(familyHouse.getId());
    }
    
    /**
    *查询出所有自建房信息
    *lsh
    *2018/5/11
    *@param pageInfo
    *[pageInfo]
    */
    public PageInfo<FamilyHouse> getFamilyHouse(PageInfo<FamilyHouse> pageInfo){
        String hql = " from FamilyHouse fh order by fh.Family,fh.id";
        return this.list(pageInfo,hql.toString());
    }


    /**
     * 得到所有的自建房家庭成员信息
     * Map<historyFamilyUuid,List<HistoryFamilyperson>>
     */
    public Map<Integer,List<FamilyHouse>> getFamilyHouseList(){
        String hql = " from FamilyHouse as fh order by fh.family.id,fh.id ";
        List<FamilyHouse> list = this.getSession().createQuery(hql.toString()).list();
        Map<Integer,List<FamilyHouse>> resultMap = Maps.newLinkedHashMap();
        if (Collections3.isNotEmpty(list)){
            for (FamilyHouse familyHouse : list){
                List<FamilyHouse> itemList = resultMap.get(familyHouse.getFamily().getId()) == null ? new ArrayList<FamilyHouse>() : resultMap.get(familyHouse.getFamily().getId());
                itemList.add(familyHouse);
                resultMap.put(familyHouse.getFamily().getId(), itemList);
            }
        }

        return resultMap;
    }

    /**
     * 得到所有自建房家庭行高
     * Map<Familyid,行高>
     */
    public Map<Integer,Integer> getFamilyHeightList(){
        String sql = " SELECT fh.`familyId` familyId,COUNT(fhp.id) count FROM familyHouse fh INNER JOIN familyHousePerson fhp ON Fh.`id`=fhp.`familyHouseId` " +
                "GROUP BY fh.`familyId`";
        List<Map> mapList = this.getSession().createSQLQuery(sql.toString()).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
        Map<Integer,Integer> resultMap = Maps.newLinkedHashMap();
        if (Collections3.isNotEmpty(mapList)){
            for (Map map : mapList){
               Integer familyId = Integer.valueOf(String.valueOf(map.get("familyId")));
               Integer count = Integer.valueOf(String.valueOf(map.get("count")));
                resultMap.put(familyId, count);
            }
        }

        return resultMap;
    }
}
