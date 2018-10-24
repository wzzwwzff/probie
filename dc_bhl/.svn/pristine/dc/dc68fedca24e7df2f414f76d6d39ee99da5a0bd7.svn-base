package com.app.cq.model;

import org.hibernate.annotations.Type;

import javax.persistence.*;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 历史数据记录表
 */
@Entity
@Table(name = "historyInfo")
public class HistoryInfo {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    @Column(columnDefinition = "TEXT")
    private String data;//家庭信息
    @Column(columnDefinition = "TEXT")
    private String familyPersonData;//家庭成员信息
    private Integer familyId;//家庭id
    private String type;//操作类型1、新增2、修改3、删除
    private String computerId;//操作电脑
    private String operatePerson;//操作人
    private Date operateDate;//操作时间
    private Integer orderFlag;//条数

    public Integer getOrderFlag() {
        return orderFlag;
    }

    public void setOrderFlag(Integer orderFlag) {
        this.orderFlag = orderFlag;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public Integer getFamilyId() {
        return familyId;
    }

    public void setFamilyId(Integer familyId) {
        this.familyId = familyId;
    }

    public String getComputerId() {
        return computerId;
    }

    public void setComputerId(String computerId) {
        this.computerId = computerId;
    }

    public String getFamilyPersonData() {
        return familyPersonData;
    }

    public void setFamilyPersonData(String familyPersonData) {
        this.familyPersonData = familyPersonData;
    }

    public String getOperatePerson() {
        return operatePerson;
    }

    public void setOperatePerson(String operatePerson) {
        this.operatePerson = operatePerson;
    }

    public Date getOperateDate() {
        return operateDate;
    }

    public void setOperateDate(Date operateDate) {
        this.operateDate = operateDate;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
