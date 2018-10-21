/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.screen.web;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;

import com.thinkgem.jeesite.modules.screen.entity.EScreenParent;
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
import java.util.List;

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
		addMessage(redirectAttributes, "保存E屏成功");
		return "redirect:"+Global.getAdminPath()+"/screen/escreen/eScreenParent/?repage";
	}
	
	@RequiresPermissions("screen:escreen:eScreenParent:edit")
	@RequestMapping(value = "delete")
	public String delete(EScreenParent eScreenParent, RedirectAttributes redirectAttributes) {
		eScreenParentService.delete(eScreenParent);
		addMessage(redirectAttributes, "删除E屏成功");
		return "redirect:"+Global.getAdminPath()+"/screen/escreen/eScreenParent/?repage";
	}

}