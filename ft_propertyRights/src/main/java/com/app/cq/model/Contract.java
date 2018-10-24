package com.app.cq.model;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by jmdf on 2018/8/1.
 */
@Table(name = "contract")
@Entity
public class Contract {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;           //主键
    private String familyCode;      //申请编号
    private String contractCode;      //合同编号
    private String name;            //产权人姓名
    private String idCard;           //产权人身份证号
    private Date signDate;              //合同签订日期
    private String person;           //经办人
    private String propertyRight;         //产权比例
    private BigDecimal price;               //销售价格
    @Column(columnDefinition = "INT default 1", nullable = false, insertable = false)
    private Integer status;         //数据状态 1未锁定 2已上报 3已锁定 4退回
    private String operatePerson;           //锁定人员
    private Date operateDate;               //锁定日期
    @Column(columnDefinition = "TEXT")
    private String operateMemo;             //操作备注
    @Column(columnDefinition = "TEXT")
    private String memo;                    //备注
    private String reason;                  //退回原因

    @ManyToOne
    @JoinColumn(name = "projectId")
    private Project project;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "familyId")
    private Family family;

    public Project getProject() {
        return project;
    }

    public void setProject(Project project) {
        this.project = project;
    }

    @OneToOne
    @JoinColumn(name = "houseId")
    private House house;    //安置房源

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

    public String getContractCode() {
        return contractCode;
    }

    public void setContractCode(String contractCode) {
        this.contractCode = contractCode;
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

    public Date getSignDate() {
        return signDate;
    }

    public void setSignDate(Date signDate) {
        this.signDate = signDate;
    }

    public String getPerson() {
        return person;
    }

    public void setPerson(String person) {
        this.person = person;
    }

    public String getPropertyRight() {
        return propertyRight;
    }

    public void setPropertyRight(String propertyRight) {
        this.propertyRight = propertyRight;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
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

    public String getOperateMemo() {
        return operateMemo;
    }

    public void setOperateMemo(String operateMemo) {
        this.operateMemo = operateMemo;
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

    public House getHouse() {
        return house;
    }

    public void setHouse(House house) {
        this.house = house;
    }

    public String getReason() { return reason; }

    public void setReason(String reason) { this.reason = reason; }
}
