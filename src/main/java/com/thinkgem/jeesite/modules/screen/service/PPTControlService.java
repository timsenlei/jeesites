/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.screen.service;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;

import com.thinkgem.jeesite.modules.screen.dao.PPTControlDao;
import com.thinkgem.jeesite.modules.screen.entity.PPTControl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * PPTService
 * @author zl
 * @version 2018-10-23
 */
@Service
@Transactional(readOnly = true)
public class PPTControlService extends CrudService<PPTControlDao, PPTControl> {
	@Autowired
	PPTControlDao pptControlDao;

	public PPTControl get(String id) {
		return super.get(id);
	}
	
	public List<PPTControl> findList(PPTControl pPTControl) {
		return super.findList(pPTControl);
	}
	
	public Page<PPTControl> findPage(Page<PPTControl> page, PPTControl pPTControl) {
		return super.findPage(page, pPTControl);
	}
	
	@Transactional(readOnly = false)
	public void save(PPTControl pPTControl) {
		super.save(pPTControl);
	}
	
	@Transactional(readOnly = false)
	public void delete(PPTControl pPTControl) {
		super.delete(pPTControl);
	}

	@Transactional(readOnly = false)
	public void updateStatus(String screen) {
		pptControlDao.updateStatus(screen);
	}
	public PPTControl searchPPT(String screen){
		return pptControlDao.searchPPT(screen);
	}
}