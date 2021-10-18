package qnaBoard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import qnaBoard.model.QnaBoardBean;
import qnaBoard.model.QnaBoardDao;

@Controller
public class QnaBoardInsertCmd {
	private final String command = "/insert.qnaBoard";
	private final String getPage = "qnaBoardInsert";
	private final String goToPage = "redirect:/list.qnaBoard";
	
	@Autowired
	QnaBoardDao qdao;
	
	@RequestMapping(command)
	public String doAction() {
		return getPage;
	}
	
	@RequestMapping(value = command,method = RequestMethod.POST)
	public String doAcrion(
			QnaBoardBean qna
			) {
		qdao.insert(qna);
		return goToPage;
	}
	
}
