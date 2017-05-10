//박진우 : 판매자   컨트롤러
//권록헌 : 판매자 정보수정
package com.jaego.web.Controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jaego.web.DAO.BuyerDAO;
import com.jaego.web.DAO.GoodsDao;
import com.jaego.web.DAO.SellerDAO;
import com.jaego.web.Util.FileService;
import com.jaego.web.VO.Buyer;
import com.jaego.web.VO.Goods;
import com.jaego.web.VO.Seller;

@Controller
public class SellerController {

	@Autowired
	private SellerDAO sdao;

	@Autowired
	private BuyerDAO bdao;

	@Autowired
	GoodsDao gdao; // 20170425 박진우

	final String uploadPath = "/sellerShopOimg"; // 업로드시 저장 폴더 설정
													// (C:\sellerShopOimg 이런 식으로
													// 폴더 생성함)

	// 박진우 - 20170329 회원가입 : 부트스트랩 적용
	@RequestMapping(value = "sellerJoinForm", method = RequestMethod.GET)
	public String sellerJoinForm() {
		return "./Seller/sellerJoinForm";
	}

	// 박진우 - ID 체크 폼 불러오기
	@RequestMapping(value = "sellerIDcheck", method = RequestMethod.GET)
	public String sellerIDcheck() {
		return "./Seller/sellerIDcheck";
	}

	// 박진우 - 실제 ID 체크(DB 조회)
	@ResponseBody // ★ Ajax 통신에서는 이 @ResponseBody를 붙여줘야 함!
	@RequestMapping(value = "sellerIDcheck", method = RequestMethod.POST)
	public Seller sellerIDcheck(String idcheck_to_ctr) {
		Seller seller = sdao.selectOne(idcheck_to_ctr);

		// Seller도 체크하고, Buyer도 체크
		if (seller == null) {
			Buyer buyer = bdao.selectOne(idcheck_to_ctr);
			if (buyer != null) {
				Seller s = new Seller();
				s.setSellerId(buyer.getBuyerId());
				return s;
			}
		}
		return seller;
	}

	// 박진우 - 20170320 : 판매자 가입
	@RequestMapping(value = "sellerJoin", method = RequestMethod.POST)
	public String sellerJoin(Seller seller, MultipartFile upload) {

		// 파일 업로드 위한 코드
		if (!upload.isEmpty()) { // ★ upload는 null로 체크가 불가능! (그래서 isEmpty()라는 함수
									// 사용)
			String savedfile = FileService.saveFile(upload, uploadPath); // FileService는
																			// Static으로
																			// 등록됐기
																			// 때문에
																			// 이렇게
																			// '.함수명'
																			// 형식으로
																			// saveFile()을
																			// 사용할
																			// 수
																			// 있음
			// 실질적인 파일 업로드 처리는 이 FileService에서 다~~ 해주고 있음
			seller.setSellerShopOimg(upload.getOriginalFilename());
			seller.setSellerShopSimg(savedfile);
		}
		sdao.addSeller(seller);
		return "./Seller/sellerJoin"; // Q) redirect로 바꿀까...
	}
	// 수정 20170405권록헌

	@RequestMapping(value = "sellerupdate", method = RequestMethod.GET)
	public String sellerupdate(HttpSession session, /* String sellerId, */Model model) {

		String sellerId = (String) session.getAttribute("custid");
		Seller seller = sdao.selectOne(sellerId);
		model.addAttribute("seller", seller);

		
		return "./Seller/sellerupdateForm";
	}

	@RequestMapping(value = "sellerupdatePJW", method = RequestMethod.GET)
	public String sellerupdatePJW(HttpSession session, /* String sellerId, */Model model) {

		String sellerId = (String) session.getAttribute("custid");
		Seller seller = sdao.selectOne(sellerId);
		model.addAttribute("seller", seller);

		
		return "./Seller/sellerupdateFormPJW";
	}

	@RequestMapping(value = "sellerupdateForm", method = RequestMethod.POST)
	public String rgoodsupdate(Seller seller, HttpSession session, MultipartFile upload, Model model) {

		
		// 기존에첨부파일있다면 기존에파일을지우는것
		// 새로파일을 작성
		String id = seller.getSellerId();
		String savefile = sdao.selectOne(id).getSellerShopSimg();
		if (!upload.isEmpty()) {

			// 업로드된 파일삭제

			FileService.deleteFile(uploadPath + "/" + savefile);// upload 실제
																// 저장된경로
																// savefile파일이름과
																// 확장자

			savefile = FileService.saveFile(upload, uploadPath);

			seller.setSellerShopOimg(upload.getOriginalFilename());
			seller.setSellerShopSimg(savefile);

		}
		sdao.updateSeller(seller);
		session.removeAttribute("name");

		session.setAttribute("name", seller.getSellerName());

		// 20170425 박진우
		// 날짜 띄우기
		SimpleDateFormat today = new SimpleDateFormat("yyyy년 MM월 dd일");
		String todate = today.format(new Date());
		model.addAttribute("todate", todate);

		// 목록 가져오기
		String sellerId = (String) session.getAttribute("custid");
		String sellerCRN = gdao.sellerCRN(sellerId);
		ArrayList<Goods> result = gdao.list(sellerCRN);
		
		model.addAttribute("list", result);

		return "./goods/goodslist";
	}

	// 업소사진미리보기
	@RequestMapping(value = "sellerdownload", method = RequestMethod.GET)
	public void download(String sellerId, HttpServletResponse response) {
		Seller seller = sdao.selectPic1(sellerId);
		try {
			response.setHeader("Content-Disposition",
					"attachment;filename=" + URLEncoder.encode(seller.getSellerShopOimg(), "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 저장된 파일 경로
		String fullPath = uploadPath + "/" + seller.getSellerShopSimg();
		// 서버의 파일을 읽을 입력 스트림
		// 클라이언트에게 전달할 출력 스트림
		FileInputStream fis = null;
		ServletOutputStream sos = null;
		try {
			fis = new FileInputStream(fullPath);
			sos = response.getOutputStream();
			// Spring 파일 관련 유틸
			FileCopyUtils.copy(fis, sos);
			fis.close();
			sos.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
}
