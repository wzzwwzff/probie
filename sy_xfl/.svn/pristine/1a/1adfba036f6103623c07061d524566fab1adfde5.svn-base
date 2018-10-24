package com.app.cq.model;

import org.hibernate.annotations.Type;

import javax.persistence.*;
import java.util.Date;

/**
 * 审计数据退回记录表
 * Created by jmdf on 2017/11/2.
 */
@Entity
@Table(name = "backInfo")
public class BackInfo {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    private String grouping;           //组
    private String familyNum;           //编号
    private String name;                //被搬迁人
    private String address;             //房屋坐落
    private Date backDate;               //退回时间
    private String backPerson;           //操作人
    private String backIp;               //操作ip
    private String reason;               //退回原因
    private String type;            //退回类型  管理公司初审/审计预审
    private String company;      //退回哪一公司的数据  入户/评估/测绘
    @Type(type = "text")
    private String data;                //退回的家庭数据，Json 格式

    @Type(type = "text")
    private String personData;                //退回的家庭成员数据，Json 格式

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "familyId")
    private Family family;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Family getFamily() {
        return family;
    }

    public void setFamily(Family family) {
        this.family = family;
    }

    public String getGrouping() {
        return grouping;
    }

    public void setGrouping(String grouping) {
        this.grouping = grouping;
    }

    public String getFamilyNum() {
        return familyNum;
    }

    public void setFamilyNum(String familyNum) {
        this.familyNum = familyNum;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getBackDate() {
        return backDate;
    }

    public void setBackDate(Date backDate) {
        this.backDate = backDate;
    }

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

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getPersonData() {
        return personData;
    }

    public void setPersonData(String personData) {
        this.personData = personData;
    }
}
