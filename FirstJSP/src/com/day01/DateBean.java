package com.day01;

import java.util.Calendar;

public class DateBean {
	Calendar ca = Calendar.getInstance();
	String[] week = {"일", "월", "화", "수", "목", "금", "토"};
	
	public String getToday() {
		String str = ca.get(Calendar.YEAR)+"년";
		str += ca.get(Calendar.MONTH)+1+"월";
		str += ca.get(Calendar.DATE)+"일";
		str += week[ca.get(Calendar.DAY_OF_WEEK)-1]+"요일";
		return str;
	}
}
