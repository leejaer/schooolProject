package com.jafa.controller;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jafa.domain.ApprovalVO;
import com.jafa.domain.AttachVO;
import com.jafa.domain.Category;
import com.jafa.domain.Criteria;
import com.jafa.domain.ModifySnoS;
import com.jafa.domain.Pagination;
import com.jafa.domain.PeopleVO;
import com.jafa.domain.Reply_boardVO;
import com.jafa.domain.SchoolVO;
import com.jafa.exception.monthException;
import com.jafa.service.ApprovalService;
import com.jafa.service.AttachService;
import com.jafa.service.BoardService;
import com.jafa.service.PeopleService;

import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	
	@Autowired
	BoardService boardService;
	
	@Autowired
	AttachService attachService; 
	
	@Autowired
	PeopleService peopleService;
	
	@Autowired
	ApprovalService approvalService;
	
	//카멜 sno를 카멜케이스 사용 오류
	@GetMapping(value = {"/list","/list/{kind}","/list/{kind}/{pageName}","/list/{kind}/{pageName}/{month}"})
	public String school(Model model,@PathVariable String kind,
			@PathVariable(required = false) String pageName,
			@PathVariable(required = false) String month,
			String type,
			@ModelAttribute("cri") Criteria criteria,
			String search) {
		Calendar calendar = Calendar.getInstance();
		int today = calendar.get(Calendar.MONTH)+1;
		
		if(month != null && month!="") {
			int monthInt = Integer.parseInt(month);
			if(monthInt>12) monthInt-=12;
			if(monthInt<1) monthInt+=12;
			if(monthInt<1 || monthInt>13 ) {
				throw new monthException("잘못된 값입니다");
			}
			today = monthInt; 
		};
		
		if(pageName.equals("join")) {
			List<PeopleVO> list = peopleService.list();
			model.addAttribute("list",list);
		}
		if(pageName.equals("p_join")) {
			List<ApprovalVO> list = approvalService.list();
			System.out.println(list);
			model.addAttribute("list",list);
		}
		
		
		model.addAttribute("cateList",boardService.list(kind));
		
		if(kind.equals("school") && pageName!=null && pageName !="") {
			model.addAttribute("board",boardService.getBoard(kind, pageName,criteria))
				.addAttribute("p", new Pagination(criteria, boardService.getToalCount(kind, pageName,criteria)));;
		}	

		//intro만의 attachList
		if(kind.equals("school") && pageName!=null && pageName.equals("intro")) {
			SchoolVO vo = boardService.detail(1L);
			if(vo.getAttachFileCnt()>=1) {
				List<AttachVO> attachList=attachService.list(1L);
				model.addAttribute("attachList",attachList);
			}
		};
		
		
		//급식 메뉴에 달을 넣어서 표시해야하는데 오늘 달을 검색하게 하기 or 직접 입력하기 
		if(kind.equals("school") && pageName!=null && pageName.equals("cafe")) {
			SchoolVO vo	= boardService.serchCafeInfo(pageName,today);
			model.addAttribute("today",today);
			if(vo.getAttachFileCnt()>=1) {
				List<AttachVO> attachList=attachService.list(vo.getSno());
				model.addAttribute("attachList",attachList);
			}
		};
		
		return "board/schoolInfo";
	}
	
	@PostMapping("/write")
	public String write(SchoolVO vo,RedirectAttributes rttr,
			@RequestParam("attachFile") List<MultipartFile> multipartFiles,String kind, String cate_id) {
		
		boardService.write(vo, multipartFiles);
		return "redirect:/board/list/school/"+cate_id;
	}
	
	
	/*
	 * 메인 사진 게시판과 게시판 나누기 
	 * 메인은 사진만 올라가고 위치가 고정이여서 따로 만듬
	 * */
	@PostMapping("/pictureUpdate")
	public String pictureUpdate(SchoolVO vo,RedirectAttributes rttr,
			@RequestParam("attachFile") List<MultipartFile> multipartFile) {
		
		boardService.pictureUpdate(vo, multipartFile);
		return "redirect:/board/list/school/Intro";
	}
	
	@GetMapping(value = {"/write/{kind}/{pageName}"})
	public String writeForm(Model model,@PathVariable String kind, @PathVariable String pageName) {
		model.addAttribute("cateList",boardService.list(kind));
		
		return "/board/writeForm";
	}
	
	@GetMapping("/detail/{sno}")
	public String detail(Model model,@PathVariable Long sno) {
		
		
		List<Reply_boardVO> replyList = boardService.findReply(sno);
		
		SchoolVO detail = boardService.detail(sno);
		
		if(detail.getAttachFileCnt()>=1) {
			List<AttachVO> attachList=attachService.list(sno);
			model.addAttribute("attachList",attachList);
		}
		
		model.addAttribute("reply",replyList);
		model.addAttribute("cateList",boardService.list(detail.getKind()));
		model.addAttribute("d",detail);
		
		return "/board/detail";
	}
	
	
	@PostMapping("/delete")
	public String remove(Long sno,Model model,RedirectAttributes rttr,String kind,String pageName) {
		SchoolVO detail = boardService.detail(sno);
		model.addAttribute("cateList",boardService.list(detail.getKind()));
		boardService.remove(sno);
		
		return "redirect:/list/"+kind+"/"+pageName;
	}
	
	@PostMapping("/cafeUpdate")
	public String cate(SchoolVO vo,RedirectAttributes rttr,Model model
			,@RequestParam("attachFile") List<MultipartFile> multipartFile) {
		model.addAttribute("cateList",boardService.list(vo.getKind()));
		
		boardService.cafeUpdate(vo, multipartFile);
		
		
		return "redirect:/board/list/school/cafe";
	}
	
	@GetMapping("/modify")
	public String modifyForm(Long sno, Model model,String pageName) {
		SchoolVO vo = boardService.detail(sno);
		model.addAttribute("cateList",boardService.list(vo.getKind()));
		if(vo.getAttachFileCnt()>=1) {
			List<AttachVO> attachList=attachService.list(sno);
			model.addAttribute("attachList",attachList);
		}		
		model.addAttribute("pageName",pageName);
		model.addAttribute("d",vo);
		
		return "/board/modifyForm";
	}
	
	@PostMapping("/modify")
	public String modify(ModifySnoS delCheck,SchoolVO vo,RedirectAttributes rttr,
			@RequestParam("attachFile") List<MultipartFile> multipartFiles) {
		boardService.modifyBoard(delCheck, vo, multipartFiles);
		return "redirect:/board/detail/"+vo.getSno();
	}
	
}
