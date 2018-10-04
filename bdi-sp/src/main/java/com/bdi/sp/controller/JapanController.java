package com.bdi.sp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bdi.sp.dao.JapanDAO;

@Controller
public class JapanController {
	
	@Autowired
	private JapanDAO jdao;
	
	@RequestMapping(value="/japan",method=RequestMethod.GET)
	public ModelAndView japanList() {
		ModelAndView mav = new ModelAndView("japan/list");
		mav.addObject("jList",jdao.getJapanList(null));
		return mav;
	}
	
	@RequestMapping(value="/japan/{jpnum}",method=RequestMethod.DELETE)
	public @ResponseBody String deleteJapan(@PathVariable int jpnum) {
		return jdao.deleteJapan(jpnum)+"";
		
	}
}
