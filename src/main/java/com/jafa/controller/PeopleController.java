package com.jafa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jafa.domain.PeopleVO;
import com.jafa.service.BoardService;
import com.jafa.service.PeopleService;

@Controller 
@RequestMapping("/people")
public class PeopleController {
	
	@Autowired
	PeopleService peopleService;
	
	@Autowired
	BoardService boardService;
	
	@GetMapping(value = {"/write/{kind}/{pageName}"})
	public String writeForm(Model model,@PathVariable String kind, @PathVariable String pageName) {
		model.addAttribute("cateList",boardService.list(kind));
		
		return "/people/writeForm";
	}
	
	@PostMapping("/write")
	public String school(PeopleVO  vo,RedirectAttributes rttr,
			@RequestParam("attachFile") List<MultipartFile> multipartFiles, String cate_id) {

		peopleService.write(vo,multipartFiles);
		return "redirect:/board/list/vicep/"+cate_id;
	}

}
