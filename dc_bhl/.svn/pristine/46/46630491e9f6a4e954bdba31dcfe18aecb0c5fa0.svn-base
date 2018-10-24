package com.app.cq.model;

import com.alibaba.fastjson.annotation.JSONField;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.List;

/**
 * Created by lsh on 2018/5/7.
 * 标准自建房表
 */
@Entity
@Table(name = "familyHouse")
public class FamilyHouse {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    private BigDecimal houseNum;//间数
    private BigDecimal houseArea;//面积
    private String name;//房主姓名
    private String idCard;//房主身份证号

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "familyId")
    private Family family;

    //标准自建房家庭成员
    @JSONField(serialize = false)
    @OneToMany(mappedBy = "familyHouse",fetch = FetchType.LAZY)
    private List<FamilyHousePerson> familyHousePersonList;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public BigDecimal getHouseNum() {
        return houseNum;
    }

    public void setHouseNum(BigDecimal houseNum) {
        this.houseNum = houseNum;
    }

    public BigDecimal getHouseArea() {
        return houseArea;
    }

    public void setHouseArea(BigDecimal houseArea) {
        this.houseArea = houseArea;
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

    public Family getFamily() {
        return family;
    }

    public void setFamily(Family family) {
        this.family = family;
    }

    public List<FamilyHousePerson> getFamilyHousePersonList() {
        return familyHousePersonList;
    }

    public void setFamilyHousePersonList(List<FamilyHousePerson> familyHousePersonList) {
        this.familyHousePersonList = familyHousePersonList;
    }
}
