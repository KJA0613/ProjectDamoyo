package com.bitschool.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.servlet.ServletRequestContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitschool.dto.GatheringDTO;
import com.bitschool.dto.PersonDTO;
import com.bitschool.dto.RecommGatherDTO;
import com.bitschool.service.IGatheringService;

@RequestMapping("/gather")
@Controller
public class GatheringController {

	@Inject
	private IGatheringService gService;
		

	@RequestMapping(value = "/gathering", method =  { RequestMethod.GET, RequestMethod.POST })
	public String gathering(
			Model model,
			HttpSession session
			) {
			
		String url = "gather/gathering";
		
		// 현재 세션에 저장된 정보 > pdto에 저장
		PersonDTO pdto = (PersonDTO) session.getAttribute("pdto");
		
		System.out.println(pdto);

		List<GatheringDTO> gList = gService.getGatheringAll(); // 전체글 가져옴
		/* 로그인 되면 userId에 session.getAttribute("아이디"); 이거 해야함 */
		//session.getAttribute("guserId");		
		
		if(pdto!=null){
			List<GatheringDTO> recommList = gService.getRecommendAll(pdto.getGuserId()); // 추천글 가져옴
			model.addAttribute("pdto", pdto);
			
			if(recommList != null){
				model.addAttribute("recomm", recommList);
			}
		}
		if (gList != null) {
			model.addAttribute("gath", gList);
		}		
		
		return url;
	}

	
	@RequestMapping(value = "/gatheringSearch", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody HashMap<String, List<GatheringDTO>> gatheringAjax(
			@RequestParam(value = "cDATA", defaultValue="") String cData,
			@RequestParam(value = "aDATA", defaultValue="") String aData,
			@RequestParam(value = "sSTR", defaultValue="") String sSTR,
			@RequestParam(value = "sSelect", defaultValue="") String sSelect,
			HttpSession session
			) {
		// @ResponseBody는 리턴값을 JSON 형태로 만들어줌
		// @ResponseBody List<GatheringDTO> checkLogin 는 리턴 타입
		// List<GatheringDTO>를 json 타입으로 변경하여 응답함
		// 접속할 때는 파라미터 형식으로 값을 보내기 때문에 그냥 받음
		// 스프링에서 @ResponseBody를 사용하여 json 형식으로 응답(만들어서) return 값을 안드로이드로 보낸다

		// 메서드에 @RequestBody가 적용된 경우, 리턴 객체를 JSON이나 XML과 같은 알맞은 응답으로 변환

		
		@SuppressWarnings("unchecked")
		List<RecommGatherDTO> recommgatherList = (List<RecommGatherDTO>) session.getAttribute("recommgatherList");
		RecommGatherDTO regather = null;
		
		PersonDTO pdto = (PersonDTO) session.getAttribute("pdto");
		
		if(!sSTR.equals("")){
			regather = new RecommGatherDTO();
			regather.setRecommgatherName(sSTR);
			regather.setRecommgatherCode(sSelect);
			regather.setGuserId(pdto.getGuserId());
			recommgatherList.add(regather);
		}
		
		
		
		List<String> cList = null;
		List<String> aList = null;

		String[] aaList = aData.split(",");
		String[] ccList = cData.split(",");
		
		
		
		if(ccList.length>1){
			cList = new ArrayList<String>();
			for (int i = 0; i < ccList.length; i++) {
				cList.add(ccList[i]);
				
				
				// 체크박스 했을때 dto에 저장
				if(i==ccList.length-1&&recommgatherList!=null){
					if(!ccList[i].equals("")){
						regather = new RecommGatherDTO();
						regather.setRecommgatherName(ccList[i]);
						regather.setRecommgatherCode("카테고리");
						regather.setGuserId(pdto.getGuserId());
						recommgatherList.add(regather);
					}
				}
			}
		}
		
		if(aaList.length>1){
			aList = new ArrayList<String>();
			for (int i = 0; i < aaList.length; i++) {
				aList.add(aaList[i]);

				if(i==aaList.length-1&&recommgatherList!=null){
					if(!aaList[i].equals("")){
						regather = new RecommGatherDTO();
						regather.setRecommgatherName(aaList[i]);
						regather.setRecommgatherCode("지역");
						regather.setGuserId(pdto.getGuserId());
						recommgatherList.add(regather);
					}
				}
			}
		}
		
		System.out.println(recommgatherList);
		session.setAttribute("recommgatherList", recommgatherList);
		
		List<GatheringDTO> gList = gService.getGatheringCheck(cList, aList, sSelect, sSTR);
		HashMap<String, List<GatheringDTO>> map = new HashMap<String, List<GatheringDTO>>();
		
		if (gList != null) {
			map.put("gList", gList);
		}
		
		return map;
	}

	
	
	@RequestMapping(value = "/gatheringMake", method = { RequestMethod.GET, RequestMethod.POST })
	public String gathering_make(HttpSession session,Model model) {
		String url = "gather/gathering_make";
		
		
		PersonDTO pdto = (PersonDTO) session.getAttribute("pdto");
		model.addAttribute("pdto", pdto);
		
		return url;
	}
	
	
	@RequestMapping(value="/gatheringInsert",method={RequestMethod.GET, RequestMethod.POST})
	public String gatheringInsert(HttpServletRequest req){
		String url = null;
		int checkType = 0;
		
		GatheringDTO gath = new GatheringDTO();
		
		String aPath = req.getSession().getServletContext().getRealPath("/");
		String rPath =  "\\resources\\image\\mozip\\";

		boolean flag = false;
		DiskFileItemFactory fac = new DiskFileItemFactory(); // 파일 업로드 핸들러를 생성
		ServletFileUpload sfu = new ServletFileUpload(fac); // 클라이언트로 부터 우리가 지정한 곳으로 연결시키는 역활
		sfu.setFileSizeMax(20*1024*1024); // 업로드할 파일의 제한 크기를 정함
		sfu.setHeaderEncoding("UTF-8"); // 업로드할 파일을 UTF-8로 설정하여 글자가 깨지는것을 방지
 		String fileName = null;
		try { 
			//HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
			List<FileItem> list = sfu.parseRequest(new ServletRequestContext(req));
			// List<FileItem> 객체변수인 items에다가  은 request를 받아서 다 읽어옴, 모든 태그들을 받아옴
			// 네트웤에 관련된 작업을 개발자가 인식못하게 할려고 이렇게함
			// 즉, 읽어온 req를 FileItem 타입에 맞게 변홤함
			Iterator<FileItem> iter = list.iterator(); // list를 FileItem의 Iterator로 변환
			FileItem item = null;
			StringBuffer sb = new StringBuffer(); // Day를 ,로 넣기 위해
			int cnt = 0; // sb의 인덱스를 효율적으로 쓰기위한 인덱스
			
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
					System.out.println(fileName);
				} else {
					// FormField는 일방적인 데이터 정보
					
					// 파일 네임에 따라서 제목, 메세지, 글쓴이를 구분하여 저장
					// getFileName()은  <input> 태그의 name값을 가져옴, <input name="zz"> 에서는 zz를 가져옴.
					// 문자가 깨지는걸 방지하기 위해 UTF-8로 설정
										
					// GatherDTO
					if(item.getFieldName().equals("gatherSubject")){
						gath.setGatherSubject(item.getString("UTF-8"));
						/*cate.setGatherSubject(item.getString("UTF-8"));
						area.setGatherSubject(item.getString("UTF-8"));*/
					} else if(item.getFieldName().equals("categoryBot")){
						gath.setGatherCategory(item.getString("UTF-8"));
					} else if(item.getFieldName().equals("gatherWrite")){
						gath.setGatherWrite(item.getString("UTF-8"));
					} else if(item.getFieldName().equals("gatherSdate")){
						gath.setGatherSdate(item.getString("UTF-8"));
					} else if(item.getFieldName().equals("gatherEdate")){
						gath.setGatherEdate(item.getString("UTF-8"));
					} 
					
					else if(item.getFieldName().equals("gatherStime")){
						gath.setGatherStime("2017-12-31 "+item.getString("UTF-8"));
					} 
					else if(item.getFieldName().equals("gatherEtime")){
						gath.setGatherEtime("2017-12-31 "+item.getString("UTF-8"));
					} 
					
					else if(item.getFieldName().equals("gatherDay")){
						
						if(cnt==0){
							sb.append(item.getString("UTF-8")); 
						}else{
							sb.append(", "+item.getString("UTF-8")); 
						}
						cnt++;
						gath.setGatherDay(sb.toString());

					}
					
					
					else if(item.getFieldName().equals("areaMid")){
						gath.setGatherArea(item.getString("UTF-8"));
					} else if(item.getFieldName().equals("gatherParti")){
						gath.setGatherParti(Integer.parseInt(item.getString("UTF-8")));
					} else if(item.getFieldName().equals("gatherContent")){
						gath.setGatherContent(item.getString("UTF-8"));
					} else if(item.getFieldName().equals("guserId")){
						gath.setGuserId(item.getString("UTF-8"));
					}
					
					
				}
			} // 파일 뽑아내는 while문 쓰기
			
						
			if(fileName!=null&&!fileName.trim().equals("")){
			// 파일이름이 있고, 공백제거한 파일이름이 ""(널)이 아니면, 즉 성공했으면
				// 보드에 파일이름을 저장
				fileName = rPath + fileName; // 저장할 파일의 경로
				gath.setGatherImg(fileName);
				fileName = aPath + fileName; // 실제 파일의 경로
				item.write(new File(fileName)); //upload, 즉 저장할 파일의 경로로 item을 저장함
			} else {
				// 파일이름이 널이면 빈값저장
				if(checkType==1){
					flag=true;
				}
				gath.setGatherImg(rPath+"\\damoyo_noPicture.png"); // 파일 이미지 없을 떄 기본값 주기
			}
			
		} catch(Exception e){
			e.printStackTrace();
			flag = true;
		}
		if(!flag){
			// 성공했으면 reigstBook으로 가서 등록하고 listAll로 감
			HashMap<String, Object> map = new HashMap<String, Object>();
						
			map.put("gath", gath);
			
			System.out.println("삽입 성공 : "+gath);
			
			flag = gService.GatheringInsert(map);
		}
		
		if(flag){
			// insert에 성공하거나, 혹은 파일 분석에 실패했으면 그냥 리스트올로감
			url = "redirect:/gather/gathering";
			
		}
		return url;
	}
	
	@RequestMapping(value="/gatheringParti", method={RequestMethod.GET, RequestMethod.POST})
	public String gatherParti(
			Model model,
			HttpSession session
			){
		
		PersonDTO pdto = (PersonDTO) session.getAttribute("pdto");
		
		
		String url = "default";	
		
		List<GatheringDTO> plist = null;
		List<GatheringDTO> mlist = null;
		
		if(pdto!=null){ // 로그인 체크
			
			model.addAttribute("pdto", pdto);
			
			String guserId = pdto.getGuserId();
			plist = gService.getpartiList(guserId); // 참여중인 모임
			mlist = gService.getmakeList(guserId); // 내가 만든 모임
			
			url="gather/gathering_parti";
		}else{
			
		}
		
		if(plist!=null){
			model.addAttribute("plist", plist);
		}
		if(mlist!=null){
			model.addAttribute("mlist", mlist);
		}
		
		return url; 
	}
	
	// 게시글 클릭했을때 사용자 클릭한 게시글의 카테고리와 지역을 db 추천테이블에 넣는것
	@RequestMapping(value = "/gatheringRecomm", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody  HashMap<String, String>  gatheringRecomm(
			@RequestParam(value = "category", defaultValue="") String category,
			@RequestParam(value = "area", defaultValue="") String area,
			HttpSession session
			) {
				
		@SuppressWarnings("unchecked")
		List<RecommGatherDTO> recommgatherList = (List<RecommGatherDTO>) session.getAttribute("recommgatherList");
		
		// 로그인 사용자 정보
		PersonDTO pdto = (PersonDTO) session.getAttribute("pdto");
		
		
		if(recommgatherList!=null){
		
			RecommGatherDTO regather = null;
			if(!category.equals("")){
				regather = new RecommGatherDTO();
				regather.setRecommgatherName(category);
				regather.setRecommgatherCode("카테고리");
				regather.setGuserId(pdto.getGuserId());
				recommgatherList.add(regather);
			}
			if(!area.equals("")){
				regather = new RecommGatherDTO();
				regather.setRecommgatherName(area);
				regather.setRecommgatherCode("지역");
				regather.setGuserId(pdto.getGuserId());
				recommgatherList.add(regather);
			}
			
			
			
			System.out.println(recommgatherList);
			session.setAttribute("recommgatherList", recommgatherList);	
		
		}
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("success", "success");
		
		return map;
	}

}
