//20170406 박진우 : 게시판 컨트롤러
package com.jaego.web.Controller;

import java.io.FileInputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.jaego.web.DAO.CSBoardDAO;
import com.jaego.web.Util.FileService;
import com.jaego.web.Util.PageNavigator;
import com.jaego.web.VO.CSBoard;

@Controller
public class CSBoardController {

	final int countPerPage = 10;				//페이지당 글 수 : 10개씩 보여줄 것
	final int pagePerGroup = 5;					//페이지 이동 그룹당 표시할 페이지 수
	final String uploadPath = "/CSBoardOimg";	//업로드시 저장 폴더 설정	

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
		model.addAttribute("total", total);		
		return "/CSBoard/csboardlist";
	}

	@RequestMapping(value="csboardWriteForm", method=RequestMethod.GET)
	public String csboardWriteForm() {
		return "CSBoard/csboardWriteForm";
	}

	@RequestMapping(value="write", method=RequestMethod.POST)
	public String csboardWrite(CSBoard csboard, HttpSession session, MultipartFile upload/* ★ 파일 업로드를 위한 매개변수 : 기존의 File 클래스와는 완전히 다른 클래스 */) {
		String custid = (String)session.getAttribute("custid");
		String type = (String)session.getAttribute("type");
		csboard.setId(custid);
		csboard.setType(type);
		
		//파일 업로드 위한 코드
		if (!upload.isEmpty()) {		//★ upload는 null로 체크가 불가능! (그래서 isEmpty()라는 함수 사용)
			String savedfile = FileService.saveFile(upload, uploadPath);	//FileService는 Static으로 등록됐기 때문에 이렇게 '.함수명' 형식으로 saveFile()을 사용할 수 있음
																			//실질적인 파일 업로드 처리는 이 FileService에서 다~~ 해주고 있음
			csboard.setOriginalfile(upload.getOriginalFilename());
			csboard.setSavedfile(savedfile);
		}
		
		dao.write(csboard);
		return "redirect:csboardlist";
	}

	@RequestMapping(value="read", method=RequestMethod.GET)
	public String read(int boardnum, Model model) {
		CSBoard csboard = dao.selectOne(boardnum);
		if (csboard == null) {
			return "redirect:csboardlist";
		}
		model.addAttribute("csboard", csboard);
		return "CSBoard/read";
	}
	
	@RequestMapping(value="csbdownload", method=RequestMethod.GET)
	public String download(int boardnum, HttpServletResponse response) {		//브라우저는 자신이 직접 열 수 없는 파일이면 무조건 다운로드시킴 : 이 원리를 이용! (브라우저에 전달만 시키면 됨)
		CSBoard csboard = dao.selectOne(boardnum);
		try {
			response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(csboard.getOriginalfile(),"UTF-8")/*UTF-8로 바꿔주기 위한 작업*/);	//대소문자 유의!
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String fullpath = uploadPath + "/" + csboard.getSavedfile();
		FileInputStream filein = null;			//서버가 파일을 읽을 입력 스트림
		ServletOutputStream fileout = null;		//클라이언트에게 전달할 출력 스트림
		try {
			filein = new FileInputStream(fullpath);
			fileout = response.getOutputStream();
			//Spring 파일 관련 유틸
			FileCopyUtils.copy(filein, fileout);	//InputStream에 있는 걸 OutputStream에 복사함
			filein.close();
			fileout.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;		//다운로드만 하고 그 페이지를 유지함
	}
	
}