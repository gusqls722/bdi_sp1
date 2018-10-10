package com.bdi.sp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bdi.sp.dao.BoardDAO;
import com.bdi.sp.dao.impl.BoardDAOImpl;
import com.bdi.sp.vo.BoardInfo;

@Controller
public class BoardInfoController {
	@Autowired
	private BoardDAO bdao;
	
	@RequestMapping (value="/board",method=RequestMethod.GET)
	public @ResponseBody List<BoardInfo> getSelectList(@ModelAttribute BoardInfo bi){
		return bdao.getBoardList(bi);
	}
	
	@RequestMapping (value="/board/{binum}", method=RequestMethod.DELETE)
	public @ResponseBody String boardDelete(@PathVariable int binum) {
		return bdao.boardDelete(binum) + "";
	}
	
	@RequestMapping(value="/board", method=RequestMethod.PUT)
	public @ResponseBody String boardUpdate(@RequestBody BoardInfo bi) {
		return bdao.boardUpdate(bi) + "";
	}
	
	@RequestMapping(value="/board", method=RequestMethod.POST)
	public @ResponseBody String boardInsert(@RequestBody BoardInfo bi) {
		return bdao.boardInsert(bi) + "";
	}
}
