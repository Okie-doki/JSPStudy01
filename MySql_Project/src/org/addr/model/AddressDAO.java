package org.addr.model;

import java.util.ArrayList;

public interface AddressDAO {
//	전체보기
	public ArrayList<Address> getAddress(String field, String word);
//	상세보기
	public Address findByNum(int num);
//	추가
	public void addressInsert(Address address);
//	수정
	public void addressUpdate(Address address);
//	삭제
	public void addressDelete(int num);
//	개수
	public int getCount(String field, String word);
//	우편번호
	public ArrayList<Zipcode> findZipcode(String dong);
}
