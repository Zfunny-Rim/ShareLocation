package space.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import space.model.SpaceBean;
import space.model.SpaceDao;
import utility.Paging;

@Controller
public class spaceListCmd {

	private final String command = "/list.sp";	
	private final String getPage = "spaceList";	
		
	@Autowired
	SpaceDao spaceDao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public ModelAndView doAction(ModelAndView mav,
			@RequestParam(value ="keyword",required = false) String keyword,
			@RequestParam(value ="pageNumber",required = false) String pageNumber,
			HttpServletRequest request
						) {

		if(keyword==null) {
			keyword = "";
		}
		keyword = "%"+keyword+"%";
		
		int totalCount = spaceDao.getTotalCount(keyword);
		String url = request.getContextPath() + command;
		System.out.println("url 확인해보자"+url);
		
		Paging pageInfo = new Paging(pageNumber, null, totalCount, url, null, keyword, null);
		
		System.out.println(keyword);
		List<SpaceBean> spaceLists = spaceDao.getSpaceList(pageInfo,keyword);
		System.out.println("spaceLists"+spaceLists.size());
		mav.addObject("spaceLists",spaceLists);
		mav.setViewName(getPage);
		mav.addObject("pageInfo",pageInfo);
		return mav;
	}
	
	
}