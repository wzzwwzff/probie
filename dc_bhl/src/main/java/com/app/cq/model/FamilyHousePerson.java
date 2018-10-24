package com.app.cq.model;

import javax.persistence.*;

/**
 * Created by lsh on 2018/5/7.
 * 标准自建房家庭成员表
 */
@Entity
@Table(name = "familyHousePerson")
public class FamilyHousePerson {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    private String name;//姓名
    private String idCard;//身份证号
    private String relation;//与房主关系

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "familyHouseId")
    private FamilyHouse familyHouse;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public FamilyHouse getFamilyHouse() {
        return familyHouse;
    }

    public void setFamilyHouse(FamilyHouse familyHouse) {
        this.familyHouse = familyHouse;
    }
}
