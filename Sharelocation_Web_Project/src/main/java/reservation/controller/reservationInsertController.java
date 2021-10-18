package reservation.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
			@RequestParam(value = "spacenum",required=false) int spacenum,
			@RequestParam(value = "detailspacenum",required=false) int detailspacenum,
			ReservationBean reservationbean,BindingResult result, HttpServletRequest request,
			ModelAndView mav, HttpSession session
			) throws ParseException{
		
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		//set member session요청
		reservationbean.setMembernum(loginInfo.getNum()); 
		reservationbean.setSpacenum(spacenum);
		reservationbean.setDetailspacenum(detailspacenum);
		reservationbean.setStatus("예약대기");//임시
		
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
		
		reservationbean.setCheckin(checkin);
		reservationbean.setCheckout(checkout);
		
		SpaceBean spacebean = spaceDao.getSpace(spacenum);
		
		DetailSpaceBean detailSpacebean = detailSpaceDao.getDetailSpaceByNum(detailspacenum);
		
		int price = detailSpacebean.getPrice();
		int Intoperatingtime = Integer.parseInt(checkintime);
		int Intoperatingendtime = Integer.parseInt(checkouttime);
		int time = (Intoperatingendtime-Intoperatingtime);
		int person = reservationbean.getPerson();
		int totalamount = (price*time)+(price*person);
		
		reservationbean.setAmounts(totalamount);
		
		System.out.println("resevationbean InsertController:"+reservationbean);
		if(result.hasErrors()) {
			System.out.println("유효성 검사 오류입니다.");
			mav.setViewName(gotoPage);
			return mav;
		}
			int cnt=-1;
			cnt = reservationDao.reservInsert(reservationbean);
			if(cnt != -1) {
				System.out.println("저장 성공");
			}
			else {
				System.out.println("저장 살패");
			}
			
			mav.addObject("spacenum",spacenum);
			mav.addObject("spacebean",spacebean);
			mav.addObject("reservationdate",reservationdate);
			mav.addObject("detailSpacebean",detailSpacebean);
			mav.addObject("reservationbean",reservationbean);
			
			mav.setViewName(getPage);
			return mav;
	}
}