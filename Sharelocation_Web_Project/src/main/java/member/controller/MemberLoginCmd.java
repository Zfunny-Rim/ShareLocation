package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

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
	private final String hostPage = "redirect:/list.ho";
	private final String guestPage = "redirect:/list.sp";
	private final String adminPage = "redirect:/list.admin";
	
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
		 response.setContentType("text/html;charset=UTF-8");
		 PrintWriter pw = response.getWriter();
		 
		 ModelAndView mav = new ModelAndView();
		 mav.addObject("loginInfo",dbMember);
		 
		 if(dbMember == null) {
			 mav.setViewName("/");
			 pw.println("<script>alert('아이디|비밀번호를 확인해 주세요');</script>");
			 pw.flush();
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
