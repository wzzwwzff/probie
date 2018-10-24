package com.app.cq.model;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by lsh on 2018/5/7.
 * 非宅信息表
 */
@Entity
@Table(name="nonFamily")
public class NonFamily {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    private String bdCode;//分指编号
    private String groupCode;//组别编号
    private String familyCode;//档案编号
    private String unitMan;//单位联系人
    private String bgTel;//办公电话
    private String ydTel;//移动电话
    private String unit;//所属部门
    private String telPersonDuty;//联系人职务
    private String unitMail;//单位电子邮箱
    private String address;//房屋地址门牌
    private String unitName;//房屋产权单位名称（全称）
    private String unitAddress;//房屋产权单位办公地址门牌
    private String dailyUnit;//房屋日常管理单位
    private Integer dailyStatus;//有无专业管理单位1:有，2：无
    private Integer status;//现状1：出租经营2：加油站3：居住4：空置5：营业
    private String sjUseUnit;//房屋实际使用单位
    private Integer unitStatus;//房屋产权单位性质1：国有企业2：集体企业3：事业单位4：私营企业5：其它
    private Integer underRelation;//房屋产权单位隶属关系1:央属2：区属3：街道
    private String underCode;//房屋权属证书号
    private String landUseCode;//土地使用证号
    private Integer houseUse;//房屋用途1:住宅2：居住3：商业4：公厕5：公交
    private BigDecimal houseTotalArea;//房屋总建筑面积（M²）
    private BigDecimal zdTotalArea;//占地总面积（M²）
    private BigDecimal pfArea;//平房建筑面积（M²）
    private BigDecimal lsArea;//临时房屋面积（M²）
    private BigDecimal wzArea;//无证房屋建筑面积（M²）
    private Integer bussType;//房屋是否用于经营1:是2：否
    private Integer bussStatus;//营业状态1:是2：否
    private Integer houseFlag;//房屋有无转租1:有2：无
    private Integer xyFlag;//有无转租协议1:有2：无
    private String bussRange;//经营范围（业务）
    private String bussCode;//营业执照号
    private Integer djType;//注册登记类型数据字典
    private String unitPerson;//产权单位法定代表人（单位负责人）
    private Integer unitType;//产权单位行业类别数据字典
    private Integer unitOnStatus;//产权单位是否有上级法人单位1:有2：无
    private BigDecimal jyNum;//经营间数
    private BigDecimal jzNum;//居住间数
    private BigDecimal ccNum;//仓储间数
    private BigDecimal otherNum;//其他间数
    private BigDecimal totalNum;//间数合计
    private BigDecimal ygBuildArea;//预估建筑面积（M²）
    @Column(columnDefinition = "TEXT")
    private String wejMemo;//未登记房屋备注
    @Column(columnDefinition = "TEXT")
    private String memo;//备注

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getBdCode() {
        return bdCode;
    }

    public void setBdCode(String bdCode) {
        this.bdCode = bdCode;
    }

    public String getGroupCode() {
        return groupCode;
    }

    public void setGroupCode(String groupCode) {
        this.groupCode = groupCode;
    }

    public String getFamilyCode() {
        return familyCode;
    }

    public void setFamilyCode(String familyCode) {
        this.familyCode = familyCode;
    }

    public String getUnitMan() {
        return unitMan;
    }

    public void setUnitMan(String unitMan) {
        this.unitMan = unitMan;
    }

    public String getBgTel() {
        return bgTel;
    }

    public void setBgTel(String bgTel) {
        this.bgTel = bgTel;
    }

    public String getYdTel() {
        return ydTel;
    }

    public void setYdTel(String ydTel) {
        this.ydTel = ydTel;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getTelPersonDuty() {
        return telPersonDuty;
    }

    public void setTelPersonDuty(String telPersonDuty) {
        this.telPersonDuty = telPersonDuty;
    }

    public String getUnitMail() {
        return unitMail;
    }

    public void setUnitMail(String unitMail) {
        this.unitMail = unitMail;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getUnitName() {
        return unitName;
    }

    public void setUnitName(String unitName) {
        this.unitName = unitName;
    }

    public String getUnitAddress() {
        return unitAddress;
    }

    public void setUnitAddress(String unitAddress) {
        this.unitAddress = unitAddress;
    }

    public String getDailyUnit() {
        return dailyUnit;
    }

    public void setDailyUnit(String dailyUnit) {
        this.dailyUnit = dailyUnit;
    }

    public Integer getDailyStatus() {
        return dailyStatus;
    }

    public void setDailyStatus(Integer dailyStatus) {
        this.dailyStatus = dailyStatus;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getSjUseUnit() {
        return sjUseUnit;
    }

    public void setSjUseUnit(String sjUseUnit) {
        this.sjUseUnit = sjUseUnit;
    }

    public Integer getUnitStatus() {
        return unitStatus;
    }

    public void setUnitStatus(Integer unitStatus) {
        this.unitStatus = unitStatus;
    }

    public Integer getUnderRelation() {
        return underRelation;
    }

    public void setUnderRelation(Integer underRelation) {
        this.underRelation = underRelation;
    }

    public String getUnderCode() {
        return underCode;
    }

    public void setUnderCode(String underCode) {
        this.underCode = underCode;
    }

    public String getLandUseCode() {
        return landUseCode;
    }

    public void setLandUseCode(String landUseCode) {
        this.landUseCode = landUseCode;
    }

    public Integer getHouseUse() {
        return houseUse;
    }

    public void setHouseUse(Integer houseUse) {
        this.houseUse = houseUse;
    }

    public BigDecimal getHouseTotalArea() {
        return houseTotalArea;
    }

    public void setHouseTotalArea(BigDecimal houseTotalArea) {
        this.houseTotalArea = houseTotalArea;
    }

    public BigDecimal getZdTotalArea() {
        return zdTotalArea;
    }

    public void setZdTotalArea(BigDecimal zdTotalArea) {
        this.zdTotalArea = zdTotalArea;
    }

    public BigDecimal getPfArea() {
        return pfArea;
    }

    public void setPfArea(BigDecimal pfArea) {
        this.pfArea = pfArea;
    }

    public BigDecimal getLsArea() {
        return lsArea;
    }

    public void setLsArea(BigDecimal lsArea) {
        this.lsArea = lsArea;
    }

    public BigDecimal getWzArea() {
        return wzArea;
    }

    public void setWzArea(BigDecimal wzArea) {
        this.wzArea = wzArea;
    }

    public Integer getBussType() {
        return bussType;
    }

    public void setBussType(Integer bussType) {
        this.bussType = bussType;
    }

    public Integer getBussStatus() {
        return bussStatus;
    }

    public void setBussStatus(Integer bussStatus) {
        this.bussStatus = bussStatus;
    }

    public Integer getHouseFlag() {
        return houseFlag;
    }

    public void setHouseFlag(Integer houseFlag) {
        this.houseFlag = houseFlag;
    }

    public Integer getXyFlag() {
        return xyFlag;
    }

    public void setXyFlag(Integer xyFlag) {
        this.xyFlag = xyFlag;
    }

    public String getBussRange() {
        return bussRange;
    }

    public void setBussRange(String bussRange) {
        this.bussRange = bussRange;
    }

    public String getBussCode() {
        return bussCode;
    }

    public void setBussCode(String bussCode) {
        this.bussCode = bussCode;
    }

    public Integer getDjType() {
        return djType;
    }

    public void setDjType(Integer djType) {
        this.djType = djType;
    }

    public String getUnitPerson() {
        return unitPerson;
    }

    public void setUnitPerson(String unitPerson) {
        this.unitPerson = unitPerson;
    }

    public Integer getUnitType() {
        return unitType;
    }

    public void setUnitType(Integer unitType) {
        this.unitType = unitType;
    }

    public Integer getUnitOnStatus() {
        return unitOnStatus;
    }

    public void setUnitOnStatus(Integer unitOnStatus) {
        this.unitOnStatus = unitOnStatus;
    }

    public BigDecimal getJyNum() {
        return jyNum;
    }

    public void setJyNum(BigDecimal jyNum) {
        this.jyNum = jyNum;
    }

    public BigDecimal getJzNum() {
        return jzNum;
    }

    public void setJzNum(BigDecimal jzNum) {
        this.jzNum = jzNum;
    }

    public BigDecimal getCcNum() {
        return ccNum;
    }

    public void setCcNum(BigDecimal ccNum) {
        this.ccNum = ccNum;
    }

    public BigDecimal getOtherNum() {
        return otherNum;
    }

    public void setOtherNum(BigDecimal otherNum) {
        this.otherNum = otherNum;
    }

    public BigDecimal getTotalNum() {
        return totalNum;
    }

    public void setTotalNum(BigDecimal totalNum) {
        this.totalNum = totalNum;
    }

    public BigDecimal getYgBuildArea() {
        return ygBuildArea;
    }

    public void setYgBuildArea(BigDecimal ygBuildArea) {
        this.ygBuildArea = ygBuildArea;
    }

    public String getWejMemo() {
        return wejMemo;
    }

    public void setWejMemo(String wejMemo) {
        this.wejMemo = wejMemo;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }
}
