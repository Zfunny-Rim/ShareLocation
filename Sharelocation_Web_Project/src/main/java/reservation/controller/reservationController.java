package reservation.controller;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import detailspace.model.DetailSpaceBean;
import detailspace.model.DetailSpaceDao;
import member.model.MemberBean;
import reservation.model.BalanceBean;
import reservation.model.BalanceDao;
import reservation.model.ReservationBean;
import reservation.model.ReservationDao;
import space.model.SpaceBean;
import space.model.SpaceDao;


@Controller
public class reservationController {
	
	private final String command="/reserv.rv";
	private final String getPage="reservation";
	
	@Autowired
	ReservationDao reservationDao;
		
	@Autowired
	SpaceDao spaceDao;
	
	@Autowired
	DetailSpaceDao detailSpaceDao;
	
	@Autowired
	BalanceDao balanceDao;
	
	@RequestMapping(value=command)
	public ModelAndView reservation(HttpServletRequest request,ModelAndView mav,
			@RequestParam("spacenum") int spacenum,
			@RequestParam("detailspacenum") int detailspacenum,		
			Model model,HttpServletResponse response,
			HttpSession session ) throws IOException {
		response.setContentType("text/html; charset=UTF-8");	 
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		//로그인 안했다면
		PrintWriter pw = response.getWriter();
		if(session.getAttribute("loginInfo")==null) { 
			session.setAttribute("destination", "redirect:/detailView.sp?num="+spacenum+"&detailspacenum="+detailspacenum);     
			pw.print("<script>");
			pw.print("alert('로그인이 필요한 서비스입니다.');");
			pw.println("location.href='miniLogin.member';");
			pw.print("</script>");
			return null;
		}
		//로그인 했으면
		else {
			//spaceNum값 받아서 bean 묶기
			//호스트정보가져오려면 호스트memberNum값 bean으로 묶기
			
			SpaceBean spacebean = spaceDao.getSpace(spacenum);
			
			DetailSpaceBean detailSpacebean = detailSpaceDao.getDetailSpaceByNum(detailspacenum);
			
			BalanceBean balance = balanceDao.getBalance(spacebean.getMembernum());
			
			mav.addObject("balance",balance);
			mav.addObject("spacebean",spacebean);
			mav.addObject("detailSpacebean",detailSpacebean);
			mav.setViewName(getPage);
			return mav;
		}
	}	
}