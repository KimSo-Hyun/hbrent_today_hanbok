package com.today.hanbok.dao;

import java.util.ArrayList;

import com.today.hanbok.dto.MemberDto;

public interface JoinIDao {


//	마이페이지의  회원가입
	public void mypage_join(String mem_id, String mem_pass, String mem_name,String mem_birth, String mem_gender,String mem_email,
			String mem_cellphone,String mem_address);

	public ArrayList<MemberDto> mypage_loginproc(String mem_id_input);

	public String id_check(String input_id);
	
}