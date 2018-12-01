/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.screen.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.common.persistence.DataEntity;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotNull;
import java.util.Date;

/**
 * eScreenEntity
 * @author zl
 * @version 2018-10-16
 */
public class EScreenParent extends DataEntity<EScreenParent> {
	
	private static final long serialVersionUID = 1L;
	private String imgUrl;		// img_url
	private String businessName;		// business_name
	private EScreenParent parent;		// parent_id
	private String ifIsParent;		// if_is_parent
	private String status;		// status
	private Date updatDate;		// updat_date
	private String companys;

	public String getCompanys() {
		return companys;
	}

	public void setCompanys(String companys) {
		this.companys = companys;
	}

	public EScreenParent() {
		super();
	}

	public EScreenParent(String id){
		super(id);
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	
	@Length(min=0, max=100, message="business_name长度必须介于 0 和 100 之间")
	public String getBusinessName() {
		return businessName;
	}

	public void setBusinessName(String businessName) {
		this.businessName = businessName;
	}
	
	@JsonBackReference
	public EScreenParent getParent() {
		return parent;
	}

	public void setParent(EScreenParent parent) {
		this.parent = parent;
	}
	
	@Length(min=0, max=2, message="if_is_parent长度必须介于 0 和 2 之间")
	public String getIfIsParent() {
		return ifIsParent;
	}

	public void setIfIsParent(String ifIsParent) {
		this.ifIsParent = ifIsParent;
	}
	
	@Length(min=0, max=2, message="status长度必须介于 0 和 2 之间")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getUpdatDate() {
		return updatDate;
	}

	public void setUpdatDate(Date updatDate) {
		this.updatDate = updatDate;
	}
	
}