package com.today.hanbok.dao;

import java.util.ArrayList;

import com.today.hanbok.dto.orderDto;

public interface rentHistoryIDao {

	public ArrayList<orderDto> rentHistory(int start, int end,String searchKeyword,String searchType,String dt_fr,String dt_to,String date,String state,String searchState,String mem_id);	
	public int selectBoardTotCount(String searchKeyword,String searchType,String dt_fr,String dt_to,String date,String state, String searchState,String mem_id);
	public orderDto rentCancel(String rt_num);
	public void cg_state(String rt_num);
	public void cancel(String rt_num,String rf_num,String rf_reason,String mem_id);
	public orderDto rentHistory_view(String odr_num);


}
