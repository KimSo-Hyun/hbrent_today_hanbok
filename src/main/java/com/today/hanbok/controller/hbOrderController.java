package com.today.hanbok.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.today.hanbok.dao.OrderIDao;
import com.today.hanbok.dto.MemberDto;
import com.today.hanbok.dto.basketDto;
import com.today.hanbok.dto.basketShadowDto;
import com.today.hanbok.util.Constant;



@Controller
public class hbOrderController {

	public JdbcTemplate template;
	
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
		Constant.template=this.template;
	}
	
	@Autowired
	private SqlSession sqlSession;
	

	
	//hb_order
	@RequestMapping(value = "/hb_order")
	public String review(HttpServletRequest request,  Model model) {
		System.out.println("=========================");
		System.out.println("hb_order 접속");
		
		String mem_id= request.getParameter("logined_mem_id");
		System.out.println("mem_id: "+mem_id);
		System.out.println("=========================");
		
		//mybatits에서 작업
		OrderIDao dao=sqlSession.getMapper(OrderIDao.class);
		
		//장바구니 정보가져오기
		ArrayList<basketDto>dto = new ArrayList<basketDto>();
		
		String[] checked_chBox = request.getParameterValues("chBox");
		if (checked_chBox !=null) {
			
			for (int i = 0; i < checked_chBox.length; i++) {
				System.out.println("bk_num: "+checked_chBox[i]);
				int basket_num =Integer.parseInt((checked_chBox[i]));
				dto.addAll(dao.send_basket(basket_num));
			}
		}
		model.addAttribute("send_basket",dto);
		
		
		//회원정보 가져오기
	
		MemberDto dto2=dao.send_meminfo(mem_id);
		model.addAttribute("send_meminfo",dto2);
		
		
		return "hb_order/hb_order";
	}	
	
		
	//hb_orderProc
			@RequestMapping(value = "/hb_orderProc")
			public String hb_orderProc(HttpServletRequest request,  Model model) {
				System.out.println("=========================");
				System.out.println("hb_orderProc 접속");
				System.out.println("=========================");
				
				String odr_name =request.getParameter("oder_name");
				String odr_postnum =request.getParameter("post_num");
				String addr1 =request.getParameter("addr1");
				String addr2 =request.getParameter("addr2");
				String odr_addr =addr1+addr2;
				int odr_cell =Integer.parseInt(request.getParameter("oder_cell"));
				String odr_email =request.getParameter("oder_email");
				
//				String odr_rentdate =request.getParameter("odr_rentdate");
				
				String odr_request =request.getParameter("oder_request");
				int odr_usedpoint =Integer.parseInt(request.getParameter("oder_point"));
				int odr_finalpay =Integer.parseInt(request.getParameter("finaltotal"));
				
				int odr_getpoint =(int) (odr_finalpay*0.1);
				
				
				String mem_id= request.getParameter("mymem_id");
				String[] bk_nums = request.getParameterValues("bk_num");
				String bk_numall ="";
				if (bk_nums !=null) {
					
					for (int i = 0; i < bk_nums.length; i++) {
						System.out.println("bk_num: "+bk_nums[i]);
						int bk_num =Integer.parseInt((bk_nums[i]));
						bk_numall =bk_numall+bk_nums[i]+',';
//						dto.addAll(dao.send_basket(bk_nums));
					}
				}
				
				System.out.println("odr_name: "+odr_name);
				System.out.println("odr_postnum: "+odr_postnum);
				System.out.println("odr_addr: "+odr_addr);
				System.out.println("odr_cell: "+odr_cell);
				System.out.println("odr_email: "+odr_email);
//				System.out.println("odr_rentdate: "+odr_rentdate);
				System.out.println("odr_request: "+odr_request);
				System.out.println("odr_usedpoint: "+odr_usedpoint);
				System.out.println("odr_finalpay: "+odr_finalpay);
				System.out.println("odr_getpoint: "+odr_getpoint);
				System.out.println("bk_numall: "+bk_numall);
				System.out.println("mem_id: "+mem_id);
				
				
				
				//hball 테이블에서 해당한복 재고 체크
				String[] pick_bk_num = bk_numall.split(",");
				OrderIDao dao=sqlSession.getMapper(OrderIDao.class);
				
				for (int i = 0; i < pick_bk_num.length; i++) {
					System.out.println(pick_bk_num[i]);
					basketDto dto=dao.load_basket_info(Integer.parseInt(pick_bk_num[i]));
					
					String temp_hba_Id =dto.getHba_Id();
					int temp_bk_amount =dto.getBk_amount();

					//hball 테이블에서 해당한복 재고 체크
					int present_stock =dao.check_hba_stock(temp_hba_Id);
					
					System.out.println("present_stock: "+present_stock);
					System.out.println("temp_bk_amount: "+temp_bk_amount);
					
					if (present_stock==0 || present_stock < temp_bk_amount) {
					
						String oder_err_msg ="해당상품은 현재 수량이 부족합니다.";
						System.out.println("oder_err_msg:" +oder_err_msg);
						
						model.addAttribute("oder_err_msg",oder_err_msg);
						return "redirect:basket";
						
					}
				}
				
				
				
				//여기 부분 수정
				String hba_id[] =request.getParameterValues("hba_id");

				//mybatits에서 작업
//				IDao dao=sqlSession.getMapper(IDao.class);
				for (int i = 0; i < hba_id.length; i++) {
					System.out.println("hba_id: "+hba_id[i]);
					
					if (hba_id.length >=1) {
						
						
						dao.orderproc(odr_name,odr_postnum,odr_addr,odr_cell,odr_email,
								odr_request,odr_usedpoint,odr_finalpay,odr_getpoint,bk_numall,mem_id,hba_id[i]);
						
						int temp_odr_usedpoint =odr_usedpoint;
						System.out.println("포인트차감시작");
						System.out.println("mem_id: "+mem_id);
						System.out.println("odr_usedpoint: "+temp_odr_usedpoint);
						dao.orderproc_adjustpoint(mem_id,temp_odr_usedpoint);
						
						odr_usedpoint=0;
						odr_finalpay=0;
						odr_getpoint=0;
					}
				}
				
				//여기까지
			
				
				//기존장바구니 정보 ->basket_shadow 테이블로 복사 하고 -> 기존 bsket 테이블에서는 삭제
				String[] pick_bk_num2 = bk_numall.split(",");
				
				for (int i = 0; i < pick_bk_num2.length; i++) {
					System.out.println(pick_bk_num2[i]);
					basketDto dto=dao.load_basket_info(Integer.parseInt(pick_bk_num2[i]));
					
					int temp_bk_num =dto.getBk_num();
					String temp_mem_id =dto.getMem_id();
					String temp_hba_Id =dto.getHba_Id();
					int temp_bk_amount =dto.getBk_amount();
					String temp_hba_info =dto.getHba_info();
					int temp_hba_price =dto.getHba_price();
					String temp_hba_img =dto.getHba_img();
					int temp_hba_stock =dto.getHba_stock();
					int temp_hba_size =dto.getHba_size();
					String temp_rt_rentdate =dto.getRt_rentdate();
					
					System.out.println(temp_bk_num);
					System.out.println(temp_mem_id);
					System.out.println(temp_hba_Id);
					System.out.println(temp_bk_amount);
					System.out.println(temp_hba_info);
					System.out.println(temp_hba_price);
					System.out.println(temp_hba_img);
					System.out.println(temp_hba_stock);
					System.out.println(temp_hba_size);
					System.out.println(temp_rt_rentdate);
				
					//바스켓 ->바스켓쉐도우로 복사
					dao.to_basket_shadow(temp_bk_num,temp_mem_id,temp_hba_Id,temp_bk_amount,temp_hba_info,
							temp_hba_price,temp_hba_img,temp_hba_stock,temp_hba_size,temp_rt_rentdate);
					
					//바스켓삭제
					dao.delete_Basket(temp_bk_num);
				}
				
				
				
				//바스켓번호,한복아이디,한복대여수량 가지고 hball 테이블에서 해당 한복 재고 차감
				for (int i = 0; i < pick_bk_num.length; i++) {
					
					System.out.println("한복재고 정리 시작");
					System.out.println(pick_bk_num[i]);
					basketShadowDto dto=dao.load_basketshadow_info(Integer.parseInt(pick_bk_num[i]));
					
					
					
					int temp_bk_num =dto.getBk_num();
					String temp_hba_id =dto.getHba_Id();
					int temp_bk_amount =dto.getBk_amount();
					
					System.out.println("temp_bk_num: "+temp_bk_num);
					System.out.println("temp_hba_id: "+temp_hba_id);
					System.out.println("temp_bk_amount: "+temp_bk_amount);
					
			
					dao.reduce_hba_stock(temp_hba_id,temp_bk_amount);
				}

				return "hb_order/hb_delivery";
			}		
	
						
}