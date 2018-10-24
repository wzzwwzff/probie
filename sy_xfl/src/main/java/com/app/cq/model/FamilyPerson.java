package com.app.cq.model;

import org.hibernate.annotations.Type;

import javax.persistence.*;
import java.util.Date;

/**
 * 家庭人员信息
 *
 * @author zsj
 * @date 2017/11/10
 */
@Entity
@Table(name = "familyPerson")
public class FamilyPerson {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;             // 主键
    private String personName;      // 姓名
    private Integer sex; ////性别  1: 男：女
    private String idCard;          // 身份证号
    private String relation;        // 与户主关系
    private String unit;            // 工作单位
    private String tel;             // 联系方式
    private Integer marrType; //婚姻状况
    private Integer age; //年龄
    private Integer oneType; //是否是独生子女  1否 2是
    private Integer pregnancyType; //是否怀孕  1否 2是
    private Date qrDate; //户口迁入时间
    private Integer status; //是否为安置人口    1:否 2：是（登记界面默认为是）
    private String address;   //现住址
    @Type(type = "text")
    private String memo;   //备注



    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "familyId")
    private Family family;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPersonName() {
        return personName;
    }

    public void setPersonName(String personName) {
        this.personName = personName;
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

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public Integer getMarrType() {
        return marrType;
    }

    public void setMarrType(Integer marrType) {
        this.marrType = marrType;
    }

    public Integer getOneType() {
        return oneType;
    }

    public void setOneType(Integer oneType) {
        this.oneType = oneType;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public Integer getPregnancyType() {
        return pregnancyType;
    }

    public void setPregnancyType(Integer pregnancyType) {
        this.pregnancyType = pregnancyType;
    }

    public Date getQrDate() {
        return qrDate;
    }

    public void setQrDate(Date qrDate) {
        this.qrDate = qrDate;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
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
