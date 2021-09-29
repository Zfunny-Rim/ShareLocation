package host.space.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HostSpaceInsertController {
	public final String command = "insertSpace.ho";
	public final String viewPage = "insert/insertSpace";
	
	@RequestMapping(value=command)
	public ModelAndView doAction() {
		ModelAndView mav = new ModelAndView(viewPage);
		return mav;
	}
}
