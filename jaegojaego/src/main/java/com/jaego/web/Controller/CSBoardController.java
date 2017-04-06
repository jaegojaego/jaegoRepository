//20170406 박진우 : 게시판 컨트롤러
package com.jaego.web.Controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jaego.web.DAO.CSBoardDAO;
import com.jaego.web.VO.CSBoard;

@Controller
public class CSBoardController {

	@Autowired
	private CSBoardDAO dao;
	
	@RequestMapping(value="csboardlist", method=RequestMethod.GET)
	public String csboardlist(Model model) {
		ArrayList<CSBoard> csbList = dao.getAll();
		model.addAttribute("csbList", csbList);		
		return "CSBoard/csboardlist";
	}

	@RequestMapping(value="csboardWriteForm", method=RequestMethod.GET)
	public String csboardWriteForm() {
		return "CSBoard/csboardWriteForm";
	}

	@RequestMapping(value="write", method=RequestMethod.POST)
	public String csboardWrite(CSBoard csboard, HttpSession session) {
		String custid = (String)session.getAttribute("custid");
		csboard.setId(custid);
		dao.write(csboard);
		return "redirect:csboardlist";
	}
	
}