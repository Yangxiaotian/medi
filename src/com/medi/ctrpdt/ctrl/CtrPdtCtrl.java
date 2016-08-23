package com.medi.ctrpdt.ctrl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.enjoyun.bmc.common.util.WebUtil;
import com.enjoyun.bmc.core.service.CoreService;
import com.medi.ctrpdt.service.CtrPdtService;

@Controller(value = "com.XXX.ctrl.CtrPdtCtrl")
@RequestMapping("medi-ctr/ctrpdt")
public class CtrPdtCtrl {
	@Autowired
	private CtrPdtService ctrPdtService;
	@Autowired
	private CoreService aCoreService;
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> list(
		@RequestParam(value = "id", required = false) Integer id,
		@RequestParam(value = "name", required = false) String name,
		@RequestParam(value = "ono", required = false) String ono,
		@RequestParam(value = "start", required = false) Integer start,
		@RequestParam(value = "limit", required = false) Integer limit
	) {
		try {
			aCoreService.assertFunctionAuth("");
			if (ono == null) {
				ono = aCoreService.getMyOno();
			}
			return WebUtil.getSuccessMap(ctrPdtService.getCtrPdtList(id, name, ono, start, limit), ctrPdtService.getCtrPdtCount(name, ono));
		} catch(Exception e) {
			return WebUtil.getFailureMap(e.getMessage());
		}
	}
}