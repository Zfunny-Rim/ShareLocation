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
import reservation.model.ReservationBean;
import reservation.model.ReservationDao;
import reviewBoard.model.ReviewBoardBean;
import reviewBoard.model.ReviewBoardDao;
import space.model.SpaceBean;
import space.model.SpaceDao;


@Controller
public class reservationViewController {


	private final String command="/reservView.rv";
	private final String command1="/reviewboardInsert.rv";
	private final String getPage="reservationview";
	private final String getPage1="redirect:/reservView.rv";
	
	@Autowired
	ReservationDao reservationDao;
	
	@Autowired
	SpaceDao spaceDao;
	
	@Autowired
	ReviewBoardDao reviewBoardDao;
	
	@Autowired
	DetailSpaceDao detailSpaceDao;
	
	@RequestMapping(value = command)
	public ModelAndView doAction(
			@RequestParam(value = "num") int num,
			ModelAndView mav
			) {
		
		ReservationBean reservationbean = reservationDao.getReservationByNum(num);
		
		SpaceBean spacebean = spaceDao.getSpace(reservationbean.getSpacenum());
		DetailSpaceBean detailSpacebean = detailSpaceDao.getDetailSpaceByNum(reservationbean.getDetailspacenum());
		
		mav.addObject("reservationbean",reservationbean);
		mav.addObject("spacebean",spacebean);
		mav.addObject("detailSpacebean",detailSpacebean);
		
		mav.setViewName(getPage);
		return mav;
	}
	
	@RequestMapping(value=command1)
	public ModelAndView review(ModelAndView mav,
			@RequestParam(value = "spacenum") int spacenum,
			@RequestParam(value = "membernum") int membernum,
			@RequestParam(value = "reservnum") int reservnum,
			@Valid ReviewBoardBean reviewBoardBean, BindingResult result 
			) {
		
		reviewBoardBean.setSpacenum(spacenum);
		reviewBoardBean.setMembernum(membernum);
		
		int serview = reviewBoardBean.getServicerating();
		int price = reviewBoardBean.getPricevalueration();
		int clean = reviewBoardBean.getCleanrating();
		int total = serview+price+clean;
		
		reviewBoardBean.setTotalrating(total);
		System.out.println("totalrating:"+total );
		
		System.out.println(reviewBoardBean);
		if(result.hasErrors()) {
			System.out.println("유효성 검사 오류입니다.");
			mav.addObject("num",reservnum);
			mav.setViewName(getPage1);
			return mav;
		}
		int cnt=-1;
		cnt = reviewBoardDao.insertReviewBoard(reviewBoardBean);
		
		if(cnt != -1) {
			System.out.println("리뷰후기 등록");
		}
		else {
			System.out.println("리뷰후기 실패");
		}
		mav.setViewName(getPage1);
		return mav;
	}
}
