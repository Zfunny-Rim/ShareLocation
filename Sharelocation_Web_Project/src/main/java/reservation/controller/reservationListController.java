package reservation.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import reservation.model.ReservationBean;
import reservation.model.ReservationDao;
import space.model.SpaceBean;
import space.model.SpaceDao;
import utility.Paging;

@Controller
public class reservationListController {

	private final String command="/reservList.rv";
	private final String getPage="reservationList";
	
	@Autowired
	ReservationDao reservationDao;
	
	@Autowired
	SpaceDao spaceDao;
	
	@RequestMapping(value=command,method = RequestMethod.GET)
	public ModelAndView doAction(
			@RequestParam(value = "pageNumber",required=false) String pageNumber,
			@RequestParam(value="whatColumn", required =false) String whatColumn,
			@RequestParam(value="keyword", required =false) String keyword,
			Model model,ModelAndView mav,HttpSession session,ReservationBean reservationbean,
			HttpServletRequest request
			) {
		
		reservationbean.setSpacenum(4); // 임시
		
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		//로그인 안했다면
		if(session.getAttribute("loginInfo")==null) { 

			model.addAttribute("msg", "로그인 해주세요~!");
			model.addAttribute("url", "/sharelocation/#");
			mav.setViewName("redirect");
			return mav;
		}
		if(pageNumber == null) {
			pageNumber = "1";
		}
		Map<String, String> map = new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", keyword);
		
		String url = request.getContextPath() + "/" + command;
		int totalCount = reservationDao.getReservationTotalCountByMap(map);
		Paging pageInfo = new Paging(pageNumber, "5", totalCount, url, whatColumn, keyword, null);
		List<ReservationBean> reservationLists = reservationDao.getReservList(loginInfo.getNum(),pageInfo);  //membernum값 1 임시
		System.out.println("reservationbean.List:"+reservationLists.size());
		
		SpaceBean spacebean = spaceDao.getSpace(reservationbean.getSpacenum());
		
		mav.setViewName(getPage);
		mav.addObject("pageInfo",pageInfo);
		mav.addObject("totalCount", totalCount);
		mav.addObject("spacebean",spacebean);
		mav.addObject("reservationLists",reservationLists);
		return mav;
	}
}