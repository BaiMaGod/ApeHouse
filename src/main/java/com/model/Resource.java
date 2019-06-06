package com.model;

import java.util.Date;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;
import org.springframework.web.multipart.MultipartFile;

public class Resource {
    private String id;

    @Length(min=20,max=25,message="{resourceUpload.userId.error}")
    private String userId;

    @NotBlank(message="{resourceUpload.name.null}")
    private String name;

    private String icon;

    private String realName;

    private String src;

    @Length(min=20,max=25,message="{resourceUpload.typeId.error}")
    private String typeId;

    @Length(min=20,max=25,message="{resourceUpload.categoryId.error}")
    private String categoryId;

    @Length(min=2,max=120,message="{resourceUpload.depict.length}")
    private String depict;

    private Date updateTime;

    private Date createTime;
    
    @NotNull(message="{resourceUpload.resourceFile.null}")
    private MultipartFile resourceFile;
    
    private MultipartFile iconfFile;
    

    
    public MultipartFile getResourceFile() {
		return resourceFile;
	}

	public void setResourceFile(MultipartFile resourceFile) {
		this.resourceFile = resourceFile;
	}

	public MultipartFile getIconfFile() {
		return iconfFile;
	}

	public void setIconfFile(MultipartFile iconfFile) {
		this.iconfFile = iconfFile;
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon == null ? null : icon.trim();
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName == null ? null : realName.trim();
    }

    public String getSrc() {
        return src;
    }

    public void setSrc(String src) {
        this.src = src == null ? null : src.trim();
    }

    public String getTypeId() {
        return typeId;
    }

    public void setTypeId(String typeId) {
        this.typeId = typeId == null ? null : typeId.trim();
    }

    public String getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(String categoryId) {
        this.categoryId = categoryId == null ? null : categoryId.trim();
    }

    public String getDepict() {
        return depict;
    }

    public void setDepict(String depict) {
        this.depict = depict == null ? null : depict.trim();
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    
    
	@Override
	public String toString() {
		return "Resource [id=" + id + ", userId=" + userId + ", name=" + name + ", icon=" + icon + ", realName="
				+ realName + ", src=" + src + ", typeId=" + typeId + ", categoryId=" + categoryId + ", depict=" + depict
				+ ", updateTime=" + updateTime + ", createTime=" + createTime + "]";
	}
    
}