package host.space.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HostSpaceListController {
	public final String command = "/spaceList.ho";
	public final String viewPage = "hostSpaceList";
	
	@RequestMapping(value=command)
	public ModelAndView gotoList() {
		ModelAndView mav = new ModelAndView(viewPage);
		return mav;
	}
}
