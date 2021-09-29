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
		response.setContentType("text/html;charset=UTF-8");//�ѱ۷� ��������
		if(dbMember == null) {
			System.out.println("�������� �ʴ� ȸ��");
			//�� �������� alert����
			pw.println("<script>alert('�ش� ���̵� �����ϴ�');</script>");
			pw.flush();//ȭ�鿡 ����Ϸ���
			mav.setViewName(getPage);
			return mav;
		}
		else {
			System.out.println("�����ϴ� ȸ��");
			if(member.getPassword().equals(dbMember.getPassword())) {//����� ���ٸ�=>�α���
				session.setAttribute("loginInfo", dbMember);

				mav.setViewName(goToPage);
				return mav;
			}
			else {//����� ���� �ʴٸ�
				pw.println("<script>alert('�ش� ����� �����ϴ�');</script>");
				pw.flush();
				mav.setViewName(getPage);
				return mav;
			}
		}
	}
}

