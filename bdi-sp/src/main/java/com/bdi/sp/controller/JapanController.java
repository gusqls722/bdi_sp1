package com.bdi.sp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bdi.sp.dao.JapanDAO;
import com.bdi.sp.vo.Japan;

@Controller
public class JapanController {
	
	@Autowired
	private JapanDAO jdao;
	
	// 전체 리스트
	@RequestMapping(value="/japan",method=RequestMethod.GET)
	public @ResponseBody List<Japan> japanList(@ModelAttribute Japan jp) {
		return jdao.getJapanList(jp);
	}
	
	// 리스트
	@RequestMapping(value="/japan/{jpnum}", method=RequestMethod.GET)
	public @ResponseBody Japan japan(@PathVariable int jpnum) {
		return jdao.getJapan(jpnum);
	}
	
	// 리스트삭제
	@RequestMapping(value="/japan/{jpnum}",method=RequestMethod.DELETE)
	public @ResponseBody String deleteJapan(@PathVariable int jpnum) {
		return jdao.deleteJapan(jpnum)+"";
	}
	
	// 리스트 추가
	@RequestMapping(value="/japan",method=RequestMethod.POST)
	public @ResponseBody String insertJapan(@RequestBody Japan jp) {
		return jdao.insertJapan(jp)+"";
	}
	
	// 리스트 수정
	@RequestMapping(value="/japan",method=RequestMethod.PUT)
	public @ResponseBody String updateJapan(@RequestBody Japan jp) {
		System.out.println(jp);
		return jdao.updateJapan(jp) + "";
	}

}
