package member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MemberFindIdPwCmd {
	public final String command = "/findIdPw.member";
	public final String getPage = "memberFindIdPwForm";
	public final String emailHpCheck = "emailHpCheck.member";
	public final String goToPage = "redirect:/login.member";
	
	@Autowired
	MemberDao mdao;
	
	@RequestMapping(value = command,method = RequestMethod.GET)
	public String goAction() {
		return getPage;
	}
	
	@ResponseBody
	@RequestMapping(value = emailHpCheck,method = RequestMethod.POST)
	public String doAction(
			String email,
			String hp
			) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("hp", hp);
		MemberBean dbIdPw = mdao.getIdPw(map);
		
		String msg = "yes";
		
		if(dbIdPw == null) {
			msg = "no";
		}
		return msg;
	}
	
	@RequestMapping(value = command,method = RequestMethod.POST)
	public String doAction() {
		
		return goToPage;
	}
	
}
