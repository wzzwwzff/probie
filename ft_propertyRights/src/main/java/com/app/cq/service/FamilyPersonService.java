package com.app.cq.service;

import com.app.cq.model.FamilyPerson;
import com.sqds.hibernate.HibernateDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by jmdf on 2018/8/9.
 */
@Service
public class FamilyPersonService extends HibernateDao<FamilyPerson> {

    @Autowired
    private FamilyService familyService;


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

}
