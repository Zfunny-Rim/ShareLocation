package qnaBoard.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
			HttpSession session, HttpServletResponse response
			) throws IOException {
		MemberBean member = (MemberBean)session.getAttribute("loginInfo");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = response.getWriter();
		if(member == null) {
			session.setAttribute("destination", "redirect:"+command);
			pw.println("<script>");
			pw.println("alert('검수가 처리되었습니다.');");
			pw.println("location.href='miniLogin.member';");
			pw.println("</script>");
			pw.flush();
			return null;
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
