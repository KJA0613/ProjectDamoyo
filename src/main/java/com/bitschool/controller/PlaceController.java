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
		System.out.println("[TEST-세션에 저장된 정보] cdto : " + cdto);		
	
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
		
		
		// [이미지 파일 저장]		
		String aPath = req.getSession().getServletContext().getRealPath("/");	 
		System.out.println("aPath : " + aPath);					// D:\dev\spring_workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\DAMOYO_Project\
		String rPath =  "\\resources\\image\\place\\";			// 저장할 파일의 절대 경로		
		System.out.println("rPath : " + rPath);					// \resources\image\place\
		
		DiskFileItemFactory fac = new DiskFileItemFactory(); 	// 파일 업로드 핸들러를 생성
		ServletFileUpload sfu = new ServletFileUpload(fac); 	// 클라이언트로 부터 우리가 지정한 곳으로 연결시키는 역활
		sfu.setFileSizeMax(5*1024*1024);						// 업로드할 파일의 제한 크기를 정함
		sfu.setHeaderEncoding("UTF-8"); 						// 업로드할 파일을 UTF-8로 설정하여 글자가 깨지는것을 방지
 		String fileName = null;
 		
		try { 
			//HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
			List<FileItem> list = sfu.parseRequest(new ServletRequestContext(req));
			// List<FileItem> 객체변수인 items에다가  은 request를 받아서 다 읽어옴, 모든 태그들을 받아옴
			// 네트웤에 관련된 작업을 개발자가 인식못하게 할려고 이렇게함
			// 즉, 읽어온 req를 FileItem 타입에 맞게 변홤함
			Iterator<FileItem> iter = list.iterator(); // list를 FileItem의 Iterator로 변환
			FileItem item = null;
			
			while(iter.hasNext()){ // 이터레이터식 데이터 꺼내기, 다음이 있으면 true
				item = iter.next(); // iter에 값을 현재 값을 넣고 커서를 다음으로 넘김
				if(!item.isFormField()){// isFormField()는 일방적인 데이터 정보를 뜻하고 앞에 ! 붙은 !isFormField는 파일정보를 뜻함
					// !formfield는 파일정보
					String temp = item.getName();
					int index = temp.lastIndexOf("\\"); //  마지막 \\의 인덱스번호를 구함, 즉, 마지막인덱스 번호를 통해 파일 이름을 뽑겠다. 
					
					if(index!=-1){ 
						//  \\가 있으면
						//  index+1(마지막 \\의 뒤, 즉 파일이름)을 fileName에 저장하고
						fileName = temp.substring(index+1);
					} else {
						// 마지막에 \\가 없으면, 즉 파일이름만 있으면
						// temp를 fileName에 저장함
						fileName = temp;
					}
					System.out.println("fileName: " + fileName);
				} else {
					// FormField는 일방적인 데이터 정보					
					// getFileName()은  <input> 태그의 name값을 가져옴, <input name="zz"> 에서는 zz를 가져옴.
					// 문자가 깨지는걸 방지하기 위해 UTF-8로 설정
					
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
			
			// 파일이름이 있고, 공백제거한 파일이름이 ""(널)이 아니면, 즉 성송했으면
			if(fileName!=null && !fileName.trim().equals("")){
				// 저장할 파일의 경로
				fileName = rPath + fileName; 
				// 파일경로 DB에 저장
				pl_dto.setPlaceImage(fileName);
				
				// 실제 파일 경로
				fileName = aPath + fileName;
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
		flag = placeService.PlaceRegist(pl_dto);
		System.out.println("[TEST-DB Insert] pl_dto : " + pl_dto);
		
		model.addAttribute("pl_dto", pl_dto);
		
		if(flag) {
			url = "redirect:/place/PlaceListAll";			// 전체 조회 (Reload) : Insert 후, 최신 정보로 업뎃		
		} else {
			url = "default";
		}

		return url;
	}
	
	
	
	// 02. 모임 전체 조회
	@RequestMapping(value = "/PlaceListAll",  method = { RequestMethod.POST, RequestMethod.GET })
	public String PlaceListAll(Model model) {
		String url = null;
		
		List<PlaceDTO> placeList = placeService.getPlaceListAll();		
		System.out.println("[TEST] 전체조회: " + placeList);
		
		model.addAttribute("placeList", placeList);
		
		url = "PartnerMain";
		
		return url;
	}
	
	
	
}