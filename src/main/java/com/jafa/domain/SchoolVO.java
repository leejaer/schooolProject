package com.jafa.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class SchoolVO {

	private Long sno;
	private String kind;
	private String cate_id;
	private String title;
	private String content;
	private String writer;
	private String writeDate;	
	private Long attachFileCnt;
	
	Category schoolCate;
	
	List<AttachVO> attachList;
}
