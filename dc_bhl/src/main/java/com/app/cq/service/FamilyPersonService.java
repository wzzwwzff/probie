package com.app.cq.service;

import com.app.cq.model.Family;
import com.app.cq.model.FamilyPerson;
import com.google.common.collect.Maps;
import com.sqds.hibernate.HibernateDao;
import com.sqds.utils.Collections3;
import com.sqds.utils.StringUtils;
import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by lsh on 2018/5/7.
 * 家庭成员业务层
 */
@Service
public class FamilyPersonService extends HibernateDao<FamilyPerson>{

    @Autowired
    private FamilyService familyService;

    /**
     * 根据family id取得这个所有家庭成员信息
     *
     * @param familyId
     * @return
     */
    public List<FamilyPerson> getPersonListByFamilyId(Integer familyId) {
        return list("from FamilyPerson fp where fp.family.id = ? order by fp.type,fp.id", familyId);
    }

    /**
     * 根据family id取得这个在本址或不在本址家庭成员信息
     *
     * @param familyId
     * @return
     */
    public List<FamilyPerson> getPersonListByFamilyId(Integer familyId,Integer type) {
        return list("from FamilyPerson fp where fp.family.id = ? and fp.type = ? order by fp.id", familyId,type);
    }

    /**
     * 根据name和idCard获取familyperson
     *
     * @return
     */
    public FamilyPerson getPersonByNameIdCard(String name,String idCard) {
        return findUnique("from FamilyPerson fp where fp.name = ? and fp.idCard = ? order by fp.id", name,idCard);
    }

    /**
     * 保存家庭成员
     * @param list
     * @param familyId
     */
    public synchronized void saveFamilyPerson(List<String[]> list, Integer familyId) {
        Family family = this.familyService.get(familyId);
        String[] personIdArray = list.get(0);
        if (personIdArray != null && personIdArray.length > 0) {
            String[] personTypeArray = list.get(1);
            String[] personHkNumArray = list.get(2);
            String[] personNameArray = list.get(3);
            String[] personIdCardArray = list.get(4);
            String[] personRelationArray = list.get(5);
            String[] personHzRelationArray = list.get(6);
            String[] personUnitArray = list.get(7);
            String[] personHjAddressArray = list.get(8);
            String[] personStatusArray = list.get(9);
            String[] personAveStatusArray = list.get(10);
            String[] personFlagArray = list.get(11);
            String[] personAgeArray = list.get(12);
            for (int i = 0; i < personIdArray.length; i++) {
                if (StringUtils.isEmpty(personNameArray[i]) && StringUtils.isNotEmpty(personIdArray[i])) {
                    this.delete(Integer.valueOf(personIdArray[i]));
                } else if (StringUtils.isNotEmpty(personNameArray[i])) {
                    FamilyPerson familyPerson = new FamilyPerson();
                    if (StringUtils.isNotEmpty(personIdArray[i])) {
                        familyPerson = this.get(Integer.valueOf(personIdArray[i]));
                    }
                    if (StringUtils.isNotEmpty(personTypeArray[i])) {
                        familyPerson.setType(Integer.valueOf(personTypeArray[i]));   //是否在本址
                    }
                    if (StringUtils.isNotEmpty(personHkNumArray[i])) {
                        familyPerson.setHkNum(Integer.valueOf(personHkNumArray[i] == "" ? "0" : personHkNumArray[i]));   //户口本数
                    }
                    familyPerson.setName(personNameArray[i]);   //姓名
                    familyPerson.setIdCard(personIdCardArray[i]);   //身份证号
                    familyPerson.setRelation(personRelationArray[i]);   //（在本址：与户主关系；不在本址：与被拆迁人关系）
                    familyPerson.setHzRelation(personHzRelationArray[i]);   //户主与被拆迁人关系
                    familyPerson.setUnit(personUnitArray[i]);
                    familyPerson.setHjAddress(personHjAddressArray[i]);   //户口所在地
                    if (StringUtils.isNotEmpty(personStatusArray[i])){
                        familyPerson.setStatus(Integer.valueOf(personStatusArray[i]));   //是否享受过保障性住房政策 1：是，2：否（录入界面默认为否）
                    }
                    if (StringUtils.isNotEmpty(personAveStatusArray[i])){
                        familyPerson.setAveStatus(Integer.valueOf(personAveStatusArray[i]));   //是否享受人均5平米 1：是，2：否（录入界面默认为是）
                    }
                    if (StringUtils.isNotEmpty(personFlagArray[i])){
                        familyPerson.setFlag(Integer.valueOf(personFlagArray[i]));   //是否长期住在未登记房屋内 1：是，2：否（录入界面默认为是）
                    }
                    familyPerson.setAge(Integer.valueOf(personAgeArray[i] == "" ? "0" : personAgeArray[i]));
                    familyPerson.setFamily(family);
                    this.save(familyPerson);
                }
            }
        }
    }


    /**
     * 得到所有入户/认定家庭成员<主表uuid,List<家庭成员>>
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
}
