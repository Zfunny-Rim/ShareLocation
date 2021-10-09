package reservation.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import reservation.model.ReservationBean;
import reservation.model.ReservationDao;
import utility.Paging;

@Controller
public class reservationListController {

	private final String command="/reservList.rv";
	private final String getPage="reservationList";
	
	@Autowired
	ReservationDao reservationDao;
	
	@RequestMapping(value=command,method = RequestMethod.GET)
	public ModelAndView doAction(
			@RequestParam(value = "pageNumber",required=false) String pageNumber,
			//@RequestParam(value = "membernum",required=false) int membernum,
			Model model,ModelAndView mav,HttpSession session
			) {
		
		//�α��� ���ߴٸ�
		if(session.getAttribute("loginInfo")==null) { 

			model.addAttribute("msg", "�α��� ���ּ���~!");
			model.addAttribute("url", "/sharelocation/#");
			mav.setViewName("redirect");
			return mav;
		}
		Paging pageInfo = new Paging(pageNumber, null, 0, null, null, null, null);
		
		List<ReservationBean> reservationbean = reservationDao.getReservList(1,pageInfo);  //membernum�� 1 �ӽ�
		System.out.println("reservationbean.List:"+reservationbean);
		
		mav.addObject("reservationbean",reservationbean);
		mav.setViewName(getPage);
		return mav;
	}
}
