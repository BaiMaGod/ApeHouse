package com.model;

import org.hibernate.validator.constraints.Length;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.NotBlank;
import java.util.Date;
import java.util.List;

public class Album {
    private String id;

    @Length(min=5,max=25,message="用户id错误")
    private String userId;

    @Length(min=6,max=6,message="分类id错误")
    private String categoryId;

    @NotBlank(message="标题不能为空")
    private String title;

    private String summary;

    private Date createTime;

    private Date updateTime;

    private String content;

    private List<Img> imgs;

    private List<MultipartFile> imgFiles;

    private List<String> depicts;


    public List<Img> getImgs() {
        return imgs;
    }

    public void setImgs(List<Img> imgs) {
        this.imgs = imgs;
    }

    public List<MultipartFile> getImgFiles() {
        return imgFiles;
    }

    public void setImgFiles(List<MultipartFile> imgFiles) {
        this.imgFiles = imgFiles;
    }

    public List<String> getDepicts() {
        return depicts;
    }

    public void setDepicts(List<String> depicts) {
        this.depicts = depicts;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary == null ? null : summary.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}