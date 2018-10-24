package com.app.cq.service;

import com.sqds.hibernate.HibernateDao;
import com.sqds.utils.DateUtils;
import org.springframework.stereotype.Service;

import java.io.File;
import java.util.Date;

/**
 * 数据库备份业务层
 * Created by zyk on 2018/1/30.
 */
@Service
public class DataBackDownService extends HibernateDao {

    /**
     * 数据库备份
     *
     * @param saveDir
     */
    public void backup(String saveDir, String databaseName) {
        Date date = new Date();
        String formaterDate = DateUtils.date2string("yyyy_MM_dd_HH_mm_ssSSS", date);
        File file = new File(saveDir);
        if (!file.exists()) {//不存在目录重新创建
            file.mkdirs();
        }
        String backFile = saveDir + "\\" + databaseName + "_backup_" + formaterDate + ".bak";
        //压缩备份
        System.out.println("数据库备份开始：" + formaterDate);
        StringBuffer sql = new StringBuffer("Backup Database " + databaseName + "  To disk='" + backFile + "'  with COMPRESSION ");
        this.getSession().createSQLQuery(sql.toString()).executeUpdate();
        System.out.println("数据库备份结束：" + DateUtils.date2string("yyyy_MM_dd_HH_mm_ssSSS", new Date()));
    }
}
