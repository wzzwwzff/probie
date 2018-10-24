package com.app.cq.service;

import com.app.cq.model.ComplaintFeedback;
import com.sqds.hibernate.HibernateDao;
import com.sqds.page.PageInfo;
import org.springframework.stereotype.Service;

/**
 * Created by jmdf on 2018/8/9.
 */
@Service
public class ComplaintFeedbackService extends HibernateDao<ComplaintFeedback>{

    /**
     * 申诉、投诉、反馈列表
     * @param pageInfo
     * @return
     */
    public PageInfo<ComplaintFeedback> list(PageInfo<ComplaintFeedback> pageInfo){
        StringBuffer hql = new StringBuffer("from ComplaintFeedback order by id");
        return this.list(pageInfo,hql.toString());
    }
}
