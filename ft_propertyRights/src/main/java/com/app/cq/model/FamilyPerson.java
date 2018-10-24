package com.app.cq.model;

import javax.persistence.*;

/**
 * Created by jmdf on 2018/8/1.
 */
@Table(name = "familyPerson")
@Entity
public class FamilyPerson {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;             //主键
    private String name;          //姓名
    private Integer cardType;     //证件类型（1.身份证2.军（警）身份证）
    private String idCard;        //证件号码
    private String relationShip;  //关系
    private String address;         //户籍所在地
    @Column(columnDefinition = "TEXT")
    private String memo;            //备注

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "familyId")
    private Family family;

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

    public Integer getCardType() {
        return cardType;
    }

    public void setCardType(Integer cardType) {
        this.cardType = cardType;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public String getRelationShip() {
        return relationShip;
    }

    public void setRelationShip(String relationShip) {
        this.relationShip = relationShip;
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
