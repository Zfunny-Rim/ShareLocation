package admin.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberDao;
import space.model.SpaceBean;
import space.model.SpaceDao;
import utility.Paging;

@Controller
public class AdminSpaceListController {
	private final String command = "spaceList.admin";
	private final String viewPage = "spaceList";
	@Autowired
	SpaceDao spaceDao;
	@Autowired
	MemberDao memberDao;
	@RequestMapping(value=command)
	public ModelAndView goList(HttpServletRequest request,
			@RequestParam(value="pageNumber", required=false)String pageNumber) {
		ModelAndView mav = new ModelAndView(viewPage);
		if(pageNumber == null)
			pageNumber = "1";
		String url = request.getContextPath()+"/"+command;
		int totalCount = spaceDao.getAllSpaceCount();
		Paging pageInfo = new Paging(pageNumber,"1", totalCount, url, null, null, null);
		List<SpaceBean> spaceList = spaceDao.getAllSpaceList(pageInfo);
		for(SpaceBean sBean:spaceList) {
			String mNick = memberDao.getMemberNickNameByNum(sBean.getMembernum());
			sBean.setMnickname(mNick);
		}
		mav.addObject("spaceList", spaceList);
		mav.addObject("pageInfo", pageInfo);
		return mav;
		
	}
}
