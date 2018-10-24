package com.app.cq.model;

import javax.persistence.*;
import java.util.Date;

/**
 * 非宅家庭
 * @author
 * @date 2018/08/27
 */
@Table(name = "notFamily")
@Entity
public class NotFamily {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;             //主键
    private String familyCode;      //编号
    private String groupCode;       //组别编号
    private String address;    //坐落
    private String name;            //被拆迁人
    private Date qyDate;                //签约时间
    private Date addDate;             // 登记时间(入户时间)
    private String dkAddress;       //地块位置
    private String operatePerson;     //操作人
    @Column(columnDefinition = "INT default 1", nullable = false, insertable = false)
    private Integer qyState;            // 签约状态 1未签约 2 已签约
    @Column(columnDefinition = "INT default 1", nullable = false, insertable = false)
    private Integer delState; //1：初始未删除，2：已删除
    @Column(columnDefinition = "INT default 2", nullable = false, insertable = false)
    private Integer isLive;    // 显示状态 1：隐藏 2.显示

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFamilyCode() {
        return familyCode;
    }

    public void setFamilyCode(String familyCode) {
        this.familyCode = familyCode;
    }

    public String getGroupCode() {
        return groupCode;
    }

    public void setGroupCode(String groupCode) {
        this.groupCode = groupCode;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getQyState() {
        return qyState;
    }

    public void setQyState(Integer qyState) {
        this.qyState = qyState;
    }

    public Date getQyDate() {
        return qyDate;
    }

    public void setQyDate(Date qyDate) {
        this.qyDate = qyDate;
    }

    public Date getAddDate() {
        return addDate;
    }

    public void setAddDate(Date addDate) {
        this.addDate = addDate;
    }

    public String getOperatePerson() {
        return operatePerson;
    }

    public void setOperatePerson(String operatePerson) {
        this.operatePerson = operatePerson;
    }

    public Integer getDelState() {
        return delState;
    }

    public void setDelState(Integer delState) {
        this.delState = delState;
    }

    public Integer getIsLive() {
        return isLive;
    }

    public void setIsLive(Integer isLive) {
        this.isLive = isLive;
    }

    public String getDkAddress() {
        return dkAddress;
    }

    public void setDkAddress(String dkAddress) {
        this.dkAddress = dkAddress;
    }
}
