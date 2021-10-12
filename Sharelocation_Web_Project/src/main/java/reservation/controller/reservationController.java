package reservation.controller;


import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import detailspace.model.DetailSpaceBean;
import detailspace.model.DetailSpaceDao;
import member.model.MemberBean;
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
		
	@Autowired
	SpaceDao spaceDao;
	
	@Autowired
	DetailSpaceDao detailSpaceDao;
	
	//@Autowired
	//BalanceDao balanceDao;
	
	@RequestMapping(value=command)
	public ModelAndView reservation(HttpServletRequest request,ModelAndView mav,
			@RequestParam("spacenum") int spacenum,
			@RequestParam("detailspacenum") int detailspacenum,		
			Model model,
			HttpSession session ) throws IOException {
			 
		
		//�α��� ���ߴٸ�
		if(session.getAttribute("loginInfo")==null) { 
						
			model.addAttribute("msg", "�α��� ���ּ���~!");
			model.addAttribute("url", "/sharelocation/#");
			mav.setViewName("redirect");
			return mav;
		}
		//�α��� ������
		else {
			//spaceNum�� �޾Ƽ� bean ����
			//ȣ��Ʈ�������������� ȣ��ƮmemberNum�� bean���� ����
			
			SpaceBean spacebean = spaceDao.getSpace(spacenum);
			
			DetailSpaceBean detailSpacebean = detailSpaceDao.getDetailSpaceByNum(detailspacenum);
			
			ReservationBean reservationbean = new ReservationBean();
			reservationbean.setMembernum(1);
			reservationbean.setSpacenum(spacenum);
			reservationbean.setDetailspacenum(detailspacenum);
			reservationbean.setCheckin(spacebean.getOperatingtime()); //�ӽ�
			reservationbean.setCheckout(spacebean.getOperatingendtime()); //�ӽ�
			reservationbean.setPerson(2);  //�ӽ�
			reservationbean.setAmounts(detailSpacebean.getPrice());
			reservationbean.setApplicationdate("2021-10-20");  //�ӽ�
			 
			System.out.println(reservationbean.toString());
			//BalanceBean balance = balanceDao.getBalance(spacebean.getMembernum());
			//mav.addObject("balance",balance);
			
			mav.addObject("spacebean",spacebean);
			mav.addObject("detailSpacebean",detailSpacebean);
			mav.addObject("reservationbean",reservationbean);
			mav.setViewName(getPage);
			return mav;
		}
	}	
}
