package com.today.hanbok.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.today.hanbok.dao.BasketIDao;
import com.today.hanbok.dto.basketDto;
import com.today.hanbok.util.Constant;

@Controller
public class BasketController {
	public JdbcTemplate template;
	
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
		Constant.template=this.template;
	}
	@Autowired
	private SqlSession sqlSession;
	
	
	// 카트 담기
	@RequestMapping("/addBasket")
	public String addBasket(HttpServletRequest request,Model model) throws Exception{
		System.out.println("pass by addBasket");
		String mem_id = request.getParameter("logined_mem_id");
		System.out.println("mem_id : "+mem_id);
		

		if(mem_id == "") {
			return "redirect:loginForm";
		}

		String hba_Id = request.getParameter("hba_Id");
		String hba_info = request.getParameter("hba_info");
		String hba_price = request.getParameter("hba_price");
		String hba_img = request.getParameter("hba_img");
		String bk_amount = request.getParameter("bk_amount");
		String hba_stock = request.getParameter("hba_stock");
		String hba_size = request.getParameter("hba_size");
		String rt_rentdate = request.getParameter("rt_rentdate");
		
		System.out.println(hba_Id);
		System.out.println(hba_info);
		System.out.println(hba_price);
		System.out.println(hba_img);
		System.out.println(bk_amount);
		System.out.println(hba_stock);
		System.out.println(hba_size);
		System.out.println(rt_rentdate);


//			mybatis에서 작업
			BasketIDao dao=sqlSession.getMapper(BasketIDao.class);
			dao.addBasket(hba_Id,hba_info,hba_price,hba_img,bk_amount,hba_stock,hba_size,rt_rentdate,mem_id);
			
			

		 return "redirect:basket";
		}


	@RequestMapping("/basket")
	public String basket(HttpServletRequest request,Model model) throws Exception{
		System.out.println("pass by basket()");
		
		
		
		HttpSession session = request.getSession();
		String mem_id=(String)session.getAttribute("logined_mem_id");
		System.out.println("mem_id :" + mem_id); 
		
		String oder_err_msg =request.getParameter("oder_err_msg");
		System.out.println("oder_err_msg:"+oder_err_msg);
		model.addAttribute("oder_err_msg",oder_err_msg);
				
		Map<String, Object> map=new HashMap<String, Object>();

		 if(mem_id!= null) { 
		BasketIDao dao=sqlSession.getMapper(BasketIDao.class);
		List<basketDto> list= new ArrayList<basketDto>();
		list = dao.basket(mem_id);
	
		 map.put("list", list);
         map.put("count", list.size());	
        
         
		model.addAttribute("basket",list);
		model.addAttribute("map", map);
		
		return "basket/basket";
		
	  }else { 

		  return "redirect:loginForm";
         
     }
	}
	
	@RequestMapping("/deleteCart")
	public String deleteCart(HttpServletRequest request,Model model) {
		System.out.println("pass by deleteCart()");
	        
		BasketIDao dao=sqlSession.getMapper(BasketIDao.class);
		
		String bk_num=request.getParameter("checkArr");		
		String[] array=bk_num.split(",");
					
		for (int i = 0; i < array.length; i++) {
			System.out.println("bk_num : "+array[i]);
			dao.deleteCart(array[i]);
		}
   
		return "redirect:basket";
	}
	
	@RequestMapping("/deleteAll")
	public String deleteAll(HttpServletRequest request,Model model) {
		System.out.println("pass by deleteAll()");
		
		String mem_id=request.getParameter("mem_id");

		System.out.println(mem_id);
//		mybatis에서 작업
		BasketIDao dao=sqlSession.getMapper(BasketIDao.class);
		dao.deleteAll(mem_id);

		return "redirect:basket";
	}

	@RequestMapping("/amountUp")
	public String amountUp(HttpServletRequest request,Model model) {
		
		String bk_num=request.getParameter("bk_num");
		
//		mybatis에서 작업
		BasketIDao dao=sqlSession.getMapper(BasketIDao.class);
		dao.amountUp(bk_num);

		return "redirect:basket";
	}	
	
	@RequestMapping("/amountDown")
	public String amountDown(HttpServletRequest request,Model model) {
		
		String bk_num=request.getParameter("bk_num");
		String bk_amount=request.getParameter("bk_amount");
		
		System.out.println(bk_amount);
		
		if(Integer.parseInt(bk_amount) > 1) {		
			BasketIDao dao=sqlSession.getMapper(BasketIDao.class);				
			dao.amountDown(bk_num);
		}
		

		return "redirect:basket";
	}	
    
}
	
	
