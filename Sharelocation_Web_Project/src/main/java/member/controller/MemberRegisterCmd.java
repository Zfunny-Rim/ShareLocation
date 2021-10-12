package member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MemberRegisterCmd {
	private final String command = "register.member";
	private final String idCheck = "idcheck.member";
	private final String nickNameCheck = "nicknamecheck.member";
	private final String getPage = "memberRegisterForm";
	private final String goToPage = "redirect:/login.member";
	
	@Autowired
	MemberDao mdao;  
	
	@RequestMapping(value = command,method = RequestMethod.GET)
	public String doAction(
			) {
		return getPage;
	}
	
	//아이디중복체크
	@ResponseBody
	@RequestMapping(value=idCheck, method = RequestMethod.POST)
	public String idCheck(String problem_id) throws Exception {
		
		MemberBean member = mdao.getData(problem_id); 
		String msg = "yes";
		if(member == null) {	
			msg = "no";
		}
		return msg;
		
	}
	
	//닉네임중복체크
	@ResponseBody
	@RequestMapping(value=nickNameCheck, method = RequestMethod.POST)
	public String nicknameCheck(String problem_nickname) throws Exception {
		MemberBean member = mdao.getNickname(problem_nickname); 
		String msg = "yes";
		if(member == null) {	
			msg = "no";
		}
		return msg;
	}
	
	@RequestMapping(value = command, method =RequestMethod.POST)
	public ModelAndView doAction(
			MemberBean member,
			ModelAndView mav
			) {
		mdao.insertMember(member);
		mav.addObject("id",member.getId());
		mav.addObject("password",member.getPassword());
		mav.setViewName(goToPage);
		return mav;
	}
	
}
