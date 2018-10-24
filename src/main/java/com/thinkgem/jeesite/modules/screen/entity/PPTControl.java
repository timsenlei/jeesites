/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.screen.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.common.persistence.DataEntity;
import org.hibernate.validator.constraints.Length;

import java.util.Date;

/**
 * PPTEntity
 * @author zl
 * @version 2018-10-23
 */
public class PPTControl extends DataEntity<PPTControl> {
	
	private static final long serialVersionUID = 1L;
	private String imgurl;		// imgurl
	private String controlword;		// controlword
	private String status;		// status
	private Date creatdate;		// creatdate
	private Date updatedate;		// updatedate
	private String whichScreen;		// which_screen
	private String extends1;		// extends1
	private String extends2;		// extends2
	
	public PPTControl() {
		super();
	}

	public PPTControl(String id){
		super(id);
	}

	public String getImgurl() {
		return imgurl;
	}

	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}
	
	@Length(min=0, max=100, message="controlword长度必须介于 0 和 100 之间")
	public String getControlword() {
		return controlword;
	}

	public void setControlword(String controlword) {
		this.controlword = controlword;
	}
	
	@Length(min=0, max=2, message="status长度必须介于 0 和 2 之间")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getCreatdate() {
		return creatdate;
	}

	public void setCreatdate(Date creatdate) {
		this.creatdate = creatdate;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getUpdatedate() {
		return updatedate;
	}

	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}
	
	@Length(min=0, max=10, message="which_screen长度必须介于 0 和 10 之间")
	public String getWhichScreen() {
		return whichScreen;
	}

	public void setWhichScreen(String whichScreen) {
		this.whichScreen = whichScreen;
	}
	
	@Length(min=0, max=100, message="extends1长度必须介于 0 和 100 之间")
	public String getExtends1() {
		return extends1;
	}

	public void setExtends1(String extends1) {
		this.extends1 = extends1;
	}
	
	@Length(min=0, max=100, message="extends2长度必须介于 0 和 100 之间")
	public String getExtends2() {
		return extends2;
	}

	public void setExtends2(String extends2) {
		this.extends2 = extends2;
	}
	
}