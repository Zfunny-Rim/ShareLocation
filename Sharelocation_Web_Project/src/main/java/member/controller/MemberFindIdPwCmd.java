package member.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MemberFindIdPwCmd {
	public final String command = "/findIdPw.member";
	public final String getPage = "memberFindIdPwForm";
	public final String emailHpCheck = "emailHpCheck.member";
	public final String goToPage = "memberRecordIdForm";
	
	@Autowired
	MemberDao mdao;
	
	@RequestMapping(value = command,method = RequestMethod.GET)
	public String goAction() {
		return getPage;
	}
	
	@RequestMapping(value = command,method = RequestMethod.POST)
	public ModelAndView doAction(
			@RequestParam(value = "email") String email,
			@RequestParam(value = "hp") String hp
			) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("hp", hp);
		MemberBean dbIdPw = mdao.getIdPw(map);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("id",dbIdPw.getId());
		mav.setViewName(goToPage);
		return mav;
	}
	
}
