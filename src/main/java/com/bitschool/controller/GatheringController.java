package com.bitschool.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
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

import com.bitschool.dto.CompanyDTO;
import com.bitschool.dto.GatherAddonsDTO;
import com.bitschool.dto.GatheringDTO;
import com.bitschool.dto.PersonDTO;
import com.bitschool.dto.RecommGatherDTO;
import com.bitschool.service.IGatheringService;

@RequestMapping("/gather")
@Controller
public class GatheringController {
	//21
	@Inject
	private IGatheringService gService;
		

	// gathering.jsp 의 정보를 뿌리는 메서드
	@RequestMapping(value = "/gathering", method = {RequestMethod.GET, RequestMethod.POST})
	public String gathering(
			Model model,
			HttpSession session
			) {
			
		String url = "gather/gathering";
		
		// 현재 세션에 저장된 정보 > pdto에 저장 
		// 즉, 로그인된 사용자의 정보를 나타냄
		PersonDTO pdto = (PersonDTO) session.getAttribute("pdto");
		CompanyDTO cdto = (CompanyDTO)session.getAttribute("cdto");
		
		List<GatheringDTO> gList = gService.getGatheringAll(); // 전체게시글 가져옴
		
		List<GatheringDTO> recommList = gService.getRecommDefault();
		
		if(cdto==null){		
			if (pdto != null) { // 로그인 중이면
				model.addAttribute("pdto", pdto);

				recommList = gService.getRecommendUser(pdto.getGuserId()); // 사용자
																			// 추천
																			// 리스트
				// 사용자 정보에 따른 추천글 가져옴
				// 그리고 jsp로 모델을 보냄

				if (recommList.size() == 0) { // 사용자 추천 리스트가 없으면
					recommList = gService.getRecommDefault();// 디폴트 추천검색
				}
			}

			if (gList != null) {
				model.addAttribute("gath", gList);
			}
		}
		
		if(pdto!=null){ // 로그인 중이면
			model.addAttribute("pdto", pdto);
			List<GatheringDTO> recommListCopy = recommList;
			
			recommList = gService.getRecommendUser(pdto.getGuserId()); //사용자 추천 리스트
			// 사용자 정보에 따른 추천글 가져옴
			// 그리고 jsp로 모델을 보냄
			
			if(recommList.size()==0){ // 사용자 추천 리스트가 없으면
				recommList = recommListCopy;// 디폴트 추천검색

			}

			model.addAttribute("recomm", recommList);
		}
		
		if(pdto==null){
			if (cdto != null) { // 로그인 중이면
				model.addAttribute("cdto", cdto);

				recommList = gService.getRecommendUser(cdto.getComId()); // 사용자
																			// 추천
																			// 리스트
				// 사용자 정보에 따른 추천글 가져옴
				// 그리고 jsp로 모델을 보냄

				if (recommList.size() == 0) { // 사용자 추천 리스트가 없으면
					recommList = gService.getRecommDefault();// 디폴트 추천검색
				}
			}

			if (gList != null) {
				model.addAttribute("gath", gList);
			}

			model.addAttribute("recomm", recommList);
		}
		
		return url;
	}

	// gathering.jsp에서 ajax로 접근하여 체크된값 and 검색한 값 출력
	@RequestMapping(value = "/gatheringSearch",  method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody HashMap<String, List<GatheringDTO>> gatheringSearch(
			@RequestParam(value = "cDATA", defaultValue="") String cData,
			@RequestParam(value = "aDATA", defaultValue="") String aData,
			@RequestParam(value = "tDATA", defaultValue="") String tData,
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
			if(pdto!=null){ // 로그인 했을때
				regather = new RecommGatherDTO();
				regather.setRecommgatherName(sSTR);
				regather.setRecommgatherCode(sSelect);
				regather.setGuserId(pdto.getGuserId());
				recommgatherList.add(regather);
			}
		}
		
		List<String> cList = null;
		List<String> aList = null;
		List<String> tList = null;

		String[] aaList = aData.split(",");
		String[] ccList = cData.split(",");
		String[] ttList = tData.split(",");
		
		
		
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
		
		if(ttList.length>1){
			tList = new ArrayList<String>();
			for (int i = 0; i < ttList.length; i++) {
				tList.add(ttList[i]);

				if(i==ttList.length-1&&recommgatherList!=null){
					if(!ttList[i].equals("")){
						regather = new RecommGatherDTO();
						regather.setRecommgatherName(ttList[i]);
						regather.setRecommgatherCode("타입");
						regather.setGuserId(pdto.getGuserId());
						recommgatherList.add(regather);
					}
				}
			}
		}
		
		session.setAttribute("recommgatherList", recommgatherList);
		
		System.out.println(tList);
		
		List<GatheringDTO> gList = gService.getGatheringCheck(cList, aList, tList, sSelect, sSTR);
		HashMap<String, List<GatheringDTO>> map = new HashMap<String, List<GatheringDTO>>();
				
		if (gList != null) {
			map.put("gList", gList);
		}
		
		return map;
	}
	
	// 모집글 쓰는 페이지로 이동하는 메서드
	@RequestMapping(value = "/gatheringMake", method = { RequestMethod.GET, RequestMethod.POST })
	public String gathering_make(HttpSession session,Model model) {
		String url = "gather/gathering_make";
		
		PersonDTO pdto = (PersonDTO) session.getAttribute("pdto");
		CompanyDTO cdto = (CompanyDTO)session.getAttribute("cdto");
		
		if (cdto == null) {
			model.addAttribute("pdto", pdto);
		}
		if (pdto == null) {
			model.addAttribute("cdto", cdto);
		}

		return url;
	}
	
	// 올린파일을 내부에 저장하는 메서드
	@RequestMapping(value = "/gatherImg", method = RequestMethod.POST)
	public @ResponseBody String multiplePhotoUpload(HttpServletRequest request) {
		// 파일정보
		StringBuffer sb = new StringBuffer();
		try {
			// 파일명을 받는다 - 일반 원본파일명
			String oldName = request.getHeader("file-name");
			
			// 파일 기본경로 _ 상세경로
			//D:\dev\git\src
			String aPath = "D:/dev/git/src/main/webapp";
			String rPath = "\\resources\\image\\mozip\\";
			String filePath = aPath+rPath;
			System.out.println("파일경로 : "+filePath);
			
			// 여기서 oldName은 그냥 파일 이름 확장자
			String saveName = sb.append(oldName).toString();
			System.out.println(saveName);
			InputStream is = request.getInputStream();
			OutputStream os = new FileOutputStream(filePath + saveName);
			int numRead;
			byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
			while ((numRead = is.read(b, 0, b.length)) != -1) {
				os.write(b, 0, numRead);
			}
			os.flush();
			os.close();
			
			// 정보 출력
			sb = new StringBuffer();
			sb.append("&bNewLine=true").append("&sFileName=").append(oldName).append("&sFileURL=")
					.append("http://localhost:5050/resources/image/mozip/").append(saveName);
			

		} catch (Exception e) {
			e.printStackTrace();
		}
		return sb.toString();
	}
	
	
	// 모집글 디비에 삽입하는 메서드
	@RequestMapping(value="/gatheringInsert",method={RequestMethod.GET, RequestMethod.POST})
	public String gatheringInsert(HttpServletRequest req){
		String url = null;
		int checkType = 0;
		
		GatheringDTO gath = new GatheringDTO();
		
		String aPath = req.getSession().getServletContext().getRealPath("/");
		String rPath = "\\resources\\image\\mozip\\";

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
					} else if(item.getFieldName().equals("gatherCategoryTop")){
						gath.setGatherCategoryTop(item.getString("UTF-8"));
					} else if(item.getFieldName().equals("gatherCategoryMid")){
						gath.setGatherCategoryMid(item.getString("UTF-8"));
					} else if(item.getFieldName().equals("gatherCategoryBot")){
						gath.setGatherCategoryBot(item.getString("UTF-8"));
					} else if(item.getFieldName().equals("gatherWrite")){
						gath.setGatherWrite(item.getString("UTF-8"));
					} else if(item.getFieldName().equals("gatherSdate")){
						gath.setGatherSdate(item.getString("UTF-8"));
					} else if(item.getFieldName().equals("gatherEdate")){
						gath.setGatherEdate(item.getString("UTF-8"));
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
					
					else if(item.getFieldName().equals("gatherState")){
						gath.setGatherState(item.getString("UTF-8"));
					}					
					else if(item.getFieldName().equals("areaTop")){
						gath.setGatherAreaTop(item.getString("UTF-8"));
					}else if(item.getFieldName().equals("areaMid")){
						gath.setGatherArea(item.getString("UTF-8"));
					} else if(item.getFieldName().equals("gatherPartiMax")){
						gath.setGatherPartiMax(Integer.parseInt(item.getString("UTF-8")));
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
				gath.setGatherImg(fileName); // 여기서 dto에 넣어서 db에 저장
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
			System.out.println(gath);			
			map.put("gath", gath);
			flag = gService.GatheringInsert(map);
		}
		
		if(flag){
			// insert에 성공하거나, 혹은 파일 분석에 실패했으면 그냥 리스트올로감
			url = "redirect:/gather/gathering";
			
		}
		return url;
	}
	
	// 마이페이지의 참여중인 모임 뿌리기
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
	// + 추가로 여기다 게시글 클릭했을때 모달로 띄우기전, 관심글 체크 유무 여부를 불러와서 리턴해야함
	@RequestMapping(value = "/gatheringRecomm", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody HashMap<String, String>  gatheringRecomm(
			@RequestParam(value = "category", defaultValue="") String category,
			@RequestParam(value = "area", defaultValue="") String area,
			@RequestParam(value = "no") int gatherNo,
			@RequestParam(value = "id") String guserId, // id이지만 모집글을 쓴사람
			HttpSession session
			) {
				
		@SuppressWarnings("unchecked")
		List<RecommGatherDTO> recommgatherList = (List<RecommGatherDTO>) session.getAttribute("recommgatherList");
		
		// 로그인 사용자 정보
		PersonDTO pdto = (PersonDTO) session.getAttribute("pdto");
		
		// 사용자가 클릭한 모집글의 값을 dto에 담음
		if(recommgatherList!=null){
		
			RecommGatherDTO regather = null;
			if(!category.equals("")){
				regather = new RecommGatherDTO();
				regather.setGatherNo(gatherNo);
				regather.setRecommgatherName(category);
				regather.setRecommgatherCode("카테고리");
				regather.setGuserId(pdto.getGuserId()); // RecommgatherDTO 의 
				recommgatherList.add(regather);
			}
			if(!area.equals("")){
				regather = new RecommGatherDTO();
				regather.setGatherNo(gatherNo);
				regather.setRecommgatherName(area);
				regather.setRecommgatherCode("지역");
				regather.setGuserId(pdto.getGuserId());
				recommgatherList.add(regather);
			}
			
			session.setAttribute("recommgatherList", recommgatherList);
		}
		
		
		/* 여기서부터는 관심글 유무를 구분함 */
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("result", "no"); // 값이 없을때는 no, result에 디폴트값으로 no를 넣는 이유는 로그인 안했을때에는 1가 나와야함으로
						
		if(pdto!=null){
		
			System.out.println("관심글 등록에 작성자아디 : "+guserId);
			System.out.println("관심글 등록에 로그인아디 : "+pdto.getGuserId());
			
			// 초기에 모달에 심장무늬를 뿌릴때 여기서는 gatherNo를 가지고 디비에 조회하여 값의 유무를 비교하여 yes or no 를 보내는 메서드
			GatherAddonsDTO gadto = new GatherAddonsDTO();
			gadto.setGatherNo(gatherNo);  // 게시글 번호
			gadto.setGatherAddonsWriter(guserId);	// 게시글 작성자
			gadto.setGuserId(pdto.getGuserId()); // 관심글로 등록한 사람의 아이디
			gadto.setGatherAddonsCode("관심"); // 우선은 관심or앵콜
			
			boolean flag = gService.existAddons(gadto);
						
			if(flag){
				map.put("result", "yes");
			}
		}
		
		return map;
	}
	
	// 여기서는 모달차잉 띄어지고 하트모양을 눌렀을때 유무체크 판단하여 뿌리기
	// 모임 찜하기 or 앵콜요청 (아직은 여기까지, 추가로 더 들어갈 수 있음 )
	@RequestMapping(value="/gatherAddons", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody HashMap<String, String> gatherAddons(
			@RequestParam(value="no") int gatherNo,
			@RequestParam(value="writer") String gatherAddonsWriter,
			@RequestParam(value="state") String state,
			@RequestParam(value="code") String gatherAddonsCode,
			HttpSession session
			){
		
		GatherAddonsDTO gadto = new GatherAddonsDTO();
		gadto.setGatherNo(gatherNo);
		gadto.setGatherAddonsWriter(gatherAddonsWriter);
		gadto.setGatherAddonsCode(gatherAddonsCode);
				
		PersonDTO pdto = (PersonDTO) session.getAttribute("pdto");
		if(pdto!=null){
			gadto.setGuserId(pdto.getGuserId());
		}
		
		boolean flag = gService.manageAddons(gadto, state);

		HashMap<String, String> map = new HashMap<String, String>();
		
		if(flag){
			map.put("result", "yes");
		}else{
			map.put("result", "no");
		}
		
		return map;
	}
	
	@RequestMapping(value = "/damoyoSearch", method = { RequestMethod.GET, RequestMethod.POST })
	public String damoyoSearch(
			@RequestParam(value = "sSTR", defaultValue="") String sSTR,
			Model model,
			HttpSession session
			) {
			
		String url = "gather/gathering";
		
		// 현재 세션에 저장된 정보 > pdto에 저장 
		// 즉, 로그인된 사용자의 정보를 나타냄
		PersonDTO pdto = (PersonDTO) session.getAttribute("pdto");
		List<GatheringDTO> gList = gService.getGatheringAll(sSTR); // 전체게시글 가져옴
		
		List<GatheringDTO> recommList = gService.getRecommDefault();
		
		
		if(pdto!=null){ // 로그인 중이면
			model.addAttribute("pdto", pdto);
			
			List<GatheringDTO> recommListCopy = recommList;
			
			recommList = gService.getRecommendUser(pdto.getGuserId()); //사용자 추천 리스트
			// 사용자 정보에 따른 추천글 가져옴
			// 그리고 jsp로 모델을 보냄
			
			if(recommList.size()==0){ // 사용자 추천 리스트가 없으면
				recommList = recommListCopy;// 디폴트 추천검색
			}
		}
		
		if (gList != null) {
			model.addAttribute("gath", gList);
		}
		
		model.addAttribute("recomm", recommList);
		model.addAttribute("sSTR", sSTR);
		
		return url;
		
	}
	
	@RequestMapping(value="/gatheringModalModify",  method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody HashMap<String, Object> gatheringModalModify(
			GatheringDTO gdto
			){
		
		System.out.println(gdto);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("result", "no");
		
		boolean flag = gService.updateModalGathering(gdto);
		
		if(flag){
			map.put("result", "yes");
		}
		
		
		return map;
	}

}
