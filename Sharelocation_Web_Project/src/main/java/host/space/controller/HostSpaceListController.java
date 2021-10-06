package host.space.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import space.model.SpaceBean;
import space.model.SpaceDao;

@Controller
public class HostSpaceListController {
	public final String command = "/spaceList.ho";
	public final String viewPage = "hostSpaceList";
	
	@Autowired
	SpaceDao spaceDao;
	
	@RequestMapping(value=command)
	public ModelAndView gotoList() {
		ModelAndView mav = new ModelAndView(viewPage);
		List<SpaceBean> spaceList = spaceDao.getSpaceListByMemberNum(1);
		mav.addObject("spList", spaceList);
		return mav;
	}
}
