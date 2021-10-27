package com.today.hanbok.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.today.hanbok.dao.rentHistoryMgrIDao;
import com.today.hanbok.util.Constant;
import com.today.hanbok.vopage.SearchVO;



@Controller
	public class RentHistoryMgrController {
		public JdbcTemplate template;
		
		public void setTemplate(JdbcTemplate template) {
			this.template = template;
			Constant.template=this.template;
		}
		@Autowired
		private SqlSession sqlSession;
		
		@RequestMapping("/rentHistory_manager")
		public String rentHistory_manager(HttpServletRequest request,
				SearchVO searchVO,Model model) {
			System.out.println("pass by rentHistory_manager()");
 
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
			rentHistoryMgrIDao dao=sqlSession.getMapper(rentHistoryMgrIDao.class);
			
			if (strPage==null || strPage.equals("")) {
				strPage="1";
			}
			System.out.println("strPage : "+strPage);
			
			int page=Integer.parseInt(strPage);
			searchVO.setPage(page);
			
			//totcnt
			int total=0;
			total=dao.selectTotCount(searchKeyword,searchType,dt_fr,dt_to,date,state,searchState);
			
			
					
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
				model.addAttribute("rentHistory_manager",dao.rentHistory_manager(rowStart,rowEnd,searchKeyword,searchType,dt_fr,dt_to,date,state,searchState));
				model.addAttribute("totRowCnt",dao.selectTotCount(searchKeyword,searchType,dt_fr,dt_to,date,state,searchState));
			}
			else if (searchType.equals("odr_num")) {
				model.addAttribute("rentHistory_manager",dao.rentHistory_manager(rowStart,rowEnd,searchKeyword,searchType,dt_fr,dt_to,date,state,searchState));
				model.addAttribute("totRowCnt",dao.selectTotCount(searchKeyword,searchType,dt_fr,dt_to,date,state,searchState));
			}
			else if (searchType.equals("hba_info")) {
				model.addAttribute("rentHistory_manager",dao.rentHistory_manager(rowStart,rowEnd,searchKeyword,searchType,dt_fr,dt_to,date,state,searchState));
				model.addAttribute("totRowCnt",dao.selectTotCount(searchKeyword,searchType,dt_fr,dt_to,date,state,searchState));
			}
			else if (searchType.equals("all")) {
				model.addAttribute("rentHistory_manager",dao.rentHistory_manager(rowStart,rowEnd,searchKeyword,searchType,dt_fr,dt_to,date,state,searchState));
				model.addAttribute("totRowCnt",dao.selectTotCount(searchKeyword,searchType,dt_fr,dt_to,date,state,searchState));
			}
			else if (searchType.equals("rt_date")) {
				model.addAttribute("rentHistory_manager",dao.rentHistory_manager(rowStart,rowEnd,searchKeyword,searchType,dt_fr,dt_to,date,state,searchState));
				model.addAttribute("totRowCnt",dao.selectTotCount(searchKeyword,searchType,dt_fr,dt_to,date,state,searchState));
			}
			else if (searchType.equals("state")) {
				model.addAttribute("rentHistory_manager",dao.rentHistory_manager(rowStart,rowEnd,searchKeyword,searchType,dt_fr,dt_to,date,state,searchState));
				model.addAttribute("totRowCnt",dao.selectTotCount(searchKeyword,searchType,dt_fr,dt_to,date,state,searchState));
			}
						
			model.addAttribute("searchVo",searchVO);

			System.out.println("rowStart : "+rowStart);
			System.out.println("rowEnd : "+rowEnd);
			return "rentHistory/rentHistory_manager";
			
		}
	         
	     
		
		
		@RequestMapping("/cgState")
		public String cgState(HttpServletRequest request,Model model) {
			System.out.println("pass by cgState()");
			
			String odr_num=request.getParameter("checkArr");	
			String[] array=odr_num.split(",");
			
			
			String state_box=request.getParameter("state_box");
			System.out.println(state_box);
						
			rentHistoryMgrIDao dao=sqlSession.getMapper(rentHistoryMgrIDao.class);
			for (int i = 0; i < array.length; i++) {
				System.out.println("odr_num : "+array[i]);
				dao.cgState(array[i],state_box);
			}
			
			
			return "redirect:rentHistory_manager";
		}
		
		
		
		@RequestMapping("/rentHistoryCancel_mgr")
		public String rentHistoryCancel_mgr(HttpServletRequest request,Model model) {
			System.out.println("pass by rentHistoryCancel_mgr()");
			
			rentHistoryMgrIDao dao=sqlSession.getMapper(rentHistoryMgrIDao.class);
			model.addAttribute("refund",dao.refund());

			
			return "rentHistory/rentHistoryCancel_mgr";
		}
		

		}

