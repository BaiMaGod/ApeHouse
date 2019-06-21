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
		String id = MyUtil.getLongId();
		category.setId(id);
		category.setCreateTime(MyUtil.nowDate());
		return categoryMapper.insertSelective(category)>0 ? id : null;
	}

	@Override
	public boolean delete(String id) {
		return categoryMapper.deleteByPrimaryKey(id)>0;
	}

	@Override
	public boolean update(Category category) {
		return categoryMapper.updateByPrimaryKeySelective(category)>0;
	}

	@Override
	public int countByExample(Category category) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Category findById(String id) {
		return categoryMapper.selectByPrimaryKey(id);
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
		if(MyUtil.notEmpty(category.getType())) {
			criteria.andTypeEqualTo(category.getType());
		}

		
		if(page.getCurPage()>0) {
			example.setStartRow(page.getStartRow());
			example.setPageRows(page.getPageRows());
		}
		page.setTotalRows((int)categoryMapper.countByExample(example));


//
		List<Category> categorie1 = categoryMapper.selectByExample(example);

//		//查询子类
//		for (Category category2 : categorie1) {
//			CategoryExample example2 = new CategoryExample();
//			example2.createCriteria().andParentIdEqualTo(category.getId());
//			category2.setChildCategories( categoryMapper.selectByExample(example2) );
//
//		}
		
		return categorie1;
	}

	@Override
	public List<Category> findAll(Page page) {
		/*CategoryExample example = new CategoryExample();
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
		
		return categorie1;*/
		return null;
	}

	@Override
	public List<Category> findByType(String type, Page page) {
		CategoryExample example = new CategoryExample();
		Criteria criteria = example.createCriteria();

		criteria.andTypeEqualTo(type);

		//先查询一级分类
		criteria.andParentIdIsNull();

		if(page.getCurPage()>0) {
			example.setStartRow(page.getStartRow());
			example.setPageRows(page.getPageRows());
		}
		page.setTotalRows((int)categoryMapper.countByExample(example));

		List<Category> categorie1 = categoryMapper.selectByExample(example);

		//查询子类
		for (Category category : categorie1) {
			CategoryExample example2 = new CategoryExample();
			example2.createCriteria().andParentIdEqualTo(category.getId());
			category.setChildCategories( categoryMapper.selectByExample(example2) );

		}

		return categorie1;

	}

}
