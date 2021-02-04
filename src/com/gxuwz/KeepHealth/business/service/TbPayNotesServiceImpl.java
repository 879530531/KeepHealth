package com.gxuwz.KeepHealth.business.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxuwz.KeepHealth.business.dao.TbPayNotesDAO;
import com.gxuwz.KeepHealth.business.entity.TbPayNotes;

@Service("tbPayNotesService")

public class TbPayNotesServiceImpl  implements TbPayNotesService{

	
	@Autowired
	private TbPayNotesDAO tbPayNotesDAO;
	/**
	 * 添加用户角色
	 * @param sysUserRole
	 */
	@Override
	public void addPayNotes(TbPayNotes tbPayNotes) {
		tbPayNotesDAO.save(tbPayNotes);
	}
	
}
