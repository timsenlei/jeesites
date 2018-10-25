/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.screen.service;


import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.screen.dao.EScreenParentDao;
import com.thinkgem.jeesite.modules.screen.entity.EScreenParent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * eScreenService
 * @author zl
 * @version 2018-10-16
 */
@Service
@Transactional(readOnly = true)
public class EScreenParentService extends CrudService<EScreenParentDao, EScreenParent> {
	@Autowired
	EScreenParentDao eScreenParentDao;
	public EScreenParent get(String id) {
		return super.get(id);
	}
	
	public List<EScreenParent> findList(EScreenParent eScreenParent) {
		return super.findList(eScreenParent);
	}
	
	public Page<EScreenParent> findPage(Page<EScreenParent> page, EScreenParent eScreenParent) {
		return super.findPage(page, eScreenParent);
	}
	
	@Transactional(readOnly = false)
	public void save(EScreenParent eScreenParent) {
		super.save(eScreenParent);
	}
	
	@Transactional(readOnly = false)
	public void delete(EScreenParent eScreenParent) {
		super.delete(eScreenParent);
	}

	public List<EScreenParent> queryParent(){
		return  eScreenParentDao.queryParent();
	}
	public List<EScreenParent> querySecond(String parentId){
		return eScreenParentDao.querySecond(parentId);
	}
}