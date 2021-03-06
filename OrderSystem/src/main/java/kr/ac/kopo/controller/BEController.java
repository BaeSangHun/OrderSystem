package kr.ac.kopo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.kopo.model.BEsave;
import kr.ac.kopo.service.BEservice;

@Controller
@RequestMapping("/besave")
public class BEController {
	
	@Autowired
	BEservice service;
	
	@RequestMapping(value="/besave", method=RequestMethod.POST)
	@ResponseBody
	int BEDataAdd(BEsave besave, HttpSession session) {
		String username = (String)session.getAttribute("user");
		if(username!=null) {
			besave.setUsername(username);
			service.add(besave);
			return 1;
		}
		else {
			return 0;
		}
	}
	
}
