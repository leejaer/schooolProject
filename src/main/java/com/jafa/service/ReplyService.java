package com.jafa.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jafa.domain.Reply_boardVO;
import com.jafa.repository.ReplyRepository;

@Service
public class ReplyService {

	@Autowired
	ReplyRepository replyRepository;

	public void write(Reply_boardVO reply) {
		
		replyRepository.write(reply);
		replyRepository.updateAnswer(reply);
	}

	public void answerdel(Reply_boardVO comment) {
		
		
		if(comment.getAnswer()!=null) {
			replyRepository.delanswer(comment);
		}else {
			replyRepository.del(comment);
		}
		
	}
	
	

}
