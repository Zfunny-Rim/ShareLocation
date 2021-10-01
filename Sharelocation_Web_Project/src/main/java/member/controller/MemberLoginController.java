package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MemberLoginController {
	private final String command = "login.member";
	private final String getPage = "memberLoginForm";
	private final String goToPage = "redirect:/list.mall";
	
	@Autowired
	MemberDao mdao;

	 @RequestMapping(value = command,method = RequestMethod.POST)
	  public String doAction(
			  MemberBean member,
			  HttpServletResponse response,
			  HttpSession session
			  ) throws IOException {
		 
		 MemberBean dbMember = mdao.getData(member.getId());
		 PrintWriter pw = response.getWriter();
		 response.setContentType("text/html;charset=UTF-8");
		 
		 if(dbMember == null) {
			 pw.println("<script>alert('아이디를 확인해 주세요');</script>");
			 pw.flush();
			 return getPage;
		 }
		 else {
			 if(member.getPassword().equals(dbMember.getPassword())) {
				 session.setAttribute("loginInfo", dbMember);
				 return goToPage;
			 }
			 else {
				 pw.println("<script>alert('비밀번호를 확인해 주세요');</script>");
				 pw.flush();
				 return getPage;
			 }
		 }
	 }
	 
}
