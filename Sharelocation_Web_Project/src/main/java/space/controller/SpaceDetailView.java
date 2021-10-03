package space.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import space.model.SpaceBean;
import space.model.SpaceDao;

@Controller
public class SpaceDetailView {

	private final String command = "/detailView.sp";
	private final String getPage = "spaceDetailView";
	
	@Autowired
	SpaceDao spaceDao;
	
	@RequestMapping(value= command)
	public ModelAndView doAction(@RequestParam(value = "num") int num
			,  ModelAndView mav) {
		System.out.println("spaceDetailView");
		
		SpaceBean space = spaceDao.getSpace(num);
<<<<<<< HEAD
		System.out.println("space"+space);
=======
		System.out.println("space È®ÀÎ"+space);
>>>>>>> branch 'Park' of https://github.com/Zfunny-Rim/ShareLocation.git
		

		//List<ReviewBoardBean> review = reviewBoardDao.getReview(num);
		
		
		mav.addObject("space",space);
		//mav.addObject("review", review);
		mav.setViewName(getPage);
		
		return mav;
	}
	
}
