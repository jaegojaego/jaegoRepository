//20170406 박진우 : 게시판 컨트롤러
package com.jaego.web.Controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jaego.web.DAO.CSBoardDAO;
import com.jaego.web.Util.PageNavigator;
import com.jaego.web.VO.CSBoard;

@Controller
public class CSBoardController {

	final int countPerPage = 10;		//페이지당 글 수 : 10개씩 보여줄 것
	final int pagePerGroup = 5;			//페이지 이동 그룹당 표시할 페이지 수

	@Autowired
	private CSBoardDAO dao;

	@RequestMapping(value="csboardlist", method=RequestMethod.GET)
	public String csboardlist(Model model, @RequestParam(value="page",defaultValue="1") int page, @RequestParam(value="searchText", defaultValue="") String searchText/*검색값이 넘어올 수도, 안 넘어올 수도 있으므로 searchText의 기본값을 빈 값으로 설정*/) {
																/*page라고 들어온 값이 있으면 그걸 주고, 없으면 기본값으로 1을 줌*/
																/*RequestParam에 설정한 내용이 int page로 들어감*/



		int total = dao.getAllCount(searchText);		//전체 글 개수 가져오는 명령어
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total);		//★ 이 navi만 있으면 페이징을 처리하는 데에 필요한 모든 정보가 있음 ← 이걸 model에 세팅!
		System.out.println(navi);



		ArrayList<CSBoard> csbList = dao.getAll(navi.getStartRecord()/*첫 번째 글번호*/, navi.getCountPerPage()/*페이지당 글 수*/, searchText/*검색 기능 추가를 위한 새 매개변수*/);			//← 페이징에 맞춰서 가져오도록 변경		
		//↑ navi.getStartRecord()와 navi.getCountPerPage() 대신 RowBounds를 여기서 생성해서 바로 넘겨도 됨(매개변수가 헷갈린다면...) : 하지만 Controller는 가능하면 페이지를 돌려주는 역할만 맡기기 위해 RowBounds를 BoardDao에서 생성하는 것!



		model.addAttribute("navi", navi);		//실제 페이징 처리를 위해 navi를 model에 attribute함
		model.addAttribute("csbList", csbList);
		model.addAttribute("searchText", searchText);
		return "/CSBoard/csboardlist";
	}

	@RequestMapping(value="csboardWriteForm", method=RequestMethod.GET)
	public String csboardWriteForm() {
		return "CSBoard/csboardWriteForm";
	}

	@RequestMapping(value="write", method=RequestMethod.POST)
	public String csboardWrite(CSBoard csboard, HttpSession session) {
		String custid = (String)session.getAttribute("custid");
		String type = (String)session.getAttribute("type");
		csboard.setId(custid);
		csboard.setType(type);
		dao.write(csboard);
		return "redirect:csboardlist";
	}
	
}