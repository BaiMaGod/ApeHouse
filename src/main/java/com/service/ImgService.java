package com.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;


public interface ImgService {
	String add(MultipartFile imgFile,String type);
	
	List<String> add(List<MultipartFile> imgFile,String type);
	
    boolean delete(String url,String type);

}
