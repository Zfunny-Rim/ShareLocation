package reservation.controller;

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
public class reservationViewController {


	private final String command="/reservView.rv";
	private final String getPage="reservationview";
	
	@Autowired
	ReservationDao reservationDao;
	
	@Autowired
	SpaceDao spaceDao;
	
	@RequestMapping(value = command)
	public ModelAndView doAction(
			@RequestParam(value = "num",required=false) int num,
			ModelAndView mav
			) {
		ReservationBean reservationbean = reservationDao.getReservationByNum(num);
		
		SpaceBean spacebean = spaceDao.getSpace(reservationbean.getSpacenum());
		
		mav.addObject("reservationbean",reservationbean);
		mav.addObject("spacebean",spacebean);
		
		mav.setViewName(getPage);
		return mav;
	}
}
