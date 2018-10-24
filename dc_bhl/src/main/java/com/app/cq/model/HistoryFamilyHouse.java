package com.app.cq.model;

import com.alibaba.fastjson.annotation.JSONField;

import javax.persistence.*;
import java.math.BigDecimal;

/**
 * 历史签约安置房源表
 * Created by ZYK on 2018/5/23.
 */
@Table(name = "historyFamilyHouse")
@Entity
public class HistoryFamilyHouse {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;             //主键
    private String projectName;    //项目名称
    private String buildNum;    //楼号
    private String unitNum;        //单元号
    private String houseNum;    //房间号
    private String houseHold;  //户型
    private String houseType;  //居室  数据字典（11：一居，21：二居，31：三居）
    private BigDecimal buildArea;   //房屋建筑面积

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "historyFamilyId")
    private HistoryFamily historyFamily;

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

    public String getBuildNum() {
        return buildNum;
    }

    public void setBuildNum(String buildNum) {
        this.buildNum = buildNum;
    }

    public String getUnitNum() {
        return unitNum;
    }

    public void setUnitNum(String unitNum) {
        this.unitNum = unitNum;
    }

    public String getHouseNum() {
        return houseNum;
    }

    public void setHouseNum(String houseNum) {
        this.houseNum = houseNum;
    }

    public String getHouseHold() {
        return houseHold;
    }

    public void setHouseHold(String houseHold) {
        this.houseHold = houseHold;
    }

    public String getHouseType() {
        return houseType;
    }

    public void setHouseType(String houseType) {
        this.houseType = houseType;
    }

    public BigDecimal getBuildArea() {
        return buildArea;
    }

    public void setBuildArea(BigDecimal buildArea) {
        this.buildArea = buildArea;
    }

    public HistoryFamily getHistoryFamily() {
        return historyFamily;
    }

    public void setHistoryFamily(HistoryFamily historyFamily) {
        this.historyFamily = historyFamily;
    }
}
