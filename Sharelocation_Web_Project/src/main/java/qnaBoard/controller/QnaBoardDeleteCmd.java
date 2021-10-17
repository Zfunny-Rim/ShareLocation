package qnaBoard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import qnaBoard.model.QnaBoardDao;

@Controller
public class QnaBoardDeleteCmd {
	private final String command = "/delete.qnaBoard";
	private final String goToPage = "redirect:/list.qnaBoard";
	
	@Autowired
	QnaBoardDao qdao;
	
	@RequestMapping(command)
	public ModelAndView doAction(
			ModelAndView mav,
			@RequestParam("pageNumber") int pageNumber,
			@RequestParam("num") int num
			) {
		qdao.delete(num);
		mav.addObject("pageNumber",pageNumber);
		mav.setViewName(goToPage);
		return mav;
	}
	
}
