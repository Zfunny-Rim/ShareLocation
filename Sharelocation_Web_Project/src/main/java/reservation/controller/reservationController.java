package reservation.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import detailspace.model.DetailSpaceBean;
import detailspace.model.DetailSpaceDao;
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
	
	@RequestMapping(value=command)
	public ModelAndView reservation(HttpServletRequest request,ModelAndView mav,
		//	@RequestParam(value="spaceNum", required = false) int spaceNum,
		//	@RequestParam(value="memberNum", required = false) int memberNum,
			
			HttpSession session ) {
		
		ReservationBean reservationbean = new ReservationBean();
		reservationbean.setSpacenum(1);
		reservationbean.setDetailspacenum(1);
		reservationbean.setCheckin("20");
		reservationbean.setCheckout("21");
		reservationbean.setPerson(1);
		reservationbean.setAmounts(10000);
		
		System.out.println("reservationbean:"+reservationbean.toString());
		//로그인 안했다면
//		if(session.getAttribute("loginInfo")==null) { 
//			session.setAttribute("destination", "redirect:/reserv.rv");
//			return "redirect:/loginForm.me";
			
//		}
		//로그인 했으면
//		else {
			//spaceNum값 받아서 bean 묶기
			//호스트정보가져오려면 호스트memberNum값 bean으로 묶기
			//reservationbean = reservationDao.getReserv(reservationbean.getSpacenum());
			
			SpaceBean spacebean = spaceDao.getSpace(reservationbean.getSpacenum());
			
			DetailSpaceBean detailSpacebean = detailSpaceDao.getdetailspace(reservationbean.getDetailspacenum());
			
			mav.addObject("spacebean",spacebean);
			mav.addObject("detailSpacebean",detailSpacebean);
			mav.addObject("reservationbean",reservationbean);
			
		//	mav.addObject("balance",balance);
			mav.setViewName(getPage);
			return mav;
//		}
	}	
}
