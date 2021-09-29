package host.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HostController {
	public final String command = "/main.ho";
	public final String viewPage = "main";
	
	@RequestMapping(value=command)
	public ModelAndView doAction() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewPage);
		return mav;
	}
}
