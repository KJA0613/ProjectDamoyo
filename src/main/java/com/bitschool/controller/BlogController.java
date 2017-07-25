package com.bitschool.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitschool.dto.BGalleryDTO;
import com.bitschool.dto.BPageVO;
import com.bitschool.dto.BPostDTO;
import com.bitschool.dto.BReplyDTO;
import com.bitschool.dto.BScheduleDTO;
import com.bitschool.dto.BScheduleFormatDTO;
import com.bitschool.dto.BSearchVO;
import com.bitschool.service.BGalleryService;
import com.bitschool.service.BPageService;
import com.bitschool.service.BPostService;
import com.bitschool.service.BReplyService;
import com.bitschool.service.BScheduleService;
import com.google.gson.Gson;

/**
 * Handles requests for the application home page.
 * 1 gyu hihihi
 */
@Controller
@RequestMapping(value="/blog", method = {RequestMethod.GET,RequestMethod.POST})
public class BlogController {
	
	@Inject
	private BPostService service;
	
	@Inject
	private BPageService pService;
	
	@Inject 
	private BReplyService rService;
	
	@Inject
	private BScheduleService cService;
	
	@Inject
	private BGalleryService gService;
	
	private static final Logger logger = LoggerFactory.getLogger(BlogController.class);
	
	/**
	 * github 성공! 테스트
	 */
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		return "blog/home";
	}
	
	//*****************************************************************
	
	@RequestMapping(value="/notice", method = RequestMethod.GET)
	public String notice() {
		
		return "blog/notice/notice";
	}
	
	//*****************************************************************
	
	@RequestMapping(value="/schedule/viewSchedule", method = {RequestMethod.GET,RequestMethod.POST})
	public String viewSchedule() {
		
		return "blog/schedule/viewSchedule";
	}
	
	@RequestMapping(value="/schedule/recevieData", method = RequestMethod.POST)
	public @ResponseBody String recevieData(Model model, HttpServletResponse response) {
		List<BScheduleFormatDTO> list = cService.getScheduleAll();
		String data = new Gson().toJson(list);
		//System.out.println(data);
		response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");
		return data;
	}
	
	@RequestMapping(value="/schedule/viewRegistSchedule", method = RequestMethod.GET)
	public String viewRegistSchedule(@RequestParam("fDate") String date, Model model) {
		//System.out.println(date);
		model.addAttribute("startDate",date);
		return "blog/schedule/viewRegistSchedule";
	}
	
	@RequestMapping(value="/schedule/viewDetailSchedule", method = RequestMethod.GET)
	public String viewDetailSchedule(@RequestParam("sid") int sid, Model model) {
		BScheduleDTO schedule = cService.readScheduleOne(sid);
		model.addAttribute("schedule", schedule);
		model.addAttribute("sid", sid);
		return "blog/schedule/viewDetailSchedule";
	}
	
	@RequestMapping(value="/schedule/registSchedule", method = RequestMethod.POST)
	public String registSchedule(BScheduleDTO schedule) {
		String url = null;
		boolean flag = cService.registSchedule(schedule);
		if(flag) {
			url = "blog/schedule/complete";
		}
		return url;
	}
	
	@RequestMapping(value="/schedule/modifySchedule", method = RequestMethod.POST)
	public String modifySchedule(BScheduleDTO schedule, @RequestParam("sid") int sid) {
		String url = null;
		schedule.setSid(sid);
		boolean flag = cService.modifySchedule(schedule);
		if(flag) {
			url = "blog/schedule/complete";
		}
		return url;
	}
	
	@RequestMapping(value="/schedule/removeSchedule", method = RequestMethod.POST)
	public String removeSchedule(@RequestParam("sid") int sid) {
		String url = null;
		boolean flag = cService.removeSchedule(sid);
		if(flag) {
			url = "blog/schedule/complete";
		}
		return url;
	}
	//*****************************************************************
	
	@RequestMapping(value="/file", method = RequestMethod.GET)
	public String file() {
		
		return "blog/file/file";
	}
	
	//*****************************************************************
	
	@RequestMapping(value="/board/listAll", method = {RequestMethod.POST, RequestMethod.GET})
	public String listAll(@RequestParam(value="page",defaultValue="0") int page, Model model) {
		int amount = 15;
		BPageVO vo = pService.getPageVO(page,amount);
		List<BPostDTO> list = service.getListAll(vo);
		ArrayList<String> pList = pService.makePageList(page, amount);
		model.addAttribute("list",list);
		model.addAttribute("pList",pList);
		model.addAttribute("page",page);
		return "blog/board/boardList";
	}
	
	@RequestMapping(value="/board/viewRegist", method = {RequestMethod.GET, RequestMethod.POST})
	public String viewRegist() {
		return "blog/board/boardRegist";
	}
	
	@RequestMapping(value="/board/boardRegist", method = {RequestMethod.GET, RequestMethod.POST})
	public String boardList(BPostDTO post) {
		String url = null;
		boolean flag = service.registPost(post);
		if(flag) {
			url = "redirect:/blog/board/listAll";
		}
		return url;
	}
	
	@RequestMapping(value="/board/read", method = RequestMethod.GET)
	public String read(@RequestParam("postNo") int postNo, @RequestParam("page") int page,
								@RequestParam(value="query", defaultValue="") String query,Model model) {
		String url = null;
		boolean flag = service.increasCount(postNo);
		if(flag){
			BPostDTO post = service.readPost(postNo);
			model.addAttribute("post", post);
			model.addAttribute("page", page);
			List<BReplyDTO> list = rService.getReplyListAll(postNo);
			model.addAttribute("list", list);
			model.addAttribute("query", query);
			url = "blog/board/detailPost";
		}
		return url;
	}
	
	@RequestMapping(value="/board/remove", method=RequestMethod.POST)
	public String remove(@RequestParam("postNo") int postNo, @RequestParam("page") int page) {
		String url = null;
		boolean flag = service.remove(postNo);
		if(flag) {
			url = "redirect:/blog/board/listAll?page="+page;
		}
		return url;
	}
	
	
	@RequestMapping(value="/board/viewModify", method=RequestMethod.POST)
	public String viewModify(BPostDTO post, Model model, @RequestParam("postNo") int postNo, @RequestParam("page") int page) {
		model.addAttribute("post",post);
		model.addAttribute("postNo",postNo);
		model.addAttribute("page",page);
		return "blog/board/boardModify";
	}
	
	@RequestMapping(value="/board/modify", method=RequestMethod.POST)
	public String modify(BPostDTO post, Model model, @RequestParam("page") int page) {
		String url = null;
		boolean flag = service.modify(post);
		int postNo = post.getPostNo();
		String qs = "?postNo="+postNo+"&page="+page;
		if(flag) {
			url = "redirect:/blog/board/read"+qs;
		}
		return url;
	}
	
	@RequestMapping(value="board/reply", method=RequestMethod.POST)
	public String reply(BReplyDTO reply, @RequestParam("page") int page) {
		String url = null;
		int postNo = reply.getPostNo();
		boolean flag = rService.insertReply(reply);
		if(flag) {
			String qs = "?postNo="+postNo+"&page="+page;
			url = "redirect:/blog/board/read"+qs;
		}
		return url;
	}
	
	@RequestMapping(value="/board/search", method=RequestMethod.POST)
	public String search(@RequestParam("query") String query, @RequestParam(value="page",defaultValue="0") int page, Model model) {
		String url = null;
		int amount = 15;
		BSearchVO searchVO = new BSearchVO();
		searchVO.setQuery(query);
		searchVO.setVo(pService.getPageVO(page, amount));
		List<BPostDTO> list = service.listSearchBookAll(searchVO);
		ArrayList<String> pList = pService.makeSerachList(page, amount,searchVO);
		model.addAttribute("list",list);
		model.addAttribute("pList",pList);
		model.addAttribute("page",page);
		model.addAttribute("search",searchVO);
		url = "blog/board/searchList";
		return url;
	}
	
	//*****************************************************************
	
	@RequestMapping(value="photo/viewModifyPhoto", method=RequestMethod.POST)
	public String viewModifyImage(@RequestParam("imgNo") int imageNo, Model model) {
		BGalleryDTO gallery = gService.getPhoto(imageNo);
		model.addAttribute("gallery", gallery);
		return "blog/photo/viewModifyPhoto";
	}
	
	@RequestMapping(value="photo/removePhoto", method=RequestMethod.POST)
	public String removePhoto(@RequestParam("imgNo") int imageNo) {
		String url = null;
		boolean flag = gService.removePhoto(imageNo);
		if(flag) {
			url = "redirect:/blog/photo/viewPhoto";
		}
		return url;
	}
	
	@RequestMapping(value="photo/viewPhoto", method = RequestMethod.GET)
	public String viewPhoto(Model model) {
		String url = "blog/photo/viewPhoto";
		List<BGalleryDTO> list = gService.getImageList();
		model.addAttribute("imgList", list);
		return url;
	}
	
	@RequestMapping(value="photo/viewUploadPhoto", method = RequestMethod.GET)
	public String viewUploadPhoto() {
		String url = "blog/photo/viewUploadPhoto";
		return url;
	}
	
	@RequestMapping(value="photo/uploadPhoto", method = RequestMethod.POST)
	public String uploadPhoto(HttpServletRequest req) {
		String url = null;
		BGalleryDTO gallery = new BGalleryDTO();
		String path = req.getSession().getServletContext().getRealPath("/")+"resources\\image\\";
		//System.out.println(path);
		boolean flag = false;
		DiskFileItemFactory fac = new DiskFileItemFactory();
		ServletFileUpload sfu = new ServletFileUpload(fac);
		sfu.setFileSizeMax(5*1024*1024);
		sfu.setHeaderEncoding("UTF-8");
		String fileName = null;
		try { 
			//HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
			List<FileItem> list = sfu.parseRequest(new ServletRequestContext(req));
			Iterator<FileItem> iter = list.iterator();
			FileItem item = null;
			while(iter.hasNext()){
				item = iter.next();
				if(!item.isFormField()){
					String temp = item.getName();
					int index = temp.lastIndexOf("\\");
					if(index!=-1){
						fileName = temp.substring(index+1);
					} else {
						fileName = temp;
					}
					//System.out.println(fileName);
				} else {
					if(item.getFieldName().equals("imageTitle")){
						gallery.setImageTitle(item.getString("UTF-8"));
					} else if(item.getFieldName().equals("userId")){
						gallery.setUserId(item.getString("UTF-8"));
					} else if(item.getFieldName().equals("imageContents")) {
						gallery.setImageContents(item.getString("UTF-8"));
					}
				}
			}
			if(fileName!=null&&!fileName.trim().equals("")){
			
				gallery.setUploadImg(fileName);
				fileName = path + fileName;
				item.write(new File(fileName)); //upload
			} else {
				gallery.setUploadImg("no_detail_img.gif");
			}
		} catch(Exception e){
			e.printStackTrace();
			flag = true;
		}
		//System.out.println(flag);
		if(!flag){
			flag =  gService.uploadImage(gallery);
		}
		if(flag){
			url = "redirect:/blog/photo/viewPhoto";
		}
		//System.out.println(gallery);
		return url;
	}
	
	//*****************************************************************
	@RequestMapping(value="/mission", method = RequestMethod.GET)
	public String mission() {
		
		return "blog/mission/mission";
	}
	
	@RequestMapping(value="/contact", method = RequestMethod.GET)
	public String contact() {
		
		return "blog/contact/contact";
	}
	
}
