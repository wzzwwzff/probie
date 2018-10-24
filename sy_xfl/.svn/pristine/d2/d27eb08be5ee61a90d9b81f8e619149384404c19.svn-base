package com.app.cq.model;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

/**
 * 桌面文件目录
 * Created by ZYK on 2018/2/28.
 */
@Table(name = "deskCatalog")
@Entity
public class DeskCatalog {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;             //主键
    private Integer number; //排序
    private Date createDate; //创建目录时间
    private String name; //创建目录名字
    @Column(columnDefinition = "INT default 1", nullable = false, insertable = false)
    private Integer able; //目录是否有效   1：有效，2：无效

    @OneToMany(mappedBy = "deskCatalog")
    private List<DeskFile> deskFileList;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getAble() {
        return able;
    }

    public void setAble(Integer able) {
        this.able = able;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<DeskFile> getDeskFileList() {
        return deskFileList;
    }

    public void setDeskFileList(List<DeskFile> deskFileList) {
        this.deskFileList = deskFileList;
    }
}
