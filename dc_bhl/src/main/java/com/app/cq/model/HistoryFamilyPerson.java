package com.app.cq.model;

import javax.persistence.*;

/**
 * Created by lsh on 2018/5/7.
 * 历史签约家庭成员信息表
 */
@Entity
@Table(name="historyFamilyPerson")
public class HistoryFamilyPerson {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    private Integer type;//类别1:被拆迁人，2：被安置人
    private String name;//姓名
    private String idCard;//身份证号

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "historyFamilyId")
    private HistoryFamily historyFamily;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
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

    public HistoryFamily getHistoryFamily() {
        return historyFamily;
    }

    public void setHistoryFamily(HistoryFamily historyFamily) {
        this.historyFamily = historyFamily;
    }
}
