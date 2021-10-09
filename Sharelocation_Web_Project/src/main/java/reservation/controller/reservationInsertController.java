package reservation.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
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
public class reservationInsertController {

	private final String command="/reservInsert.rv";
	private final String getPage="reservationConfirmation";
	private final String gotoPage = "redirect:/reserv.rv";
	
	
	@Autowired
	ReservationDao reservationDao;
	
	@Autowired
	SpaceDao spaceDao;
	
	@Autowired
	DetailSpaceDao detailSpaceDao;
	
	
	@RequestMapping(value=command)
	public ModelAndView reservationInsert(
			@RequestParam(value = "spacenum",required=false) int spacenum,
			@RequestParam(value = "detailspacenum",required=false) int detailspacenum,
			@Valid ReservationBean reservationbean,BindingResult result,
			ModelAndView mav
			) {
		//set member session��û
		reservationbean.setMembernum(1); 
		reservationbean.setSpacenum(spacenum);
		reservationbean.setDetailspacenum(detailspacenum);
		reservationbean.setStatus("����Ȯ��");//�ӽ�
		reservationbean.setApplicationdate("2021-10-20"); //�ӽ�
		reservationbean.setPerson(2); //�ӽ�
		reservationbean.setPaymenttype("�������"); //�ӽ�
		
		SpaceBean spacebean = spaceDao.getSpace(spacenum);
		reservationbean.setCheckin(spacebean.getOperatingtime()); //�ӽ�
		reservationbean.setCheckout(spacebean.getOperatingendtime()); //�ӽ�
		
		DetailSpaceBean detailSpacebean = detailSpaceDao.getdetailspace(detailspacenum);
		reservationbean.setAmounts(detailSpacebean.getPrice());
		
		System.out.println("resevationbean InsertController:"+reservationbean);
		if(result.hasErrors()) {
			System.out.println("��ȿ�� �˻� �����Դϴ�.");
			mav.setViewName(gotoPage);
			return mav;
		}
			int cnt=-1;
			cnt = reservationDao.reservInsert(reservationbean);
			if(cnt != -1) {
				System.out.println("���� ����");
			}
			else {
				System.out.println("���� ����");
			}
			
			mav.addObject("spacebean",spacebean);
			mav.addObject("detailSpacebean",detailSpacebean);
			mav.addObject("reservationbean",reservationbean);
			
			mav.setViewName(getPage);
			return mav;
	}
}
