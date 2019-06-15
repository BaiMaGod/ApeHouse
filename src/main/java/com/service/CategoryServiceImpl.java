package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.CategoryMapper;
import com.model.Category;
import com.model.CategoryExample;
import com.model.CategoryExample.Criteria;
import com.pojo.Page;
import com.util.MyUtil;

@Service
public class CategoryServiceImpl implements CategoryService{
	@Autowired
	CategoryMapper categoryMapper;

	@Override
	public String add(Category category) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean delete(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean update(Category category) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int countByExample(Category category) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Category findById(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Category> findByExample(Category category, Page page) {
		if(category == null) return null;
		
		CategoryExample example = new CategoryExample();
		Criteria criteria = example.createCriteria();
		
		if(MyUtil.notEmpty(category.getId())) {
			criteria.andIdEqualTo(category.getId());
		}
		if(MyUtil.notEmpty(category.getName())) {
			criteria.andNameLike(category.getName());
		}
		if(MyUtil.notEmpty(category.getDepict())) {
			criteria.andDepictLike(category.getDepict());
		}
		
		
		if(page.getCurPage()>0) {
			example.setStartRow(page.getStartRow());
			example.setPageRows(page.getPageRows());
		}
		page.setTotalRows((int)categoryMapper.countByExample(example));
		
		return categoryMapper.selectByExample(example);
	}

	@Override
	public List<Category> findAll(Page page) {
		CategoryExample example = new CategoryExample();
		Criteria criteria = example.createCriteria();
		//先查询一级分类
		criteria.andParentIdIsNull();
		
		if(page.getCurPage()>0) {
			example.setStartRow(page.getStartRow());
			example.setPageRows(page.getPageRows());
		}
		page.setTotalRows((int)categoryMapper.countByExample(example));
		
		List<Category> categorie1 = categoryMapper.selectByExample(example);
		
		for (Category category : categorie1) {
			CategoryExample example2 = new CategoryExample();
			example2.createCriteria().andParentIdEqualTo(category.getId());
			category.setChildCategories( categoryMapper.selectByExample(example2) );
			
		}
		
		return categorie1;
	}

}
