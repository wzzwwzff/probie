package com.app.cq.service;

import com.alibaba.fastjson.JSON;
import com.app.cq.model.HistoryInfo;
import com.app.cq.model.NotFamily;
import com.sqds.hibernate.HibernateDao;
import com.sqds.page.PageInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;
import java.util.Date;

@Service
@Transactional
public class NotFamilyService extends HibernateDao<NotFamily> {
    private Logger logger = LoggerFactory.getLogger(NotFamilyService.class);

    @Autowired
    private HistoryInfoService historyInfoService;


    /**
     * 非宅列表
     * @param pageInfo
     * @return
     */
    public PageInfo<NotFamily> familyList(PageInfo<NotFamily> pageInfo){
        String hql = "from NotFamily f where delState = 1 order by f.familyCode";
        return list(pageInfo,hql);
    }
    /**
     * 非宅喊删除列表
     * @param pageInfo
     * @return
     */
    public PageInfo<NotFamily> delFamilyList(PageInfo<NotFamily> pageInfo){
        String hql = "from NotFamily f where delState = 2 order by f.familyCode";
        return list(pageInfo,hql);
    }


    /**
     * @author lsh
     * @note 保存非宅信息
     * @param notFamily
     * @param userName
     * @param ip
     */
    public void saveNotFamily(HttpServletRequest request, NotFamily notFamily, String userName, String ip){
        save(notFamily);

        //保存修改记录
        HistoryInfo historyInfo = new HistoryInfo();
        historyInfo.setFamilyId(notFamily.getId());//家庭表Id
        historyInfo.setData(JSON.toJSONString(notFamily));//家庭表信息
        historyInfo.setOperateType("非宅信息");
        historyInfo.setPerson(userName);//操作人姓名
        historyInfo.setComputerId(ip);//操作人IP地址
        historyInfo.setDoDate(new Date());
        historyInfoService.save(historyInfo);
    }


    /**
     * 编号重复验证
     * @param familyCode
     * @param familyId
     * @return
     */
    public NotFamily checkRepeat(String familyCode, Integer familyId) {
        String hql = "from NotFamily where familyCode=? and id!=?";
        return findUnique(hql, familyCode, familyId);
    }

}
