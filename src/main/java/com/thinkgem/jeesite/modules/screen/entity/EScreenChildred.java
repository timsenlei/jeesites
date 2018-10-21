/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.screen.entity;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import org.hibernate.validator.constraints.Length;

/**
 * 公司详细信息配置Entity
 * @author zl
 * @version 2018-10-16
 */
public class EScreenChildred extends DataEntity<EScreenChildred> {
	
	private static final long serialVersionUID = 1L;
	private String imgUrl;		// img_url
	private String companyName;		// company_name
	private String companyService;		// company_service
	private String companyAmount;		// company_amount
	private String companyPersonRece;		// company_person_rece
	private String companyProduct;		// company_product
	private String status;		// status
	private Long parentId;		// parent_id
	private String[] imgUrls;
	private String[] productNames;

	public String[] getImgUrls() {
		return imgUrls;
	}

	public void setImgUrls(String[] imgUrls) {
		this.imgUrls = imgUrls;
	}

	public String[] getProductNames() {
		return productNames;
	}

	public void setProductNames(String[] productNames) {
		this.productNames = productNames;
	}

	public EScreenChildred() {
		super();
	}

	public EScreenChildred(String id){
		super(id);
	}

	@Length(min=0, max=200, message="img_url长度必须介于 0 和 200 之间")
	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	
	@Length(min=0, max=100, message="company_name长度必须介于 0 和 100 之间")
	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	
	@Length(min=0, max=500, message="company_service长度必须介于 0 和 500 之间")
	public String getCompanyService() {
		return companyService;
	}

	public void setCompanyService(String companyService) {
		this.companyService = companyService;
	}
	
	public String getCompanyAmount() {
		return companyAmount;
	}

	public void setCompanyAmount(String companyAmount) {
		this.companyAmount = companyAmount;
	}
	
	@Length(min=0, max=100, message="company_person_rece长度必须介于 0 和 100 之间")
	public String getCompanyPersonRece() {
		return companyPersonRece;
	}

	public void setCompanyPersonRece(String companyPersonRece) {
		this.companyPersonRece = companyPersonRece;
	}
	
	@Length(min=0, max=2000, message="company_product长度必须介于 0 和 2000 之间")
	public String getCompanyProduct() {
		return companyProduct;
	}

	public void setCompanyProduct(String companyProduct) {
		this.companyProduct = companyProduct;
	}
	
	@Length(min=0, max=2, message="status长度必须介于 0 和 2 之间")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	public Long getParentId() {
		return parentId;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}
	
}