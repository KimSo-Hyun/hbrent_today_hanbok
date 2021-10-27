package com.today.hanbok.dao;

import java.util.ArrayList;
import com.today.hanbok.dto.HbDto;

public interface HbIDao {

	public ArrayList<HbDto> hba(int start, int end, String searchKeyword,String selNum);
	
	public int selectBoardTotCount(String searchKeyword, String selNum);
	
	public HbDto hba_detail(String hba_num);
	public void hba_delete(String hba_num);
	
	
	public void hba_add(String hba_info,int hba_price, String hba_size,int hba_stock,String hba_gender,String hba_img );


}
