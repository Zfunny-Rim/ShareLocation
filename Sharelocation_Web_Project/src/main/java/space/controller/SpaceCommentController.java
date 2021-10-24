package space.controller;

import java.io.IOException;
import java.io.PrintWriter;

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
import space.model.SpaceCommentBean;
import space.model.SpaceDao;

@Controller
public class SpaceCommentController {
	private final String insertCommand = "insertComment.sp";
	private final String deleteCommand = "deleteComment.sp";
	
	@Autowired
	SpaceDao spaceDao;
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value=insertCommand)
	public ModelAndView insertComment(SpaceCommentBean spaceCommentBean,
			HttpServletResponse response, HttpSession session) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		ModelAndView mav = new ModelAndView();
		MemberBean loginInfo = (MemberBean) session.getAttribute("loginInfo");
		if(loginInfo == null) {
			pw.println("<script>");
			pw.println("alert('로그인이 필요한 서비스입니다.');");
			pw.println("location.href='miniLogin.member';");
			pw.println("</script>");
			pw.flush();
			return null;
		}
		
		spaceCommentBean.setMembernum(loginInfo.getNum());
		spaceCommentBean.setWriter(loginInfo.getNickname());
		spaceCommentBean.setReplynum(0);
		System.out.println(spaceCommentBean);
		int cnt = -1;
		cnt = spaceDao.insertSpaceComment(spaceCommentBean);
		if(cnt != -1) {
		}
		mav.setViewName("redirect:/detailView.sp");
		mav.addObject("num", spaceCommentBean.getSpacenum());
		return mav;
	}
	
	@RequestMapping(value=deleteCommand)
	public ModelAndView deleteComment(@RequestParam(value="num")int num,
			@RequestParam(value="spaceNum")int spaceNum,
			HttpServletResponse response, HttpSession session) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		ModelAndView mav = new ModelAndView();
		int cnt = -1;
		cnt = spaceDao.deleteComment(num);
		mav.setViewName("redirect:/detailView.sp");
		mav.addObject("num", spaceNum);
		return mav;
		
	}
}
