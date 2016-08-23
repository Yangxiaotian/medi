package com.medi.ctrpdt.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.medi.ctrpdt.dao.CtrPdtDao;
import com.medi.ctrpdt.model.CtrPdt;

@Service(value = "com.medi.ctrpdt.service.CtrPdtService")
public class CtrPdtService {
	@Autowired
	private CtrPdtDao ctrPdtDao;
	/**
	 * 获取总数
	 * @author 杨笑天
	 */
	public int getCtrPdtCount(String name, String ono) {
		Map<String,Object> p = new HashMap<String,Object>();
		p.put("name", name);
		p.put("ono", ono);
		return ctrPdtDao.getCtrPdtCount(p);
	}
	/**
	 * 获取列表
	 * @author 杨笑天
	 */
	public List<CtrPdt> getCtrPdtList(Integer id, String name, String ono, Integer start, Integer limit) {
		Map<String,Object> p = new HashMap<String,Object>();
		p.put("id", id);
		p.put("name", name);
		p.put("ono", ono);
		p.put("start", start);
		p.put("limit", limit);
		return ctrPdtDao.getCtrPdtList(p);
	}
	/**
	 * 新增
	 * @author 杨笑天
	 */
	public void addCtrPdt(CtrPdt ctrPdt) {
		ctrPdtDao.addCtrPdt(ctrPdt);
	}
	/**
	 * 更新
	 * @author 杨笑天
	 */
	public void updateCtrPdt(CtrPdt ctrPdt) {
		ctrPdtDao.updateCtrPdt(ctrPdt);
	}
	/**
	 * 删除
	 * @author 杨笑天
	 */
	public void delCtrPdt(int id) {
		Map<String,Object> p = new HashMap<String,Object>();
		p.put("id", id);
		ctrPdtDao.delCtrPdt(p);
	}
}
