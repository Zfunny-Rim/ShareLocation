package admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberDao;
import reservation.model.DayOfWeekCountBean;
import reservation.model.ReservationDao;
import reservation.model.TypeRankingBean;
import space.model.SpaceDao;

@Controller
public class AdminMainController {
	private final String command = "main.admin";
	private final String viewPage = "main";
	@Autowired
	MemberDao memberDao;
	@Autowired
	SpaceDao spaceDao;
	@Autowired
	ReservationDao reservationDao;
	@RequestMapping(value=command)
	public ModelAndView goMain() {
		ModelAndView mav = new ModelAndView(viewPage);
		int totalMemberCount = memberDao.getAllMemberCount();
		int hostMemberCount = memberDao.getHostMemberCount();
		int totalSpaceCount = spaceDao.getAllSpaceCount();
		int completeReservationCount = reservationDao.getCompleteReservationCount();
		TypeRankingBean trBean = reservationDao.getTypeRankingBest();
		List<DayOfWeekCountBean> dayOfWeekCountList = reservationDao.getDayOfWeekCount();
		String[] dowWord = {"일", "월", "화", "수", "목", "금", "토"};
		Map<String, Integer> dowMap = new HashMap<String, Integer>();
		boolean isFind = false;
		for(String dowStr:dowWord) {
			isFind = false;
			for(DayOfWeekCountBean dowBean:dayOfWeekCountList) {
				if(dowBean.getDayofweek().equals(dowStr)) {
					dowMap.put(dowStr, dowBean.getCount());
					isFind = true;
					break;
				}
			}
			if(!isFind) {
				dowMap.put(dowStr, 0);
			}
		}
		
		mav.addObject("totalMemberCount", totalMemberCount);
		mav.addObject("hostMemberCount", hostMemberCount);
		mav.addObject("totalSpaceCount", totalSpaceCount);
		mav.addObject("completeReservationCount", completeReservationCount);
		mav.addObject("dowMap", dowMap);
		mav.addObject("trBean", trBean);
		
		return mav;
	}
}
