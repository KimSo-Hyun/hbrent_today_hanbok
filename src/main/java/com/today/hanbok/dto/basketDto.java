package com.today.hanbok.dto;


public class basketDto { 
	
	private int bk_num;
	private String mem_id;
	private String hba_Id;
	private int bk_amount;
	private String hba_info;
	private int hba_price;
	private String hba_img;
	private int hba_stock;
	private int hba_size;
	private String rt_rentdate;

	
	public basketDto() {
		// TODO Auto-generated constructor stub
	}
	
	
	public basketDto(int bk_num, String mem_id, String hba_Id, int bk_amount, String hba_info, int hba_price,
			String hba_img, int hba_stock,int hba_size,String rt_rentdate) {
		super();
		this.bk_num = bk_num;
		this.mem_id = mem_id;
		this.hba_Id = hba_Id;
		this.bk_amount = bk_amount;
		this.hba_info = hba_info;
		this.hba_price = hba_price;
		this.hba_img = hba_img;
		this.hba_stock = hba_stock;
		this.hba_size = hba_size;
		this.rt_rentdate = rt_rentdate;
	}


	/**
	 * @return the bk_num
	 */
	public int getBk_num() {
		return bk_num;
	}


	/**
	 * @param bk_num the bk_num to set
	 */
	public void setBk_num(int bk_num) {
		this.bk_num = bk_num;
	}


	/**
	 * @return the mem_id
	 */
	public String getMem_id() {
		return mem_id;
	}


	/**
	 * @param mem_id the mem_id to set
	 */
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}


	/**
	 * @return the hba_Id
	 */
	public String getHba_Id() {
		return hba_Id;
	}


	/**
	 * @param hba_Id the hba_Id to set
	 */
	public void setHba_Id(String hba_Id) {
		this.hba_Id = hba_Id;
	}


	/**
	 * @return the bk_amount
	 */
	public int getBk_amount() {
		return bk_amount;
	}


	/**
	 * @param bk_amount the bk_amount to set
	 */
	public void setBk_amount(int bk_amount) {
		this.bk_amount = bk_amount;
	}


	/**
	 * @return the hba_info
	 */
	public String getHba_info() {
		return hba_info;
	}


	/**
	 * @param hba_info the hba_info to set
	 */
	public void setHba_info(String hba_info) {
		this.hba_info = hba_info;
	}


	/**
	 * @return the hba_price
	 */
	public int getHba_price() {
		return hba_price;
	}


	/**
	 * @param hba_price the hba_price to set
	 */
	public void setHba_price(int hba_price) {
		this.hba_price = hba_price;
	}


	/**
	 * @return the hba_img
	 */
	public String getHba_img() {
		return hba_img;
	}


	/**
	 * @param hba_img the hba_img to set
	 */
	public void setHba_img(String hba_img) {
		this.hba_img = hba_img;
	}


	/**
	 * @return the hba_stock
	 */
	public int getHba_stock() {
		return hba_stock;
	}


	/**
	 * @param hba_stock the hba_stock to set
	 */
	public void setHba_stock(int hba_stock) {
		this.hba_stock = hba_stock;
	}


	/**
	 * @return the hba_size
	 */
	public int getHba_size() {
		return hba_size;
	}


	/**
	 * @param hba_size the hba_size to set
	 */
	public void setHba_size(int hba_size) {
		this.hba_size = hba_size;
	}


	/**
	 * @return the rt_rentdate
	 */
	public String getRt_rentdate() {
		return rt_rentdate;
	}


	/**
	 * @param rt_rentdate the rt_rentdate to set
	 */
	public void setRt_rentdate(String rt_rentdate) {
		this.rt_rentdate = rt_rentdate;
	}


	


}