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
public class MemberUpdateCmd {
	public final String command = "/update.member";
	public final String getPage = "updateForm";
	public final String goToPage = "redirect:/login.member";
	
	@Autowired
	MemberDao mdao;
	
	@RequestMapping(value = command,method = RequestMethod.GET)
	public ModelAndView doAction(
			@RequestParam("id") String id
			) {
		MemberBean member = mdao.getData(id);
		ModelAndView mav = new ModelAndView();
		mav.addObject("member",member);
		
		//이메일
		String[] email = member.getEmail().split("@");
		for(int i=0; i<email.length; i++) {
			String email_id = email[0];
			String email_domain = email[1];
			mav.addObject("email_id",email_id);
			mav.addObject("email_domain",email_domain);
		}
		
		//폰번호
		String[] hp = member.getHp().split("-");
		for(int i=0; i<hp.length;i++) {
			String hp1 = hp[0];
			String hp2 = hp[1];
			String hp3 = hp[2];
			mav.addObject("hp1",hp1);
			mav.addObject("hp2",hp2);
			mav.addObject("hp3",hp3);
		}
		
		mav.setViewName(getPage);
		return mav;
	}
	
	@RequestMapping(value = command,method = RequestMethod.POST)
	public ModelAndView doAction(
			MemberBean member,
			ModelAndView mav
			) {
		mdao.updateMember(member);
		mav.addObject("id",member.getId());
		mav.addObject("password",member.getPassword());
		mav.setViewName(goToPage);
		return mav;
	}

}
