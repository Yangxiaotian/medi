package com.medi.ctrpdt.model;

public class CtrPdt {
	private int id;//主键
	private String name;//对照品名称
	private String molecular;//分子式
	private String remark;//备注

	public void setId(int id) {
	        this.id = id;
	}
	public int getId() {
	        return id;
	}
	public void setName(String name) {
	        this.name = name;
	}
	public String getName() {
	        return name;
	}
	public void setMolecular(String molecular) {
	        this.molecular = molecular;
	}
	public String getMolecular() {
	        return molecular;
	}
	public void setRemark(String remark) {
	        this.remark = remark;
	}
	public String getRemark() {
	        return remark;
	}
}
