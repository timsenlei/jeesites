/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.screen.service;


import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.excel.ImportExcel;
import com.thinkgem.jeesite.modules.screen.dao.EScreenChildredDao;
import com.thinkgem.jeesite.modules.screen.dao.EScreenParentDao;
import com.thinkgem.jeesite.modules.screen.entity.EScreenChildred;
import com.thinkgem.jeesite.modules.screen.entity.EScreenParent;
import org.apache.poi.ss.usermodel.Row;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

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
	@Autowired
	EScreenParentDao eScreenParentDao;
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
	@Transactional(readOnly = false)
	public void saveParent(Row row,ImportExcel ei){
		try {
			Object val = ei.getCellValue(row, 0);
			EScreenParent parent=new EScreenParent();
			parent.setIfIsParent("0");
			parent.setStatus("1");
			parent.setBusinessName(ei.getCellValue(row, 1).toString());
			parent.setParent(eScreenParentDao.get(ei.getCellValue(row, 0).toString()));
			eScreenParentDao.insert(parent);
			EScreenChildred childred=new EScreenChildred();
			childred.setCompanyService(ei.getCellValue(row, 2).toString().replaceAll("，",","));
			childred.setCompanyName(ei.getCellValue(row, 1).toString());
			childred.setCompanyAmount(ei.getCellValue(row, 3).toString());
			childred.setCompanyPersonRece(ei.getCellValue(row, 4).toString());
			childred.setStatus("1");
			childred.setParentId(Long.valueOf(parent.getId()));
			String poduct[]=(ei.getCellValue(row, 6).toString().replaceAll("，",",")).split(",");
			childred.setImgUrl(getJson(poduct));
			eScreenChildredDao.insert(childred);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	private static String  getJson(String [] name){
		Map map = new LinkedHashMap();//定义一个map集合
		for (int i=0;i<name.length;i++){
			map.put(name[i],"");//map集合添加数据
		}
		return JsonMapper.toJsonString(map);
	}
}