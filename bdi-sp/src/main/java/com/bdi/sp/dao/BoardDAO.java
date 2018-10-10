package com.bdi.sp.dao;

import java.util.List;

import com.bdi.sp.vo.BoardInfo;

public interface BoardDAO {

	public List<BoardInfo> getBoardList(BoardInfo bi);
	public int boardDelete(int binum); 
	
	public int boardUpdate(BoardInfo bi);
	public int boardInsert(BoardInfo bi);
}
