package qnaBoard.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import qnaBoard.model.QnaBoardBean;
import qnaBoard.model.QnaBoardDao;

@Controller
public class QnaBoardInsertCmd {
	private final String command = "/insert.qnaBoard";
	private final String getPage = "qnaBoardInsert";
	private final String miniLogin = "redirect:/miniLogin.member";
	private final String goToPage = "redirect:/list.qnaBoard";
	
	@Autowired
	QnaBoardDao qdao;
	
	@RequestMapping(command)
	public String doAction(
			HttpSession session
			) {
		MemberBean member = (MemberBean)session.getAttribute("loginInfo");
		if(member == null) {
			session.setAttribute("destination", "redirect:"+command);
			return miniLogin;  
		}
		return getPage;
	}
	
	@RequestMapping(value = command,method = RequestMethod.POST)
	public String doAcrion(
			QnaBoardBean qna,
			HttpSession session
			) {
		session.removeAttribute("destination");
		qdao.insert(qna);
		return goToPage;
	}
	
	
}
