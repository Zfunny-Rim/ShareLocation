package host.space.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import detailspace.model.DetailSpaceBean;
import detailspace.model.DetailSpaceDao;

@Controller
public class HostDetailSpaceInsertController {
	private final String command = "/detailSpaceInsert.ho";
	private final String viewPage = "insert/hostDetailSpaceInsert";
	private final String gotoPage = "redirect:/detailSpaceList.ho";
	
	@Autowired
	DetailSpaceDao detailSpaceDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public ModelAndView gotoInsertPage(@RequestParam("spaceNum") int spaceNum) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewPage);
		mav.addObject("spaceNum", spaceNum);
		return mav;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public ModelAndView insertDetailSpace(@Valid DetailSpaceBean detailSpaceBean,
			BindingResult result) {
		ModelAndView mav = new ModelAndView();
		if(result.hasErrors()) {
			System.out.println("Has Error");
			mav.setViewName(viewPage);
			mav.addObject("spaceNum", detailSpaceBean.getSpacenum());
			return mav;
		}
		mav.setViewName(gotoPage);
		return mav;
	}
}
