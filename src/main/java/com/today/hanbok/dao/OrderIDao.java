package com.today.hanbok.dao;

import java.util.ArrayList;

import com.today.hanbok.dto.MemberDto;
import com.today.hanbok.dto.basketDto;
import com.today.hanbok.dto.basketShadowDto;

public interface OrderIDao {

	public ArrayList<basketDto> send_basket(int basket_num);

	public MemberDto send_meminfo(String mem_id);

	public void orderproc(String odr_name, String odr_postnum, String odr_addr, int odr_cell, String odr_email,
			String odr_request, int odr_usedpoint, int odr_finalpay, int odr_getpoint, String bk_numall, String mem_id, String hba_id);
	
	public basketDto load_basket_info(int parseInt);

	public void to_basket_shadow(int temp_bk_num, String temp_mem_id, String temp_hba_Id, int temp_bk_amount,
			String temp_hba_info, int temp_hba_price, String temp_hba_img, int temp_hba_stock, int temp_hba_size,
			String temp_rt_rentdate);

	public void delete_Basket(int temp_bk_num);

	public int check_hba_stock(String temp_hba_Id);

	public basketShadowDto load_basketshadow_info(int parseInt);

	public void reduce_hba_stock(String temp_hba_id, int temp_bk_amount);

	public void orderproc_adjustpoint(String mem_id, int odr_usedpoint);


}
