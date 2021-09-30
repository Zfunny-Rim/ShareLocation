package space.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import space.model.SpaceBean;
import space.model.SpaceDao;

@Controller
public class spaceListCmd {

	private final String command = "/list.sp";	
	private final String getPage = "spaceList";	
	
	@Autowired
	SpaceDao spaceDao;
	
	@RequestMapping(value = command)
	public ModelAndView doAction(ModelAndView mav) {
		
		
		List<SpaceBean> spaceLists = spaceDao.getSpaceList();
		System.out.println("spaceLists ����"+spaceLists.size());
		mav.addObject("spaceLists",spaceLists);
		mav.setViewName(getPage);
		return mav;
	}
	
	
}
