package reservation.controller;

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
			@RequestParam(value = "spacenum",required=false) int spacenum,
			@RequestParam(value = "detailspacenum",required=false) int detailspacenum,
			@Valid ReservationBean reservationbean,BindingResult result,
			ModelAndView mav
			) {
		//set member session요청
		reservationbean.setMembernum(1); 
		reservationbean.setSpacenum(spacenum);
		reservationbean.setDetailspacenum(detailspacenum);
		reservationbean.setStatus("예약확정");//임시
		reservationbean.setApplicationdate("2021-10-20"); //임시
		reservationbean.setPerson(2); //임시
		reservationbean.setPaymenttype("현장결제"); //임시
		
		SpaceBean spacebean = spaceDao.getSpace(spacenum);
		reservationbean.setCheckin(spacebean.getOperatingtime()); //임시
		reservationbean.setCheckout(spacebean.getOperatingendtime()); //임시
		
		DetailSpaceBean detailSpacebean = detailSpaceDao.getdetailspace(detailspacenum);
		reservationbean.setAmounts(detailSpacebean.getPrice());
		
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
			
			mav.addObject("spacebean",spacebean);
			mav.addObject("detailSpacebean",detailSpacebean);
			mav.addObject("reservationbean",reservationbean);
			
			mav.setViewName(getPage);
			return mav;
	}
}
