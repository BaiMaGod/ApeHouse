package com.service;

import com.dao.ResourceMapper;
import com.model.Resource;
import com.model.ResourceExample;
import com.model.ResourceExample.Criteria;
import com.pojo.Page;
import com.util.MyUtil;

import org.antlr.grammar.v3.ANTLRv3Parser.id_return;
import org.apache.cassandra.cli.CliParser.newColumnFamily_return;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ResourceServiceImpl implements ResourceService {
	@Autowired
	ResourceMapper resourceMapper;

    public String add(Resource resource) {
    	String id = MyUtil.getLongId();
    	
    	resource.setId(id);
    	resource.setCreateTime(MyUtil.nowDate());
    	
    	//处理资源文件
    	
    	
    	//处理图标文件
    	
    	if(resourceMapper.insertSelective(resource)>0) {
    		return id;
    	}
    	
        return null;
    }

    public boolean delete(String id) {
        return false;
    }

    public boolean update(Resource resource) {
    	
        return false;
    }

    public int countByExample(Resource resource) {
        return 0;
    }

    public Resource findById(String id) {
        return null;
    }

    public List<Resource> findByExample(Resource resource, Page page) {
    	if(resource == null) return null;
    	
    	ResourceExample example = new ResourceExample();
    	Criteria criteria = example.createCriteria();

    	if( MyUtil.notEmpty(resource.getId()) ) {
    		criteria.andIdEqualTo(resource.getId());
    	}
    	if( MyUtil.notEmpty(resource.getName()) ) {
    		criteria.andNameLike(resource.getName());
    	}
    	if( MyUtil.notEmpty(resource.getUserId()) ) {
    		criteria.andUserIdEqualTo(resource.getUserId());
    	}
    	if( MyUtil.notEmpty(resource.getTypeId()) ) {
    		criteria.andTypeIdEqualTo(resource.getTypeId());
    	}
    	if( MyUtil.notEmpty(resource.getCategoryId()) ) {
    		criteria.andCategoryIdEqualTo(resource.getCategoryId());
    	}
    	
    	example.setOrderByClause("createTime desc");
    	
    	if(page.getCurPage()>0) {
    		example.setStartRow(page.getStartRow());
    		example.setPageRows(page.getPageRows());
    	}
    	page.setTotalRows((int)resourceMapper.countByExample(example));
    	
        return resourceMapper.selectByExample(example);
    }
    
    
    public void find(Page page) {
    	
    	System.out.println(page.toString());
    	page.setCurPage(1000);
    	page.setTotalRows(100);
    	
    }
}
