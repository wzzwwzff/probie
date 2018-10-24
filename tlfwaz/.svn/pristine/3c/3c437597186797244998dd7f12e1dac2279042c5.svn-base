package com.app.cq.model;

import org.hibernate.annotations.Type;

import javax.persistence.*;
import java.util.Date;

/**
 * 历史记录表
 * Created by jmdf on 2018/9/5.
 */
@Table(name = "historyInfo")
@Entity
public class HistoryInfo {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;      //主键
    private Integer familyId;//家庭id

    @Type(type = "text")
    private String data;//家庭信息
    @Type(type = "text")
    private String familyPersonData;//家庭成员信息
    @Type(type = "text")
    private String houseData;//所选房源信息

    private Integer orderFlag;//记录条数
    private String operatePerson;//操作人
    private String computerId;//操作电脑
    private Date operateDate;//操作时间
    private Integer dataPhase;//数据阶段（1、选房 2、变更购房人 3、结算 4、入住）

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getFamilyId() {
        return familyId;
    }

    public void setFamilyId(Integer familyId) {
        this.familyId = familyId;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public String getFamilyPersonData() {
        return familyPersonData;
    }

    public void setFamilyPersonData(String familyPersonData) {
        this.familyPersonData = familyPersonData;
    }

    public String getHouseData() {
        return houseData;
    }

    public void setHouseData(String houseData) {
        this.houseData = houseData;
    }

    public Integer getOrderFlag() {
        return orderFlag;
    }

    public void setOrderFlag(Integer orderFlag) {
        this.orderFlag = orderFlag;
    }

    public String getOperatePerson() {
        return operatePerson;
    }

    public void setOperatePerson(String operatePerson) {
        this.operatePerson = operatePerson;
    }

    public String getComputerId() {
        return computerId;
    }

    public void setComputerId(String computerId) {
        this.computerId = computerId;
    }

    public Date getOperateDate() {
        return operateDate;
    }

    public void setOperateDate(Date operateDate) {
        this.operateDate = operateDate;
    }

    public Integer getDataPhase() {
        return dataPhase;
    }

    public void setDataPhase(Integer dataPhase) {
        this.dataPhase = dataPhase;
    }
}
