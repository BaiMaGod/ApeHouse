package com.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.model.Album;
import com.pojo.Page;

@Service
public class AlbumServiceImpl implements AlbumService {

	@Override
	public String add(Album album) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean delete(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean update(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int countByExample(Album album) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Album findById(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Album> findByExample(Album album, Page page) {
		// TODO Auto-generated method stub
		return null;
	}

}
