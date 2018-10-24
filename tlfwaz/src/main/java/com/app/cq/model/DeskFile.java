package com.app.cq.model;

import javax.persistence.*;
import java.util.Date;

/**
 * 桌面文件
 * Created by ZYK on 2018/2/28.
 */
@Table(name = "deskFile")
@Entity
public class DeskFile {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;             //主键
    private String fileName;//	文件名称，缩略图：s_...
    private String filePath;//	文件路径
    private String suffixes;//	文件后缀名
    private Long fileSize;//	文件大小
    private Date uploadDate;//	上传日期
    private Integer number;    //	排序
    private String uploadPerson;//	上传人员
    @Column(columnDefinition = "INT default 1", nullable = false, insertable = false)
    private Integer able; //目录是否有效   1：有效，2：无效

    @ManyToOne
    @JoinColumn(name = "deskCatalogId")
    private DeskCatalog deskCatalog;

    @Transient
    public String getSmallPic(){
        if(filePath!=null){
            int index = filePath.lastIndexOf("/");
            return filePath.substring(0,index)+"/s_"+filePath.substring(index+1);
        }
        return filePath;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public String getSuffixes() {
        return suffixes;
    }

    public void setSuffixes(String suffixes) {
        this.suffixes = suffixes;
    }

    public Long getFileSize() {
        return fileSize;
    }

    public void setFileSize(Long fileSize) {
        this.fileSize = fileSize;
    }

    public Date getUploadDate() {
        return uploadDate;
    }

    public void setUploadDate(Date uploadDate) {
        this.uploadDate = uploadDate;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public String getUploadPerson() {
        return uploadPerson;
    }

    public void setUploadPerson(String uploadPerson) {
        this.uploadPerson = uploadPerson;
    }

    public Integer getAble() {
        return able;
    }

    public void setAble(Integer able) {
        this.able = able;
    }

    public DeskCatalog getDeskCatalog() {
        return deskCatalog;
    }

    public void setDeskCatalog(DeskCatalog deskCatalog) {
        this.deskCatalog = deskCatalog;
    }
}
