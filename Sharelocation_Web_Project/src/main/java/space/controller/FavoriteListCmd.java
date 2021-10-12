package space.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import space.model.SpaceDao;

@Controller
public class FavoriteListCmd {

	private final String command = "/favoriteList.sp";
	private final String getPage = "favoriteList";
	
	
	@Autowired
	SpaceDao spaceDao;
	
	@RequestMapping(value= command)
	public ModelAndView doAction( ModelAndView mav) {
		System.out.println("FavoriteListCmd");
		
		mav.setViewName(getPage);	
		
		
		
		
		
		
		
		return mav;
	}
	
	
	
}
