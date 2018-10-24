package com.app.cq.model;

import javax.persistence.*;

/**
 * 保存sql语句
 * Created by zyk on 2018/1/30
 */
@Entity
public class SqlExecuteInfo {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    @Column(columnDefinition = "TEXT")
    private String sqlExecute;//sql执行语句
    @Column(columnDefinition = "TEXT")
    private String sqlTitle;//功能名称

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSqlExecute() {
        return sqlExecute;
    }

    public void setSqlExecute(String sqlExecute) {
        this.sqlExecute = sqlExecute;
    }

    public String getSqlTitle() {
        return sqlTitle;
    }

    public void setSqlTitle(String sqlTitle) {
        this.sqlTitle = sqlTitle;
    }
}
