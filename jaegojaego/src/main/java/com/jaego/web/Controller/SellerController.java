//박진우 : 판매자 컨트롤러
package com.jaego.web.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.jaego.web.VO.Seller;
import com.jaego.web.DAO.SellerDAO;
import com.jaego.web.Util.FileService;

@Controller
public class SellerController {
	
	@Autowired
	private SellerDAO dao;	

	final String uploadPath = "/sellerShopOimg";		//업로드시 저장 폴더 설정 (C:\sellerShopOimg 이런 식으로 폴더 생성함)

	@RequestMapping(value="sellerJoinForm", method = RequestMethod.GET)
	public String sellerJoinForm() {
		return "./Seller/sellerJoinForm";
	}

	@RequestMapping(value="sellerMap", method = RequestMethod.GET)
	public String sellerMap() {
		return "./Seller/sellerMap";
	}

	@RequestMapping(value="sellerJoin", method = RequestMethod.POST)
	public String sellerJoin(Seller seller, MultipartFile upload) {
	
		//파일 업로드 위한 코드
		if (!upload.isEmpty()) {		//★ upload는 null로 체크가 불가능! (그래서 isEmpty()라는 함수 사용)
			String savedfile = FileService.saveFile(upload, uploadPath);	//FileService는 Static으로 등록됐기 때문에 이렇게 '.함수명' 형식으로 saveFile()을 사용할 수 있음
																			//실질적인 파일 업로드 처리는 이 FileService에서 다~~ 해주고 있음

//			board.setOriginalfile(upload.getOriginalFilename());
			seller.setSellerShopOimg(upload.getOriginalFilename());
			System.out.println("sellerShopOimg : " + upload.getOriginalFilename());

//			board.setSavedfile(savedfile);
			seller.setSellerShopSimg(savedfile);
			System.out.println("sellerShopSimg : " + savedfile);

			System.out.println(seller);

		}
		
		dao.addSeller(seller);
		return "./Seller/sellerJoin";		//Q) redirect로 바꿀까...

	}



}