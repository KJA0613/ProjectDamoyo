package com.bitschool.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bitschool.dto.BGalleryDTO;
import com.bitschool.dto.BPageVO;
import com.bitschool.dto.BPostDTO;
import com.bitschool.dto.BPostNoInfoDTO;
import com.bitschool.dto.BReplyDTO;
import com.bitschool.dto.BScheduleDTO;
import com.bitschool.dto.BScheduleFormatDTO;
import com.bitschool.dto.BSearchVO;
import com.bitschool.dto.PersonDTO;
import com.bitschool.helper.Recommend;
import com.bitschool.service.BGalleryService;
import com.bitschool.service.BPageService;
import com.bitschool.service.BPostService;
import com.bitschool.service.BReplyService;
import com.bitschool.service.BScheduleService;
import com.bitschool.service.BTempService;
import com.google.gson.Gson;

/**
 * Handles requests for the application home page.
 * 1 gyu hihihi
 */
@Controller
@RequestMapping(value="/blog")
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
	
	@Inject
	private BTempService tService;
	
	@Inject
	private Recommend recom;
	
	private static final Logger logger = LoggerFactory.getLogger(BlogController.class);
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Model model, HttpSession session, @RequestParam(value="blogId") int blogId, @RequestParam(value="blogName") String blogName) {
		PersonDTO pdto = (PersonDTO) session.getAttribute("pdto");
		model.addAttribute("pdto", pdto);
		model.addAttribute("pdto", pdto);
		model.addAttribute("blogName",blogName);
		model.addAttribute("blogId", blogId);
		return "redirect:/blog/notice/listAll";
	}
	
	//*****************************************************************
	
	@RequestMapping(value="/notice/listAll", method = {RequestMethod.GET, RequestMethod.POST})
	public String notice(@RequestParam(value="page",defaultValue="0") int page,Model model, HttpSession session
								,@RequestParam(value="blogId") int blogId, @RequestParam(value="blogName") String blogName) {
		int amount = 15;
		BPageVO vo = pService.getPageVO(page,amount);
		vo.setBoardName("notice");
		vo.setBlogId(blogId);
		vo.setBlogName(blogName);
		List<BPostDTO> list = service.getListAll(vo);
		ArrayList<String> pList = pService.makePageList(page, amount, vo);
		PersonDTO pdto = (PersonDTO) session.getAttribute("pdto");
		model.addAttribute("pdto", pdto);
		model.addAttribute("list",list);
		model.addAttribute("pList",pList);
		model.addAttribute("page",page);
		model.addAttribute("blogName",blogName);
		model.addAttribute("blogId", blogId);
		model.addAttribute("num", list.size());
		return "blog/notice/noticeList";
	}
	
	@RequestMapping(value="/notice/viewRegist", method = {RequestMethod.GET, RequestMethod.POST})
	public String viewNoticeRegist(HttpSession session, Model model
												,@RequestParam(value="blogId") int blogId, @RequestParam(value="blogName") String blogName) {
		PersonDTO pdto = (PersonDTO) session.getAttribute("pdto");
		model.addAttribute("pdto", pdto);
		model.addAttribute("blogName",blogName);
		model.addAttribute("blogId", blogId);
		return "blog/notice/noticeRegist";
	}
	
	@RequestMapping(value="/notice/noticeRegist", method = {RequestMethod.GET, RequestMethod.POST})
	public String noticeRegist(BPostDTO post, @RequestParam(value="blogId") int blogId
										,@RequestParam(value="blogName") String blogName, Model model) {
		String url = null;
		post.setBoardName("notice");
		post.setBlogId(blogId);
		boolean flag = service.registPost(post);
		if(flag) {
			url = "redirect:/blog/notice/listAll";
		}
		model.addAttribute("blogName",blogName);
		model.addAttribute("blogId", blogId);
		return url;
	}
	
	@RequestMapping(value="/notice/read", method = RequestMethod.GET)
	public String noticeRead(@RequestParam("postNo") int postNo, @RequestParam("page") int page,
								@RequestParam(value="query", defaultValue="") String query,Model model, HttpSession session
								,@RequestParam(value="blogId") int blogId, @RequestParam(value="blogName") String blogName) {
		String url = null;
		PersonDTO pdto = (PersonDTO) session.getAttribute("pdto");
		BPostNoInfoDTO infoDTO = new BPostNoInfoDTO();
		infoDTO.setPostNo(postNo);
		infoDTO.setBoardName("notice");
		infoDTO.setBlogId(blogId);
		boolean flag = service.increasCount(infoDTO);
		boolean authFlag = false;
		if(flag){
			BPostDTO post = service.readPost(infoDTO);
			if(pdto != null) {
				if(post.getUserId().equals(pdto.getGuserId())) {
					authFlag = true;
					model.addAttribute("authFlag", authFlag);
				}
			}
			model.addAttribute("pdto", pdto);
			model.addAttribute("post", post);
			model.addAttribute("page", page);
			List<BReplyDTO> list = rService.getReplyListAll(infoDTO);
			model.addAttribute("list", list);
			model.addAttribute("query", query);
			model.addAttribute("blogName",blogName);
			model.addAttribute("blogId", blogId);
			url = "blog/notice/detailNotice";
		}
		return url;
	}
	
	@RequestMapping(value="/notice/remove", method=RequestMethod.POST)
	public String noticeRemove(@RequestParam("postNo") int postNo, @RequestParam("page") int page, Model model
											,@RequestParam(value="blogId") int blogId, @RequestParam(value="blogName") String blogName) {
		String url = null;
		BPostNoInfoDTO infoDTO = new BPostNoInfoDTO();
		infoDTO.setPostNo(postNo);
		infoDTO.setBoardName("notice");
		boolean flag = service.remove(infoDTO);
		if(flag) {
			url = "redirect:/blog/notice/listAll?page="+page;
		}
		model.addAttribute("blogName",blogName);
		model.addAttribute("blogId", blogId);
		return url;
	}
	
	@RequestMapping(value="/notice/viewModify", method=RequestMethod.POST)
	public String viewNoticeModify(BPostDTO post, Model model, @RequestParam("postNo") int postNo
						,@RequestParam("page") int page, HttpSession session, @RequestParam(value="blogId") int blogId, @RequestParam(value="blogName") String blogName) {
		model.addAttribute("post",post);
		PersonDTO pdto = (PersonDTO) session.getAttribute("pdto");
		model.addAttribute("pdto", pdto);
		model.addAttribute("postNo",postNo);
		model.addAttribute("page",page);
		model.addAttribute("blogName",blogName);
		model.addAttribute("blogId", blogId);
		return "blog/notice/noticeModify";
	}
	
	@RequestMapping(value="/notice/modify", method=RequestMethod.POST)
	public String modifyNotice(BPostDTO post, Model model, @RequestParam("page") int page, @RequestParam(value="blogId") int blogId, @RequestParam(value="blogName") String blogName) {
		String url = null;
		post.setBoardName("notice");
		boolean flag = service.modify(post);
		int postNo = post.getPostNo();
		String qs = "?postNo="+postNo+"&page="+page;
		if(flag) {
			url = "redirect:/blog/notice/read"+qs;
		}
		model.addAttribute("blogName",blogName);
		model.addAttribute("blogId", blogId);
		return url;
	}
	
	@RequestMapping(value="/notice/reply", method=RequestMethod.POST)
	public String replyNotice(BReplyDTO reply, @RequestParam("page") int page, Model model
										,@RequestParam(value="blogId") int blogId, @RequestParam(value="blogName") String blogName) {
		String url = null;
		int postNo = reply.getPostNo();
		reply.setBoardName("notice");
		reply.setBlogId(blogId);
		boolean flag = rService.insertReply(reply);
		if(flag) {
			String qs = "?postNo="+postNo+"&page="+page;
			url = "redirect:/blog/notice/read"+qs;
		}
		model.addAttribute("blogName",blogName);
		model.addAttribute("blogId", blogId);
		return url;
	}
	
	@RequestMapping(value="/notice/search", method=RequestMethod.POST)
	public String searchNotice(@RequestParam("query") String query, @RequestParam(value="page",defaultValue="0") int page,
											Model model, HttpSession session, @RequestParam(value="blogId") int blogId, @RequestParam(value="blogName") String blogName) {
		String url = null;
		int amount = 15;
		BSearchVO searchVO = new BSearchVO();
		searchVO.setQuery(query);
		searchVO.setVo(pService.getPageVO(page, amount));
		searchVO.setBoardName("notice");
		List<BPostDTO> list = service.listSearchBookAll(searchVO);
		ArrayList<String> pList = pService.makeSerachList(page, amount,searchVO);
		PersonDTO pdto = (PersonDTO) session.getAttribute("pdto");
		model.addAttribute("pdto", pdto);
		model.addAttribute("list",list); 
		model.addAttribute("pList",pList);
		model.addAttribute("page",page);
		model.addAttribute("search",searchVO);
		model.addAttribute("blogName",blogName);
		model.addAttribute("blogId", blogId);
		url = "blog/notice/searchList";
		return url;
	}
	
	@RequestMapping(value="/notice/removeReply", method=RequestMethod.POST)
	public String removeNoticeReply(BReplyDTO reply, @RequestParam("page") int page
											,@RequestParam(value="blogId") int blogId, @RequestParam(value="blogName") String blogName) {
		String url = null;
		reply.setBlogId(blogId);
		boolean flag = rService.removeReply(reply);
		if(flag) {
			String qs = "?postNo="+reply.getPostNo()+"&page="+page + "&blogId=" + blogId + "&blogName=" + blogName;
			url = "redirect:/blog/notice/read"+qs;
		}
		return url;
	}
	//*****************************************************************
	
	@RequestMapping(value="/schedule/viewSchedule", method = {RequestMethod.GET,RequestMethod.POST})
	public String viewSchedule(HttpSession session, Model model, @RequestParam(value="blogId") int blogId, @RequestParam(value="blogName") String blogName) {
		PersonDTO pdto = (PersonDTO) session.getAttribute("pdto");
		model.addAttribute("pdto", pdto);
		model.addAttribute("blogName",blogName);
		model.addAttribute("blogId", blogId);
		return "blog/schedule/viewSchedule";
	}
	
	@RequestMapping(value="/schedule/recevieData", method = RequestMethod.POST)
	public @ResponseBody String recevieData(Model model, HttpServletResponse response, @RequestParam(value="blogId") int blogId) {
		List<BScheduleFormatDTO> list = cService.getScheduleAll(blogId);
		String data = new Gson().toJson(list);
		response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");
		return data;
	}
	
	@RequestMapping(value="/schedule/viewRegistSchedule", method = RequestMethod.GET)
	public String viewRegistSchedule(@RequestParam("fDate") String date, Model model, HttpSession session
													,@RequestParam(value="blogId") int blogId) {
		PersonDTO pdto = (PersonDTO) session.getAttribute("pdto");
		model.addAttribute("pdto", pdto);
		model.addAttribute("startDate",date);
		model.addAttribute("blogId", blogId);
		return "blog/schedule/viewRegistSchedule";
	}
	
	@RequestMapping(value="/schedule/viewDetailSchedule", method = RequestMethod.GET)
	public String viewDetailSchedule(@RequestParam("sid") int sid, Model model, HttpSession session
													,@RequestParam(value="blogId") int blogId) {
		BScheduleDTO schedule = cService.readScheduleOne(sid);
		PersonDTO pdto = (PersonDTO) session.getAttribute("pdto");
		model.addAttribute("pdto", pdto);
		model.addAttribute("schedule", schedule);
		model.addAttribute("sid", sid);
		model.addAttribute("blogId", blogId);
		return "blog/schedule/viewDetailSchedule";
	}
	
	@RequestMapping(value="/schedule/registSchedule", method = RequestMethod.POST)
	public String registSchedule(BScheduleDTO schedule, Model model) {
		String url = null;
		System.out.println(schedule);
		boolean flag = cService.registSchedule(schedule);
		if(flag) {
			url = "blog/schedule/complete";
		}
		model.addAttribute("blogId", schedule.getBlogId());
		return url;
	}
	
	@RequestMapping(value="/schedule/modifySchedule", method = RequestMethod.POST)
	public String modifySchedule(BScheduleDTO schedule, Model model
											,@RequestParam("sid") int sid) {
		String url = null;
		schedule.setSid(sid);
		boolean flag = cService.modifySchedule(schedule);
		if(flag) {
			url = "blog/schedule/complete";
		}
		model.addAttribute("blogId", schedule.getBlogId());
		return url;
	}
	
	@RequestMapping(value="/schedule/removeSchedule", method = RequestMethod.POST)
	public String removeSchedule(@RequestParam("sid") int sid, Model model
												,@RequestParam(value="blogId") int blogId) {
		String url = null;
		boolean flag = cService.removeSchedule(sid);
		if(flag) {
			url = "blog/schedule/complete";
		}
		model.addAttribute("blogId", blogId);
		return url;
	}
	
	
	//*****************************************************************
	
	@RequestMapping(value="/file/listAll", method = {RequestMethod.POST, RequestMethod.GET})
	public String fileListAll(@RequestParam(value="page",defaultValue="0") int page, Model model, HttpSession session
									,@RequestParam(value="blogId") int blogId, @RequestParam(value="blogName") String blogName) {
		int amount = 15;
		BPageVO vo = pService.getPageVO(page,amount);
		vo.setBoardName("file");
		vo.setBlogId(blogId);
		vo.setBlogName(blogName);
		List<BPostDTO> list = service.getListAll(vo);
		ArrayList<String> pList = pService.makePageList(page, amount,vo);
		PersonDTO pdto = (PersonDTO) session.getAttribute("pdto");
		model.addAttribute("pdto", pdto);
		model.addAttribute("list",list);
		model.addAttribute("pList",pList);
		model.addAttribute("page",page);
		model.addAttribute("blogName",blogName);
		model.addAttribute("blogId", blogId);
		model.addAttribute("num", list.size());
		return "blog/file/fileList";
	}
	
	@RequestMapping(value="/file/viewRegist", method = {RequestMethod.GET, RequestMethod.POST})
	public String viewFileRegist(Model model, HttpSession session, @RequestParam(value="blogId") int blogId, @RequestParam(value="blogName") String blogName) {
		PersonDTO pdto = (PersonDTO) session.getAttribute("pdto");
		model.addAttribute("pdto", pdto);
		model.addAttribute("blogName",blogName);
		model.addAttribute("blogId", blogId);
		return "blog/file/fileRegist";
	}
	
/*	@RequestMapping(value="/file/fileRegist", method = {RequestMethod.GET, RequestMethod.POST})
	public String fileRegist(BPostDTO post, Model model
									,@RequestParam(value="blogId") int blogId, @RequestParam(value="blogName") String blogName) {
		String url = null;
		post.setBoardName("file");
		post.setBlogId(blogId);
		boolean flag = service.registPost(post);
		if(flag) {
			url = "redirect:/blog/file/listAll";
		}
		model.addAttribute("blogName",blogName);
		model.addAttribute("blogId", blogId);
		return url;
	}*/
	
	@RequestMapping(value="/file/fileRegist", method = {RequestMethod.GET, RequestMethod.POST})
	public String fileRegist(HttpServletRequest req, @RequestParam(value="blogId") int blogId,
									@RequestParam(value="blogName") String blogName, Model model, HttpSession session) {
		String url = null;
		BPostDTO fileDTO = new BPostDTO();
		PersonDTO pdto = (PersonDTO) session.getAttribute("pdto");
		model.addAttribute("pdto", pdto);
		fileDTO.setBlogId(blogId);
		//String path = req.getSession().getServletContext().getRealPath("/")+"resources\\image\\";
		String path = "d:\\dev\\upload\\";
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
					if(item.getFieldName().equals("postTitle")){
						fileDTO.setPostTitle(item.getString("UTF-8"));
					} else if(item.getFieldName().equals("userId")){
						fileDTO.setUserId(item.getString("UTF-8"));
					} else if(item.getFieldName().equals("postContents")) {
						fileDTO.setPostContents(item.getString("UTF-8"));
					}
				}
			}
			if(fileName!=null&&!fileName.trim().equals("")){
			
				fileDTO.setFilePath(fileName);
				fileName = path + fileName;
				item.write(new File(fileName)); //upload
			} else {
				//gallery.setUploadImg("no_detail_img.gif");
			}
		} catch(Exception e){
			e.printStackTrace();
			flag = true;
		}
		System.out.println(flag);
		System.out.println(fileDTO);
		if(!flag){
			fileDTO.setBlogId(blogId);
			fileDTO.setBoardName("file");
			flag =  service.uploadfile(fileDTO);
		}
		if(flag){
			url = "redirect:/blog/file/listAll";
		}
		//System.out.println(gallery);
		model.addAttribute("blogName",blogName);
		model.addAttribute("blogId", blogId);
		return url;
	}
	
	@RequestMapping(value="/file/download", method=RequestMethod.GET)
	public ModelAndView download(@RequestParam("filename") String filename, Model model){
		System.out.println(filename);
		String path = "d:\\dev\\upload\\";
		File file = new File(path+filename);
		return new ModelAndView("download", "fileName", file);
	}

	
	@RequestMapping(value="/file/read", method = RequestMethod.GET)
	public String fileRead(@RequestParam("postNo") int postNo, @RequestParam("page") int page,
								@RequestParam(value="query", defaultValue="") String query,Model model, HttpSession session
								,@RequestParam(value="blogId") int blogId, @RequestParam(value="blogName") String blogName) {
		String url = null;
		PersonDTO pdto = (PersonDTO) session.getAttribute("pdto");
		BPostNoInfoDTO infoDTO = new BPostNoInfoDTO();
		infoDTO.setPostNo(postNo);
		infoDTO.setBoardName("file");
		infoDTO.setBlogId(blogId);
		boolean flag = service.increasCount(infoDTO);
		boolean authFlag = false;
		if(flag){
			BPostDTO post = service.readPost(infoDTO);
			System.out.println(post.getFilePath());
			if(pdto != null) {
				if(post.getUserId().equals(pdto.getGuserId())) {
					authFlag = true;
					model.addAttribute("authFlag", authFlag);
				}
			}
			model.addAttribute("pdto", pdto);
			model.addAttribute("post", post);
			model.addAttribute("page", page);
			List<BReplyDTO> list = rService.getReplyListAll(infoDTO);
			model.addAttribute("list", list);
			model.addAttribute("query", query);
			model.addAttribute("blogName",blogName);
			model.addAttribute("blogId", blogId);
			url = "blog/file/detailFile";
		}
		return url;
	}
	
	@RequestMapping(value="/file/remove", method=RequestMethod.POST)
	public String fileRemove(@RequestParam("postNo") int postNo, @RequestParam("page") int page, Model model
										,@RequestParam(value="blogId") int blogId, @RequestParam(value="blogName") String blogName) {
		String url = null;
		BPostNoInfoDTO infoDTO = new BPostNoInfoDTO();
		infoDTO.setPostNo(postNo);
		infoDTO.setBoardName("file");
		boolean flag = service.remove(infoDTO);
		if(flag) {
			url = "redirect:/blog/file/listAll?page="+page;
		}
		model.addAttribute("blogName",blogName);
		model.addAttribute("blogId", blogId);
		return url;
	}
	
	
	@RequestMapping(value="/file/viewModify", method=RequestMethod.POST)
	public String viewFileModify(BPostDTO post, Model model, @RequestParam("postNo") int postNo,
											@RequestParam("page") int page, HttpSession session
											,@RequestParam(value="blogId") int blogId, @RequestParam(value="blogName") String blogName) {
		PersonDTO pdto = (PersonDTO) session.getAttribute("pdto");
		model.addAttribute("pdto", pdto);
		model.addAttribute("post",post);
		model.addAttribute("postNo",postNo);
		model.addAttribute("page",page);
		model.addAttribute("blogName",blogName);
		model.addAttribute("blogId", blogId);
		return "blog/file/fileModify";
	}
	
	@RequestMapping(value="/file/modify", method=RequestMethod.POST)
	public String modifyFile(BPostDTO post, Model model, @RequestParam("page") int page
										,@RequestParam(value="blogId") int blogId, @RequestParam(value="blogName") String blogName) {
		String url = null;
		post.setBoardName("file");
		boolean flag = service.modify(post);
		int postNo = post.getPostNo();
		String qs = "?postNo="+postNo+"&page="+page;
		if(flag) {
			url = "redirect:/blog/file/read"+qs;
		}
		model.addAttribute("blogName",blogName);
		model.addAttribute("blogId", blogId);
		return url;
	}
	
	@RequestMapping(value="/file/reply", method=RequestMethod.POST)
	public String replyFile(BReplyDTO reply, @RequestParam("page") int page, Model model
									,@RequestParam(value="blogId") int blogId, @RequestParam(value="blogName") String blogName) {
		String url = null;
		int postNo = reply.getPostNo();
		reply.setBoardName("file");
		reply.setBlogId(blogId);
		boolean flag = rService.insertReply(reply);
		if(flag) {
			String qs = "?postNo="+postNo+"&page="+page;
			url = "redirect:/blog/file/read"+qs;
		}
		model.addAttribute("blogName",blogName);
		model.addAttribute("blogId", blogId);
		return url;
	}
	
	@RequestMapping(value="/file/removeReply", method=RequestMethod.POST)
	public String removeFileReply(BReplyDTO reply, @RequestParam("page") int page
											,@RequestParam(value="blogId") int blogId, @RequestParam(value="blogName") String blogName) {
		String url = null;
		reply.setBlogId(blogId);
		boolean flag = rService.removeReply(reply);
		if(flag) {
			String qs = "?postNo="+reply.getPostNo()+"&page="+page + "&blogId=" + blogId + "&blogName=" + blogName;
			url = "redirect:/blog/file/read"+qs;
		}
		return url;
	}
	
	@RequestMapping(value="/file/search", method=RequestMethod.POST)
	public String searchFile(@RequestParam("query") String query, @RequestParam(value="page",defaultValue="0") int page,
										Model model, HttpSession session, @RequestParam(value="blogId") int blogId, @RequestParam(value="blogName") String blogName) {
		String url = null;
		int amount = 15;
		BSearchVO searchVO = new BSearchVO();
		searchVO.setQuery(query);
		searchVO.setVo(pService.getPageVO(page, amount));
		searchVO.setBoardName("file");
		List<BPostDTO> list = service.listSearchBookAll(searchVO);
		ArrayList<String> pList = pService.makeSerachList(page, amount,searchVO);
		PersonDTO pdto = (PersonDTO) session.getAttribute("pdto");
		model.addAttribute("pdto", pdto);
		model.addAttribute("list",list);
		model.addAttribute("pList",pList);
		model.addAttribute("page",page);
		model.addAttribute("search",searchVO);
		model.addAttribute("blogName",blogName);
		model.addAttribute("blogId", blogId);
		url = "blog/file/searchList";
		return url;
	}
	
	//*****************************************************************
	
	@RequestMapping(value="/board/listAll", method = {RequestMethod.POST, RequestMethod.GET})
	public String listAll(@RequestParam(value="page",defaultValue="0") int page, Model model, HttpSession session
								,@RequestParam(value="blogId") int blogId, @RequestParam(value="blogName") String blogName) {
		int amount = 15;
		BPageVO vo = pService.getPageVO(page,amount);
		vo.setBoardName("board");
		vo.setBlogId(blogId);
		vo.setBlogName(blogName);
		List<BPostDTO> list = service.getListAll(vo);
		ArrayList<String> pList = pService.makePageList(page, amount,vo);
		PersonDTO pdto = (PersonDTO) session.getAttribute("pdto");
		model.addAttribute("pdto", pdto);
		model.addAttribute("list",list);
		model.addAttribute("pList",pList);
		model.addAttribute("page",page);
		model.addAttribute("blogName",blogName);
		model.addAttribute("blogId", blogId);
		model.addAttribute("num", list.size());
		return "blog/board/boardList";
	}
	
	@RequestMapping(value="/board/viewRegist", method = {RequestMethod.GET, RequestMethod.POST})
	public String viewRegist(Model model, HttpSession session, @RequestParam(value="blogId") int blogId, @RequestParam(value="blogName") String blogName) {
		PersonDTO pdto = (PersonDTO) session.getAttribute("pdto");
		model.addAttribute("pdto", pdto);
		model.addAttribute("blogName",blogName);
		model.addAttribute("blogId", blogId);
		return "blog/board/boardRegist";
	}
	
	@RequestMapping(value="/board/boardRegist", method = {RequestMethod.GET, RequestMethod.POST})
	public String boardRegist(BPostDTO post, Model model
										,@RequestParam(value="blogId") int blogId, @RequestParam(value="blogName") String blogName) {
		String url = null;
		post.setBoardName("board");
		post.setBlogId(blogId);
		boolean flag = service.registPost(post);
		if(flag) {
			url = "redirect:/blog/board/listAll";
		}
		model.addAttribute("blogName",blogName);
		model.addAttribute("blogId", blogId);
		return url;
	}
	
	@RequestMapping(value="/board/read", method = RequestMethod.GET)
	public String read(@RequestParam("postNo") int postNo, @RequestParam("page") int page,
								@RequestParam(value="query", defaultValue="") String query,Model model, HttpSession session
								,@RequestParam(value="blogId") int blogId, @RequestParam(value="blogName") String blogName) {
		String url = null;
		PersonDTO pdto = (PersonDTO) session.getAttribute("pdto");
		BPostNoInfoDTO infoDTO = new BPostNoInfoDTO();
		infoDTO.setPostNo(postNo);
		infoDTO.setBoardName("board");
		infoDTO.setBlogId(blogId);
		boolean flag = service.increasCount(infoDTO);
		boolean authFlag = false;
		if(flag){
			BPostDTO post = service.readPost(infoDTO);
			if(pdto != null) {
				if(post.getUserId().equals(pdto.getGuserId())) {
					authFlag = true;
					model.addAttribute("authFlag", authFlag);
				}
			}
			model.addAttribute("pdto", pdto);
			model.addAttribute("post", post);
			model.addAttribute("page", page);
			List<BReplyDTO> list = rService.getReplyListAll(infoDTO);
			model.addAttribute("list", list);
			model.addAttribute("query", query);
			model.addAttribute("blogName",blogName);
			model.addAttribute("blogId", blogId);
			url = "blog/board/detailPost";
		}
		return url;
	}
	
	@RequestMapping(value="/board/remove", method=RequestMethod.POST)
	public String remove(@RequestParam("postNo") int postNo, @RequestParam("page") int page, Model model
									,@RequestParam(value="blogId") int blogId, @RequestParam(value="blogName") String blogName) {
		String url = null;
		BPostNoInfoDTO infoDTO = new BPostNoInfoDTO();
		infoDTO.setPostNo(postNo);
		infoDTO.setBoardName("board");
		boolean flag = service.remove(infoDTO);
		if(flag) {
			url = "redirect:/blog/board/listAll?page="+page;
		}
		model.addAttribute("blogName",blogName);
		model.addAttribute("blogId", blogId);
		return url;
	}
	
	
	@RequestMapping(value="/board/viewModify", method=RequestMethod.POST)
	public String viewModify(BPostDTO post, Model model, @RequestParam("postNo") int postNo, @RequestParam("page") int page, HttpSession session
										,@RequestParam(value="blogId") int blogId, @RequestParam(value="blogName") String blogName) {
		PersonDTO pdto = (PersonDTO) session.getAttribute("pdto");
		model.addAttribute("pdto", pdto);
		model.addAttribute("post",post);
		model.addAttribute("postNo",postNo);
		model.addAttribute("page",page);
		model.addAttribute("blogName",blogName);
		model.addAttribute("blogId", blogId);
		return "blog/board/boardModify";
	}
	
	@RequestMapping(value="/board/modify", method=RequestMethod.POST)
	public String modify(BPostDTO post, Model model, @RequestParam("page") int page
								,@RequestParam(value="blogId") int blogId, @RequestParam(value="blogName") String blogName) {
		String url = null;
		post.setBoardName("board");
		boolean flag = service.modify(post);
		int postNo = post.getPostNo();
		String qs = "?postNo="+postNo+"&page="+page;
		if(flag) {
			url = "redirect:/blog/board/read"+qs;
		}
		model.addAttribute("blogName",blogName);
		model.addAttribute("blogId", blogId);
		return url;
	}
	
	@RequestMapping(value="/board/reply", method=RequestMethod.POST)
	public String reply(BReplyDTO reply, @RequestParam("page") int page, Model model
								,@RequestParam(value="blogId") int blogId, @RequestParam(value="blogName") String blogName) {
		String url = null;
		int postNo = reply.getPostNo();
		reply.setBoardName("board");
		reply.setBlogId(blogId);
		boolean flag = rService.insertReply(reply);
		if(flag) {
			String qs = "?postNo="+postNo+"&page="+page;
			url = "redirect:/blog/board/read"+qs;
		}
		model.addAttribute("blogName",blogName);
		model.addAttribute("blogId", blogId);
		return url;
	}
	
	@RequestMapping(value="/board/modifyReply", method=RequestMethod.POST)
	public String modifyReply(BReplyDTO reply, @RequestParam("page") int page, Model model
											,@RequestParam(value="blogId") int blogId, @RequestParam(value="blogName") String blogName) {
		String url = null;
		model.addAttribute("blogName",blogName);
		model.addAttribute("blogId", blogId);
		return url;
	}
	
	@RequestMapping(value="/board/removeReply", method=RequestMethod.POST)
	public String removeReply(BReplyDTO reply, @RequestParam("page") int page
											,@RequestParam(value="blogId") int blogId, @RequestParam(value="blogName") String blogName) {
		String url = null;
		reply.setBlogId(blogId);
		boolean flag = rService.removeReply(reply);
		if(flag) {
			String qs = "?postNo="+reply.getPostNo()+"&page="+page + "&blogId=" + blogId + "&blogName=" + blogName;
			url = "redirect:/blog/board/read"+qs;
		}
		return url;
	}
	
	@RequestMapping(value="/board/search", method=RequestMethod.POST)
	public String search(@RequestParam("query") String query, @RequestParam(value="page",defaultValue="0") int page, Model model
								,@RequestParam(value="blogId") int blogId, @RequestParam(value="blogName") String blogName) {
		String url = null;
		int amount = 15;
		BSearchVO searchVO = new BSearchVO();
		searchVO.setQuery(query);
		searchVO.setVo(pService.getPageVO(page, amount));
		searchVO.setBoardName("board");
		List<BPostDTO> list = service.listSearchBookAll(searchVO);
		ArrayList<String> pList = pService.makeSerachList(page, amount,searchVO);
		model.addAttribute("list",list);
		model.addAttribute("pList",pList);
		model.addAttribute("page",page);
		model.addAttribute("search",searchVO);
		model.addAttribute("blogName",blogName);
		model.addAttribute("blogId", blogId);
		url = "blog/board/searchList";
		return url;
	}
	
	//*****************************************************************
	
	@RequestMapping(value="/photo/viewModifyPhoto", method=RequestMethod.POST)
	public String viewModifyImage(@RequestParam("imgNo") int imageNo, Model model
													,@RequestParam(value="blogId") int blogId, @RequestParam(value="blogName") String blogName) {
		BGalleryDTO gallery = gService.getPhoto(imageNo);
		model.addAttribute("gallery", gallery);
		model.addAttribute("blogName",blogName);
		model.addAttribute("blogId", blogId);
		model.addAttribute("blogName",blogName);
		model.addAttribute("blogId", blogId);
		return "blog/photo/viewModifyPhoto";
	}
	
	@RequestMapping(value="/photo/removePhoto", method=RequestMethod.POST)
	public String removePhoto(@RequestParam("imgNo") int imageNo,Model model,
											@RequestParam(value="blogId") int blogId, @RequestParam(value="blogName") String blogName) {
		String url = null;
		boolean flag = gService.removePhoto(imageNo);
		if(flag) {
			String qs = "?blogId=" + blogId + "&blogName=" + blogName;
			url = "redirect:/blog/photo/viewPhoto"+qs;
		}
		return url;
	}
	
	@RequestMapping(value="/photo/viewPhoto", method = RequestMethod.GET)
	public String viewPhoto(Model model, HttpSession session
										,@RequestParam(value="blogId") int blogId, @RequestParam(value="blogName") String blogName) {
		String url = "blog/photo/viewPhoto";
		List<BGalleryDTO> list = gService.getImageList(blogId);
		PersonDTO pdto = (PersonDTO) session.getAttribute("pdto");
		model.addAttribute("pdto", pdto);
		model.addAttribute("imgList", list);
		model.addAttribute("blogName",blogName);
		model.addAttribute("blogId", blogId);
		return url;
	}
	
	@RequestMapping(value="/photo/viewUploadPhoto", method = RequestMethod.GET)
	public String viewUploadPhoto(@RequestParam(value="blogId") int blogId, @RequestParam(value="blogName") String blogName,
													Model model, HttpSession session) {
		PersonDTO pdto = (PersonDTO) session.getAttribute("pdto");
		String url = "blog/photo/viewUploadPhoto";
		model.addAttribute("blogName",blogName);
		model.addAttribute("blogId", blogId);
		model.addAttribute("pdto", pdto);
		return url;
	}
	
	@RequestMapping(value="/photo/uploadPhoto", method = RequestMethod.POST)
	public String uploadPhoto(HttpServletRequest req, @RequestParam(value="blogId") int blogId, @RequestParam(value="blogName") String blogName,
											Model model, HttpSession session) {
		String url = null;
		BGalleryDTO gallery = new BGalleryDTO();
		gallery.setBlogId(blogId);
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
		model.addAttribute("blogName",blogName);
		model.addAttribute("blogId", blogId);
		return url;
	}
	
	//*****************************************************************
	
	@RequestMapping(value="/comments/listAll", method = {RequestMethod.POST, RequestMethod.GET})
	public String commentsListAll(@RequestParam(value="page",defaultValue="0") int page, Model model, HttpSession session
												,@RequestParam(value="blogId") int blogId, @RequestParam(value="blogName") String blogName) {
		int amount = 15;
		BPageVO vo = pService.getPageVO(page,amount);
		vo.setBoardName("comments");
		vo.setBlogId(blogId);
		vo.setBlogName(blogName);
		List<BPostDTO> list = service.getListAll(vo);
		ArrayList<String> pList = pService.makePageList(page, amount,vo);
		PersonDTO pdto = (PersonDTO) session.getAttribute("pdto");
		model.addAttribute("pdto", pdto);
		model.addAttribute("list",list);
		model.addAttribute("pList",pList);
		model.addAttribute("page",page);
		model.addAttribute("blogName",blogName);
		model.addAttribute("blogId", blogId);
		model.addAttribute("num", list.size());
		return "blog/comments/commentsList";
	}
	
	@RequestMapping(value="/comments/viewRegist", method = {RequestMethod.GET, RequestMethod.POST})
	public String viewCommentsRegist(Model model, HttpSession session
														,@RequestParam(value="blogId") int blogId, @RequestParam(value="blogName") String blogName) {
		PersonDTO pdto = (PersonDTO) session.getAttribute("pdto");
		model.addAttribute("pdto", pdto);
		model.addAttribute("blogName",blogName);
		model.addAttribute("blogId", blogId);
		return "blog/comments/commentsRegist";
	}
	
	@RequestMapping(value="/comments/commentsRegist", method = {RequestMethod.GET, RequestMethod.POST})
	public String commentsRegist(BPostDTO post, Model model
												,@RequestParam(value="blogId") int blogId, @RequestParam(value="blogName") String blogName) {
		String url = null;
		post.setBoardName("comments");
		post.setBlogId(blogId);
		boolean flag = service.registPost(post);
		if(flag) {
			url = "redirect:/blog/comments/listAll";
		}
		model.addAttribute("blogName",blogName);
		model.addAttribute("blogId", blogId);
		return url;
	}
	
	@RequestMapping(value="/comments/read", method = RequestMethod.GET)
	public String commentsRead(@RequestParam("postNo") int postNo, @RequestParam("page") int page,
								@RequestParam(value="query", defaultValue="") String query,Model model, HttpSession session
								,@RequestParam(value="blogId") int blogId, @RequestParam(value="blogName") String blogName) {
		String url = null;
		PersonDTO pdto = (PersonDTO) session.getAttribute("pdto");
		BPostNoInfoDTO infoDTO = new BPostNoInfoDTO();
		infoDTO.setPostNo(postNo);
		infoDTO.setBoardName("comments");
		infoDTO.setBlogId(blogId);
		boolean flag = service.increasCount(infoDTO);
		boolean authFlag = false;
		if(flag){
			BPostDTO post = service.readPost(infoDTO);
			if(pdto != null) {
				if(post.getUserId().equals(pdto.getGuserId())) {
					authFlag = true;
					model.addAttribute("authFlag", authFlag);
				}
			}
			System.out.println(authFlag);
			model.addAttribute("pdto", pdto);
			model.addAttribute("post", post);
			model.addAttribute("page", page);
			List<BReplyDTO> list = rService.getReplyListAll(infoDTO);
			model.addAttribute("list", list);
			model.addAttribute("query", query);
			model.addAttribute("blogName",blogName);
			model.addAttribute("blogId", blogId);
			url = "blog/comments/detailComments";
		}
		return url;
	}
	
	@RequestMapping(value="/comments/remove", method=RequestMethod.POST)
	public String commentsRemove(@RequestParam("postNo") int postNo, @RequestParam("page") int page, Model model
													,@RequestParam(value="blogId") int blogId, @RequestParam(value="blogName") String blogName) {
		String url = null;
		BPostNoInfoDTO infoDTO = new BPostNoInfoDTO();
		infoDTO.setPostNo(postNo);
		infoDTO.setBoardName("comments");
		boolean flag = service.remove(infoDTO);
		if(flag) {
			url = "redirect:/blog/comments/listAll?page="+page;
		}
		model.addAttribute("blogName",blogName);
		model.addAttribute("blogId", blogId);
		return url;
	}
	
	@RequestMapping(value="/comments/removeReply", method=RequestMethod.POST)
	public String removeComReply(BReplyDTO reply, @RequestParam("page") int page
											,@RequestParam(value="blogId") int blogId, @RequestParam(value="blogName") String blogName) {
		String url = null;
		System.out.println(reply);
		reply.setBlogId(blogId);
		boolean flag = rService.removeReply(reply);
		if(flag) {
			String qs = "?postNo="+reply.getPostNo()+"&page="+page + "&blogId=" + blogId + "&blogName=" + blogName;
			url = "redirect:/blog/comments/read"+qs;
		}
		return url;
	}
	
	@RequestMapping(value="/comments/viewModify", method=RequestMethod.POST)
	public String viewCommentsModify(BPostDTO post, Model model, @RequestParam("postNo") int postNo,
														@RequestParam("page") int page, HttpSession session
														,@RequestParam(value="blogId") int blogId, @RequestParam(value="blogName") String blogName) {
		PersonDTO pdto = (PersonDTO) session.getAttribute("pdto");
		model.addAttribute("pdto", pdto);
		model.addAttribute("post",post);
		model.addAttribute("postNo",postNo);
		model.addAttribute("page",page);
		model.addAttribute("blogName",blogName);
		model.addAttribute("blogId", blogId);
		return "blog/comments/commentsModify";
	}
	
	@RequestMapping(value="/comments/modify", method=RequestMethod.POST)
	public String modifyComments(BPostDTO post, Model model, @RequestParam("page") int page
												,@RequestParam(value="blogId") int blogId, @RequestParam(value="blogName") String blogName) {
		String url = null;
		post.setBoardName("comments");
		boolean flag = service.modify(post);
		int postNo = post.getPostNo();
		String qs = "?postNo="+postNo+"&page="+page;
		if(flag) {
			url = "redirect:/blog/comments/read"+qs;
		}
		model.addAttribute("blogName",blogName);
		model.addAttribute("blogId", blogId);
		return url;
	}
	
	@RequestMapping(value="/comments/reply", method=RequestMethod.POST)
	public String replyComments(BReplyDTO reply, @RequestParam("page") int page, Model model
												,@RequestParam(value="blogId") int blogId, @RequestParam(value="blogName") String blogName) {
		String url = null;
		int postNo = reply.getPostNo();
		reply.setBoardName("comments");
		reply.setBlogId(blogId);
		boolean flag = rService.insertReply(reply);
		if(flag) {
			String qs = "?postNo="+postNo+"&page="+page;
			url = "redirect:/blog/comments/read"+qs;
		}
		model.addAttribute("blogName",blogName);
		model.addAttribute("blogId", blogId);
		return url;
	}
	
	@RequestMapping(value="/comments/search", method=RequestMethod.POST)
	public String searchComments(@RequestParam("query") String query, @RequestParam(value="page",defaultValue="0") int page,
													Model model, HttpSession session, @RequestParam(value="blogId") int blogId, @RequestParam(value="blogName") String blogName) {
		String url = null;
		int amount = 15;
		BSearchVO searchVO = new BSearchVO();
		searchVO.setQuery(query);
		searchVO.setVo(pService.getPageVO(page, amount));
		searchVO.setBoardName("comments");
		List<BPostDTO> list = service.listSearchBookAll(searchVO);
		ArrayList<String> pList = pService.makeSerachList(page, amount,searchVO);
		PersonDTO pdto = (PersonDTO) session.getAttribute("pdto");
		model.addAttribute("pdto", pdto);
		model.addAttribute("list",list); 
		model.addAttribute("pList",pList);
		model.addAttribute("page",page);
		model.addAttribute("search",searchVO);
		model.addAttribute("blogName",blogName);
		model.addAttribute("blogId", blogId);
		url = "blog/comments/searchList";
		return url;
	}
	
	//*****************************************************************
	@RequestMapping(value="/contact", method = RequestMethod.GET)
	public String contact() {
		
		return "blog/contact/contact";
	}
	
	@RequestMapping(value="/member/LoginForm", method = {RequestMethod.GET, RequestMethod.POST})
	public String login() {
		String url = "login/LoginForm";
		
		/*-------------------------- [2차 처리 예정] --------------------------
			1) 개인/기업 > 체크박스 추가 	2) 개인/기업 > DB등록된 코드값 비교해서 로그인 처리 
			3) 로그인 유지 > 체크박스 추가
		 ------------------------------------------------------------------*/

		return url;
	}
	
	
	
}
