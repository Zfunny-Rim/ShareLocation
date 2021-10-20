package space.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import space.model.SpaceBean;
import space.model.SpaceDao;

@Controller
public class spaceMainContorller {
	private final String command = "main.sp";
	private final String getPage = "index";
	
	@Autowired
	SpaceDao spaceDao;
	@RequestMapping(value=command)
	public ModelAndView goMain() {
		ModelAndView mav = new ModelAndView(getPage);
		int listCount = 3;
		List<SpaceBean> spaceList = spaceDao.getRecentSpaceList(listCount);
		mav.addObject("spaceList", spaceList);
		return mav;
	}
}
