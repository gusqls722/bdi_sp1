package com.bdi.sp.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bdi.sp.dao.JapanDAO;
import com.bdi.sp.vo.Japan;

@Repository
public class JapanDAOImpl implements JapanDAO{

	@Autowired
	private SqlSession ss;
	
	@Override
	public List<Japan> getJapanList(Japan j) {
		return ss.selectList("SQL.JAPAN.selectJapan",j);
	}

	@Override
	public int deleteJapan(int jpnum) {
		return ss.delete("SQL.JAPAN.deleteJapan", jpnum);
	}

}
