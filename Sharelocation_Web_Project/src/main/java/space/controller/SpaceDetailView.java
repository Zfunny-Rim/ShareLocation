package space.controller;


import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import space.model.SpaceBean;
import space.model.SpaceDao;
import space.model.SpaceTagBean;

@Controller
public class SpaceDetailView {

	private final String command = "/detailView.sp";
	private final String getPage = "spaceDetailView";
	
	@Autowired
	SpaceDao spaceDao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value= command)
	public ModelAndView doAction(@RequestParam(value = "num") int num
			,   ModelAndView mav) {
		System.out.println("spaceDetailView");
		
		SpaceBean space = spaceDao.getSpace(num);
		System.out.println("space"+space);


		List<SpaceTagBean> st = spaceDao.getTag(num);
		
		System.out.println("tag실행"+st);
		
		mav.addObject("st",st);
		mav.addObject("space",space);
		
		
		//mav.addObject("review", review);
		mav.setViewName(getPage);
		
		
		return mav;
	}
	
}
