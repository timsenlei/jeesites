/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.screen.web;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;

import com.thinkgem.jeesite.modules.screen.entity.EScreenChildred;
import com.thinkgem.jeesite.modules.screen.entity.EScreenParent;
import com.thinkgem.jeesite.modules.screen.service.EScreenChildredService;
import com.thinkgem.jeesite.modules.screen.service.EScreenParentService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * eScreenController
 * @author zl
 * @version 2018-10-16
 */
@Controller
@RequestMapping(value = "${adminPath}/screen/escreen/eScreenParent")
public class EScreenParentController extends BaseController {

	@Autowired
	private EScreenParentService eScreenParentService;
	@Autowired
	private EScreenChildredService eScreenChildredService;
	@ModelAttribute
	public EScreenParent get(@RequestParam(required=false) String id) {
		EScreenParent entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = eScreenParentService.get(id);
		}
		if (entity == null){
			entity = new EScreenParent();
		}
		return entity;
	}
	
	@RequiresPermissions("screen:escreen:eScreenParent:view")
	@RequestMapping(value = {"list", ""})
	public String list(EScreenParent eScreenParent, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<EScreenParent> page = eScreenParentService.findPage(new Page<EScreenParent>(request, response), eScreenParent); 
		model.addAttribute("page", page);
		return "modules/screen/escreen/eScreenParentList";
	}

	@RequiresPermissions("screen:escreen:eScreenParent:view")
	@RequestMapping(value = "form")
	public String form(EScreenParent eScreenParent, Model model) {

		List<EScreenParent> eScreenParentList=eScreenParentService.queryParent();
		model.addAttribute("parents", eScreenParentList);
		model.addAttribute("eScreenParent", eScreenParent);
		return "modules/screen/escreen/eScreenParentForm";
	}

	@RequiresPermissions("screen:escreen:eScreenParent:edit")
	@RequestMapping(value = "save")
	public String save(EScreenParent eScreenParent, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, eScreenParent)){
			return form(eScreenParent, model);
		}
		eScreenParentService.save(eScreenParent);
		addMessage(redirectAttributes, "保存成功");
		return "redirect:"+Global.getAdminPath()+"/screen/escreen/eScreenParent/?repage";
	}
	
	@RequiresPermissions("screen:escreen:eScreenParent:edit")
	@RequestMapping(value = "delete")
	public String delete(EScreenParent eScreenParent, RedirectAttributes redirectAttributes) {
		eScreenParentService.delete(eScreenParent);
		addMessage(redirectAttributes, "删除成功");
		return "redirect:"+Global.getAdminPath()+"/screen/escreen/eScreenParent/?repage";
	}
	@RequestMapping(value ="firstPage")
	public String firstPage(EScreenParent eScreenParent, HttpServletRequest request, HttpServletResponse response, Model model) {
		List<EScreenParent> eScreenParentList=eScreenParentService.queryParent();
		model.addAttribute("eScreenParentList", eScreenParentList);
		return "modules/screen/escreen/firstScreen";
	}
	@RequestMapping(value = "secondPage")
	public String secondPage(@RequestParam(required=false) String parentId, HttpServletRequest request, HttpServletResponse response, Model model) {
		EScreenParent entity = eScreenParentService.get(parentId);
		List<EScreenParent> eScreenParentList=eScreenParentService.querySecond(parentId);
		model.addAttribute("eScreenParentList", eScreenParentList);
		model.addAttribute("entity", entity);
		return "modules/screen/escreen/secondScreen";
	}
	@RequestMapping(value = "thirdPage")
	public String thirdPage(@RequestParam(required=false) String parentId, @RequestParam(required=false) String id, @RequestParam(required=false) String imgUrl, @RequestParam(required=false) String businessName,HttpServletRequest request, HttpServletResponse response, Model model) {
		List<EScreenChildred> eScreenChildredList=eScreenChildredService.thirdScreen(Long.valueOf(id));
		EScreenChildred eScreenChildred=null;
		Map productsMap=new LinkedHashMap();
		if(eScreenChildredList!=null && eScreenChildredList.size()>0){
			eScreenChildred= eScreenChildredList.get(0);
			productsMap= (Map) JsonMapper.fromJsonString(eScreenChildred.getImgUrl(),LinkedHashMap.class);
		}
		model.addAttribute("eScreenChildred", eScreenChildred);
		model.addAttribute("comImgUrl", imgUrl);
		model.addAttribute("comBusinessName", businessName);
		model.addAttribute("parentId", parentId);
		model.addAttribute("productsMap", productsMap);
		return "modules/screen/escreen/thirdScreen";
	}

}