package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberDao;

@Controller
public class MemberDeleteCmd {
	
	private final String command = "delete.member";
	private final String getPage = "deleteForm";
	private final String goToPage = "logout";
	
	
	@Autowired
	MemberDao mdao;
	
	@RequestMapping(command)
	public String doAction() {
		
		return getPage;
	}
	
	@RequestMapping(value = command,method = RequestMethod.POST)
	public String doAction(
			@RequestParam("id") String id,
			@RequestParam("password") String password,
			HttpServletResponse response
			) throws IOException {  
		
		 PrintWriter pw = response.getWriter();   
	     response.setContentType("text/html;charset=UTF-8");
		
		int cnt = mdao.deleteMember(id,password);
		if(cnt==0) {
			pw.println("<script>alert('아이디와 비밀번호를 확인하세요.');</script>");
			pw.flush();
			return getPage;
		}
		else {
		return goToPage;
		}
	}
	
}
