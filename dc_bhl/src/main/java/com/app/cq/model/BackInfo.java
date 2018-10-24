package com.app.cq.model;

import com.alibaba.fastjson.annotation.JSONField;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by lsh on 2018/9/18.
 * 退回信息表
 */
@Table(name = "BackInfo")
@Entity
public class BackInfo {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;//主键
    private String problem;//退回原因
    private Date backDate;//退回时间
    private Integer backType;//退回类型   数据字典(1、初审退回    2、终审退回) (没用)
    private String backPerson;           //操作人
    private String backIp;               //操作ip
    private String company;      //退回哪一公司的数据  入户/评估/测绘

    @JSONField(serialize = false)
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "familyId")
    private Family family;

    public String getBackPerson() {
        return backPerson;
    }

    public void setBackPerson(String backPerson) {
        this.backPerson = backPerson;
    }

    public String getBackIp() {
        return backIp;
    }

    public void setBackIp(String backIp) {
        this.backIp = backIp;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public Integer getBackType() {
        return backType;
    }

    public void setBackType(Integer backType) {
        this.backType = backType;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getProblem() {
        return problem;
    }

    public void setProblem(String problem) {
        this.problem = problem;
    }

    public Date getBackDate() {
        return backDate;
    }

    public void setBackDate(Date backDate) {
        this.backDate = backDate;
    }

    public Family getFamily() {
        return family;
    }

    public void setFamily(Family family) {
        this.family = family;
    }
}
