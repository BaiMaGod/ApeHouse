package com.service;

import java.util.List;

import com.dao.AlbumMapper;
import com.dao.ImgMapper;
import com.model.Img;
import com.model.ImgExample;
import com.util.MyUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.model.Album;
import com.pojo.Page;
import org.springframework.web.multipart.MultipartFile;

@Service
public class AlbumServiceImpl implements AlbumService {
	@Autowired
	AlbumMapper albumMapper;
	@Autowired
	ImgMapper imgMapper;


	@Override
	public String add(Album album) {
		String id = MyUtil.getLongId();

		album.setId(id);
		album.setCreateTime(MyUtil.nowDate());

		List<MultipartFile> imgs = album.getImgFiles();
		Img img ;
		String imgId;
		for (MultipartFile imgf : imgs) {
			imgId = MyUtil.getLongId();
			img = new Img();
			img.setId(imgId);
			img.setUrl(MyUtil.fileSave(imgf,"ape\\img\\album",imgId));
			img.setType("album");
			img.setCreateTime(MyUtil.nowDate());
			img.setTargetId(id);

			imgMapper.insertSelective(img);
		}


		return albumMapper.insertSelective(album)>0 ? id : null;
	}

	@Override
	public boolean delete(String id) {

		return albumMapper.deleteByPrimaryKey(id)>0;
	}

	@Override
	public boolean update(Album album) {

		return albumMapper.updateByPrimaryKeySelective(album)>0;
	}


	@Override
	public int countByExample(Album album) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Album findById(String id) {
		Album album = albumMapper.selectByPrimaryKey(id);

		ImgExample example = new ImgExample();
		example.createCriteria().andTargetIdEqualTo(album.getId());

		album.setImgs(imgMapper.selectByExample(example));

		return album;
	}

	@Override
	public List<Album> findByExample(Album album, Page page) {
		// TODO Auto-generated method stub
		return null;
	}

}
