package member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MemberRecordCmd {
	private final String command = "/record.member";
	private final String goToPage = "redirect:/login.member";
	
	@Autowired
	MemberDao mdao;
	
	@RequestMapping(value = command,method = RequestMethod.POST)
	public ModelAndView doAction(
			MemberBean member,
			ModelAndView mav
			) {
		mdao.updateFindMember(member);
		mav.addObject("id",member.getId());
		mav.addObject("password",member.getPassword());
		mav.setViewName(goToPage);
		return mav;
	}
	
}
