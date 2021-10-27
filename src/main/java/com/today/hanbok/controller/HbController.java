package com.today.hanbok.controller;


import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.today.hanbok.dao.HbIDao;
import com.today.hanbok.dto.HbDto;
import com.today.hanbok.util.Constant;
import com.today.hanbok.vopage.SearchVO;

@Controller
public class HbController {
public JdbcTemplate template;
	
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
		Constant.template=this.template;
		
	}
	

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/hb_list")
	public String hba(HttpServletRequest request, SearchVO SearchVO,Model model) {
		
		System.out.println("hb_list접속");
		
		String hba_info="";
		String hba_price="";
		
		String[] brdtitle=request.getParameterValues("searchType");
		
		if(brdtitle!=null) {
			for (int i = 0; i < brdtitle.length; i++) {
				System.out.println("brdtitle : "+brdtitle[i]);
			}
		}
		//검색유지
		if (brdtitle!=null) {
			for (String val : brdtitle) {
				if (val.equals("hba_info")) {
					model.addAttribute("hba_info","true");
					hba_info="hba_info";
				}else if (val.equals("hba_price")) {
					model.addAttribute("hba_price","true");
					hba_price="hba_price";
				}
			}
		}
		String searchKeyword=request.getParameter("sk");
		
		if (searchKeyword == null) {
			
			searchKeyword="";
			
		}
			String strPage=request.getParameter("page");
			
		
		
		
		HbIDao dao=sqlSession.getMapper(HbIDao.class);
		
		if (strPage==null || strPage.equals("")) {
			strPage="1";
		}
		
		

		int page = Integer.parseInt(strPage);
		SearchVO.setPage(page);
		
		
		
		
		System.out.println("=========================");
		System.out.println("strPage: "+strPage);
		System.out.println("=========================");
		
		
		
		//TotCnt
		
		int total=0;
		System.out.println("a"+dao.selectBoardTotCount(searchKeyword,"0"));
		
		if (hba_info.equals("hba_info") && hba_price.equals("")) {
			total=dao.selectBoardTotCount(searchKeyword,"1");
			System.out.println("list1~~~~~~~~~~~~");
		}else if (hba_info.equals("") && hba_price.equals("hba_price")) {
			total=dao.selectBoardTotCount(searchKeyword,"2");
			System.out.println("list2~~~~~~~~~~~~");
		}else if (hba_info.equals("hba_info") && hba_price.equals("hba_price")) {
			total=dao.selectBoardTotCount(searchKeyword,"3");
			System.out.println("list3~~~~~~~~~~~~");
		}else if (hba_info.equals("") && hba_price.equals("")) {
			
			System.out.println("b"+dao.selectBoardTotCount(searchKeyword,"0"));
			total=dao.selectBoardTotCount(searchKeyword,"0");
			System.out.println("c"+dao.selectBoardTotCount(searchKeyword,"0"));
			System.out.println("list0~~~~~~~~~~~~");
		}
		
		
		
		
		
		
		System.out.println("c"+total);
		model.addAttribute("searchKeyword",searchKeyword);
		System.out.println("d"+total);
		SearchVO.pageCalculate(total);
		
		System.out.println("total: "+total);
		System.out.println("clickPage: "+strPage);
		System.out.println("pageStart: "+SearchVO.getPageStart());
		System.out.println("pageEnd: "+SearchVO.getPageEnd());
		System.out.println("pageTot: "+SearchVO.getTotPage());
		System.out.println("rowStart: "+SearchVO.getRowStart());
		System.out.println("rowEnd: "+SearchVO.getRowEnd());
		
		int rowStart =SearchVO.getRowStart();
		int rowEnd =SearchVO.getRowEnd();
		
		if (hba_info.equals("hba_info") && hba_price.equals("")) {
			model.addAttribute("hba",dao.hba(rowStart,rowEnd,searchKeyword,"1"));
			model.addAttribute("totRowCnt",dao.selectBoardTotCount(searchKeyword,"1"));
		}else if (hba_info.equals("") && hba_price.equals("hba_price")) {
			model.addAttribute("hba",dao.hba(rowStart,rowEnd,searchKeyword,"2"));
			model.addAttribute("totRowCnt",dao.selectBoardTotCount(searchKeyword,"2"));
		}else if (hba_info.equals("hba_info") && hba_price.equals("hba_price")) {
			model.addAttribute("hba",dao.hba(rowStart,rowEnd,searchKeyword,"3"));
			model.addAttribute("totRowCnt",dao.selectBoardTotCount(searchKeyword,"3"));
		}else if (hba_info.equals("") && hba_price.equals("")) {
			model.addAttribute("hba",dao.hba(rowStart,rowEnd,searchKeyword,"0"));
			model.addAttribute("totRowCnt",dao.selectBoardTotCount(searchKeyword,"0"));
			
			
			System.out.println("b"+dao.selectBoardTotCount(searchKeyword,"0"));
			total=dao.selectBoardTotCount(searchKeyword,"0");
			System.out.println("c"+dao.selectBoardTotCount(searchKeyword,"0"));
			System.out.println("list0~~~~~~~~~~~~");
		}	
		model.addAttribute("searchVo",SearchVO);	
		return "product/hb_list";
	}	
	




	
	@RequestMapping("/hb_detail")
	public String hba_detail(HttpServletRequest request,Model model) {
		System.out.println("hb_detail");
		
		String hba_num=request.getParameter("hba_num");
		
		
		
		
		HbIDao dao=sqlSession.getMapper(HbIDao.class);
		
		HbDto dto=dao.hba_detail(hba_num);
		
		model.addAttribute("hba_detail",dto);

		return "product/hb_detail";
		
	}
	

	
	@RequestMapping("/hba_add_view")
	public String hba_add_view() {
		
		System.out.println("hba_add_view()");
		
		
		
		return "product/hba_add_view";
	}
	
	
	
	@RequestMapping("/hba_add")
	public String hba_add(HttpServletRequest request, Model model) throws Exception {
		System.out.println("=========================");
		System.out.println("hba_add");
		System.out.println("=========================");
		
		String path= "F:\\springSet\\springwork\\hbrent_today_hanbok\\src\\main\\webapp\\resources\\upload";		
		MultipartRequest req=
		new MultipartRequest(request, path,1024*1024*20,"utf-8",new DefaultFileRenamePolicy());
		
		
		String hba_info=req.getParameter("hba_info");
		int hba_price=Integer.parseInt(req.getParameter("hba_price"));
		String hba_size=req.getParameter("hba_size");
		int hba_stock=Integer.parseInt(req.getParameter("hba_stock"));
		String hba_gender=req.getParameter("hba_gender");
		
		//주의 -불러오는 형식이다름
		String ptrv_filesrc_temp =req.getFilesystemName("hba_img");
		//파일명앞에 경로까지 추가함  
		String hba_img ="resources/upload/"+ptrv_filesrc_temp;
		

		HbIDao dao=sqlSession.getMapper(HbIDao.class);		
		dao.hba_add(hba_info, hba_price,hba_size, hba_stock, hba_gender, hba_img);
		
		
		return "redirect:hb_list";
	}
	
	@RequestMapping("/hba_delete")
	public String delete(HttpServletRequest request,Model model) {
		
		String hba_num=request.getParameter("hba_num");

		HbIDao dao=sqlSession.getMapper(HbIDao.class);
		dao.hba_delete(hba_num);

		return "redirect:hba";
	}
}



