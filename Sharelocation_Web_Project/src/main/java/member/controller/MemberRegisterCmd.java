package member.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MemberRegisterCmd {
	private final String command = "/register.member";
	private final String getPage = "memberRegisterForm";
	private final String goToPage = "redirect:/list.sp";
	
	@Autowired
	MemberDao mdao;
	
	@RequestMapping(value = command,method = RequestMethod.GET)
	public ModelAndView doAction(
			ModelAndView mav
			) {
		
		List<MemberBean> idLists=mdao.getId();
		System.out.println(idLists);
		mav.addObject("idLists",idLists);
		mav.setViewName(getPage);
		return mav;
	}
	
	@RequestMapping(value = command, method =RequestMethod.POST)
	public ModelAndView goActionPOST(
			@Valid MemberBean member,
			BindingResult result,
			ModelAndView mav
			) {
		
		if(result.hasErrors()) {
			mav.setViewName(getPage);
			return mav;
		}
		
		mdao.insertMember(member);
		mav.setViewName(goToPage);
		return mav;
	}
	
}
