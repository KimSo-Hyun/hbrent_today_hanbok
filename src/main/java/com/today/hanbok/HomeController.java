package com.today.hanbok;

import java.util.Locale;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.today.hanbok.dao.IDao;
import com.today.hanbok.util.Constant;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
/*	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "home";
	}*/
	
	public JdbcTemplate template;
	
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
		Constant.template=this.template;
	}
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String mainhome(Locale locale, Model model) {
		
		System.out.println("main접속");
		
		IDao dao=sqlSession.getMapper(IDao.class);
		model.addAttribute("mainhome",dao.mainhome());
		
		return "mainhome";
		
	}
	
	//mainhome
	@RequestMapping(value = "/mainhome")
	public String mainhome(Model model) {
		
		System.out.println("mainhome 접속");
		
		//mybatits에서 작업
		IDao dao=sqlSession.getMapper(IDao.class);
		model.addAttribute("mainhome",dao.mainhome());
			
		return "mainhome";
	}
	

}