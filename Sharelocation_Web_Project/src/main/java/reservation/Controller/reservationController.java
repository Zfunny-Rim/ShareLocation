package reservation.Controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import reservation.model.ReservationBean;
import reservation.model.ReservationDao;
import space.model.SpaceBean;
import space.model.SpaceDao;


@Controller
public class reservationController {
	
	private final String command="/reserv.rv";
	private final String getPage="reservation";
	
	@Autowired
	ReservationDao reservationDao;
	
	
	@RequestMapping(value=command)
	public String reservation(HttpServletRequest request,
			@RequestParam(value="spaceNum") int spaceNum,
			@RequestParam(value="memberNum") int memberNum,
			HttpSession session ) {
		
		//�α��� ���ߴٸ�
		if(session.getAttribute("loginInfo")==null) { 
			session.setAttribute("destination", "redirect:/reserv.rv");
			return "redirect:/loginForm.me";
		}
		//�α��� ������
		else {
			//spaceNum�� �޾Ƽ� bean ����
			//ȣ��Ʈ�������������� ȣ��ƮmemberNum�� bean���� ����
			ReservationBean reservation = reservationDao.getReserv(spaceNum);  		
			request.setAttribute("reservation",reservation);			
			return getPage;
		}
	}	
}
