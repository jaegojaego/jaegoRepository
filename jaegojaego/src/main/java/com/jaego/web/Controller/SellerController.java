//박진우 : 판매자 컨트롤러
package com.jaego.web.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jaego.web.VO.Seller;
import com.jaego.web.DAO.SellerDAO;
import com.jaego.web.Util.FileService;

@Controller
public class SellerController {
	
	@Autowired
	private SellerDAO dao;	

	final String uploadPath = "/sellerShopOimg";		//업로드시 저장 폴더 설정 (C:\sellerShopOimg 이런 식으로 폴더 생성함)



	//20170329 부트스트랩 적용 테스트
	@RequestMapping(value="form_elements", method = RequestMethod.GET)
	public String tables_basic() {
		return "./Seller/form_elements";
	}



	@RequestMapping(value="sellerJoinForm", method = RequestMethod.GET)
	public String sellerJoinForm() {
		return "./Seller/sellerJoinForm";
	}

	@RequestMapping(value="sellerMap", method = RequestMethod.GET)
	public String sellerMap() {
		return "./Seller/sellerMap";
	}
	
	//ID 체크 폼 불러오기
	@RequestMapping(value="sellerIDcheck",method=RequestMethod.GET)
	public String sellerIDcheck() {
		return "./Seller/sellerIDcheck";
	}
	
	//실제 ID 체크(DB 조회)
	@ResponseBody		//★ Ajax 통신에서는 이 @ResponseBody를 붙여줘야 함!
	@RequestMapping(value="sellerIDcheck",method=RequestMethod.POST)
	public Seller sellerIDcheck(String idcheck_to_ctr) {
		Seller seller = dao.selectOne(idcheck_to_ctr);
		return seller;
	}

	//20170320 : 판매자 가입
	@RequestMapping(value="sellerJoin", method = RequestMethod.POST)
	public String sellerJoin(Seller seller, MultipartFile upload) {
		System.out.println(seller);
	
		//파일 업로드 위한 코드
		if (!upload.isEmpty()) {		//★ upload는 null로 체크가 불가능! (그래서 isEmpty()라는 함수 사용)
			String savedfile = FileService.saveFile(upload, uploadPath);	//FileService는 Static으로 등록됐기 때문에 이렇게 '.함수명' 형식으로 saveFile()을 사용할 수 있음
																			//실질적인 파일 업로드 처리는 이 FileService에서 다~~ 해주고 있음
			seller.setSellerShopOimg(upload.getOriginalFilename());
			seller.setSellerShopSimg(savedfile);
		}
		dao.addSeller(seller);
		return "./Seller/sellerJoin";		//Q) redirect로 바꿀까...

	}

}