/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.screen.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.screen.entity.EScreenParent;

import java.util.List;


/**
 * eScreenDAO接口
 * @author zl
 * @version 2018-10-16
 */
@MyBatisDao
public interface EScreenParentDao extends CrudDao<EScreenParent> {
	public List<EScreenParent> queryParent();
	public List<EScreenParent> querySecond(String parentId);
}