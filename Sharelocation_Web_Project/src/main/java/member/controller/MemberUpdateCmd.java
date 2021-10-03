package member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MemberUpdateCmd {
	public final String command = "/update.member";
	public final String getPage = "updateForm";
	public final String goToPage = "/list.sp";
	
	@Autowired
	MemberDao mdao;
	
	@RequestMapping(value = command,method = RequestMethod.GET)
	public ModelAndView doAction(
			@RequestParam("id") String id
			) {
		MemberBean member = mdao.getData(id);
		ModelAndView mav = new ModelAndView();
		mav.addObject("member",member);
		mav.setViewName(getPage);
		return mav;
	}
	
	@RequestMapping(value = command,method = RequestMethod.POST)
	public String doAction(
			MemberBean member,
			HttpSession session
			) {
		
		mdao.updateMember(member);
		session.setAttribute("loginInfo", member);
		return goToPage;
	}

}
