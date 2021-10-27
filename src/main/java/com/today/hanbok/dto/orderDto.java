package com.today.hanbok.dto;

import java.sql.Date;

public class orderDto {


	private int odr_num;
	private String odr_name;
	private String odr_postnum;
	private String odr_addr;
	private int odr_cell;
	private String odr_email;
	private String odr_request;
	private int odrodr_usedpoint_num;
	private int odrodr_usedpoint;
	private int odr_finalpay;
	private int odr_getpoint;
	private String odr_bknumall;
	private String odr_status;
	private String mem_id;
	private Date rt_date;
	private String hba_Id;
	
	private int bk_amount;
	private String hba_info;
	private int hba_price;
	private String hba_img;
	private int hba_size;
	private String rt_rentdate;
	
	public orderDto() {
		// TODO Auto-generated constructor stub
	}

	
	
	
	public orderDto(int odr_num, String odr_name, String odr_postnum, String odr_addr, int odr_cell, String odr_email,
			String odr_request, int odrodr_usedpoint_num, int odrodr_usedpoint, int odr_finalpay, int odr_getpoint, String odr_bknumall,
			String odr_status, String mem_id, Date rt_date, String hba_Id, int bk_amount, String hba_info,
			int hba_price, String hba_img, int hba_size, String rt_rentdate) {
		super();
		this.odr_num = odr_num;
		this.odr_name = odr_name;
		this.odr_postnum = odr_postnum;
		this.odr_addr = odr_addr;
		this.odr_cell = odr_cell;
		this.odr_email = odr_email;
		this.odr_request = odr_request;
		this.odrodr_usedpoint_num = odrodr_usedpoint_num;
		this.odrodr_usedpoint = odrodr_usedpoint;
		this.odr_finalpay = odr_finalpay;
		this.odr_getpoint = odr_getpoint;
		this.odr_bknumall = odr_bknumall;
		this.odr_status = odr_status;
		this.mem_id = mem_id;
		this.rt_date = rt_date;
		this.hba_Id = hba_Id;
		this.bk_amount = bk_amount;
		this.hba_info = hba_info;
		this.hba_price = hba_price;
		this.hba_img = hba_img;
		this.hba_size = hba_size;
		this.rt_rentdate = rt_rentdate;
	}




	public int getBk_amount() {
		return bk_amount;
	}

	public void setBk_amount(int bk_amount) {
		this.bk_amount = bk_amount;
	}

	public String getHba_info() {
		return hba_info;
	}

	public void setHba_info(String hba_info) {
		this.hba_info = hba_info;
	}

	public int getHba_price() {
		return hba_price;
	}

	public void setHba_price(int hba_price) {
		this.hba_price = hba_price;
	}

	public String getHba_img() {
		return hba_img;
	}

	public void setHba_img(String hba_img) {
		this.hba_img = hba_img;
	}

	public int getHba_size() {
		return hba_size;
	}

	public void setHba_size(int hba_size) {
		this.hba_size = hba_size;
	}

	public String getRt_rentdate() {
		return rt_rentdate;
	}

	public void setRt_rentdate(String rt_rentdate) {
		this.rt_rentdate = rt_rentdate;
	}


	/**
	 * @return the odr_num
	 */
	public int getOdr_num() {
		return odr_num;
	}

	/**
	 * @param odr_num the odr_num to set
	 */
	public void setOdr_num(int odr_num) {
		this.odr_num = odr_num;
	}

	/**
	 * @return the odr_name
	 */
	public String getOdr_name() {
		return odr_name;
	}

	/**
	 * @param odr_name the odr_name to set
	 */
	public void setOdr_name(String odr_name) {
		this.odr_name = odr_name;
	}

	/**
	 * @return the odr_postnum
	 */
	public String getOdr_postnum() {
		return odr_postnum;
	}

	/**
	 * @param odr_postnum the odr_postnum to set
	 */
	public void setOdr_postnum(String odr_postnum) {
		this.odr_postnum = odr_postnum;
	}

	/**
	 * @return the odr_addr
	 */
	public String getOdr_addr() {
		return odr_addr;
	}

	/**
	 * @param odr_addr the odr_addr to set
	 */
	public void setOdr_addr(String odr_addr) {
		this.odr_addr = odr_addr;
	}

	/**
	 * @return the odr_cell
	 */
	public int getOdr_cell() {
		return odr_cell;
	}

	/**
	 * @param odr_cell the odr_cell to set
	 */
	public void setOdr_cell(int odr_cell) {
		this.odr_cell = odr_cell;
	}

	/**
	 * @return the odr_email
	 */
	public String getOdr_email() {
		return odr_email;
	}

	/**
	 * @param odr_email the odr_email to set
	 */
	public void setOdr_email(String odr_email) {
		this.odr_email = odr_email;
	}

	/**
	 * @return the odr_request
	 */
	public String getOdr_request() {
		return odr_request;
	}

	/**
	 * @param odr_request the odr_request to set
	 */
	public void setOdr_request(String odr_request) {
		this.odr_request = odr_request;
	}

	/**
	 * @return the odrodr_usedpoint_num
	 */
	public int getOdrodr_usedpoint_num() {
		return odrodr_usedpoint_num;
	}
	
	/**
	 * @return the odrodr_usedpoint
	 */
	public int getOdrodr_usedpoint() {
		return odrodr_usedpoint;
	}

	/**
	 * @param odrodr_usedpoint_num the odrodr_usedpoint_num to set
	 */
	public void setOdrodr_usedpoint_num(int odrodr_usedpoint_num) {
		this.odrodr_usedpoint_num = odrodr_usedpoint_num;
	}

	/**
	 * @param odrodr_usedpoint the odrodr_usedpoint to set
	 */
	public void setOdrodr_usedpoint(int odrodr_usedpoint) {
		this.odrodr_usedpoint = odrodr_usedpoint;
	}
	/**
	 * @return the odr_finalpay
	 */
	public int getOdr_finalpay() {
		return odr_finalpay;
	}

	/**
	 * @param odr_finalpay the odr_finalpay to set
	 */
	public void setOdr_finalpay(int odr_finalpay) {
		this.odr_finalpay = odr_finalpay;
	}

	/**
	 * @return the odr_getpoint
	 */
	public int getOdr_getpoint() {
		return odr_getpoint;
	}

	/**
	 * @param odr_getpoint the odr_getpoint to set
	 */
	public void setOdr_getpoint(int odr_getpoint) {
		this.odr_getpoint = odr_getpoint;
	}

	/**
	 * @return the odr_bknumall
	 */
	public String getOdr_bknumall() {
		return odr_bknumall;
	}

	/**
	 * @param odr_bknumall the odr_bknumall to set
	 */
	public void setOdr_bknumall(String odr_bknumall) {
		this.odr_bknumall = odr_bknumall;
	}

	/**
	 * @return the odr_status
	 */
	public String getOdr_status() {
		return odr_status;
	}

	/**
	 * @param odr_status the odr_status to set
	 */
	public void setOdr_status(String odr_status) {
		this.odr_status = odr_status;
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
	 * @return the rt_date
	 */
	public Date getRt_date() {
		return rt_date;
	}

	/**
	 * @param rt_date the rt_date to set
	 */
	public void setRt_date(Date rt_date) {
		this.rt_date = rt_date;
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

 



}