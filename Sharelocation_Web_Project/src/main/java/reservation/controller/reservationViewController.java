package reservation.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
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
import member.model.MemberDao;
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
	@Autowired
	MemberDao memberDao;
	@RequestMapping(value = command)
	public ModelAndView doAction(
			@RequestParam(value = "num") int num,
			ModelAndView mav
			) {
		
		ReservationBean reservationbean = reservationDao.getReservationByNum(num);
		SpaceBean spacebean = spaceDao.getSpace(reservationbean.getSpacenum());
		DetailSpaceBean detailSpacebean = detailSpaceDao.getDetailSpaceByNum(reservationbean.getDetailspacenum());
		MemberBean memberBean = memberDao.getMemberByNum(reservationbean.getMembernum());
		
		mav.addObject("reservationbean",reservationbean);
		mav.addObject("spacebean",spacebean);
		mav.addObject("detailSpacebean",detailSpacebean);
		mav.addObject("memberbean",memberBean);
		mav.setViewName(getPage);
		return mav;
	}
	
	@RequestMapping(value=command1)
	public ModelAndView review(ModelAndView mav,
			@RequestParam(value = "spacenum") int spacenum,
			@RequestParam(value = "membernum") int membernum,
			@RequestParam(value = "reservnum") int reservnum,
			@RequestParam(value = "writer") String writer,
			@RequestParam(value = "detailspacenum") int detailspacenum,
		    ReviewBoardBean reviewBoardBean, HttpServletResponse response
			) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		reviewBoardBean.setSpacenum(spacenum);
		reviewBoardBean.setMembernum(membernum);
		
		int serview = reviewBoardBean.getServicerating();
		int price = reviewBoardBean.getPricevalueration();
		int clean = reviewBoardBean.getCleanrating();
		int total = serview+price+clean;
		
		reviewBoardBean.setTotalrating(total);
		System.out.println("totalrating:"+total );
		
		System.out.println(reviewBoardBean);
		int cnt=-1;
		cnt = reviewBoardDao.insertReviewBoard(reviewBoardBean);
		PrintWriter pw = response.getWriter();
		if(cnt != -1) {
			pw.println("<script>");
			pw.println("alert('리뷰 등록되었습니다.');");
			pw.println("location.href='detailView.sp?num="+spacenum+"&membernum="+membernum+"';");
			pw.println("</script>");
			pw.flush();
			return null;
		}
		else {
			System.out.println("리뷰후기 실패");
		}
		return mav;
	}
}
