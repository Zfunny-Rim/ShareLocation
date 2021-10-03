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

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MemberFindIdPwCmd {
	public final String command = "/findIdPw.member";
	public final String getPage = "memberFindIdPwForm";
	public final String goToPage = "redirect:/list.sp";
	
	@Autowired
	MemberDao mdao;
	
	@RequestMapping(value = command,method = RequestMethod.GET)
	public String doAction() {
		return getPage;
	}
	
	@RequestMapping(value = command,method = RequestMethod.POST)
	public String doAction(
			MemberBean member,
			HttpServletResponse response,
			HttpSession session
			) throws IOException {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("email", member.getEmail());
		map.put("hp", member.getHp());
		MemberBean dbMember = mdao.getIdPw(map);
		session.setAttribute("loginInfo", dbMember);
		
		PrintWriter pw = response.getWriter();
		response.setContentType("text/html;charset=UTF-8");
		
		if(dbMember == null) {
			 pw.println("<script>alert('email �Ǵ� Phone Number�� Ȯ���� �ּ���');</script>");
			 pw.flush();
			 return getPage;
		}
		
		pw.println("<script>alert('���̵�:'+idpw.getId()+'��й�ȣ:'+idpw.getPassword());</script>");
		pw.flush();
		return goToPage;
	}
	
}
