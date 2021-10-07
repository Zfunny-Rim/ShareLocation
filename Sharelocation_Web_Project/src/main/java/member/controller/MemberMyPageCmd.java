package member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MemberMyPageCmd {
	private final String command = "/mypage.member";
	private final String goToPage = "myPageForm";
	
	@Autowired
	MemberDao mdao;
	
	 @RequestMapping(value = command,method = RequestMethod.GET)
	 public ModelAndView doAction(
			 @RequestParam("id") String id
			 ) {   
		 MemberBean member = mdao.getData(id);
		 ModelAndView mav = new ModelAndView();
		 mav.addObject("member",member);
		 mav.setViewName(goToPage);
		 return mav;
		 
	 }
	
}
