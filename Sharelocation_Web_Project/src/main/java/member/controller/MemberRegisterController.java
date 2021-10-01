package member.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MemberRegisterController {
	private final String command = "/register.member";
	private final String getPage = "memberRegisterForm";
	private final String goToPage = "redirect:/list.mall";
	
	@Autowired
	MemberDao mdao;
	
	@RequestMapping(value = command,method = RequestMethod.GET)
	public String doAction() {
		return getPage;
	}
	
	@RequestMapping(value = command, method =RequestMethod.POST)
	public ModelAndView goActionPOST(
			MemberBean member,
			ModelAndView mav
			) {
		
		mdao.insertMember(member);
		
		mav.setViewName(goToPage);
		return mav;
	}
	
}
