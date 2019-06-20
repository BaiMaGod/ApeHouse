package com.model;

import javax.validation.constraints.NotBlank;
import java.util.Date;

public class Music {
    @NotBlank
    private String id;

    @NotBlank
    private String url;

    private String songSheet;

    private String name;

    private String artist;

    private String tag;

    private Date createTime;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    public String getSongSheet() {
        return songSheet;
    }

    public void setSongSheet(String songSheet) {
        this.songSheet = songSheet == null ? null : songSheet.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getArtist() {
        return artist;
    }

    public void setArtist(String artist) {
        this.artist = artist == null ? null : artist.trim();
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag == null ? null : tag.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }


    @Override
    public String toString() {
        return "Music{" +
                "id='" + id + '\'' +
                ", url='" + url + '\'' +
                ", songSheet='" + songSheet + '\'' +
                ", name='" + name + '\'' +
                ", artist='" + artist + '\'' +
                ", tag='" + tag + '\'' +
                ", createTime=" + createTime +
                '}';
    }
}