package space.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
			@RequestParam(value ="whatColumn",required = false) String whatColumn,
			@RequestParam(value ="keyword",required = false) String keyword,
			@RequestParam(value ="area",required = false) String area,
			@RequestParam(value ="pageNumber",required = false) String pageNumber,
			HttpServletRequest request
						) {
		if(keyword==null) {
			keyword = "";
		}
		if(area==null) {
			area = "";
		}		
		Map<String, String> map = new HashMap<String, String>();
		map.put("whatColumn", whatColumn); // whatColumn=area,null
		map.put("area", "%"+area+"%");
		map.put("keyword", "%"+keyword+"%");
		map.put("status", "%운영중%");
		
		int totalCount = spaceDao.getTotalCount(map);
		String url = request.getContextPath() + command;
		System.out.println("url 확인해보자"+url);
		
		Paging pageInfo = new Paging(pageNumber, null, totalCount, url, whatColumn, keyword, null);
		keyword += "%"+keyword+"%";    
		System.out.println(keyword);
		List<SpaceBean> spaceLists = spaceDao.getSpaceList(pageInfo,map);
		System.out.println("spaceLists"+spaceLists.size());
		
		List<SpaceBean> powerLink = spaceDao.getPowerSpaceList(map);
		System.out.println("powerLink"+powerLink.size());
		
		mav.addObject("powerLink",powerLink);
		mav.addObject("spaceLists",spaceLists);
		mav.setViewName(getPage);
		mav.addObject("pageInfo",pageInfo);
		return mav;
	}
	
	
}