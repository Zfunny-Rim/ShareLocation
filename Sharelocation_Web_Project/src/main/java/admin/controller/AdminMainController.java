package admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminMainController {
	private final String command = "main.admin";
	private final String viewPage = "main";
	
	@RequestMapping(value=command)
	public ModelAndView goMain() {
		ModelAndView mav = new ModelAndView(viewPage);
		return mav;
	}
}
