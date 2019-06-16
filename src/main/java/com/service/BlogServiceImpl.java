package com.service;

import com.dao.BlogMapper;
import com.dao.CategoryMapper;
import com.dao.TagMapper;
import com.model.Blog;
import com.model.BlogExample;
import com.model.ResourceExample;
import com.model.Tag;
import com.model.TagExample;
import com.pojo.Page;
import com.util.MyUtil;

import org.apache.commons.io.output.WriterOutputStream;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.StringWriter;
import java.sql.Blob;
import java.util.List;

@Service
public class BlogServiceImpl implements BlogService {
	@Autowired
	BlogMapper blogMapper;
	@Autowired
	CategoryMapper categoryMapper;
	@Autowired
	TagMapper tagMapper;
	
	private String save(String id,String content,String type){
		String url = "ape\\"+type+"\\"+id+"."+type;
		System.out.println(url);
		File file = new File(MyUtil.serverPath+url);
		FileOutputStream fos = null;
		BufferedWriter bw = null;
		try {
			file.createNewFile();
			
			fos = new FileOutputStream(file);
			bw = new BufferedWriter(new OutputStreamWriter(fos, "UTF-8"));	//以utf-8格式保存文件，以防乱码
			
			if("jsp".equals(type)) {
				bw.write("<%@ page language=\"java\" contentType=\"text/html; charset=UTF-8\"\n" + 
						"	pageEncoding=\"UTF-8\"%>"+content);
			}else {
				bw.write(content);
			}
			bw.flush();
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}finally{
			if(fos!=null) {
				try {
					fos.close();
				} catch (IOException e1) {
					e1.printStackTrace();
				}
			}
			if(bw!=null) {
				try {
					bw.close();
				} catch (IOException e1) {
					e1.printStackTrace();
				}
			}
		}
		
		return url;
	}
	

	@Override
	public String add(Blog blog) {
		String id = MyUtil.getLongId();
		
		save(id, blog.getHtmlString(),"jsp");
		String htmlUrl = save(id, blog.getHtmlString(),"html");
		if(htmlUrl==null) return null;
		String mdUrl = save(id, blog.getContent(),"md");
		if(mdUrl==null) return null;
		
		blog.setId(id);
		blog.setHtmlUrl(htmlUrl); 
		blog.setMdUrl(mdUrl); 
		blog.setCreateTime(MyUtil.nowDate());
		
		//存标签
		List<String> tagList = blog.getTagString();
		Tag tag ;
		for (String str : tagList) {
			tag = new Tag();
			tag.setId(MyUtil.getLongId());
			tag.setName(str);
			tag.setTargetId(id);
			tag.setType("blog");
			tag.setCreateTime(MyUtil.nowDate());
			
			tagMapper.insert(tag);
		}
		
		String content = blog.getSummary();
		blog.setContent(content);
		
		String summary =  content.length()>200 ? content.substring(0,200):content;
		blog.setSummary(summary.replaceAll("\n", " "));
		
		return blogMapper.insertSelective(blog)>0 ? id : null;
	}

	@Override
	public boolean delete(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean update(Blog blog) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int countByExample(Blog blog) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Blog findById(String id) {
		Blog blog = blogMapper.selectByPrimaryKey(id);
		
		blog.setCategory(categoryMapper.selectByPrimaryKey(blog.getCategoryId()));
		TagExample tagExample = new TagExample();
		tagExample.createCriteria().andTargetIdEqualTo(blog.getId());
		blog.setTags(tagMapper.selectByExample(tagExample));
		
		return blog;
	}

	@Override
	public List<Blog> findByExample(Blog blog, Page page) {
		BlogExample example = new BlogExample();
		example.setOrderByClause("createTime desc");
		
		List<Blog> blogs = blogMapper.selectByExample(example);
		
		for (Blog blog2 : blogs) {
			blog2.setCategory(categoryMapper.selectByPrimaryKey(blog2.getCategoryId()));
			
			TagExample tagExample = new TagExample();
			tagExample.createCriteria().andTargetIdEqualTo(blog2.getId());
			blog2.setTags(tagMapper.selectByExample(tagExample));
		}
		
		return blogs;
	}
  
}
