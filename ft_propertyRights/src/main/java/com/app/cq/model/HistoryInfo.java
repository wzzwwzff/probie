package com.app.cq.model;

import org.hibernate.annotations.Type;

import javax.persistence.*;
import java.util.Date;

/**
 * 操作历史记录
 * Created by jmdf on 2018/8/9.
 */
@Entity
@Table(name = "historyInfo")
public class HistoryInfo {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    private Integer familyId;
    @Type(type = "text")
    private String data;//家庭信息
    @Type(type = "text")
    private String familyPersonData;//家庭成员信息
    @Type(type = "text")
    private String contractData;//合同数据

    private Integer orderFlag;//记录条数
    private String operatePerson;//操作人
    private String operateIp;//操作电脑
    private Date operateDate;//操作时间
    private Integer dataPhase;//数据阶段（1.家庭数据2.合同数据 ）

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

    public String getContractData() {
        return contractData;
    }

    public void setContractData(String contractData) {
        this.contractData = contractData;
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

    public String getOperateIp() {
        return operateIp;
    }

    public void setOperateIp(String operateIp) {
        this.operateIp = operateIp;
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
