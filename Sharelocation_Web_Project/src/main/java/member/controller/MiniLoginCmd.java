package member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

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
public class MiniLoginCmd {
	private final String command = "miniLogin.member";
	private final String hostPage = "redirect:/main.ho";
	private final String guestPage = "redirect:/list.sp";
	private final String adminPage = "redirect:/list.admin";
	private final String getPage = "miniLoginForm";
	
	@Autowired
	MemberDao mdao;
	
	@RequestMapping(value = command,method = RequestMethod.GET)
	public String doAction() {
		return getPage;
	}
	
	@RequestMapping(value = command,method = RequestMethod.POST)
	public ModelAndView doAction(
			MemberBean member,
			HttpServletResponse response,
			HttpSession session
			) throws IOException {
		
		Map<String, String> map = new HashMap<String, String>();
		 map.put("id", member.getId());
		 map.put("password", member.getPassword());
		 MemberBean dbMember = mdao.getLoginData(map);
		 session.setAttribute("loginInfo", dbMember);
		 
		 ModelAndView mav = new ModelAndView();
		 PrintWriter pw = response.getWriter();   
	     response.setContentType("text/html;charset=UTF-8");
		 mav.addObject("loginInfo",dbMember);
		 
		 if(dbMember == null) {
			 mav.setViewName(getPage);
			 pw.println("<script>alert('아이디 비밀번호를 확인하세요.');</script>");
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
