/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.screen.service;


import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.screen.dao.EScreenChildredDao;
import com.thinkgem.jeesite.modules.screen.entity.EScreenChildred;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 公司详细信息配置Service
 * @author zl
 * @version 2018-10-16
 */
@Service
@Transactional(readOnly = true)
public class EScreenChildredService extends CrudService<EScreenChildredDao, EScreenChildred> {
	@Autowired
	EScreenChildredDao eScreenChildredDao;
	public EScreenChildred get(String id) {
		return super.get(id);
	}
	
	public List<EScreenChildred> findList(EScreenChildred eScreenChildred) {
		return super.findList(eScreenChildred);
	}
	
	public Page<EScreenChildred> findPage(Page<EScreenChildred> page, EScreenChildred eScreenChildred) {
		return super.findPage(page, eScreenChildred);
	}
	
	@Transactional(readOnly = false)
	public void save(EScreenChildred eScreenChildred) {
		super.save(eScreenChildred);
	}
	
	@Transactional(readOnly = false)
	public void delete(EScreenChildred eScreenChildred) {
		super.delete(eScreenChildred);
	}
	public List<EScreenChildred>  thirdScreen(long id){
		return  eScreenChildredDao.thirdScreen(id);
	}
}