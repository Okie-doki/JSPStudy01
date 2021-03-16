package com.member.dao;

import java.util.ArrayList;

import com.member.dto.MemberDTO;

public interface MemberDAO {
//	전체보기
	public ArrayList<MemberDTO> memList();
//	추가
	public void memInsert(MemberDTO member);
//	수정
	public int memUpdate(MemberDTO member);
//	삭제
	public void memDelete(String userId);
//	상세보기
	public MemberDTO findById(String userId);
//	아이디 중복체크
	public String idCheck(String userId);
//	로그인 체크
	public int loginCheck(String userid, String pwd);
//	회원수
	public int getCount();
}
