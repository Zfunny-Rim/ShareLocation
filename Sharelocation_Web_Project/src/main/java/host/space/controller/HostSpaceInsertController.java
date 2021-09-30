package host.space.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import space.model.SpaceBean;

@Controller
public class HostSpaceInsertController {
	public final String command = "insertSpace.ho";
	public final String command_tier1 = "insertSpace_1.ho";
	public final String viewPage = "insert/insertSpace";
	
	@RequestMapping(value=command)
	public ModelAndView doAction() {
		ModelAndView mav = new ModelAndView(viewPage);
		return mav;
	}
	
	@RequestMapping(value=command_tier1)
	public ModelAndView insert_tier1(SpaceBean spaceBean, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView(viewPage);
		//email贸府
		String email = ((String)request.getParameter("email_id"))+"@"+((String)request.getParameter("email_domain"));
		spaceBean.setEmail(email);
		//hp贸府
		String hp = ((String)request.getParameter("hp1"))+"-"+
					((String)request.getParameter("hp2"))+"-"+
					((String)request.getParameter("hp3"));
		spaceBean.setHp(hp);
		//operatingtime 贸府
		String operatingtime = ((String)request.getParameter("starttime"))+"~"+
				((String)request.getParameter("endtime"));
		spaceBean.setOperatingtime(operatingtime);
		
		System.out.println(spaceBean);
		System.out.println("spaceTag : " + (String)request.getParameter("spacetag"));
		return mav;
	}
}
