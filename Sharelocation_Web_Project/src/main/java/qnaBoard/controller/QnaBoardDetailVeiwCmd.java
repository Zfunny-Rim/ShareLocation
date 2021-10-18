package qnaBoard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import qnaBoard.model.QnaBoardBean;
import qnaBoard.model.QnaBoardDao;

@Controller
public class QnaBoardDetailVeiwCmd {
	private final String command = "/detailView.qnaBoard";
	private final String getPage = "qnaBoardDetailView";
	
	@Autowired
	QnaBoardDao qdao;
	
	@RequestMapping(command)
	public ModelAndView doAction(
			ModelAndView mav,
			@RequestParam("num")int num,
			@RequestParam("pageNumber")int pageNumber
			) {
		qdao.addReadCount(num);
		QnaBoardBean list = qdao.getOne(num);
		mav.addObject("list",list);
		mav.addObject("pageNumber",pageNumber);
		mav.setViewName(getPage);
		return mav;
	}
	
}
