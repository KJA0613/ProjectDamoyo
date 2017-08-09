package com.bitschool.controller;

import java.io.File;
import java.util.Iterator;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.servlet.ServletRequestContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitschool.dto.CompanyDTO;
import com.bitschool.dto.PlaceDTO;
import com.bitschool.service.IPlaceService;

@RequestMapping("place")
@Controller
public class PlaceController {
	
	//----------------------------------------------- 설 정 -----------------------------------------------//
	
	// [로깅]
	private static final Logger logger = LoggerFactory.getLogger(MemberLoginController.class);
	
	// [주입] 서비스 인터페이스
	@Inject
	private IPlaceService placeService;	
	
	
	// ---------------------------------------- [광고주 회원] 공 간 등 록 ----------------------------------------//
	
	// 00. 모임공간 등록 폼 (Connection URL)
	@RequestMapping(value = "/PlaceRegistForm",  method = { RequestMethod.POST, RequestMethod.GET })
	public String PlaceRegistForm(HttpSession session, Model model) {
		String url = null;
	
		// 광고주 > 세션에 저장된 정보 가져오기
		CompanyDTO cdto = (CompanyDTO) session.getAttribute("cdto");	
	
		model.addAttribute("cdto", cdto);
		
		url = "place/PlaceRegistForm";
		
		return url;		
	}
	
	
	
	// 01. 모임 공간 등록 
	@RequestMapping(value = "/PlaceRegist",  method = RequestMethod.POST)
	public String PlaceRegist(PlaceDTO pl_dto, CompanyDTO cdto, HttpSession session, HttpServletRequest req, Model model) {
		String url = null;	
		boolean flag = false;

		// 광고주 > 세션에 저장된 정보 가져오기
		cdto = (CompanyDTO) session.getAttribute("cdto");
		
		// 세션에 저장된 광고주 ID > 모임장소 등록 테이블에 담기
		pl_dto.setComId(cdto.getComId());
		
		
		// 파일 > 실제 서버에 저장 (웹서비스 root 경로)
		// 저장할 파일의 상대 경로
		String aPath = req.getSession().getServletContext().getRealPath("/");
		System.out.println("aPath : " + aPath);										// D:\dev\spring_workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\DAMOYO_Project\
		String rPath =  "\\resources\\image\\place\\";								// 저장할 파일의 절대 경로		
		System.out.println("rPath : " + rPath);										// \resources\image\place\
		
		DiskFileItemFactory fac = new DiskFileItemFactory(); 						// 파일 업로드 핸들러를 생성
		ServletFileUpload sfu = new ServletFileUpload(fac); 						// 클라이언트로 부터 우리가 지정한 곳으로 연결시키는 역활
		sfu.setFileSizeMax(100*1024*1024);											// 업로드할 파일의 제한 크기를 정함
		sfu.setHeaderEncoding("UTF-8"); 											// 업로드할 파일을 UTF-8로 설정하여 글자가 깨지는것을 방지
 		String fileName = null;
 		
		try { 
			List<FileItem> list = sfu.parseRequest(new ServletRequestContext(req));
			Iterator<FileItem> iter = list.iterator(); // list를 FileItem의 Iterator로 변환
			FileItem item = null;
			
			while(iter.hasNext()){ 											// 이터레이터식 데이터 꺼내기, 다음이 있으면 true
				item = iter.next(); 										// iter에 값을 현재 값을 넣고 커서를 다음으로 넘김
				
				if(!item.isFormField()){									// isFormField()는 일방적인 데이터 정보를 뜻하고 앞에 ! 붙은 !isFormField는 파일정보를 뜻함
					String temp = item.getName();
					int index = temp.lastIndexOf("\\"); 					//  마지막 \\의 인덱스번호를 구함, 즉, 마지막인덱스 번호를 통해 파일 이름을 뽑겠다. 
					
					if(index!=-1){ 
						fileName = temp.substring(index+1);
					} else {
						fileName = temp;
					}
					//System.out.println("fileName: " + fileName);
				} else {					
					// PlaceDTO > UTF-8
					if(item.getFieldName().equals("placeName")){				// 장소명
						pl_dto.setPlaceName(item.getString("UTF-8"));						
					} else if(item.getFieldName().equals("placeType")){			// 장소 유형
						pl_dto.setPlaceType(item.getString("UTF-8"));
					} else if(item.getFieldName().equals("placeName")){			// 장소 이름
						pl_dto.setPlaceName(item.getString("UTF-8"));			
					} else if(item.getFieldName().equals("placeIntro")){		// 장소 소개
						pl_dto.setPlaceIntro(item.getString("UTF-8"));			
					} else if(item.getFieldName().equals("placeAddr1")){		// 주소1, 우편번호
						pl_dto.setPlaceAddr1(item.getString("UTF-8"));			
					} else if(item.getFieldName().equals("placeAddr2")){		// 주소2, 도로명
						pl_dto.setPlaceAddr2(item.getString("UTF-8"));			
					} else if(item.getFieldName().equals("placeAddr3")){		// 주소3, 지번
						pl_dto.setPlaceAddr3(item.getString("UTF-8"));			
					} else if(item.getFieldName().equals("placeAddr4")){		// 주소4, 상세주소
						pl_dto.setPlaceAddr4(item.getString("UTF-8"));			
					} else if(item.getFieldName().equals("placeTel")){			// 장소 전화번호
						pl_dto.setPlaceTel(item.getString("UTF-8"));			
					} else if(item.getFieldName().equals("placeURL")){			// 장소 URL
						pl_dto.setPlaceURL(item.getString("UTF-8"));			
					} else if(item.getFieldName().equals("placeUseTime")){		// 이용가능 시간
						pl_dto.setPlaceUseTime(item.getString("UTF-8"));			
					} else if(item.getFieldName().equals("placeNotUseDay")){	// 정기휴무
						pl_dto.setPlaceNotUseDay(item.getString("UTF-8"));			
					} else if(item.getFieldName().equals("placeCost")){			// 비용
						pl_dto.setPlaceCost(item.getString("UTF-8"));			
					} else if(item.getFieldName().equals("placeCostChoice")){	// 비용 유형
						pl_dto.setPlaceCostChoice(item.getString("UTF-8"));			
					} else if(item.getFieldName().equals("placeParking")){		// 주차 유무
						pl_dto.setPlaceParking(item.getString("UTF-8"));				
					} else if(item.getFieldName().equals("placeContent")){		// 상세 설명
						pl_dto.setPlaceContent(item.getString("UTF-8"));				
					} else if(item.getFieldName().equals("comId")){				// 광고주 아이디
						pl_dto.setComId(item.getString("UTF-8"));				
					} else if(item.getFieldName().equals("placePerCnt")){		// 수용인원
						pl_dto.setPlacePerCnt(Integer.parseInt(item.getString("UTF-8")));				
					}
				}
			}
			
			// 파일이름이 있고, 공백제거한 파일이름이 ""(널)이 아니면, 즉 성공했으면
			if(fileName!=null && !fileName.trim().equals("")){
				// 저장할 파일의 경로
				fileName = rPath + fileName; 						// \resources\image\place\xxx.png	
				// 파일경로 DB에 저장
				pl_dto.setPlaceImage(fileName);
				//System.out.println("최종 fileName" + fileName);
				
				// 실제 파일 경로
				fileName = aPath + fileName;						// D:\dev\spring_workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\DAMOYO_Project\resources\image\place\xxx.png
				item.write(new File(fileName)); 					//upload, 즉 저장할 파일의 경로로 item을 저장함
			} else {
				// 파일이름이 널이면 빈값저장
				pl_dto.setPlaceImage(rPath + "\\noImage.png");		// \\resources\\image\\place\\noImage.png
			}
		} catch(Exception e){
			e.printStackTrace();
			flag = true;
		}		
		
		// [서비스] 모임장소 등록
		if(!flag) {			
			flag = placeService.PlaceRegist(pl_dto);
			System.out.println("[TEST-DB Insert] pl_dto : " + pl_dto);
		}
		
		if(flag) {
			model.addAttribute("pl_dto", pl_dto);
			model.addAttribute("cdto", cdto);	
			
			url = "redirect:/place/PlaceListAll";			// 전체 조회 (Reload) : Insert 후, 최신 정보로 업뎃		
		} else {
			url = "default";
		}

		return url;
	}
	
	
	
	// 02. 모임 전체 조회
	@RequestMapping(value = "/PlaceListAll",  method = { RequestMethod.POST, RequestMethod.GET })
	public String PlaceListAll(CompanyDTO cdto, HttpSession session, Model model) {
		String url = null;
		
		List<PlaceDTO> placeList = placeService.getPlaceListAll();	
		//System.out.println("[TEST] 전체조회: " + placeList);
		
		model.addAttribute("plList", placeList);
		
		url = "PartnerMain";
		
		return url;
	}
	
	

	// 03. 선택한 모임 상세 조회
	@RequestMapping(value = "/PlaceDetail",  method = RequestMethod.GET)
	public String PlaceDetail(@RequestParam("placeNo") int placeNo, CompanyDTO cdto, HttpSession session, Model model) {
		String url = null;

		// 모임 클릭 > 상세정보
		PlaceDTO pl_dto = placeService.getPlaceDetail(placeNo);
		
		// 모임 클릭 > 작성자 정보
		cdto = placeService.getPalaceCompanyInfo(placeNo);
		
		// 로그인 한 > 사용자 정보
		CompanyDTO login_cdto = (CompanyDTO) session.getAttribute("cdto");
		
		model.addAttribute("pl_dto", pl_dto);
		model.addAttribute("cdto", cdto);
		model.addAttribute("login_cdto", login_cdto);
		
		//System.out.println("[TEST] 로그인 한 사람: " + login_cdto.getComId());
		//System.out.println("[TEST] 글 쓴 사람: " + pl_dto.getComId());

		url = "place/PlaceDetail";
		
		return url;
	}
	
	
	// 04-01. 수정 전, 선택한 모임장소 > 글 불러오기
	@RequestMapping(value="/PlaceModify", method = { RequestMethod.POST, RequestMethod.GET })
	public String PlaceModify(@RequestParam("placeNo") int placeNo, Model model) {
		String url = null;
				
		// 선택한 글 번호에 해당되는 내용 읽어오기
		PlaceDTO pl_dto = placeService.getPlaceDetail(placeNo);		
		//System.out.println("[TEST] 변경 전 pl_dto: " + pl_dto);
		
		if(pl_dto != null) {
			model.addAttribute("pl_dto", pl_dto);		
			
			url = "place/PlaceDetailModify";	
		}		
		
		return url;
	}
	
	
	// 04-02. 데이터 수정 후 > DB 수정
	@RequestMapping(value = "/PlaceModifyProcess", method = RequestMethod.POST)
	public String PlaceModifyProcess(@RequestParam("placeNo") int placeNo, PlaceDTO pl_dto, CompanyDTO cdto, 
									 HttpSession session, HttpServletRequest req, Model model) {
		String url = null;
		boolean flag = false;
		
		// 광고주 > 세션에 저장된 정보 가져오기
		cdto = (CompanyDTO) session.getAttribute("cdto");
		System.out.println("수정 작업 후, 받아온 pl_dto: " + pl_dto);
		System.out.println("수정 작업 후, 받아온 번호: " + pl_dto.getPlaceNo());
		
		// 세션에 저장된 광고주 ID > 모임장소 등록 테이블에 담기
		pl_dto.setComId(cdto.getComId());
			
		// 파일 > 실제 서버에 저장
		String aPath = req.getSession().getServletContext().getRealPath("/"); // 저장할 파일의 상대 경로
		String rPath = "\\resources\\image\\place\\"; // 저장할 파일의 절대 경로

		DiskFileItemFactory fac = new DiskFileItemFactory(); // 파일 업로드 핸들러를 생성
		ServletFileUpload sfu = new ServletFileUpload(fac); // 클라이언트로 부터 우리가 지정한
															// 곳으로 연결시키는 역활
		sfu.setFileSizeMax(100 * 1024 * 1024); // 업로드할 파일의 제한 크기를 정함
		sfu.setHeaderEncoding("UTF-8"); // 업로드할 파일을 UTF-8로 설정하여 글자가 깨지는것을 방지
		String fileName = null;

		try {
			List<FileItem> list = sfu.parseRequest(new ServletRequestContext(req));

			Iterator<FileItem> iter = list.iterator(); 
			FileItem item = null;

			while (iter.hasNext()) { // 이터레이터식 데이터 꺼내기, 다음이 있으면 true
				item = iter.next(); // iter에 값을 현재 값을 넣고 커서를 다음으로 넘김

				if (!item.isFormField()) {
					String temp = item.getName();
					int index = temp.lastIndexOf("\\"); 
					
					if (index != -1) {
						fileName = temp.substring(index + 1);
					} else {
						fileName = temp;
					}
				} else {
					// PlaceDTO > UTF-8
					if (item.getFieldName().equals("placeName")) { // 장소명
						pl_dto.setPlaceName(item.getString("UTF-8"));
					} else if (item.getFieldName().equals("placeType")) { // 장소 유형																			// 
						pl_dto.setPlaceType(item.getString("UTF-8"));
					} else if (item.getFieldName().equals("placeName")) { // 장소 이름																			// 
						pl_dto.setPlaceName(item.getString("UTF-8"));
					} else if (item.getFieldName().equals("placeIntro")) { // 장소 소개																			// 
						pl_dto.setPlaceIntro(item.getString("UTF-8"));
					} else if (item.getFieldName().equals("placeAddr1")) { // 주소1, 우편번호																			// 
						pl_dto.setPlaceAddr1(item.getString("UTF-8"));
					} else if (item.getFieldName().equals("placeAddr2")) { // 주소2, 도로명																			// 
						pl_dto.setPlaceAddr2(item.getString("UTF-8"));
					} else if (item.getFieldName().equals("placeAddr3")) { // 주소3, 지번																			// 
						pl_dto.setPlaceAddr3(item.getString("UTF-8"));
					} else if (item.getFieldName().equals("placeAddr4")) { // 주소4, 상세주소																			// 
						pl_dto.setPlaceAddr4(item.getString("UTF-8"));
					} else if (item.getFieldName().equals("placeTel")) { // 장소 전화번호																			// 
						pl_dto.setPlaceTel(item.getString("UTF-8"));
					} else if (item.getFieldName().equals("placeURL")) { // 장소 URL																			
						pl_dto.setPlaceURL(item.getString("UTF-8"));
					} else if (item.getFieldName().equals("placeUseTime")) { // 이용가능 시간																			// 시간
						pl_dto.setPlaceUseTime(item.getString("UTF-8"));
					} else if (item.getFieldName().equals("placeNotUseDay")) { // 정기휴무
						pl_dto.setPlaceNotUseDay(item.getString("UTF-8"));
					} else if (item.getFieldName().equals("placeCost")) { // 비용
						pl_dto.setPlaceCost(item.getString("UTF-8"));
						
						
					} else if (item.getFieldName().equals("placeCostChoice")) { // 비용 유형																				// 
						pl_dto.setPlaceCostChoice(item.getString("UTF-8"));
					} else if (item.getFieldName().equals("placeParking")) { // 주차 유무																				// 
						pl_dto.setPlaceParking(item.getString("UTF-8"));
					} else if (item.getFieldName().equals("placeContent")) { // 상세 설명																				// 
						pl_dto.setPlaceContent(item.getString("UTF-8"));
					} else if (item.getFieldName().equals("comId")) { // 광고주 아이디
						pl_dto.setComId(item.getString("UTF-8"));
					} else if (item.getFieldName().equals("placePerCnt")) { // 수용인원
						pl_dto.setPlacePerCnt(Integer.parseInt(item.getString("UTF-8")));
					}
				}
			}

			// 파일이름이 있고, 공백제거한 파일이름이 ""(널)이 아니면, 즉 성공했으면
			if (fileName != null && !fileName.trim().equals("")) {
				// 저장할 파일의 경로
				fileName = rPath + fileName; 
				// 파일경로 DB에 저장
				pl_dto.setPlaceImage(fileName);

				// 실제 파일 경로
				fileName = aPath + fileName; 
				item.write(new File(fileName)); 
			} else {
				// 파일이름이 널이면 빈값저장
				pl_dto.setPlaceImage(rPath + "noImage.png"); 
			}
		} catch (Exception e) {
			e.printStackTrace();
			flag = true;
		}
	
		
		// 선택한 글 번호에 해당되는 내용 수정
		flag = placeService.PlaceModifyProcess(pl_dto);			
		System.out.println("after data" + pl_dto);

		if(flag) {		
			url = "redirect:/place/PlaceDetail?placeNo="+placeNo;	// 수정 완료되면, 수정된 상세페이지로 Reload (수정작업 성공 보여주기)
		}		

		return url;
	}
	
	
	// 05. 선택한 모임 삭제
	@RequestMapping(value="/PlaceDeleteAll", method = RequestMethod.GET)
	public String PlaceDeleteAll(@RequestParam("placeNo") int placeNo) {
		String url = null;
		
		boolean flag = placeService.PlaceDeleteAll(placeNo);
		
		if(flag) {
			url = "redirect:/mypage/MyPageCreateMeeting";
		}
		
		return url;
	}
}