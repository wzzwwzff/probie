package com.app.cq.service;

import com.app.common.service.DataDictService;
import com.sqds.hibernate.HibernateDao;
import com.sqds.utils.DateUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Map;

/**
 * 数据库备份业务层
 * Created by zyk on 2018/1/30.
 */
@Service
public class DataBackDownService extends HibernateDao {

//    /**
//     * 数据库备份
//     *
//     * @param saveDir
//     */
//    public void backup(String saveDir, String databaseName) {
//        Date date = new Date();
//        String formaterDate = DateUtils.date2string("yyyy_MM_dd_HH_mm_ssSSS", date);
//        File file = new File(saveDir);
//        if (!file.exists()) {//不存在目录重新创建
//            file.mkdirs();
//        }
//        String backFile = saveDir + "\\" + databaseName + "_backup_" + formaterDate + ".bak";
//        //压缩备份
//        System.out.println("数据库备份开始：" + formaterDate);
//        StringBuffer sql = new StringBuffer("Backup Database " + databaseName + "  To disk='" + backFile + "'  with COMPRESSION ");
//        this.getSession().createSQLQuery(sql.toString()).executeUpdate();
//        System.out.println("数据库备份结束：" + DateUtils.date2string("yyyy_MM_dd_HH_mm_ssSSS", new Date()));
//    }


    public static void backup(String batPath,String bat){
        //执行批处理文件
        String strcmd="cmd /c start "+ batPath + bat;
        Runtime rt = Runtime.getRuntime();
        Process ps = null;
        try {
            ps = rt.exec(strcmd);
        } catch (IOException e1) {
            e1.printStackTrace();
        }
        try {
            ps.waitFor();
        } catch (InterruptedException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        int i = ps.exitValue();
        if (i == 0) {
            System.out.println("备份完成.") ;
        } else {
            System.out.println("备份失败.") ;
        }
        ps.destroy();
        ps = null;

        //批处理执行完后，根据cmd.exe进程名称 kill掉cmd窗口(这个方法是好不容易才找到了，网上很多介绍的都无效)
        Process p = null;
        try {
            rt.exec("cmd.exe /C start wmic process where name='cmd.exe' call terminate");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
