package com.app.cq.model;

import javax.persistence.*;

/**
 * 项目信息表
 * Created by jmdf on 2018/9/5.
 */
@Table(name = "project")
@Entity
public class Project {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;    // 主键	自动生成
    private String projectName;    // 项目名称
    private String memo;    //	备注

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }
}
