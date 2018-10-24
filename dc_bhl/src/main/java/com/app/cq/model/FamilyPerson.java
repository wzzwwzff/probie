package com.app.cq.model;

import com.alibaba.fastjson.annotation.JSONField;

import javax.persistence.*;
import javax.persistence.criteria.Fetch;

/**
 * Created by lsh on 2018/5/7.
 * 征收家庭成员表
 */
@Entity
@Table(name="familyPerson")
public class FamilyPerson {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;//家庭id
    private Integer hkNum;//户口本数（用于区分是哪个户口本家庭）
    private String name;//姓名
    private Integer age;//年龄
    private String idCard;//身份证号
    private String relation;//（在本址：与户主关系；不在本址：与被拆迁人关系）
    private String hzRelation;//户主与被拆迁人关系
    private String hjAddress;//户口所在地
    private String unit;//工作单位
    private Integer flag;//是否长期住在未登记房屋内 1：是，2：否（录入界面默认为是）
    private Integer status;//是否享受过保障性住房政策 1：是，2：否（录入界面默认为否）
    private Integer aveStatus;//是否享受人均5平米 1：是，2：否（录入界面默认为是）
    private Integer type;//是否在本址1:是，2：否
    @Column(columnDefinition = "TEXT")
    private String memo;//备注

    @JSONField(serialize = false)
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "familyId")
    private Family family;

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getHkNum() {
        return hkNum;
    }

    public void setHkNum(Integer hkNum) {
        this.hkNum = hkNum;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public String getRelation() {
        return relation;
    }

    public void setRelation(String relation) {
        this.relation = relation;
    }

    public String getHzRelation() {
        return hzRelation;
    }

    public void setHzRelation(String hzRelation) {
        this.hzRelation = hzRelation;
    }

    public String getHjAddress() {
        return hjAddress;
    }

    public void setHjAddress(String hjAddress) {
        this.hjAddress = hjAddress;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public Integer getFlag() {
        return flag;
    }

    public void setFlag(Integer flag) {
        this.flag = flag;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getAveStatus() {
        return aveStatus;
    }

    public void setAveStatus(Integer aveStatus) {
        this.aveStatus = aveStatus;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }

    public Family getFamily() {
        return family;
    }

    public void setFamily(Family family) {
        this.family = family;
    }
}