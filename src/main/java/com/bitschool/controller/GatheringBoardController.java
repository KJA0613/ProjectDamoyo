package com.bitschool.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitschool.dto.PageVO;
import com.bitschool.dto.PersonDTO;
import com.bitschool.dto.PostDTO;
import com.bitschool.dto.ReplyDTO;
import com.bitschool.dto.SearchVO;
import com.bitschool.service.IPageService;
import com.bitschool.service.IPostService;
import com.bitschool.service.IReplyService;

@Controller
@RequestMapping("/board")
public class GatheringBoardController {
	//test
	@Inject
	private IPostService postService;
	
	@Inject
	private IPageService pageService;
	
	@Inject
	private IReplyService replyService;
	
	
	@RequestMapping(value = "/listAll", method = { RequestMethod.POST, RequestMethod.GET })
	public String listAll(
			@RequestParam(value="page", defaultValue="0") int page, 
			@RequestParam("boardName") String boardName,
			@RequestParam(value="query", defaultValue="") String query,
			Model model,
			HttpSession session
			){
		String url = "/gather/board/board_list";
		int amount = 15;
		
		System.out.println("listAll의 query : "+query);
		
		PageVO vo = pageService.getPageVO(page, amount); // 페이징 작업의 전초,
		SearchVO svo = new SearchVO();
		svo.setVo(vo);
		svo.setQuery(query);

		List<PostDTO> list = postService.getListAll(svo, boardName); // f리스트 값을 불러옴
		ArrayList<String> pList = pageService.makePageList(page, amount, boardName, query); // 페이징
		
		model.addAttribute("list", list);
		model.addAttribute("pList", pList);
		model.addAttribute("page", page);
		model.addAttribute("boardName", boardName);
		model.addAttribute("query",query);
		System.out.println("listAll boardName : "+boardName);
		
		
		PersonDTO pdto = (PersonDTO) session.getAttribute("pdto");
		
		if(session.getAttribute("alarm")!=null){
			boolean alarm = (boolean) session.getAttribute("alarm");
			
			if(alarm){
				model.addAttribute("alarm",alarm);
			}
		}
		
		if(pdto!=null){ // 로그인 체크
			model.addAttribute("pdto", pdto);
		}
		
	
		return url;
	}

	@RequestMapping(value = "/viewRegist", method = { RequestMethod.GET, RequestMethod.POST })
	public String viewRegist(
			@RequestParam("boardName") String boardName, 
			Model model,
			HttpSession session
			) {
		
		PersonDTO pdto = (PersonDTO) session.getAttribute("pdto");
		
		if(session.getAttribute("alarm")!=null){
			boolean alarm = (boolean) session.getAttribute("alarm");
			
			if(alarm){
				model.addAttribute("alarm",alarm);
			}
		}
		
		if(pdto!=null){ // 로그인 체크
			model.addAttribute("pdto", pdto);
		}
				
		model.addAttribute("boardName",boardName);
				
		return "/gather/board/board_regist";
	}

	@RequestMapping(value = "/boardRegist", method = { RequestMethod.GET, RequestMethod.POST })
	public String boardRegist(PostDTO post) {
		String url = null;
		boolean flag = postService.registPost(post);
		if (flag) {
			url = "redirect:/board/listAll?boardName="+post.getBoardName();
		}
		return url;
	}

//	읽어오는 메서드
	@RequestMapping(value = "/read", method = {RequestMethod.POST, RequestMethod.GET})
	public String read(
			@RequestParam("page") int page, 
			@RequestParam(value="query", defaultValue="") String query,
			PostDTO postdto,
			Model model,
			HttpSession session
			) {
		String url = null;
		boolean flag = postService.increasCount(postdto); // 게시글 조회수 +1해주는 메서드
		if (flag) {
			PostDTO post = postService.readPost(postdto); // 게시글 내용 불러오는 메서드
			model.addAttribute("post", post);
			model.addAttribute("page", page);
			List<ReplyDTO> list = replyService.getReplyListAll(postdto); // 댓글가져오는 메서드
			model.addAttribute("list", list);
			model.addAttribute("query",query);
			System.out.println(post);
			url = "/gather/board/detailPost";
		}
		
		PersonDTO pdto = (PersonDTO) session.getAttribute("pdto");
		
		if(pdto!=null){ // 로그인 체크
			model.addAttribute("pdto", pdto);
		}
		if(session.getAttribute("alarm")!=null){
			boolean alarm = (boolean) session.getAttribute("alarm");
			
			if(alarm){
				model.addAttribute("alarm",alarm);
			}
		}
		return url;
	}

//	삭제하는 메서드
	@RequestMapping(value = "/remove", method = {RequestMethod.POST, RequestMethod.GET})
	public String remove(
			PostDTO post, 
			@RequestParam("page") int page,
			@RequestParam(value="query", defaultValue="") String query
			) {
		String url = null;
		System.out.println("remove에 "+post);
		String boardName = post.getBoardName();
		

		// utf해줌..
		SearchVO svo = new SearchVO();
		svo.setQuery(query);
		query = svo.getUTFQuery();
		
		boolean flag = postService.remove(post);
		if (flag) {
			url = "redirect:/board/listAll?page=" + page +"&boardName=" + boardName + "&query=" +query;
		}
		return url;
	}

//	수정 페이지 접근메서드
	@RequestMapping(value = "/viewModify", method = RequestMethod.POST)
	public String viewModify(
			PostDTO post, 
			@RequestParam("page") int page,
			@RequestParam(value="query", defaultValue="") String query, 
			Model model,
			HttpSession session
			) {
		
		PersonDTO pdto = (PersonDTO) session.getAttribute("pdto");
		
		if(pdto!=null){ // 로그인 체크
			model.addAttribute("pdto", pdto);
		}
		if(session.getAttribute("alarm")!=null){
			boolean alarm = (boolean) session.getAttribute("alarm");
			
			if(alarm){
				model.addAttribute("alarm",alarm);
			}
		}
		
		System.out.println("viewModify의 "+post);
		model.addAttribute("post", post);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		return "/gather/board/board_modify";
	}

//	수정하는 메서드
	@RequestMapping(value = "/modify", method = {RequestMethod.POST, RequestMethod.GET})
	public String modify(
			PostDTO post, 
			Model model, 
			@RequestParam("page") int page,
			@RequestParam(value="query", defaultValue="") String query
			){
		String url = null;
		boolean flag = postService.modify(post);
		int postNo = post.getPostNo();
		String boardName = post.getBoardName();

		// utf해줌..
		SearchVO svo = new SearchVO();
		svo.setQuery(query);
		query = svo.getUTFQuery();
		
		String qs = "?postNo=" + postNo + "&page=" + page + "&boardName=" + boardName + "&query=" + query;
		if (flag) {
			url = "redirect:/board/read" + qs;
		}
		return url;
	}

//	댓글 다는 메서드
	@RequestMapping(value = "/reply", method = {RequestMethod.POST, RequestMethod.GET})
	public String reply(
			ReplyDTO reply, 
			@RequestParam("page") int page,
			@RequestParam(value="query", defaultValue="") String query) {
		String url = null;
		
		int postNo = reply.getPostNo();
		String boardName = reply.getBoardName();
				
		SearchVO svo = new SearchVO();
		svo.setQuery(query);
		query = svo.getUTFQuery();
		
		boolean flag = replyService.insertReply(reply);
		if (flag) {
			String qs = "?postNo=" + postNo + "&page=" + page + "&boardName=" + boardName + "&query=" +query;
			url = "redirect:/board/read" + qs;
		}
		return url;
	}
}
