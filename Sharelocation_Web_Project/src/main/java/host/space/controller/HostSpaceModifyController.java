package host.space.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import space.model.SpaceBean;

@Controller
public class HostSpaceModifyController {
	private final String command = "modifySpace.ho";
	private final String viewPage = "redirect:/spaceManage.ho";
	
	@RequestMapping(value=command)
	public ModelAndView modifySpace(SpaceBean spaceBean) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewPage);
		mav.addObject("spaceNum", spaceBean.getNum());
		System.out.println(spaceBean);
		
		return mav;
	}
}
