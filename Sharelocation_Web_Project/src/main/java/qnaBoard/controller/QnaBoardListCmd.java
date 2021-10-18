package qnaBoard.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import qnaBoard.model.QnaBoardBean;
import qnaBoard.model.QnaBoardDao;
import utility.Paging;

@Controller
public class QnaBoardListCmd {
	private final String command = "/list.qnaBoard";
	private final String goToPage = "qnaBoardList";
	
	@Autowired
	QnaBoardDao qdao;
	
	@RequestMapping(command)
	public ModelAndView doAction(ModelAndView mav,
			HttpServletRequest request,
			@RequestParam(value="pagenumber", required=false)String pagenumber,
			@RequestParam(value="whatColumn", required=false)String whatColumn,
			@RequestParam(value="keyword", required=false)String keyword,
	        @RequestParam(value ="num",required = false) String spacenum
			) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		String pageSize = "5";
		String url = request.getContextPath()+command;  
		
		int totalCount = qdao.getTotalCount(map);
		Paging pageInfo = new Paging(pagenumber, pageSize, totalCount, url, whatColumn, keyword, null);
		
		List<QnaBoardBean> list = qdao.getList(map, pageInfo);
		mav.addObject("pageInfo", pageInfo);
		mav.addObject("totalCount", totalCount);
		mav.addObject("pagenumber", pagenumber);
		mav.addObject("spacenum", spacenum);
		mav.addObject("list", list);
		mav.setViewName(goToPage);
		return mav;
	}
	
}
