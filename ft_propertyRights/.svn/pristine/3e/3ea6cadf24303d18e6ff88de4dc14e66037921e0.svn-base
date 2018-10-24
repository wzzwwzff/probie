package com.app.cq.model;

import javax.persistence.*;
import java.util.Date;

/**
 * 投诉申诉反馈
 * Created by jmdf on 2018/8/1.
 */
@Table(name = "complaintFeedBack")
@Entity
public class ComplaintFeedback {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;           //主键
    private Integer dataType;         //数据类型 1.申诉2.投诉
    private String name;            //申诉/投诉人
    @Column(columnDefinition = "TEXT")
    private String matter;           //申诉/投诉事项
    private Date date;              //申诉/投诉日期
    private String phone;          //联系电话
    private String job;          //职业
    private String workUnit;          //工作单位
    private String address;          //现居住地址
    @Column(columnDefinition = "INT default 1", nullable = false, insertable = false)
    private Integer status;         //处理状态 1未处理 2已处理
    private String person;           //经办人
    private Date runDate ;               //经办日期
    @Column(columnDefinition = "TEXT")
    private String opinion;             //处理意见

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getDataType() {
        return dataType;
    }

    public void setDataType(Integer dataType) {
        this.dataType = dataType;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMatter() {
        return matter;
    }

    public void setMatter(String matter) {
        this.matter = matter;
    }

    public Date getDate() {
        return date;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public String getWorkUnit() {
        return workUnit;
    }

    public void setWorkUnit(String workUnit) {
        this.workUnit = workUnit;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getPerson() {
        return person;
    }

    public void setPerson(String person) {
        this.person = person;
    }

    public Date getRunDate() {
        return runDate;
    }

    public void setRunDate(Date runDate) {
        this.runDate = runDate;
    }

    public String getOpinion() {
        return opinion;
    }

    public void setOpinion(String opinion) {
        this.opinion = opinion;
    }
}
