package com.app.cq.model;

import javax.persistence.*;
import java.util.Date;

/**
 * 动作历史记录
 * Created by jmdf on 2018/8/9.
 */
@Table(name = "actionInfo")
@Entity
public class ActionInfo {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    private String operateType; //操作类型

    private String operateIp;//操作电脑Id
    private String operatePerson;//操作用户名
    private Date operateDate;//操作时间

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "familyId")
    private Family family;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOperateType() {
        return operateType;
    }

    public void setOperateType(String operateType) {
        this.operateType = operateType;
    }

    public String getOperateIp() {
        return operateIp;
    }

    public void setOperateIp(String operateIp) {
        this.operateIp = operateIp;
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

    public Family getFamily() {
        return family;
    }

    public void setFamily(Family family) {
        this.family = family;
    }
}
