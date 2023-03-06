package com.jafa.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jafa.domain.Reply_boardVO;
import com.jafa.service.ReplyService;

@RestController  
@RequestMapping("/reply")
public class ReplyController {
	
	@Autowired
	ReplyService replyService;
	
	@PostMapping("/write")//@RequestBody 붙여야 JSON으로 들어온 값을 바인딩 할 수 있음
	public String write(@RequestBody Reply_boardVO  reply) {
		replyService.write(reply);
		return "댓글 성공";
	}

	
	
	@PostMapping("/commentWrite")
	public String commentWrite(@RequestBody Reply_boardVO  comment) {
		replyService.write(comment);
		return "댓글 성공";
	}

	
	@PostMapping("/answerdel")//
	public String answerdel(@RequestBody Reply_boardVO  comment) {
		comment.setWriter("미상");
		comment.setReply("지워진 글입니다");
		System.out.println(comment);
		replyService.answerdel(comment);
		return "댓글 성공";
	}

	@GetMapping("/list")
	public String list(@RequestBody String sno) {
		System.out.println(sno);
		System.out.println("여기값 들어왔음?");
		return "댓글 성공";
	}
}
