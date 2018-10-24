package com.app.cq.service;

import com.app.cq.model.FamilyHouse;
import com.app.cq.model.FamilyHousePerson;
import com.google.common.collect.Maps;
import com.sqds.hibernate.HibernateDao;
import com.sqds.utils.Collections3;
import com.sqds.utils.StringUtils;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by lsh on 2018/5/7.
 * 标准自建房家庭成员业务层
 */
@Service
public class FamilyHousePersonService extends HibernateDao<FamilyHousePerson> {

    @Autowired
    private FamilyHouseService familyHouseService;

    /**
     * 根据familyHouseId取得这个所有标准自建房信息
     *
     * @param familyHouseId
     * @return
     */
    public List<FamilyHousePerson> getFamilyHousePersonListByFamilyId(Integer familyHouseId) {
        return list("from FamilyHousePerson fhp where fhp.familyHouse.id = ? order by fhp.id", familyHouseId);
    }

    /**
     * 保存标准自建家庭成员
     * @param list
     * @param familyHouseId
     */
    public synchronized void saveFamilyHousePerson(List<String[]> list, Integer familyHouseId){
        FamilyHouse familyHouse = this.familyHouseService.get(familyHouseId);
        String[] personIdArray = list.get(0);
        if (personIdArray != null && personIdArray.length > 0) {
            String[] personNameArray = list.get(1);
            String[] personIdCardArray = list.get(2);
            String[] personRelationArray = list.get(3);
            for (int i = 0; i < personIdArray.length; i++) {
                if (StringUtils.isEmpty(personNameArray[i]) && StringUtils.isNotEmpty(personIdArray[i])) {
                    this.delete(Integer.valueOf(personIdArray[i]));
                } else if (StringUtils.isNotEmpty(personNameArray[i])) {
                    FamilyHousePerson familyHousePerson = new FamilyHousePerson();
                    if (StringUtils.isNotEmpty(personIdArray[i])) {
                        familyHousePerson = this.get(Integer.valueOf(personIdArray[i]));
                    }
                    familyHousePerson.setName(personNameArray[i]);   //姓名
                    familyHousePerson.setIdCard(personIdCardArray[i]);   //身份证号
                    familyHousePerson.setRelation(personRelationArray[i]);   //关系
                    familyHousePerson.setFamilyHouse(familyHouse);
                    this.save(familyHousePerson);
                }
            }
        }
    }

    /**
     * 通过标准自建房id删除家庭成员
     * @param familyHouseId
     */
    public synchronized void deletePersonByFamilyHouseId(Integer familyHouseId){
        String sql = "DELETE FROM familyhouseperson WHERE familyHouseId =:familyHouseId";
        this.getSession().createSQLQuery(sql).setInteger("familyHouseId",familyHouseId).executeUpdate();
    }


    /**
     * 得到所有的自建房家庭成员信息
     * Map<historyFamilyUuid,List<HistoryFamilyperson>>
     */
    public Map<Integer,List<FamilyHousePerson>> getFamilyPersonList(){
        String hql = " from FamilyHousePerson as fhp order by fhp.familyHouse.id,fhp.id ";
        List<FamilyHousePerson> list = this.getSession().createQuery(hql.toString()).list();
        Map<Integer,List<FamilyHousePerson>> resultMap = Maps.newLinkedHashMap();
        if (Collections3.isNotEmpty(list)){
            for (FamilyHousePerson familyHousePerson : list){
                List<FamilyHousePerson> itemList = resultMap.get(familyHousePerson.getFamilyHouse().getId()) == null ? new ArrayList<FamilyHousePerson>() : resultMap.get(familyHousePerson.getFamilyHouse().getId());
                itemList.add(familyHousePerson);
                resultMap.put(familyHousePerson.getFamilyHouse().getId(), itemList);
            }
        }

        return resultMap;
    }
}
