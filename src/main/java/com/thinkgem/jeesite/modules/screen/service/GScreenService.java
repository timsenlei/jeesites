/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.screen.service;

import java.util.List;

import com.thinkgem.jeesite.modules.screen.entity.GScreen;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.screen.dao.GScreenDao;

/**
 * E屏代码Service
 * @author zl
 * @version 2018-10-13
 */
@Service
@Transactional(readOnly = true)
public class GScreenService extends CrudService<GScreenDao, GScreen> {
	@Autowired
	GScreenDao gScreenDao;
	public GScreen get(String id) {
		return super.get(id);
	}
	
	public List<GScreen> findList(GScreen gScreen) {
		return super.findList(gScreen);
	}
	
	public Page<GScreen> findPage(Page<GScreen> page, GScreen gScreen) {
		return super.findPage(page, gScreen);
	}
	
	@Transactional(readOnly = false)
	public void save(GScreen gScreen) {
		super.save(gScreen);
	}
	
	@Transactional(readOnly = false)
	public void delete(GScreen gScreen) {
		super.delete(gScreen);
	}
	@Transactional(readOnly = false)
	public void updateStatus() {
		gScreenDao.updateStatus();
	}
	public GScreen selectForScreen(){
		return gScreenDao.selectForScreen();
	}
}