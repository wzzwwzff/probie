package com.app.cq.model;

import org.hibernate.annotations.Type;

import javax.persistence.*;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 历史记录  by zsj  2017.12.04
 */
@Entity
@Table
public class HistoryInfo {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    @Type(type = "text")
    private String data;//数据内容
    @Type(type = "text")
    private String personData;//家庭成员
    private Integer familyId;//家庭id
    private String operateType; //操作类型：入户、测绘、评估、方案、其他

    private String computerId;//操作电脑Id
    private String person;//操作用户名
    private Date doDate;//操作时间


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

    public String getPerson() {
        return person;
    }

    public void setPerson(String person) {
        this.person = person;
    }

    public Date getDoDate() {
        return doDate;
    }

    public void setDoDate(Date doDate) {
        this.doDate = doDate;
    }

    public String getPersonData() {
        return personData;
    }

    public void setPersonData(String personData) {
        this.personData = personData;
    }

    public String getOperateType() {
        return operateType;
    }

    public void setOperateType(String operateType) {
        this.operateType = operateType;
    }

    @Transient
    public String getFormatDoDate() {
        SimpleDateFormat sf = new SimpleDateFormat("yyyy年MM月dd日 HH时mm分ss秒");
        if (doDate != null) {
            String time = sf.format(doDate);
            return time;
        }
        return "";
    }
}
