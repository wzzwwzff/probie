package com.app.cq.model;

import com.alibaba.fastjson.annotation.JSONField;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * Created by lsh on 2018/5/7.
 * 历史签约家庭信息表
 */
@Entity
@Table(name="historyFamily")
public class HistoryFamily {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    private String familyCode;//家庭编号一家一房一编号
    private String name;//被拆迁人姓名
    private String idCard;//被拆迁人身份证号
    private String tel;//联系电话
    private String mailAddress;//通信地址
    private String mailCode;//邮政编码
    private Integer hjNum;//正式户口
    private Integer azPersonNum;//安置人口
    private String relation;//被拆迁人与产权人/承租人关系
    private Integer bcStatus;//是否有补充协议1：是，2：否
    private String address;//地址门牌
    private Integer houseType;//房屋产别1：直管公房，2：单位自管，3：私房，4：文革产，5：独立自建
    private String houseCompany;//产权单位
    private Integer houseStyle;//房屋类型1：成套，2：简易楼，3：平房
    private BigDecimal useArea;//使用面积
    private BigDecimal buildArea;//建筑面积
    private BigDecimal houseNum;//房屋间数
    private Integer houseUse;//用途//1：出租经营，2：出租居住，3：自营，4：自住
    private String businessCode;//营业执照号
    private BigDecimal businessArea;//营业面积
    private Date signDate;//签约时间
    private BigDecimal buyHouseMoney;//购房款合计
    private BigDecimal gwMoney;//公共维修基金
    private BigDecimal dkMoney;//贷款人民币
    @Column(columnDefinition = "TEXT")
    private String memo;//备注

    @JSONField(serialize = false)
    @OneToMany(mappedBy = "historyFamily",fetch = FetchType.LAZY)
    private List<HistoryFamilyPerson> historyFamilyPersonList;

    @JSONField(serialize = false)
    @OneToMany(mappedBy = "historyFamily",fetch = FetchType.LAZY)
    private List<HistoryFamilyHouse> historyFamilyHouseList;

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

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getMailAddress() {
        return mailAddress;
    }

    public void setMailAddress(String mailAddress) {
        this.mailAddress = mailAddress;
    }

    public String getMailCode() {
        return mailCode;
    }

    public void setMailCode(String mailCode) {
        this.mailCode = mailCode;
    }

    public Integer getHjNum() {
        return hjNum;
    }

    public void setHjNum(Integer hjNum) {
        this.hjNum = hjNum;
    }

    public Integer getAzPersonNum() {
        return azPersonNum;
    }

    public void setAzPersonNum(Integer azPersonNum) {
        this.azPersonNum = azPersonNum;
    }

    public String getRelation() {
        return relation;
    }

    public void setRelation(String relation) {
        this.relation = relation;
    }

    public Integer getBcStatus() {
        return bcStatus;
    }

    public void setBcStatus(Integer bcStatus) {
        this.bcStatus = bcStatus;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Integer getHouseType() {
        return houseType;
    }

    public void setHouseType(Integer houseType) {
        this.houseType = houseType;
    }

    public String getHouseCompany() {
        return houseCompany;
    }

    public void setHouseCompany(String houseCompany) {
        this.houseCompany = houseCompany;
    }

    public Integer getHouseStyle() {
        return houseStyle;
    }

    public void setHouseStyle(Integer houseStyle) {
        this.houseStyle = houseStyle;
    }

    public BigDecimal getUseArea() {
        return useArea;
    }

    public void setUseArea(BigDecimal useArea) {
        this.useArea = useArea;
    }

    public BigDecimal getBuildArea() {
        return buildArea;
    }

    public void setBuildArea(BigDecimal buildArea) {
        this.buildArea = buildArea;
    }

    public BigDecimal getHouseNum() {
        return houseNum;
    }

    public void setHouseNum(BigDecimal houseNum) {
        this.houseNum = houseNum;
    }

    public Integer getHouseUse() {
        return houseUse;
    }

    public void setHouseUse(Integer houseUse) {
        this.houseUse = houseUse;
    }

    public String getBusinessCode() {
        return businessCode;
    }

    public void setBusinessCode(String businessCode) {
        this.businessCode = businessCode;
    }

    public BigDecimal getBusinessArea() {
        return businessArea;
    }

    public void setBusinessArea(BigDecimal businessArea) {
        this.businessArea = businessArea;
    }

    public Date getSignDate() {
        return signDate;
    }

    public void setSignDate(Date signDate) {
        this.signDate = signDate;
    }

    public BigDecimal getBuyHouseMoney() {
        return buyHouseMoney;
    }

    public void setBuyHouseMoney(BigDecimal buyHouseMoney) {
        this.buyHouseMoney = buyHouseMoney;
    }

    public BigDecimal getGwMoney() {
        return gwMoney;
    }

    public void setGwMoney(BigDecimal gwMoney) {
        this.gwMoney = gwMoney;
    }

    public BigDecimal getDkMoney() {
        return dkMoney;
    }

    public void setDkMoney(BigDecimal dkMoney) {
        this.dkMoney = dkMoney;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }

    public List<HistoryFamilyPerson> getHistoryFamilyPersonList() {
        return historyFamilyPersonList;
    }

    public void setHistoryFamilyPersonList(List<HistoryFamilyPerson> historyFamilyPersonList) {
        this.historyFamilyPersonList = historyFamilyPersonList;
    }

    public List<HistoryFamilyHouse> getHistoryFamilyHouseList() {
        return historyFamilyHouseList;
    }

    public void setHistoryFamilyHouseList(List<HistoryFamilyHouse> historyFamilyHouseList) {
        this.historyFamilyHouseList = historyFamilyHouseList;
    }
}
