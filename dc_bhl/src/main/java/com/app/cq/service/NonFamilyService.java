package com.app.cq.service;

import com.app.cq.en.IsValid;
import com.app.cq.model.Family;
import com.app.cq.model.NonFamily;
import com.sqds.hibernate.HibernateDao;
import com.sqds.page.PageInfo;
import org.springframework.stereotype.Service;

/**
 * Created by lsh on 2018/5/7.
 * 非宅业务层
 */
@Service
public class NonFamilyService extends HibernateDao<NonFamily>{

    /**
     * 得到非宅家庭
     * @param pageInfo
     * @return
     */
    public PageInfo<NonFamily> getFamilyList(PageInfo<NonFamily> pageInfo){
        return this.list(pageInfo,"from NonFamily f order by f.bdCode,f.groupCode,f.familyCode");
    }

    /**
     * 家庭编号查重
     * @param familyCode
     * @param nonFamilyId
     * @return
     */
    public NonFamily checkRepeat(String familyCode, Integer nonFamilyId) {
        return findUnique("from NonFamily where familyCode = ? and id <> ?", familyCode, nonFamilyId);
    }
}
