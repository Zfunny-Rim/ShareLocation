package reservation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import reservation.model.ReservationDao;

@Controller
public class reservationDeleteController {
	
	private final String command="/reservationdelete.rv";
	private final String getPage="redirect:/reservList.rv";
	
	@Autowired
	ReservationDao reservationDao;
	
	@RequestMapping(value= command)
	public ModelAndView doAction(ModelAndView mav,
			@RequestParam(value = "pageNumber",required=false) String pageNumber,
			@RequestParam(value = "num",required=false) int num) {
		
		int cnt = reservationDao.deleteReserv(num);  //DB에서 레코드삭제
		
		mav.setViewName(getPage+"?pageNumber="+pageNumber);
		return mav;
	}
}
