package member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import member.model.MemberDao;
import utility.Paging;

@Controller
public class MemberListCmd {
	private final String command = "/list.mem";
	private final String getPage= "memberList";
	
	
	@Autowired
	private MemberDao memberDao;
	
	@RequestMapping(value= command, method=RequestMethod.GET)
	public ModelAndView goAction(@RequestParam(value ="whatColumn",required = false) String whatColumn,
			@RequestParam(value ="keyword",required = false) String keyword,
			@RequestParam(value ="pageNumber",required = false) String pageNumber,
			HttpServletRequest request
			) {
		System.out.println(this.getClass());
		Map<String, String> map = new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		
		int totalCount = memberDao.getTotalCount(map);
		String url = request.getContextPath() + command;
		System.out.println("url 확인해보자"+url);
		
		Paging pageInfo = new Paging(pageNumber, null, totalCount, url, whatColumn, keyword, null);
		
		List<MemberBean> lists= memberDao.getMemberList(pageInfo, map);  
		System.out.println(lists.size());
		ModelAndView mav= new ModelAndView();
		mav.addObject("lists",lists);
		mav.addObject("pageInfo",pageInfo);
		mav.setViewName(getPage);
		return mav;
	}
	
	
}
