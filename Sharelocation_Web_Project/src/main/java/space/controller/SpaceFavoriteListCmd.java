package space.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import detailspace.model.DetailSpaceBean;
import detailspace.model.DetailSpaceDao;
import member.model.MemberBean;
import member.model.MemberDao;
import space.model.FavoriteBean;
import space.model.SpaceBean;
import space.model.SpaceDao;

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
	
	
	@RequestMapping(value= command)
	public ModelAndView doAction( ModelAndView mav,
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
			pw.println("location.href='main.ho'");
			pw.println("</script>");
			return null;
		}else if(!loginInfo.getType().equals("host")) {
			pw.println("<script>");
			pw.println("alert('호스트만 이용가능한 서비스입니다.');");
			pw.println("location.href='main.ho'");
			pw.println("</script>");
			return null;
		}
		
		
		
		
		System.out.println("확:"+loginInfo.getId());
		
		MemberBean member = memberDao.getData(loginInfo.getId());
		
		
		List<FavoriteBean> favoriteBean  = spaceDao.getFavoriteList(member.getNum());
		List<SpaceBean> favoriteResult = new ArrayList<SpaceBean>();
		
		for(FavoriteBean i: favoriteBean) {
			
			SpaceBean bean= spaceDao.getSpaceBySpaceNum(i.getNum());
			favoriteResult.add(bean);
			
			System.out.println("확인중12:"+bean);
		}
		
		mav.addObject("favoriteResult",favoriteResult);	
		System.out.println(favoriteBean);
		System.out.println(favoriteResult);
	

		
		mav.setViewName(getPage);	
		return mav;
	}
	
	
	
}