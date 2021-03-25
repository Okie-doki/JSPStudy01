package com.addr.model;

import java.util.ArrayList;

public interface AddrDAO {
//	전체보기
	public ArrayList<AddrDTO> addrList();
//	상세보기
	public AddrDTO addrDetail(int num);
//	추가
	public void addrInsert(AddrDTO addr);
//	수정
	public void addrUpdate(AddrDTO addr);
//	삭제
	public void addrDelete(int num);
//	검색
	public ArrayList<AddrDTO> addrSearchList(String field, String word);
//	개수(검색없음)
	public int addrCount();
//	개수(검색)
	public int addrSearchCount(String field, String word);
//	우편번호 검색
	public ArrayList<ZipDTO> addrZipRead(String dong);
	
}
