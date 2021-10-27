package com.today.hanbok.dao;

import java.util.ArrayList;

import com.today.hanbok.dto.orderDto;
import com.today.hanbok.dto.refundDto;

public interface rentHistoryMgrIDao {

	public ArrayList<orderDto> rentHistory_manager(int start, int end,String searchKeyword,String searchType,String dt_fr,String dt_to,String date,String state,String searchState);	
	public int selectTotCount(String searchKeyword,String searchType,String dt_fr,String dt_to,String date,String state, String searchState);
	public void cgState(String odr_num,String state_box);
	
	public ArrayList<refundDto> refund();


}
