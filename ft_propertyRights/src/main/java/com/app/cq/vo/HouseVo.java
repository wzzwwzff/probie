package com.app.cq.vo;

import javax.persistence.Transient;
import java.text.DecimalFormat;

/**
 * 房屋 vo
 */
public class HouseVo {
    private Integer id;
    private String projectName;     //项目名称
    private String buildNum;        //楼号
    private String unit;            //单元号
    private String floor;        //楼层
    private String houseNum;        //房间号
    private String showHouseNum;        //房间号
    private String houseType;      //居室  数据字典（1：一居，2：二居，3：三居）
    private String area;        //面积

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

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getHouseNum() {
        return houseNum;
    }

    public void setHouseNum(String houseNum) {
        this.houseNum = houseNum;
    }

    public String getHouseType() {
        return houseType;
    }

    public void setHouseType(String houseType) {
        this.houseType = houseType;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getShowHouseNum() {
        return showHouseNum;
    }

    public void setShowHouseNum(String showHouseNum) {
        this.showHouseNum = showHouseNum;
    }

    @Transient
    public String getFormatFloor() {
        if (houseNum != null) {
            return Integer.parseInt(houseNum.substring(0,2))+"";
        }
        return null;
    }
}
