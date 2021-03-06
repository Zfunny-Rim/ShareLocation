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
public class MemberLoginCmd {
	private final String command = "login.member";
	private final String hostPage = "main.ho";
	private final String guestPage = "list.sp";
	private final String adminPage = "main.admin";
	private final String getPage = "loginForm";
	
	@Autowired
	MemberDao mdao;

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
			 //mav.setViewName(getPage);
			 pw.println("<script>");
			 pw.println("alert('아이디 비밀번호를 확인하세요.');");
			 pw.println("location.href='miniLogin.member';");
			 pw.println("</script>");
	         pw.flush();
	         return null;
		 }
		 else {
			 String destination = (String)session.getAttribute("destination");
			 String gotoPage = null;
			 String userNName = dbMember.getNickname();
			 if(destination != null) {
				 gotoPage = destination;
			 }else {
				 if(dbMember.getType().equals("admin")) {//adminLogin
					 gotoPage = adminPage;
				 }
				 else if(dbMember.getType().equals("host")) {//hostLogin
					 gotoPage = hostPage;
				 }
				 else {//guestLogin
					 gotoPage = guestPage;
				 }
			 }
			 pw.println("<script>");
			 pw.println("alert('"+userNName+"님 환영합니다.');");
			 pw.println("location.href='"+gotoPage+"';");
			 pw.println("</script>");
			 pw.flush();
			 return null;
		 }
	 }
	 
	 @RequestMapping(value = command,method = RequestMethod.GET)
	 public ModelAndView doAction(
			 MemberBean member,
			 HttpServletResponse response,
			 HttpSession session,
			 ModelAndView mav
			 ) throws IOException {
		 PrintWriter pw = response.getWriter();   
	     response.setContentType("text/html;charset=UTF-8");
		 Map<String, String> map = new HashMap<String, String>();
		 map.put("id", member.getId());
		 map.put("password", member.getPassword());
		 
		 MemberBean dbMember = mdao.getLoginData(map);
		 session.setAttribute("loginInfo", dbMember);
		 
		 mav = new ModelAndView();
		 mav.addObject("loginInfo",dbMember);
		 String gotoPage = null;
		 String userNName = dbMember.getNickname();
		 if(dbMember.getType().equals("admin")) {//adminLogin
			 gotoPage = adminPage;
		 }
		 else if(dbMember.getType().equals("host")) {//hostLogin
			 gotoPage = hostPage;
		 }
		 else {//guestLogin
			 gotoPage = guestPage;
		 }
		 
		 pw.println("<script>");
		 pw.println("alert('"+userNName+"님 가입을 환영합니다.');");
		 pw.println("location.href='"+gotoPage+"';");
		 pw.println("</script>");
		 pw.flush();
		 return null;
	 }
	 
}
