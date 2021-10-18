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
public class QnaBoardUpdateCmd {
	private final String command = "/update.qnaBoard";
	private final String getPage = "qnaBoardUpdate";
	private final String goToPage = "redirect:/list.qnaBoard";
	
	@Autowired
	QnaBoardDao qdao;
	@RequestMapping(command)
	public ModelAndView doAction(
			ModelAndView mav,
			@RequestParam("pageNumber") int pageNumber,
			@RequestParam("num") int num
			) {
		QnaBoardBean list = qdao.getOne(num);
		mav.addObject("list",list);
		mav.addObject("pageNumber",pageNumber);
		mav.setViewName(getPage);
		return mav;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public ModelAndView doAction(
			ModelAndView mav,
			QnaBoardBean list,
			@RequestParam("pageNumber")int pageNumber
			) {
		qdao.update(list);
		mav.addObject("pageNumber", pageNumber);
		mav.addObject("num", list.getNum());
		mav.setViewName(goToPage);
		return mav;
	}
}
