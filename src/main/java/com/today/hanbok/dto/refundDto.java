package com.today.hanbok.dto;


public class refundDto {

	private int rf_num;
	private long rt_num;
	private String mem_id;
	private String rf_reason;
	private String rf_date;
	private String odr_status;
	


	public refundDto() {
		// TODO Auto-generated constructor stub
	}
	
	public refundDto(int rf_num, long rt_num, String mem_id, String rf_reason, String rf_date,String odr_status) {
		super();
		this.rf_num = rf_num;
		this.rt_num = rt_num;
		this.mem_id = mem_id;
		this.rf_reason = rf_reason;
		this.rf_date = rf_date;
		this.odr_status = odr_status;
	}
	public int getRf_num() {
		return rf_num;
	}
	public void setRf_num(int rf_num) {
		this.rf_num = rf_num;
	}
	public long getRt_num() {
		return rt_num;
	}
	public void setRt_num(long rt_num) {
		this.rt_num = rt_num;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getRf_reason() {
		return rf_reason;
	}
	public void setRf_reason(String rf_reason) {
		this.rf_reason = rf_reason;
	}
	public String getRf_date() {
		return rf_date;
	}
	public void setRf_date(String rf_date) {
		this.rf_date = rf_date;
	}

	public String getOdr_status() {
		return odr_status;
	}

	public void setOdr_status(String odr_status) {
		this.odr_status = odr_status;
	}

	



}