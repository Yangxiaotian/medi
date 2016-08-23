package com.medi.ctrpdt.dao;

import java.util.List;
import java.util.Map;

import com.medi.ctrpdt.model.CtrPdt;

public interface CtrPdtDao {
	/**
	 * 获取总数
	 * @author 杨笑天
	 */
	public int getCtrPdtCount(Map<String,Object> p);
	/**
	 * 获取列表
	 * @author 杨笑天
	 */
	public List<CtrPdt> getCtrPdtList(Map<String,Object> p);
	/**
	 * 新增
	 * @author 杨笑天
	 */
	public void addCtrPdt(CtrPdt ctrPdt);
	/**
	 * 更新
	 * @author 杨笑天
	 */
	public void updateCtrPdt(CtrPdt ctrPdt);
	/**
	 * 删除
	 * @author 杨笑天
	 */
	public int delCtrPdt(Map<String,Object> p);
}
