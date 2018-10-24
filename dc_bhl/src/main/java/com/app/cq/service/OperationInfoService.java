package com.app.cq.service;

import com.app.cq.model.OperationInfo;
import com.sqds.hibernate.HibernateDao;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by lsh on 2018/5/7.
 * 操作行为记录业务层
 */
@Service
public class OperationInfoService extends HibernateDao<OperationInfo>{

    /**
     * 通过某一家庭获取该家庭操作记录
     * @param familyId
     * @return
     */
    public List<OperationInfo> getListByFamilyId(Integer familyId){
        return this.list("from OperationInfo p where p.familyId = ? order by p.operateDate desc,p.id",familyId);
    }
}
