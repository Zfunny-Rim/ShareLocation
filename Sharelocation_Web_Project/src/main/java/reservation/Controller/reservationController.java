package reservation.Controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
	
	
	@RequestMapping(value=command)
	public String reservation(HttpServletRequest request,
			@RequestParam(value="spaceNum") int spaceNum,
			@RequestParam(value="memberNum") int memberNum,
			HttpSession session ) {
		
		//로그인 안했다면
		if(session.getAttribute("loginInfo")==null) { 
			session.setAttribute("destination", "redirect:/reserv.rv");
			return "redirect:/loginForm.me";
		}
		//로그인 했으면
		else {
			//spaceNum값 받아서 bean 묶기
			//호스트정보가져오려면 호스트memberNum값 bean으로 묶기
			ReservationBean reservation = reservationDao.getReserv(spaceNum);  		
			request.setAttribute("reservation",reservation);			
			return getPage;
		}
	}	
}
