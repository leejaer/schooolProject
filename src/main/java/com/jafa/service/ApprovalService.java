package com.jafa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jafa.domain.ApprovalVO;
import com.jafa.repository.ApprovalRepository;
import com.jafa.repository.PeopleRepository;

@Service
public class ApprovalService {
	
	@Autowired
	ApprovalRepository approvalRepository;
	
	@Autowired
	PeopleRepository peopleRepository;
	
	public void write(ApprovalVO vo) {
		approvalRepository.write(vo);
	}

	public List<ApprovalVO> list() {

		return approvalRepository.getList();
	}
	
	@Transactional
	public void del(Long ano, Long no) {
		
		approvalRepository.del(ano);
		peopleRepository.del(no);
	}

	public void upadate(String state, Long ano) {
		approvalRepository.denyUpdate(state,ano);
		
	}

}
