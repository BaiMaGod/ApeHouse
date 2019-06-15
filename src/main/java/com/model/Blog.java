package com.model;

import java.util.Date;
import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

public class Blog {
    private String id;

    @Length(min=5,max=25,message="用户id错误")
    private String userId;

    @Length(min=6,max=6,message="分类id错误")
    private String categoryId;

    @NotBlank(message="标题不能为空")
    private String title;

    @NotBlank(message="内容不能为空")
    private String summary;

    private String mdUrl;

    private String htmlUrl;

    private Date createTime;

    private Date updataTime;

    @NotBlank(message="内容不能为空")
    private String content;
    
    @NotBlank(message="内容不能为空")
    private String htmlString;

    private Category category;
    
    @NotNull(message="内容不能为空")
    private List<String> tagString;
    
    private List<Tag> tags;
    
    
    
    
	

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public List<String> getTagString() {
		return tagString;
	}

	public void setTagString(List<String> tagString) {
		this.tagString = tagString;
	}

	public List<Tag> getTags() {
		return tags;
	}

	public void setTags(List<Tag> tags) {
		this.tags = tags;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getMdUrl() {
		return mdUrl;
	}

	public void setMdUrl(String mdUrl) {
		this.mdUrl = mdUrl;
	}

	public String getHtmlUrl() {
		return htmlUrl;
	}

	public void setHtmlUrl(String htmlUrl) {
		this.htmlUrl = htmlUrl;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdataTime() {
		return updataTime;
	}

	public void setUpdataTime(Date updataTime) {
		this.updataTime = updataTime;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getHtmlString() {
		return htmlString;
	}

	public void setHtmlString(String htmlString) {
		this.htmlString = htmlString;
	}

	@Override
	public String toString() {
		return "Blog [id=" + id + ", userId=" + userId + ", categoryId=" + categoryId + ", title=" + title
				+ ", summary=" + summary + ", mdUrl=" + mdUrl + ", htmlUrl=" + htmlUrl + ", createTime=" + createTime
				+ ", updataTime=" + updataTime + ", content=" + content + ", htmlString=" + htmlString + "]";
	}

}