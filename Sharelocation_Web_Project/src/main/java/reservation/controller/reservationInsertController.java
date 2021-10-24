package reservation.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import detailspace.model.DetailSpaceBean;
import detailspace.model.DetailSpaceDao;
import member.model.MemberBean;
import reservation.model.ReservationBean;
import reservation.model.ReservationDao;
import space.model.SpaceBean;
import space.model.SpaceDao;

@Controller
public class reservationInsertController {

	private final String command="/reservInsert.rv";
	private final String getPage="reservationConfirmation";
	private final String gotoPage = "redirect:/reserv.rv";
	
	
	@Autowired
	ReservationDao reservationDao;
	
	@Autowired
	SpaceDao spaceDao;
	
	@Autowired
	DetailSpaceDao detailSpaceDao;
	
	
	@RequestMapping(value=command)
	public ModelAndView reservationInsert(
			ReservationBean reservationBean, BindingResult result,  HttpServletRequest request,
			ModelAndView mav, HttpSession session, HttpServletResponse response
			) throws ParseException, IOException{
		System.out.println(reservationBean);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		int spacenum = reservationBean.getSpacenum();
		int detailspacenum = reservationBean.getDetailspacenum();
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		if(loginInfo == null) {
			pw.println("<script>");
			pw.println("alert('로그인이 필요한 서비스입니다.');");
			pw.println("location.href='miniLogin.member';");
			pw.println("</script>");
			return null;
		}
		//set member session요청
		reservationBean.setMembernum(loginInfo.getNum()); 
		reservationBean.setSpacenum(spacenum);
		reservationBean.setDetailspacenum(detailspacenum);
		reservationBean.setStatus("예약대기");//임시
		
		String reservationdate = request.getParameter("reservationdate");
		String checkintime = request.getParameter("checkintime");
		String checkouttime = request.getParameter("checkouttime");
		
		System.out.println("reservationdate:"+reservationdate);
		System.out.println("checkintime:"+checkintime);
		System.out.println("checkouttime:"+checkouttime);
		
		String checkin = reservationdate+" "+checkintime+":00";
		String checkout = reservationdate+" "+checkouttime+":00";
		
		System.out.println("checkin:"+checkin);
		System.out.println("checkin:"+checkout);
		
		reservationBean.setCheckin(checkin);
		reservationBean.setCheckout(checkout);
		
		SpaceBean spacebean = spaceDao.getSpace(spacenum);
		
		DetailSpaceBean detailSpacebean = detailSpaceDao.getDetailSpaceByNum(detailspacenum);
		
		int price = detailSpacebean.getPrice();
		int Intoperatingtime = Integer.parseInt(checkintime);
		int Intoperatingendtime = Integer.parseInt(checkouttime);
		int time = (Intoperatingendtime-Intoperatingtime);
		int person = reservationBean.getPerson();
		int totalamount = 0;
		String priceUnit = detailSpacebean.getPriceunit();
		if(priceUnit.equals("시간")) {
			totalamount = price * time * person;
		}else {
			totalamount = price * time;
		}
		reservationBean.setAmounts(totalamount);
		
		System.out.println("resevationbean InsertController:"+reservationBean);
			int cnt=-1;
			cnt = reservationDao.reservInsert(reservationBean);
			if(cnt != -1) {
				System.out.println("저장 성공");
			}
			else {
				System.out.println("저장 살패");
			}
			
			mav.addObject("spacenum",spacenum);
			mav.addObject("spacebean",spacebean);
			mav.addObject("memberbean", loginInfo);
			mav.addObject("reservationdate",reservationdate);
			mav.addObject("detailSpacebean",detailSpacebean);
			mav.addObject("reservationbean",reservationBean);
			
			mav.setViewName(getPage);
			return mav;
	}
}