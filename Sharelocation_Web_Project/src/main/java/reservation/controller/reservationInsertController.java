package reservation.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import reservation.model.ReservationBean;
import reservation.model.ReservationDao;

@Controller
public class reservationInsertController {
	
	private final String command="/reservInsert.rv";
	private final String getPage="reservationConfirmation";
	private final String gotoPage = "redirect:/reserv.rv";
	
	@Autowired
	ReservationDao reservationDao;
	
	@RequestMapping(value=command)
	public String reservationInsert(
			@RequestParam(value="memberNum") int memberNum,
			@RequestParam(value = "spaceNum") int spaceNum,
			@Valid ReservationBean bean,BindingResult result
			) {
		/*	
		bean.setMembernum(memberNum);
		bean.setSpacenum(spaceNum);
		bean.setDetailspacenum(detailspaceNum);
		
		if(result.hasErrors()) {
			System.out.println("유효성 검사 오류입니다.");
			return gotoPage;
		}
		
		int cnt = reservationDao.reservInsert(bean);
		if(cnt != 0) {
			System.out.println("저장 성공");
		}
		else {
			System.out.println("저장 살패");
		}
		*/
		return getPage;
	}
}
