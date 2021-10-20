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
public class QnaBoardReplyCmd {
	private final String command = "/reply.qnaBoard";
	private final String getPage = "qnaBoardReply";
	private final String goToPage = "redirect:/list.qnaBoard";
	
	@Autowired
	QnaBoardDao qdao;
	
	@RequestMapping(command)
	public ModelAndView doAction(
			ModelAndView mav,
			@RequestParam("num")int num,
			@RequestParam("pageNumber")int pageNumber
			) {
		QnaBoardBean list = qdao.getOne(num);
		int ref = list.getRef();
		int restep = list.getRestep();
		int relevel = list.getRelevel();
		mav.setViewName(getPage);
		mav.addObject("originArticle", list);
		mav.addObject("ref", ref);
		mav.addObject("restep", restep);
		mav.addObject("relevel", relevel);
		mav.addObject("pageNumber", pageNumber);
		return mav;
	}
	@RequestMapping(value=command, method=RequestMethod.POST)
	public ModelAndView doAction(
			@RequestParam("pageNumber")int pageNumber,
			QnaBoardBean list,
			ModelAndView mav
			) {
		qdao.updateRestep(list);
		qdao.insertReply(list);
		mav.setViewName(goToPage);
		mav.addObject("pageNumber", pageNumber);
		return mav;
	}
}
