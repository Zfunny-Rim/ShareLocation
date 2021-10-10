package space.controller;


import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import detailspace.model.DetailSpaceBean;
import detailspace.model.DetailSpaceDao;
import reviewBoard.model.ReviewBoardBean;
import reviewBoard.model.ReviewBoardDao;
import space.model.SpaceBean;
import space.model.SpaceDao;
import space.model.SpaceImageBean;

@Controller
public class SpaceDetailView {

	private final String command = "/detailView.sp";
	private final String commandImage = "/spaceImage.sp";
	private final String getPage = "spaceDetailView";
	private final String getImage = "detailImage";

	@Autowired
	SpaceDao spaceDao;
	
	@Autowired
	DetailSpaceDao detailSpaceDao;
	
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	ReviewBoardDao reviewBoardDao;
	
	
	

	@RequestMapping(value= command)
	public ModelAndView doAction(@RequestParam(value = "num") int num,
				@RequestParam(value ="detailspacenum", required = false) String detailspacenum ,
			   ModelAndView mav) {
		System.out.println("spaceDetailView");
		System.out.println("넘어왔냐"+detailspacenum);
 
		SpaceBean space = spaceDao.getSpace(num);
		System.out.println("space"+space);
		mav.addObject("space",space);

		List<SpaceImageBean> spaceimage = spaceDao.getImage(num);

		System.out.println("spaceimage"+spaceimage);

		mav.addObject("spaceimage",spaceimage);

		List<DetailSpaceBean> detailspace = detailSpaceDao.getListDetailSpace(num);
		System.out.println("detailspace"+detailspace);
		mav.addObject("detailspace",detailspace);
		
		
		List<ReviewBoardBean> reviewBoard = reviewBoardDao.getReview(num);
		System.out.println("reviewBoard"+reviewBoard);
		mav.addObject("reviewBoard",reviewBoard);
		
		
		if(detailspacenum != null)
		{
		int num1  =  Integer.parseInt(detailspacenum);  
		 
		DetailSpaceBean detailSpaceBean =  detailSpaceDao.getselectdetailspace(num1);
		System.out.println("detailSpaceBean"+detailSpaceBean);
		mav.addObject("detailSpaceBean",detailSpaceBean);	
		
		}
		mav.setViewName(getPage);
		return mav;
	}

	@RequestMapping(value= commandImage)
	public ModelAndView doActionImage(@RequestParam(value = "spacenum") int spacenum
			,   ModelAndView mav) {
		System.out.println("doActionImage");
		List<SpaceImageBean> spaceimage = spaceDao.getImage(spacenum);
		System.out.println("spaceimage확인"+spaceimage);
		mav.addObject("spaceimage",spaceimage);
		mav.setViewName(getImage);

		return mav;
	}
	
	

}

