/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/xla/csgame">csgame</a> All rights reserved.
 */
package com.csgame.modules.oa.dao;
import java.util.List;
import java.util.Map;

import org.restlet.resource.Get;

import com.csgame.common.persistence.CrudDao;
import com.csgame.common.persistence.annotation.MyBatisDao;
import com.csgame.modules.oa.entity.OaNotify;

/**
 * 通知通告DAO接口
 * @author xla
 * @version 2014-05-16
 */
@MyBatisDao
public interface OaNotifyDao extends CrudDao<OaNotify> {
	
	/**
	 * 获取通知数目
	 * @param oaNotify
	 * @return
	 */
	public Long findCount(OaNotify oaNotify);
	public List<OaNotify> findPicture(OaNotify oaNotify);
	public List<OaNotify> showNotify(Map<String, String> id);
	
}