/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.screen.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.screen.entity.GScreen;

/**
 * g屏代码DAO接口
 * @author zl
 * @version 2018-10-13
 */
@MyBatisDao
public interface GScreenDao extends CrudDao<GScreen> {
    public void updateStatus();
}