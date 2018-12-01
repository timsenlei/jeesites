package com.thinkgem.jeesite.modules.screen.web;

import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.modules.screen.entity.EScreenChildred;
import com.thinkgem.jeesite.modules.screen.entity.EScreenParent;
import com.thinkgem.jeesite.modules.screen.entity.GScreen;
import com.thinkgem.jeesite.modules.screen.entity.PPTControl;
import com.thinkgem.jeesite.modules.screen.service.EScreenChildredService;
import com.thinkgem.jeesite.modules.screen.service.EScreenParentService;
import com.thinkgem.jeesite.modules.screen.service.GScreenService;
import com.thinkgem.jeesite.modules.screen.service.PPTControlService;
import com.thinkgem.jeesite.modules.sys.entity.Dict;
import com.thinkgem.jeesite.modules.sys.service.DictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "${adminPaths}/checkscreen/query")
public class CheckScreenController {
    @Autowired
    private GScreenService gScreenService;
    @Autowired
    private PPTControlService pPTControlService;
    @Autowired
    private DictService dictService;
    @Autowired
    private EScreenParentService eScreenParentService;
    @Autowired
    private EScreenChildredService eScreenChildredService;
    @RequestMapping(value = "/preLook/E")
    public String preLook(@RequestParam(required=false) String id, Model model) {
        GScreen gScreen=gScreenService.selectForScreen();
        Map bussinessMap= (Map) JsonMapper.fromJsonString(gScreen.getRegionBusinessTop(),LinkedHashMap.class);
        Map moneyMap= (Map) JsonMapper.fromJsonString(gScreen.getRegionMoneyTop(),LinkedHashMap.class);
        Map onlieMap= (Map) JsonMapper.fromJsonString(gScreen.getTradeOnlineCharts(),LinkedHashMap.class);
        Map cloudMap= (Map) JsonMapper.fromJsonString(gScreen.getCloudSoftTop(),LinkedHashMap.class);
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
        model.addAttribute("bussinessMap", bussinessMap);
        model.addAttribute("moneyMap", moneyMap);
        model.addAttribute("onlieMap", onlieMap);
        model.addAttribute("cloudMap", cloudMap);
        return "modules/screen/gscreen/preGScreen";
    }
      @RequestMapping(value = "/pptpre/{sceen}" ,method=RequestMethod.GET)
    public String pptpre(@PathVariable("sceen") String sceen, Model model) {
        Dict dict= dictService.findTypeByType("g_screen");
        if(sceen.equals("G")&&dict.getValue().equals("1")){
            List<EScreenParent> eScreenParentList=eScreenParentService.queryParent();
            model.addAttribute("eScreenParentList", eScreenParentList);
            return "modules/screen/escreen/firstScreen";
        }else{
            PPTControl entity= pPTControlService.searchPPT(sceen);
            entity.setImgurl(entity.getImgurl().replaceAll("/_thumbs/images","/images"));
            model.addAttribute("pPTControl", entity);
            return "modules/screen/ppt/ppt";
        }
    }
    @RequestMapping(value = "/pptprecontrol/{sceen}")
    public String pptprecontrol(@PathVariable("sceen") String sceen, Model model) {
            PPTControl entity= pPTControlService.searchPPT(sceen);
            model.addAttribute("pPTControl", entity);
             return "modules/screen/ppt/backControl";
        }
    @RequestMapping(value = "secondPage")
    public String secondPage(@RequestParam(required=false) String parentId,@RequestParam(required=false) String companys, HttpServletRequest request, HttpServletResponse response, Model model) {

        EScreenParent entity = eScreenParentService.get(parentId);
        List<EScreenParent> eScreenParentList=eScreenParentService.querySecond(parentId);
        model.addAttribute("eScreenParentList", eScreenParentList);
        model.addAttribute("companys", companys);
        model.addAttribute("entity", entity);
        return "modules/screen/escreen/secondScreen";
    }
    @RequestMapping(value = "thirdPage")
    public String thirdPage(@RequestParam(required=false) String parentId, @RequestParam(required=false) String id,@RequestParam(required=false) String companys, @RequestParam(required=false) String imgUrl, @RequestParam(required=false) String businessName,HttpServletRequest request, HttpServletResponse response, Model model) {
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
        model.addAttribute("companys", companys);
        return "modules/screen/escreen/thirdScreen";
    }
    @RequestMapping(value ="firstPage")
    public String firstPage(EScreenParent eScreenParent, HttpServletRequest request, HttpServletResponse response, Model model) {
        List<EScreenParent> eScreenParentList=eScreenParentService.queryParent();
        model.addAttribute("eScreenParentList", eScreenParentList);
        return "modules/screen/escreen/firstScreen";
    }
}
