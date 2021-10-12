package member.controller;

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
			@RequestParam("password") String password
			) {  
		mdao.deleteMember(id,password);
		return goToPage;
	}
	
}
