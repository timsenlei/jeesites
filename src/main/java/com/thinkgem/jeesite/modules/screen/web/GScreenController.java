/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.screen.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.modules.screen.entity.GScreen;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.screen.service.GScreenService;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * E屏代码Controller
 * @author zl
 * @version 2018-10-13
 */
@Controller
@RequestMapping(value = "${adminPath}/screen/gScreen")
public class GScreenController extends BaseController {

	@Autowired
	private GScreenService gScreenService;
	
	@ModelAttribute
	public GScreen get(@RequestParam(required=false) String id) {
		GScreen entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = gScreenService.get(id);
		}
		if (entity == null){
			entity = new GScreen();
		}
		return entity;
	}
	
	@RequiresPermissions("screen:gScreen:view")
	@RequestMapping(value = {"list", ""})
	public String list(GScreen gScreen, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<GScreen> page = gScreenService.findPage(new Page<GScreen>(request, response), gScreen);
		model.addAttribute("page", page);
		return "modules/screen/gscreen/gScreenList";
	}

	@RequiresPermissions("screen:gScreen:view")
	@RequestMapping(value = "form")
	public String form(GScreen gScreen, Model model) {
		Map<String,Map<String,String>> map= (Map) JsonMapper.fromJsonString(gScreen.getExtends1(),Map.class);
		if(map!=null){
			for (Map.Entry<String,Map<String,String>> entry : map.entrySet()) {
				System.out.println("Key = " + entry.getKey() + ", Value = " + entry.getValue());
				Map<String,String> maps=entry.getValue();
				for(Map.Entry<String,String> entrys : maps.entrySet()){
					if(entry.getKey().equals("chang1")){
						gScreen.setChangeFd1(entrys.getKey());
						gScreen.setChangePl1(entrys.getValue());
					}else if(entry.getKey().equals("chang2")){
						gScreen.setChangeFd2(entrys.getKey());
						gScreen.setChangePl2(entrys.getValue());
					}else if(entry.getKey().equals("chang3")){
						gScreen.setChangeFd3(entrys.getKey());
						gScreen.setChangePl3(entrys.getValue());
					}
				}
			}
		}
		model.addAttribute("gScreen", gScreen);
		return "modules/screen/gscreen/gScreenForm";
	}

	@RequiresPermissions("screen:gScreen:edit")
	@RequestMapping(value = "save")
	public String save(GScreen gScreen, Model model, RedirectAttributes redirectAttributes, HttpServletRequest request) {
		if (!beanValidator(model, gScreen)){
			return form(gScreen, model);
		}
		String []regionMoneyTopName=request.getParameterValues("regionMoneyTopName");
		gScreen.setRegionBusinessTop(getJson(gScreen.getRegionBusinessName(),gScreen.getRegionBusinessValue()));;
		gScreen.setCloudSoftTop(getJson(gScreen.getCloudSoftTopName(),gScreen.getCloudSoftTopValue()));
		gScreen.setRegionMoneyTop(getJson(gScreen.getRegionMoneyTopName(),gScreen.getRegionMoneyTopValue()));
		gScreen.setTradeOnlineCharts(getJson(gScreen.getTradeOnlineChartsName(),gScreen.getTradeOnlineChartsValue()));
		gScreen.setCoreArea(gScreen.getCoreArea().replace("，",","));
		gScreen.setSearchHotWords(gScreen.getSearchHotWords().replace("，",","));
		Map<String,Map<String,String>> mmps=new HashMap<String, Map<String, String>>();
		mmps.put("chang1",getMap(gScreen.getChangeFd1(),gScreen.getChangePl1()));
		mmps.put("chang2",getMap(gScreen.getChangeFd2(),gScreen.getChangePl2()));
		mmps.put("chang3",getMap(gScreen.getChangeFd3(),gScreen.getChangePl3()));
		gScreen.setExtends1(JsonMapper.toJsonString(mmps));
		gScreenService.save(gScreen);
		addMessage(redirectAttributes, "保存成功");
		return "redirect:"+Global.getAdminPath()+"/screen/gScreen/?repage";
	}
	
	@RequiresPermissions("screen:gScreen:edit")
	@RequestMapping(value = "delete")
	public String delete(GScreen gScreen, RedirectAttributes redirectAttributes) {
		gScreenService.delete(gScreen);
		addMessage(redirectAttributes, "删除成功");
		return "redirect:"+Global.getAdminPath()+"/screen/gScreen/?repage";
	}
	@RequiresPermissions("screen:gScreen:edit")
	@RequestMapping(value = "useThisTem")
	public String useThisTem(@RequestParam(required=false) String id, RedirectAttributes redirectAttributes) {
		//先把现在可用模板置为无效
		gScreenService.updateStatus();
		//再设置新模板
		GScreen gScreen=gScreenService.get(id);

		gScreen.setTemplateStatus("1");
		gScreenService.save(gScreen);
		addMessage(redirectAttributes, "设置成功");
		return "redirect:"+Global.getAdminPath()+"/screen/gScreen/?repage";
	}
	@RequestMapping(value = "preLook")
	public String preLook(@RequestParam(required=false) String id, Model model) {
//		//先把现在可用模板置为无效
//		gScreenService.updateStatus();
//		//再设置新模板
		GScreen gScreen=gScreenService.get(id);
//		gScreen.setTemplateStatus("1");
//		gScreenService.save(gScreen);
		Map<String,Map<String,String>> map= (Map) JsonMapper.fromJsonString(gScreen.getExtends1(),Map.class);
		if(map!=null){
			for (Map.Entry<String,Map<String,String>> entry : map.entrySet()) {
				System.out.println("Key = " + entry.getKey() + ", Value = " + entry.getValue());
				Map<String,String> maps=entry.getValue();
				for(Map.Entry<String,String> entrys : maps.entrySet()){
					if(entry.getKey().equals("chang1")){
						gScreen.setChangeFd1(entrys.getKey());
						gScreen.setChangePl1(entrys.getValue());
					}else if(entry.getKey().equals("chang2")){
						gScreen.setChangeFd2(entrys.getKey());
						gScreen.setChangePl2(entrys.getValue());
					}else if(entry.getKey().equals("chang3")){
						gScreen.setChangeFd3(entrys.getKey());
						gScreen.setChangePl3(entrys.getValue());
					}
				}
			}
		}
		Map bussinessMap= (Map) JsonMapper.fromJsonString(gScreen.getRegionBusinessTop(),LinkedHashMap.class);
		Map moneyMap= (Map) JsonMapper.fromJsonString(gScreen.getRegionMoneyTop(),LinkedHashMap.class);
		Map onlieMap= (Map) JsonMapper.fromJsonString(gScreen.getTradeOnlineCharts(),LinkedHashMap.class);
		Map cloudMap= (Map) JsonMapper.fromJsonString(gScreen.getCloudSoftTop(),LinkedHashMap.class);
		model.addAttribute("gScreen", gScreen);
		model.addAttribute("bussinessMap", bussinessMap);
		model.addAttribute("moneyMap", moneyMap);
		model.addAttribute("onlieMap", onlieMap);
		model.addAttribute("cloudMap", cloudMap);
		return "modules/screen/gscreen/preGScreen";
	}
private static String  getJson(String [] name,String [] value){
	Map map = new LinkedHashMap();//定义一个map集合
	for (int i=0;i<name.length;i++){
		map.put(name[i],value[i]);//map集合添加数据
	}
	return JsonMapper.toJsonString(map);
}
private static Map<String,String> getMap(String str1,String str2){
	Map<String,String> map=new HashMap<String, String>();
	map.put(str1,str2);
	return map;
}
	@RequestMapping(value = "viewPMT")
	public String viewPMT(Model model, RedirectAttributes redirectAttributes) {

		return "modules/screen/gscreen/viewPMT";


	}
}