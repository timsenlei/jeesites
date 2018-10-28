/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.screen.web;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;

import com.thinkgem.jeesite.modules.screen.entity.PPTControl;
import com.thinkgem.jeesite.modules.screen.service.PPTControlService;
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

/**
 * PPTController
 * @author zl
 * @version 2018-10-23
 */
@Controller
@RequestMapping(value = "${adminPath}/screen/ppt/pPTControl")
public class PPTControlController extends BaseController {

	@Autowired
	private PPTControlService pPTControlService;
	
	@ModelAttribute
	public PPTControl get(@RequestParam(required=false) String id) {
		PPTControl entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = pPTControlService.get(id);
		}
		if (entity == null){
			entity = new PPTControl();
		}
		return entity;
	}
	
	@RequiresPermissions("screen:ppt:pPTControl:view")
	@RequestMapping(value = {"list", ""})
	public String list(PPTControl pPTControl, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<PPTControl> page = pPTControlService.findPage(new Page<PPTControl>(request, response), pPTControl); 
		model.addAttribute("page", page);
		return "modules/screen/ppt/pPTControlList";
	}

	@RequiresPermissions("screen:ppt:pPTControl:view")
	@RequestMapping(value = "form")
	public String form(PPTControl pPTControl, Model model) {
		model.addAttribute("pPTControl", pPTControl);
		return "modules/screen/ppt/pPTControlForm";
	}

	@RequiresPermissions("screen:ppt:pPTControl:edit")
	@RequestMapping(value = "save")
	public String save(PPTControl pPTControl, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, pPTControl)){
			return form(pPTControl, model);
		}
		if(pPTControl.getStatus().equals("1")){
			pPTControlService.updateStatus(pPTControl.getWhichScreen());
		}
		pPTControlService.save(pPTControl);
		addMessage(redirectAttributes, "保存PPT成功");
		return "redirect:"+Global.getAdminPath()+"/screen/ppt/pPTControl/?repage";
	}
	@RequiresPermissions("screen:ppt:pPTControl:edit")
	@RequestMapping(value = "updateIng")
	public String updateIng(@RequestParam(required=false) String id, @RequestParam String whichScreen, Model model, RedirectAttributes redirectAttributes) {
		pPTControlService.updateStatus(whichScreen);
		PPTControl entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = pPTControlService.get(id);
		}
		entity.setStatus("1");
		pPTControlService.save(entity);
		addMessage(redirectAttributes, "设置成功");
		return "redirect:"+Global.getAdminPath()+"/screen/ppt/pPTControl/?repage";
	}

	@RequiresPermissions("screen:ppt:pPTControl:edit")
	@RequestMapping(value = "delete")
	public String delete(PPTControl pPTControl, RedirectAttributes redirectAttributes) {
		pPTControlService.delete(pPTControl);
		addMessage(redirectAttributes, "删除PPT成功");
		return "redirect:"+Global.getAdminPath()+"/screen/ppt/pPTControl/?repage";
	}
	@RequestMapping(value = "preControl")
	public String preControl(@RequestParam(required=false)String id,@RequestParam(required=false)String type,Model model, RedirectAttributes redirectAttributes) {
		PPTControl entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = pPTControlService.get(id);
		}
		model.addAttribute("pPTControl", entity);
		if(type.equals("1")){
			return "modules/screen/ppt/backControl";
		}else{
			return "modules/screen/ppt/ppt";
		}

	}

}