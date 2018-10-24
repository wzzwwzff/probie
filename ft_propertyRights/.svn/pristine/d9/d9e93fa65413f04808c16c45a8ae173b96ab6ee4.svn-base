package com.app.cq.model;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.List;

/**
 * Created by jmdf on 2018/8/1.
 */
@Table(name = "project")
@Entity
public class Project {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    private String projectName;//项目名称
    private String enterprise;//企业名称
    private String unit;      //建设单位
    private String unitPerson;      //建设单位联系人
    private String unitPhone;      //建设单位联系电话
    private Integer progress;      //进展情况 数据字典(1.建设期2.运营期)
    private String address;      //项目位置
    private String east;      //项目东至
    private String west;      //项目西至
    private String south;      //项目南至
    private String north;      //项目北至
    private Integer number;      //套数
    private String price;    //销售均价
    private String scale;    //产权比例
    private String houseTypeArea;   //户型面积
    private String community;   //社区街道
    private String cPerson;   //社区街道联系人
    private String cPhone;   //社区街道负责人联系电话
    private String propertyCompany;   //物业公司名称
    private String pPerson;   //物业公司联系人
    private String pPhone;   //物业公司联系电话
    private BigDecimal rentPrice;   //出租单价


    @Column(columnDefinition = "TEXT")
    private String memo;//备注

    @OneToMany(mappedBy = "project")
    private List<House> houseList;    //安置房源

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getEnterprise() {
        return enterprise;
    }

    public void setEnterprise(String enterprise) {
        this.enterprise = enterprise;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public Integer getProgress() {
        return progress;
    }

    public void setProgress(Integer progress) {
        this.progress = progress;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEast() {
        return east;
    }

    public void setEast(String east) {
        this.east = east;
    }

    public String getWest() {
        return west;
    }

    public void setWest(String west) {
        this.west = west;
    }

    public String getSouth() {
        return south;
    }

    public void setSouth(String south) {
        this.south = south;
    }

    public String getNorth() {
        return north;
    }

    public void setNorth(String north) {
        this.north = north;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getScale() {
        return scale;
    }

    public void setScale(String scale) {
        this.scale = scale;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }

    public List<House> getHouseList() {
        return houseList;
    }

    public void setHouseList(List<House> houseList) {
        this.houseList = houseList;
    }

    public String getHouseTypeArea() { return houseTypeArea; }

    public void setHouseTypeArea(String houseTypeArea) { this.houseTypeArea = houseTypeArea; }

    public String getUnitPerson() {
        return unitPerson;
    }

    public void setUnitPerson(String unitPerson) {
        this.unitPerson = unitPerson;
    }

    public String getUnitPhone() {
        return unitPhone;
    }

    public void setUnitPhone(String unitPhone) {
        this.unitPhone = unitPhone;
    }

    public String getCommunity() {
        return community;
    }

    public void setCommunity(String community) {
        this.community = community;
    }

    public String getcPerson() {
        return cPerson;
    }

    public void setcPerson(String cPerson) {
        this.cPerson = cPerson;
    }

    public String getcPhone() {
        return cPhone;
    }

    public void setcPhone(String cPhone) {
        this.cPhone = cPhone;
    }

    public String getPropertyCompany() {
        return propertyCompany;
    }

    public void setPropertyCompany(String propertyCompany) {
        this.propertyCompany = propertyCompany;
    }

    public String getpPerson() {
        return pPerson;
    }

    public void setpPerson(String pPerson) {
        this.pPerson = pPerson;
    }

    public String getpPhone() {
        return pPhone;
    }

    public void setpPhone(String pPhone) {
        this.pPhone = pPhone;
    }

    public BigDecimal getRentPrice() {
        return rentPrice;
    }

    public void setRentPrice(BigDecimal rentPrice) {
        this.rentPrice = rentPrice;
    }
}
