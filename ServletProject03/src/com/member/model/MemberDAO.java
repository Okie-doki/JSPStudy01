package com.member.model;

import java.util.ArrayList;

public interface MemberDAO {
//	전체보기
	public ArrayList<MemberDTO> getMember();
//	추가
	public void memberJoin(MemberDTO member);
//	수정
	public void memeberUpdate(MemberDTO member);
//	삭제
	public void memberDelete(MemberDTO member);
//	상세보기
	public MemberDTO findById(String userid);
//	회원수
	public int memberCount();
//	아이디 중복 확인
	public String memberIdCheck(String userid);
//	로그인 확인
	public MemberDTO memberLoginCheck(String userid, String pwd);
}
