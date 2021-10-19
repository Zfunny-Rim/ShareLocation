package space.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import member.model.MemberDao;
import reviewBoard.model.ReviewBoardBean;
import reviewBoard.model.ReviewBoardDao;
import space.model.SpaceBean;
import space.model.SpaceDao;
import utility.Paging;

@Controller
public class SpaceReviewManageController {
	private final String command = "reviewManage.sp";
	private final String viewPage = "reviewManage";
	private final String delCommand = "reviewDelete.sp";
	
	@Autowired
	MemberDao memberDao;
	@Autowired
	ReviewBoardDao reviewBoardDao;
	@Autowired
	SpaceDao spaceDao;
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value=command)
	public ModelAndView reviewList(@RequestParam(value="pageNumber", required=false) String pageNumber,
			HttpSession session, HttpServletResponse response) throws IOException {
		ModelAndView mav = new ModelAndView(viewPage);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = response.getWriter();
		MemberBean loginInfo = (MemberBean) session.getAttribute("loginInfo");
		if(loginInfo == null) {
			pw.println("<script>");
			pw.println("alert('로그인이 필요한 서비스입니다.');");
			pw.println("location.href='miniLogin.member';");
			pw.println("</script>");
			return null;
		}
		if(pageNumber == null)
			pageNumber = "1";
		int memberNum = loginInfo.getNum();
		int totalCount = reviewBoardDao.getOriginReviewCountByMemberNum(memberNum);
		String url = servletContext.getContextPath()+"/"+command;
		Paging pageInfo = new Paging(pageNumber, "2", totalCount, url, null, null, null);
		List<ReviewBoardBean> reviewList = reviewBoardDao.getOriginReviewListByMemberNum(memberNum, pageInfo);
		for(ReviewBoardBean rBean:reviewList) {
			ReviewBoardBean replyBean = reviewBoardDao.getReviewReplyByNum(rBean.getNum());
			rBean.setReviewReply(replyBean);
			SpaceBean spaceBean = spaceDao.getSpace(rBean.getSpacenum());
			rBean.setSpaceBean(spaceBean);
		}
		mav.addObject("reviewList", reviewList);
		mav.addObject("pageInfo", pageInfo);
		return mav;
	}
	
	@RequestMapping(value=delCommand)
	public ModelAndView reviewDelete(@RequestParam(value="reviewNum")int reviewNum,
			HttpSession session, HttpServletResponse response) throws IOException {
		ModelAndView mav = new ModelAndView(viewPage);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = response.getWriter();
		MemberBean loginInfo = (MemberBean) session.getAttribute("loginInfo");
		if(loginInfo == null) {
			pw.println("<script>");
			pw.println("alert('로그인이 필요한 서비스입니다.');");
			pw.println("location.href='miniLogin.member';");
			pw.println("</script>");
			return null;
		}
		int cnt = -1;
		cnt = reviewBoardDao.deleteReviewByNum(reviewNum);
		if(cnt != -1) {
			pw.println("<script>");
			pw.println("alert('리뷰가 삭제되었습니다..');");
			pw.println("location.href='reviewManage.sp';");
			pw.println("</script>");
			return null;
		}
		mav.setViewName("redirect:/reviewManage.sp");
		return mav;
	}
}
