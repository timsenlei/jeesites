/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.screen.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.screen.entity.PPTControl;


/**
 * PPTDAO接口
 * @author zl
 * @version 2018-10-23
 */
@MyBatisDao
public interface PPTControlDao extends CrudDao<PPTControl> {
    public void updateStatus(String screen);
}