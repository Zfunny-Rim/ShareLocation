package member.controller;

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
	private final String command = "/register.mem";
	private final String getPage = "memberRegisterForm";
	private final String goToPage = "redirect:/list.mem";

	@Autowired
	private MemberDao memberDao;

	@RequestMapping(value= command, method=RequestMethod.GET)
	public ModelAndView doActionGET(ModelAndView mav) {
		System.out.println("memeberRegisterGET");
		mav.setViewName(getPage);


		return mav;
	}

	@RequestMapping(value= command, method=RequestMethod.POST) public
	ModelAndView doActionPOST(MemberBean member,BindingResult result,
			ModelAndView mav) { System.out.println("memeberRegisterPOST");

			if(result.hasErrors()) 
			{ mav.setViewName(getPage);
			return mav; 
			}

			else { int cnt = memberDao.insertMember(member);
			System.out.println("member :"+member); System.out.println("¼ýÀÚ"+cnt); }
			mav.setViewName(goToPage); return mav; }


}
