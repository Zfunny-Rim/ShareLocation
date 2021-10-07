package host.space.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import detailspace.model.DetailSpaceBean;
import detailspace.model.DetailSpaceDao;
import space.model.SpaceBean;
import space.model.SpaceDao;

@Controller
public class HostDetailSpaceListController {
	private final String command = "/detailSpaceList.ho";
	private final String viewPage = "hostDetailSpaceList";
	
	@Autowired
	DetailSpaceDao detailSpaceDao;
	
	@RequestMapping(value=command)
	public ModelAndView doAction(@RequestParam("spaceNum") int spaceNum) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewPage);
		
		List<DetailSpaceBean> dspBeanList = detailSpaceDao.getDetailSpaceListBySpaceNum(spaceNum);
		mav.addObject("dspBeanList", dspBeanList);
		mav.addObject("spaceNum", spaceNum);
		return mav;
	}
}
