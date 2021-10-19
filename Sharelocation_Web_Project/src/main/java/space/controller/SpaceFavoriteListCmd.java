package space.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import detailspace.model.DetailSpaceBean;
import detailspace.model.DetailSpaceDao;
import member.model.MemberBean;
import member.model.MemberDao;
import space.model.FavoriteBean;
import space.model.SpaceBean;
import space.model.SpaceDao;
import utility.Paging;

@Controller
public class SpaceFavoriteListCmd {

	private final String command = "/favoriteList.sp";
	private final String getPage = "favoriteList";
	
	
	@Autowired
	SpaceDao spaceDao;	
	@Autowired
	MemberDao memberDao;
	@Autowired
	DetailSpaceDao detailSpaceDao;
	@Autowired
	ServletContext servletContext;
	
	
	@RequestMapping(value= command)
	public ModelAndView doAction(@RequestParam(value="pageNumber", required=false)String pageNumber,
			ModelAndView mav,
			HttpSession session, HttpServletResponse response
			)  throws IOException{
		System.out.println("FavoriteListCmd");
		System.out.println(session.getAttribute("loginInfo"));
				
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		if(loginInfo == null) {
			pw.println("<script>");
			pw.println("alert('로그인이 필요한 서비스입니다.');");
			pw.println("location.href='miniLogin.member'");
			pw.println("</script>");
			return null;
		}
		int totalCount = spaceDao.getFavoriteListCount(loginInfo.getNum());
		String url = servletContext.getContextPath()+command;
		Paging pageInfo = new Paging(pageNumber, "3", totalCount, url, null, null, null);
		List<FavoriteBean> favoriteResult = spaceDao.getFavoriteList(loginInfo.getNum(), pageInfo);
		
		for(FavoriteBean fBean: favoriteResult) {
			SpaceBean bean= spaceDao.getSpaceBySpaceNum(fBean.getSpacenum());
			fBean.setSpaceBean(bean);
		}
		
		mav.addObject("favoriteResult",favoriteResult);	
		mav.addObject("pageInfo",pageInfo);	
		System.out.println(favoriteResult);
		
		mav.setViewName(getPage);	
		return mav;
	}
	
	
	
}