package com.bdi.sp.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bdi.sp.dao.BoardDAO;
import com.bdi.sp.vo.BoardInfo;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	private SqlSession ss;

	
	@Override
	public List<BoardInfo> getBoardList(BoardInfo bi) {
		// TODO Auto-generated method stub
		return ss.selectList("SQL.BOARDINFO.selectBoardInfo", bi);
	}

	@Override
	public int boardDelete(int binum) {
		// TODO Auto-generated method stub
		return ss.delete("SQL.BOARDINFO.boardDelete", binum);
	}

	@Override
	public int boardUpdate(BoardInfo bi) {
		// TODO Auto-generated method stub
		return ss.update("SQL.BOARDINFO.boardUpdate", bi);
	}

	@Override
	public int boardInsert(BoardInfo bi) {
		// TODO Auto-generated method stub
		return ss.insert("SQL.BOARDINFO.boardInsert", bi);
	}

}
