package com.app.cq.model;

import javax.persistence.*;

/**
 * 家庭成员表
 * Created by jmdf on 2018/9/5.
 */
@Table(name = "familyPerson")
@Entity
public class FamilyPerson {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;             // 主键
    private String pName;           // 姓名
    private Integer pSex;            // 性别  1男 2女
    private String pIdCard;          // 身份证号
    private String pPhone;          // 联系电话
    private String pRelation;        // 与关系
    private String pAddress;         // 户口所在地
    private Integer isRegistered;            // 在册/非在册  1在册2非在册
    @Column(columnDefinition = "TEXT")
    private String pMemo;         // 备注
    @Column(columnDefinition = "INT default 1", nullable = false, insertable = true)
    private Integer addressType;    //户籍类型  1、农业   2、城镇
    private String age;   //年龄
    private String liveStatus;   //生活状态

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "familyId")
    private Family family;


    public Integer getAddressType() {
        return addressType;
    }

    public void setAddressType(Integer addressType) {
        this.addressType = addressType;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getLiveStatus() {
        return liveStatus;
    }

    public void setLiveStatus(String liveStatus) {
        this.liveStatus = liveStatus;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public Integer getpSex() {
        return pSex;
    }

    public void setpSex(Integer pSex) {
        this.pSex = pSex;
    }

    public String getpIdCard() {
        return pIdCard;
    }

    public void setpIdCard(String pIdCard) {
        this.pIdCard = pIdCard;
    }

    public String getpPhone() {
        return pPhone;
    }

    public void setpPhone(String pPhone) {
        this.pPhone = pPhone;
    }

    public String getpRelation() {
        return pRelation;
    }

    public void setpRelation(String pRelation) {
        this.pRelation = pRelation;
    }

    public String getpAddress() {
        return pAddress;
    }

    public void setpAddress(String pAddress) {
        this.pAddress = pAddress;
    }

    public Integer getIsRegistered() {
        return isRegistered;
    }

    public void setIsRegistered(Integer isRegistered) {
        this.isRegistered = isRegistered;
    }

    public String getpMemo() {
        return pMemo;
    }

    public void setpMemo(String pMemo) {
        this.pMemo = pMemo;
    }

    public Family getFamily() {
        return family;
    }

    public void setFamily(Family family) {
        this.family = family;
    }
}
