package reservation.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberDao;
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
	BalanceDao balanceDao;
	
	@RequestMapping(value=command)
	public ModelAndView reservation(HttpServletRequest request,ModelAndView mav,
			@RequestParam(value="spaceNum", required = false) int spaceNum,
			@RequestParam(value="memberNum", required = false) int memberNum,
			@RequestParam(value="mr", required = false) String mr,
			@RequestParam(value="selectTime", required = false) String selectTime,
			@RequestParam(value="pr", required = false) String pr,
			HttpSession session ) {
		
		System.out.println("mr:"+mr);
		System.out.println("selectTime:"+selectTime);
		System.out.println("pr:"+pr);
		
		//�α��� ���ߴٸ�
//		if(session.getAttribute("loginInfo")==null) { 
//			session.setAttribute("destination", "redirect:/reserv.rv");
//			return "redirect:/loginForm.me";
			
//		}
		//�α��� ������
//		else {
			//spaceNum�� �޾Ƽ� bean ����
			//ȣ��Ʈ�������������� ȣ��ƮmemberNum�� bean���� ����
			ReservationBean reservation = reservationDao.getReserv(spaceNum);
			
			BalanceBean balance = balanceDao.getBalance(memberNum);
			
			mav.addObject("reservation",reservation);
			mav.addObject("balance",balance);
			mav.addObject("mr",mr);
			mav.addObject("selectTime",selectTime);
			mav.addObject("pr",pr);
			mav.setViewName(getPage);
			return mav;
//		}
	}	
}
