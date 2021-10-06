package space.controller;


import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import reviewBoard.model.ReviewBoardBean;
import space.model.SpaceBean;
import space.model.SpaceDao;
import space.model.SpaceImageBean;
import space.model.SpaceTagBean;

@Controller
public class SpaceDetailView {

	private final String command = "/detailView.sp";
	private final String commandImage = "/spaceImage.sp";
	private final String getPage = "spaceDetailView";
	private final String getImage = "detailImage";

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


		List<SpaceTagBean> spacetag = spaceDao.getTag(num);
		List<SpaceImageBean> spaceimage = spaceDao.getImage(num);

		System.out.println("tag실행"+spacetag);
		System.out.println("spaceimage실행"+spaceimage);

		if(spacetag.size()!=0) {
			mav.addObject("spacetag",spacetag);
		}
		mav.addObject("space",space);
		mav.addObject("spaceimage",spaceimage);
		mav.setViewName(getPage);
		
		List<ReviewBoardBean> reviewBoard = spaceDao.getReview(num);
		System.out.println("reviewBoard: " +reviewBoard.size());
		mav.addObject("reviewBoard",reviewBoard);
		
		
		return mav;
	}

	@RequestMapping(value= commandImage)
	public ModelAndView doActionImage(@RequestParam(value = "spacenum") int spacenum
			,   ModelAndView mav) {
		System.out.println("doActionImage");
		List<SpaceImageBean> spaceimage = spaceDao.getImage(spacenum);
		System.out.println("spaceimage실행"+spaceimage);
		mav.addObject("spaceimage",spaceimage);
		mav.setViewName(getImage);

		return mav;
	}
	
	

}
