package com.jafa.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jafa.domain.ApprovalVO;

public interface ApprovalRepository {

	void write(ApprovalVO vo);

	List<ApprovalVO> getList();

	void del(Long ano);

	void denyUpdate(@Param("state") String state,@Param("ano") Long ano);

}
