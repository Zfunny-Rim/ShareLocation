package noticeBoard.controller;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import noticeBoard.model.NoticeBoardBean;
import noticeBoard.model.NoticeBoardDao;
import utility.Paging;


@Controller
public class NoticeBoardListCmd {

	private final String command = "/noticeBoardList.nb";
	private final String getPage = "noticeBoardList";

	@Autowired
	
	NoticeBoardDao noticeBoardDao;
	
	
	@RequestMapping(value= command)
	public ModelAndView doAction( ModelAndView mav,
			HttpSession session, HttpServletResponse response,
			HttpServletRequest request,
			@RequestParam(value ="whatColumn",required = false) String whatColumn,
			@RequestParam(value ="keyword",required = false) String keyword,
			@RequestParam(value ="num",required = false) String num,
			@RequestParam(value ="num",required = false) String spacenum,
			@RequestParam(value ="pagenumber",required = false) String pagenumber
			)  {
		
		if(pagenumber == null) {
			pagenumber = "1";
		}
		System.out.println("NoticeBoardListCmd");
		
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		if(loginInfo != null) {
			mav.addObject("id",loginInfo.getId());
		}
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("whatColumn", whatColumn); // whatColumn=area,null
		map.put("keyword",("%"+keyword+"%") );
		
		int totalCount = noticeBoardDao.getTotalCount(map);
		String url = request.getContextPath() + command;
		Paging pageInfo = new Paging(pagenumber, "5", totalCount, url,  whatColumn, keyword, null);
		List<NoticeBoardBean> noticeBoard = noticeBoardDao.getNoticeBoardList(pageInfo, map); 
		
		mav.addObject("noticeBoard",noticeBoard);
		mav.addObject("pageInfo",pageInfo);
		mav.addObject("totalCount", totalCount);
		mav.addObject("pagenumber", pagenumber);
		mav.addObject("spacenum",spacenum);
		mav.setViewName(getPage);
		return mav;
	}

}