package member.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MemberLoginCmd {
	private final String command = "/login.member";
	private final String hostPage = "redirect:/main.ho";
	private final String guestPage = "redirect:/list.sp";
	private final String adminPage = "redirect:/list.admin";
	private final String getPage = "loginForm";
	
	@Autowired
	MemberDao mdao;

	 @RequestMapping(value = command,method = RequestMethod.POST)
	  public ModelAndView doAction(
			  MemberBean member,
			  HttpServletResponse response,
			  HttpSession session
			  ) throws IOException {
		 MemberBean dbMember = mdao.getData(member.getId());
		 session.setAttribute("loginInfo", dbMember);
		 //response.setContentType("text/html;charset=UTF-8");
		 //PrintWriter pw = response.getWriter();
		 
		 ModelAndView mav = new ModelAndView();
		 mav.addObject("loginInfo",dbMember);
		 
		 if(dbMember == null) {
			// pw.println("<script>alert('占쏙옙占싱듸옙|占쏙옙橘占싫ｏ옙占� 확占쏙옙占쏙옙 占쌍쇽옙占쏙옙');</script>");
			// pw.flush();
			 mav.setViewName(getPage);
			 return mav;
		 }
		 else {
			 if(dbMember.getType().equals("admin")) {//adminLogin
				 mav.setViewName(adminPage);
				 return mav;
			 }
			 else if(dbMember.getType().equals("host")) {//hostLogin
				 mav.setViewName(hostPage);
				 return mav;
			 }
			 else {//guestLogin
				 mav.setViewName(guestPage);
				 return mav;
			 }
		 }
	 }
}
