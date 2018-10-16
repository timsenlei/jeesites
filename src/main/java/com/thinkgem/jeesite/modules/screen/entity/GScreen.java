/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.screen.entity;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import org.hibernate.validator.constraints.Length;

/**
 * testEntity
 * @author zl
 * @version 2018-10-14
 */
public class GScreen extends DataEntity<GScreen> {
	
	private static final long serialVersionUID = 1L;
	private Long consumerSum;		// 用户总数
	private Long enterpriseSum;		// 企业总数
	private String sumOfMoney;		// 总金额
	private String regionMoneyTop;		// 区域金额前几名
	private String regionBusinessTop;		// 区域上线商家top
	private String tradeOnlineCharts;		// 线上交易排行榜
	private String coreArea;		// 核心区域
	private String cloudSoftTop;		// 云上软件园top
	private String searchHotWords;		// 热词
	private String extends1;		// extends1
	private String extends2;		// extends2
	private String templateName;		// 模板名称
	private String templateStatus;		// 模板状态1.有效 0无效
	private String[] regionMoneyTopName ;
	private String[] regionMoneyTopValue ;
	private String[] regionBusinessName;
	private String[] regionBusinessValue;
	private String[] tradeOnlineChartsName;
	private String[] tradeOnlineChartsValue;
	private String[] cloudSoftTopName;
	private String[] cloudSoftTopValue;
	public GScreen() {
		super();
	}

	public GScreen(String id){
		super(id);
	}

	public Long getConsumerSum() {
		return consumerSum;
	}

	public void setConsumerSum(Long consumerSum) {
		this.consumerSum = consumerSum;
	}
	
	public Long getEnterpriseSum() {
		return enterpriseSum;
	}

	public void setEnterpriseSum(Long enterpriseSum) {
		this.enterpriseSum = enterpriseSum;
	}
	
	public String getSumOfMoney() {
		return sumOfMoney;
	}

	public void setSumOfMoney(String sumOfMoney) {
		this.sumOfMoney = sumOfMoney;
	}
	
	@Length(min=0, max=1000, message="区域金额前几名长度必须介于 0 和 1000 之间")
	public String getRegionMoneyTop() {
		return regionMoneyTop;
	}

	public void setRegionMoneyTop(String regionMoneyTop) {
		this.regionMoneyTop = regionMoneyTop;
	}
	
	@Length(min=0, max=1000, message="区域上线商家top长度必须介于 0 和 1000 之间")
	public String getRegionBusinessTop() {
		return regionBusinessTop;
	}

	public void setRegionBusinessTop(String regionBusinessTop) {
		this.regionBusinessTop = regionBusinessTop;
	}
	
	@Length(min=0, max=1000, message="线上交易排行榜长度必须介于 0 和 1000 之间")
	public String getTradeOnlineCharts() {
		return tradeOnlineCharts;
	}

	public void setTradeOnlineCharts(String tradeOnlineCharts) {
		this.tradeOnlineCharts = tradeOnlineCharts;
	}
	
	@Length(min=0, max=1000, message="核心区域长度必须介于 0 和 1000 之间")
	public String getCoreArea() {
		return coreArea;
	}

	public void setCoreArea(String coreArea) {
		this.coreArea = coreArea;
	}
	
	@Length(min=0, max=1000, message="云上软件园top长度必须介于 0 和 1000 之间")
	public String getCloudSoftTop() {
		return cloudSoftTop;
	}

	public void setCloudSoftTop(String cloudSoftTop) {
		this.cloudSoftTop = cloudSoftTop;
	}
	
	@Length(min=0, max=1000, message="热词长度必须介于 0 和 1000 之间")
	public String getSearchHotWords() {
		return searchHotWords;
	}

	public void setSearchHotWords(String searchHotWords) {
		this.searchHotWords = searchHotWords;
	}
	
	@Length(min=0, max=255, message="extends1长度必须介于 0 和 255 之间")
	public String getExtends1() {
		return extends1;
	}

	public void setExtends1(String extends1) {
		this.extends1 = extends1;
	}
	
	@Length(min=0, max=255, message="extends2长度必须介于 0 和 255 之间")
	public String getExtends2() {
		return extends2;
	}

	public void setExtends2(String extends2) {
		this.extends2 = extends2;
	}
	
	@Length(min=0, max=200, message="模板名称长度必须介于 0 和 200 之间")
	public String getTemplateName() {
		return templateName;
	}

	public void setTemplateName(String templateName) {
		this.templateName = templateName;
	}

	@Length(min=0, max=200, message="模板名称长度必须介于 0 和 200 之间")
	public String getTemplateStatus() {
		return templateStatus;
	}

	public void setTemplateStatus(String templateStatus) {
		this.templateStatus = templateStatus;
	}

	public String[] getRegionMoneyTopName() {
		return regionMoneyTopName;
	}

	public void setRegionMoneyTopName(String[] regionMoneyTopName) {
		this.regionMoneyTopName = regionMoneyTopName;
	}

	public String[] getRegionMoneyTopValue() {
		return regionMoneyTopValue;
	}

	public void setRegionMoneyTopValue(String[] regionMoneyTopValue) {
		this.regionMoneyTopValue = regionMoneyTopValue;
	}

	public String[] getRegionBusinessName() {
		return regionBusinessName;
	}

	public void setRegionBusinessName(String[] regionBusinessName) {
		this.regionBusinessName = regionBusinessName;
	}

	public String[] getRegionBusinessValue() {
		return regionBusinessValue;
	}

	public void setRegionBusinessValue(String[] regionBusinessValue) {
		this.regionBusinessValue = regionBusinessValue;
	}

	public String[] getTradeOnlineChartsName() {
		return tradeOnlineChartsName;
	}

	public void setTradeOnlineChartsName(String[] tradeOnlineChartsName) {
		this.tradeOnlineChartsName = tradeOnlineChartsName;
	}

	public String[] getTradeOnlineChartsValue() {
		return tradeOnlineChartsValue;
	}

	public void setTradeOnlineChartsValue(String[] tradeOnlineChartsValue) {
		this.tradeOnlineChartsValue = tradeOnlineChartsValue;
	}

	public String[] getCloudSoftTopName() {
		return cloudSoftTopName;
	}

	public void setCloudSoftTopName(String[] cloudSoftTopName) {
		this.cloudSoftTopName = cloudSoftTopName;
	}

	public String[] getCloudSoftTopValue() {
		return cloudSoftTopValue;
	}

	public void setCloudSoftTopValue(String[] cloudSoftTopValue) {
		this.cloudSoftTopValue = cloudSoftTopValue;
	}
}