package com.app.cq.service;

import com.app.cq.model.FamilyPerson;
import com.sqds.hibernate.HibernateDao;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by jmdf on 2018/9/5.
 */
@Service
public class FamilyPersonService extends HibernateDao<FamilyPerson> {

    /**
     * 取得这个家庭成员信息
     * @param familyId
     * @return
     */
    public List<FamilyPerson> listByFamilyId(Integer familyId){
        String hql = "from FamilyPerson where family.id=? order by id";
        return list(hql, familyId);
    }

    /**
     * 删除
     */
    public void deleteByFamilyId(int familyId){
        String hql="delete FamilyPerson where familyId=?";
        getSession().createQuery(hql).setInteger(0,familyId).executeUpdate();
    }

    /**
     * 根据家庭id和这个家庭成员名字取得这条家庭成员信息
     */
    public FamilyPerson getByFamilyIdAndName(Integer familyId,String name){
        String hql = "from FamilyPerson where family.id=? and pName = ? order by id";
        return findUnique(hql, familyId,name);
    }

    /**
     * 取得这个家庭成员信息是否是继承人的信息
     */
    public List<FamilyPerson> listByFamilyIdAndInheritType(Integer familyId){
        String hql = "from FamilyPerson where family.id=? order by id";
        return list(hql, familyId);
    }
}
