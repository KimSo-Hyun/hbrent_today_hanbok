package com.today.hanbok.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.today.hanbok.dao.rentHistoryIDao;
import com.today.hanbok.dto.orderDto;
import com.today.hanbok.util.Constant;
import com.today.hanbok.vopage.SearchVO;



@Controller
	public class RentHistoryController {
		public JdbcTemplate template;
		
		public void setTemplate(JdbcTemplate template) {
			this.template = template;
			Constant.template=this.template;
		}
		@Autowired
		private SqlSession sqlSession;
		
		@RequestMapping("/rentHistory")
		public String rentHistory(HttpServletRequest request,
				SearchVO searchVO,Model model) {
			System.out.println("pass by rentHistory()");
			HttpSession session = request.getSession();
			String mem_id=(String)session.getAttribute("logined_mem_id");
			System.out.println("mem_id :" + mem_id);
			
			 if(mem_id!= null) { 
			String searchType=request.getParameter("searchType");
			String searchKeyword=request.getParameter("keyword");
			
			System.out.println(searchType);
			System.out.println(searchKeyword);
			
			if (searchType == null) {
				searchType="";
			}
			if (searchKeyword == null) {
				searchKeyword="";
			}
						
			String date=request.getParameter("date");
			String dt_fr=request.getParameter("dt_fr_input");
			String dt_to=request.getParameter("dt_to_input");
			String state=request.getParameter("state");
			String searchState=request.getParameter("searchState");
	
			
			System.out.println(date);
			System.out.println(dt_fr);
			System.out.println(dt_to);
			System.out.println(state);
			System.out.println(searchState);
			
			
			String strPage=request.getParameter("page");
			System.out.println("strPage : "+strPage);
						
//			mybatis에서 작업
			rentHistoryIDao dao=sqlSession.getMapper(rentHistoryIDao.class);
			
			if (strPage==null || strPage.equals("")) {
				strPage="1";
			}
			System.out.println("strPage : "+strPage);
			
			int page=Integer.parseInt(strPage);
			searchVO.setPage(page);
			
			//totcnt
			int total=0;
			total=dao.selectBoardTotCount(searchKeyword,searchType,dt_fr,dt_to,date,state,searchState,mem_id);
					
			model.addAttribute("searchKeyword",searchKeyword);	
			model.addAttribute("date",date);
			model.addAttribute("dt_fr",dt_fr);	
			model.addAttribute("dt_to",dt_to);
			model.addAttribute("state",state);
			model.addAttribute("searchState",searchState);

			searchVO.pageCalculate(total);

			int rowStart=searchVO.getRowStart();
			int rowEnd=searchVO.getRowEnd();

			if (searchType.equals("")) {
				model.addAttribute("rentHistory",dao.rentHistory(rowStart,rowEnd,searchKeyword,searchType,dt_fr,dt_to,date,state,searchState,mem_id));
				model.addAttribute("totRowCnt",dao.selectBoardTotCount(searchKeyword,searchType,dt_fr,dt_to,date,state,searchState,mem_id));
			}
			else if (searchType.equals("odr_num")) {
				model.addAttribute("rentHistory",dao.rentHistory(rowStart,rowEnd,searchKeyword,searchType,dt_fr,dt_to,date,state,searchState,mem_id));
				model.addAttribute("totRowCnt",dao.selectBoardTotCount(searchKeyword,searchType,dt_fr,dt_to,date,state,searchState,mem_id));
			}
			else if (searchType.equals("hba_info")) {
				model.addAttribute("rentHistory",dao.rentHistory(rowStart,rowEnd,searchKeyword,searchType,dt_fr,dt_to,date,state,searchState,mem_id));
				model.addAttribute("totRowCnt",dao.selectBoardTotCount(searchKeyword,searchType,dt_fr,dt_to,date,state,searchState,mem_id));
			}
			else if (searchType.equals("all")) {
				model.addAttribute("rentHistory",dao.rentHistory(rowStart,rowEnd,searchKeyword,searchType,dt_fr,dt_to,date,state,searchState,mem_id));
				model.addAttribute("totRowCnt",dao.selectBoardTotCount(searchKeyword,searchType,dt_fr,dt_to,date,state,searchState,mem_id));
			}
			else if (searchType.equals("rt_date")) {
				model.addAttribute("rentHistory",dao.rentHistory(rowStart,rowEnd,searchKeyword,searchType,dt_fr,dt_to,date,state,searchState,mem_id));
				model.addAttribute("totRowCnt",dao.selectBoardTotCount(searchKeyword,searchType,dt_fr,dt_to,date,state,searchState,mem_id));
			}
			else if (searchType.equals("state")) {
				model.addAttribute("rentHistory",dao.rentHistory(rowStart,rowEnd,searchKeyword,searchType,dt_fr,dt_to,date,state,searchState,mem_id));
				model.addAttribute("totRowCnt",dao.selectBoardTotCount(searchKeyword,searchType,dt_fr,dt_to,date,state,searchState,mem_id));
			}
						
			model.addAttribute("searchVo",searchVO);

			System.out.println("rowStart : "+rowStart);
			System.out.println("rowEnd : "+rowEnd);
			return "rentHistory/rentHistory";
			
		}else { 

			  return "redirect:loginForm";
	         
	     }
		}
		
		@RequestMapping("/rentCancel")
		public String rentCancel(HttpServletRequest request,Model model) {
			System.out.println("pass by rentCancel()");
			
			String rt_num=request.getParameter("odr_num");
			
			System.out.println(rt_num);
			
			rentHistoryIDao dao=sqlSession.getMapper(rentHistoryIDao.class);
			 dao.rentCancel(rt_num);
			
			orderDto dto=dao.rentCancel(rt_num);
			model.addAttribute("rentCancel",dto);
			
			return "rentHistory/rentCancel";
		}
		
		@RequestMapping("/cancel")
		public String cancel(HttpServletRequest request,Model model) {
			System.out.println("pass by cancel()");
			
			String mem_id=request.getParameter("mem_id");
			String rt_num=request.getParameter("odr_num");
			String rf_reason=request.getParameter("rf_reason");
			String rf_num = "";
			 
			 for(int i = 1; i <= 6; i ++) {
				 rf_num += (int)(Math.random() * 10);
			 }
			 
			System.out.println(rf_num);			
			System.out.println(rt_num);
			System.out.println(rf_reason);
			System.out.println("mem_id : "+mem_id);

			rentHistoryIDao dao=sqlSession.getMapper(rentHistoryIDao.class);
			dao.cg_state(rt_num);
			dao.cancel(rt_num,rf_num,rf_reason,mem_id);

			
			return "redirect:rentHistory";
		}
		
		@RequestMapping("/rentHistory_view")
		public String rentHistory_view(HttpServletRequest request,Model model) {
			System.out.println("pass by rentHistory_view()");
			
			String odr_num=request.getParameter("odr_num");
			
//			mybatis에서 작업
			rentHistoryIDao dao=sqlSession.getMapper(rentHistoryIDao.class);
			
			orderDto dto=dao.rentHistory_view(odr_num);
			model.addAttribute("rentHistory_view",dto);

			
			return "rentHistory/rentHistory_view";
		}
		

		}

