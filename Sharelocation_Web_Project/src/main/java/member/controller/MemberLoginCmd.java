package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MemberLoginCmd {
	private final String command = "/login.mem";
	private final String goToPage = "list.mem";
	private final String getPage= "indexStart";

	@Autowired
	private MemberDao memberDao;


	@RequestMapping(value= command, method=RequestMethod.POST)
	public ModelAndView goAction(ModelAndView mav, MemberBean member,
			HttpServletResponse response, HttpSession session) throws IOException {

		MemberBean dbMember= memberDao.getData(member.getId());
		System.out.println("MembmerLoginController dbMember:"+dbMember);

		PrintWriter pw = response.getWriter();
		response.setContentType("text/html;charset=UTF-8");//한글로 내보내기
		if(dbMember == null) {
			System.out.println("존재하지 않는 회원");
			//웹 브라우저에 alert띄우기
			pw.println("<script>alert('해당 아이디가 없습니다');</script>");
			pw.flush();//화면에 출력하려면
			mav.setViewName(getPage);
			return mav;
		}
		else {
			System.out.println("존재하는 회원");
			if(member.getPassword().equals(dbMember.getPassword())) {//비번이 같다면=>로그인
				session.setAttribute("loginInfo", dbMember);

				mav.setViewName(goToPage);
				return mav;
			}
			else {//비번이 같지 않다면
				pw.println("<script>alert('해당 비번이 없습니다');</script>");
				pw.flush();
				mav.setViewName(getPage);
				return mav;
			}
		}
	}
}

