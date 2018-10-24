package com.app.cq.service;

import com.app.cq.model.SqlExecuteInfo;
import com.app.cq.utils.MyMapResultTransformer;
import com.google.common.base.Strings;
import com.sqds.hibernate.HibernateDao;
import org.hibernate.Query;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * 数据库查询
 * Created by zyk on 2018/1/30.
 */
@Service
public class SqlExecuteInfoService extends HibernateDao<SqlExecuteInfo> {

    /**
     * 执行sql语句，并返回结果
     *
     * @param executeInfo
     * @return
     */
    public List<Map> executeXSQL(SqlExecuteInfo executeInfo) {
        String sqlExecute = executeInfo.getSqlExecute();
        if (Strings.isNullOrEmpty(sqlExecute)) {
            return null;
        }
        sqlExecute = sqlExecute.toLowerCase();
        if (sqlExecute.indexOf("delete") >= 0 || sqlExecute.indexOf("update") >= 0 || sqlExecute.indexOf("insert") >= 0) {
            return null;
        }
        StringBuffer sql = new StringBuffer(sqlExecute);
        Query query = this.getSession().createSQLQuery(sql.toString());
        query.setResultTransformer(MyMapResultTransformer.ALIAS_TO_ENTITY_MAP);
        List<Map> list = query.list();
        return list;
    }
}
