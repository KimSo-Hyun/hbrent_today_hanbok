package com.today.hanbok.dao;

import java.util.ArrayList;

import com.today.hanbok.dto.basketDto;

public interface BasketIDao {

	/*장바구니의 리스트를 가져오는 메소드*/
	public ArrayList<basketDto> basket(String mem_id);
	/*장바구니의 데이터를 insert하는 메소드*/
	public void addBasket(String hba_Id,String hba_info,String hba_price,String hba_img,String bk_amount,String hba_stock,String hba_size,String rt_rentdate,String mem_id);
	/*장바구니의 데이터를 삭제하는 메소드*/
	public void deleteCart(String bk_num);
	public void deleteAll(String mem_id);
	public void amountUp(String bk_num);
	public void amountDown(String bk_num);


}
