package com.service;

import java.util.List;


import com.model.Album;
import com.pojo.Page;

public interface AlbumService {
	String add(Album album);
    boolean delete(String id);
    boolean update(Album album);

    int countByExample(Album album);

    Album findById(String id);
    List<Album> findByExample(Album album, Page page);


}
