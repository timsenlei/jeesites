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
 * 公司详细信息配置Controller
 * @author zl
 * @version 2018-10-16
 */
@Controller
@RequestMapping(value = "${adminPath}/screen/escreenchil/eScreenChildred")
public class EScreenChildredController extends BaseController {

	@Autowired
	private EScreenChildredService eScreenChildredService;
	@Autowired
	private EScreenParentService eScreenParentService;
	
	@ModelAttribute
	public EScreenChildred get(@RequestParam(required=false) String id) {
		EScreenChildred entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = eScreenChildredService.get(id);
		}
		if (entity == null){
			entity = new EScreenChildred();
		}
		return entity;
	}
	
	@RequiresPermissions("screen:escreenchil:eScreenChildred:view")
	@RequestMapping(value = {"list", ""})
	public String list(EScreenChildred eScreenChildred, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<EScreenChildred> page = eScreenChildredService.findPage(new Page<EScreenChildred>(request, response), eScreenChildred); 
		model.addAttribute("page", page);
		return "modules/screen/escreenchil/eScreenChildredList";
	}

	@RequiresPermissions("screen:escreenchil:eScreenChildred:view")
	@RequestMapping(value = "form")
	public String form(EScreenChildred eScreenChildred, Model model) {
		EScreenParent parent=new EScreenParent();
		parent.setIfIsParent("0");
		List<EScreenParent> listParent=eScreenParentService.findList(parent);
		model.addAttribute("eScreenChildred", eScreenChildred);
		model.addAttribute("listParent", listParent);

		return "modules/screen/escreenchil/eScreenChildredForm";
	}

	@RequiresPermissions("screen:escreenchil:eScreenChildred:edit")
	@RequestMapping(value = "save")
	public String save(EScreenChildred eScreenChildred, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, eScreenChildred)){
			return form(eScreenChildred, model);
		}
		eScreenChildred.setCompanyService(eScreenChildred.getCompanyService().replaceAll("，",","));
		eScreenChildred.setImgUrl(getJson(eScreenChildred.getProductNames(),eScreenChildred.getImgUrls()));
		eScreenChildredService.save(eScreenChildred);
		addMessage(redirectAttributes, "保存公司详细成功");
		return "redirect:"+Global.getAdminPath()+"/screen/escreenchil/eScreenChildred/?repage";
	}
	
	@RequiresPermissions("screen:escreenchil:eScreenChildred:edit")
	@RequestMapping(value = "delete")
	public String delete(EScreenChildred eScreenChildred, RedirectAttributes redirectAttributes) {
		eScreenChildredService.delete(eScreenChildred);
		addMessage(redirectAttributes, "删除公司详细成功");
		return "redirect:"+Global.getAdminPath()+"/screen/escreenchil/eScreenChildred/?repage";
	}
	private static String  getJson(String [] name,String [] value){
		Map map = new LinkedHashMap();//定义一个map集合
		for (int i=0;i<name.length;i++){
			map.put(name[i],value[i]);//map集合添加数据
		}
		return JsonMapper.toJsonString(map);
	}
}