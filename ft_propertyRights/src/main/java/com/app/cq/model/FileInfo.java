package com.app.cq.model;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 家庭档案表
 * Created by jmdf on 2018/8/1.
 */
@Table(name = "fileInfo")
@Entity
public class FileInfo {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;           //主键
    private String fileName;//	文件名称，缩略图：s_...
    private String filePath;//	文件路径
    private String suffixes;//	文件后缀名
    private BigDecimal fileSize;//	文件大小
    private Date uploadDate;//	上传日期
    private Integer sort;    //	排序
    private Long sortBy;    //	排序
    private String uploadPerson;//	上传人员
    private String userId;//	上传用户id
    private String fileType;//	文件类别（数据字典）

    @Column(columnDefinition = "INT default 1", nullable = false, insertable = false)
    private Integer handStatus;  // 上报状态 1 未上报 2 已上报
    @Column(columnDefinition = "INT default 1", nullable = false, insertable = false)
    private Integer delStatus; //1：初始未删除，2：已删除

    @ManyToOne
    @JoinColumn(name = "familyId")
    private Family family;

    @ManyToOne
    @JoinColumn(name = "projectId")
    private Project project;

    public Project getProject() {
        return project;
    }

    public void setProject(Project project) {
        this.project = project;
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

    public BigDecimal getFileSize() {
        return fileSize;
    }

    public void setFileSize(BigDecimal fileSize) {
        this.fileSize = fileSize;
    }

    public Date getUploadDate() {
        return uploadDate;
    }

    public void setUploadDate(Date uploadDate) {
        this.uploadDate = uploadDate;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public Long getSortBy() {
        return sortBy;
    }

    public void setSortBy(Long sortBy) {
        this.sortBy = sortBy;
    }

    public String getUploadPerson() {
        return uploadPerson;
    }

    public void setUploadPerson(String uploadPerson) {
        this.uploadPerson = uploadPerson;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getFileType() {
        return fileType;
    }

    public void setFileType(String fileType) {
        this.fileType = fileType;
    }

    public Integer getHandStatus() {
        return handStatus;
    }

    public void setHandStatus(Integer handStatus) {
        this.handStatus = handStatus;
    }

    public Integer getDelStatus() {
        return delStatus;
    }

    public void setDelStatus(Integer delStatus) {
        this.delStatus = delStatus;
    }

    public Family getFamily() {
        return family;
    }

    public void setFamily(Family family) {
        this.family = family;
    }
}
