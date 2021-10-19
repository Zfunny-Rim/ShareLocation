package reservation.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
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
			ModelAndView mav, HttpSession session
			) throws ParseException{
		System.out.println(reservationBean);
		int spacenum = reservationBean.getSpacenum();
		int detailspacenum = reservationBean.getDetailspacenum();
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
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
		int totalamount = (price*time)+(price*person);
		
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
			mav.addObject("reservationdate",reservationdate);
			mav.addObject("detailSpacebean",detailSpacebean);
			mav.addObject("reservationbean",reservationBean);
			
			mav.setViewName(getPage);
			return mav;
	}
}