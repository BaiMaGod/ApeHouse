package com.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;


@Service
public class ImgServiceImpl implements ImgService {

	@Override
	public String add(MultipartFile imgFile, String type) {
		
		
		
		return null;
	}

	@Override
	public List<String> add(List<MultipartFile> imgFile, String type) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean delete(String url, String type) {
		// TODO Auto-generated method stub
		return false;
	}

}
