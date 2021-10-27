package com.today.hanbok.dto;

public class HbDto {

private int hba_num;          //등록번호
private String hba_id;       //한복고유번호
private String hba_info;     //해당한복 한줄설명
private int hba_size;     //한복사이즈
private String hba_gender;   //남/여옷구분
private int hba_price;          //가격
private int hba_stock;          //재고수량
private String hba_img;      //한복이미지 주소값

public HbDto() {
	// TODO Auto-generated constructor stub
}

public HbDto(int hba_num, String hba_id, String hba_info,
		int hba_size, String hba_gender, int hba_price,
		int hba_stock, String hba_img )  {
	this.hba_num= hba_num;
	this.hba_id= hba_id;
	this.hba_info= hba_info;
	this.hba_size= hba_size;
	this.hba_gender= hba_gender;
	this.hba_price= hba_price;
	this.hba_stock= hba_stock;
	this.hba_img= hba_img;
}

/**
 * @return the hba_num
 */
public int getHba_num() {
	return hba_num;
}

/**
 * @param hba_num the hba_num to set
 */
public void setHba_num(int hba_num) {
	this.hba_num = hba_num;
}

/**
 * @return the hba_Id
 */
public String getHba_id() {
	return hba_id;
}

/**
 * @param hba_Id the hba_Id to set
 */
public void setHba_id(String hba_Id) {
	this.hba_id = hba_Id;
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
 * @return the hba_gender
 */
public String getHba_gender() {
	return hba_gender;
}

/**
 * @param hba_gender the hba_gender to set
 */
public void setHba_gender(String hba_gender) {
	this.hba_gender = hba_gender;
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




}
