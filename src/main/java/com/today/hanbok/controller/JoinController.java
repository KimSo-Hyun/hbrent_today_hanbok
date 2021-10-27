package com.today.hanbok.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.today.hanbok.dao.JoinIDao;
import com.today.hanbok.dto.MemberDto;
import com.today.hanbok.util.Constant;

@Controller
public class JoinController {

	public JdbcTemplate template;

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
		Constant.template = this.template;
	}

	@Autowired
	private SqlSession sqlSession;

	// joinForm
	@RequestMapping(value = "/joinForm")
	public String mypage() {
		System.out.println("joinForm 접속");

		return "login/joinForm";
	}

	// mypage_join
		@RequestMapping(value = "/mypage_join")
		public String mypage_join(HttpServletRequest request, Model model) {
			System.out.println("mypage_join 접속");
			String mem_id = request.getParameter("mem_id");
			String mem_pass = request.getParameter("mem_pass");
			String mem_name = request.getParameter("mem_name");
			String mem_gender = request.getParameter("mem_gender");
			String mem_cellphone = request.getParameter("mem_cellphone");
			String mem_email = request.getParameter("mem_email");
			String mem_birth = request.getParameter("mem_birth");
			String mem_address = request.getParameter("mem_address");
			
			System.out.println("mem_id: "+mem_id);
			System.out.println("mem_pass: "+mem_pass);
			System.out.println("mem_name: "+mem_name);
			System.out.println("mem_gender: "+mem_gender);
			System.out.println("mem_cellphone: "+mem_cellphone);
			System.out.println("mem_email: "+mem_email);
			System.out.println("mem_birth: "+mem_birth);
			System.out.println("mem_address: "+mem_address);
			

			// mybatis에서 작업
			JoinIDao dao = sqlSession.getMapper(JoinIDao.class);
			dao.mypage_join(mem_id, mem_pass, mem_name,mem_birth,mem_gender,
					mem_email,mem_cellphone, mem_address);
			
			return "login/loginForm";
		}
		

		@ResponseBody
		@RequestMapping(value="/id_check")
		public int id_check(HttpServletRequest request){
			
			System.out.println("id_check 접속");
			
			String input_id = request.getParameter("input_id");
			System.out.println("input_id: "+input_id);
		
			// mybatis에서 작업
			JoinIDao dao = sqlSession.getMapper(JoinIDao.class);
			String searched_id;
			searched_id= dao.id_check(input_id);
			System.out.println("searched_id: "+searched_id);
			
			int id_checkNum =0;
			
			if (searched_id != null) {
				id_checkNum =1;
				System.out.println("중복된 아이디입니다.");
				return id_checkNum;
			}
			
			System.out.println("사용가능한 아이디입니다.");
			return id_checkNum;	

		}
	
		
		
		// loginForm
		@RequestMapping(value = "/loginForm")
		public String loginForm() {
			System.out.println("loginForm 접속");
					
			return "login/loginForm";
		}
	
		
		
		// loginproc
		@RequestMapping(value = "/loginproc")
		public String loginproc(HttpServletRequest request, Model model) {
			System.out.println("loginproc 접속");
							
			String mem_id_input = request.getParameter("mem_id");
			String mem_pass_input = request.getParameter("mem_pass");
			
			System.out.println("mem_id_input: "+mem_id_input);
			System.out.println("mem_pass_input: "+mem_pass_input);
			System.out.println("********************************");
			
			// mybatis에서 작업
			JoinIDao dao = sqlSession.getMapper(JoinIDao.class);
			ArrayList<MemberDto> dto = dao.mypage_loginproc(mem_id_input);
			String logmsg="";
			
			if (dto.size() ==0) {
				System.out.println("아이디없음");
				logmsg="아이디없음";
				model.addAttribute("logmsg",logmsg);
				
				return "login/loginForm";
			}
			else {
				String mem_pass_searched=dto.get(0).getMem_pass();
				System.out.println("mem_pass_searched: "+mem_pass_searched);
				
				if (mem_pass_input.equals(mem_pass_searched)) {
					System.out.println("비번일치");
//					logmsg="비번일치";
//					model.addAttribute("logmsg",logmsg);
					request.getSession().setAttribute("logined_mem_id", mem_id_input);
					
					String mem_name_searched=dto.get(0).getMem_name();
					System.out.println("mem_name_searched: "+mem_name_searched);
					request.getSession().setAttribute("logined_mem_name", mem_name_searched);
					
					String mem_rank_searched=dto.get(0).getMem_rank();
					System.out.println("mem_rank_searched: "+mem_rank_searched);
					request.getSession().setAttribute("logined_mem_rank", mem_rank_searched);
					
//					model.addAttribute("mem_name_logined",mem_name_searched);
					
					return "redirect:mainhome";
//					return "mainhome";
				}
				else {
					System.out.println("비번불일치");
					logmsg="비번불일치";
					model.addAttribute("logmsg",logmsg);
					
					return "login/loginForm";
				}
			}			
			
		}
				
		
		// logOutProc
		@RequestMapping(value = "/logOutProc")
		public String logOutProc(HttpServletRequest request, Model model) {
			System.out.println("logOutProc 접속");
					
			request.getSession().invalidate();
			
			return "redirect:mainhome";
		}

		
}