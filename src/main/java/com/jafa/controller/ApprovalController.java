package com.jafa.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jafa.domain.ApprovalVO;
import com.jafa.service.ApprovalService;

@Controller
@RequestMapping("/approval")
public class ApprovalController {
	
	@Autowired
	ApprovalService approvlaSercive;
	
	@PostMapping("/write")
	public String write(ApprovalVO vo,RedirectAttributes rttr,String k,String p) {
		approvlaSercive.write(vo);
		return "redirect:/board/list/"+k+"/"+p;
	}
	
	@PostMapping("/ok")
	public String ok(Long ano,Long no,RedirectAttributes rttr,String k,String p) {
		approvlaSercive.del(ano,no);
		return "redirect:/board/list/"+k+"/"+p;
	}
	
	@PostMapping("/deny")
	public String deny(String state,Long ano,RedirectAttributes rttr,String k,String p) {
		approvlaSercive.upadate(state,ano);
		return "redirect:/board/list/"+k+"/"+p;
	}
}

