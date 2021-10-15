package admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
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
	public ModelAndView goMain() throws JsonGenerationException, JsonMappingException, IOException {
		ModelAndView mav = new ModelAndView(viewPage);
		int totalMemberCount = memberDao.getAllMemberCount();
		int hostMemberCount = memberDao.getHostMemberCount();
		int totalSpaceCount = spaceDao.getAllSpaceCount();
		int completeReservationCount = reservationDao.getCompleteReservationCount();
		//가장 인기있는 공간분류
		TypeRankingBean trBean = reservationDao.getTypeRankingBest();
		//월별 예약회수
		String[] monthWord = {"1월","2월","3월","4월","5월","6월",
				"7월","8월","9월","10월","11월","12월"};
		Map<String, Integer> monthlyCountMap = new HashMap<String, Integer>();
		for(int i=0;i<monthWord.length;i++) {
			String monthStr = "2021-"+String.format("%02d", (i+1));
			int mCount = reservationDao.getReservtionCountByMonth(monthStr);
			if(mCount <= 0) {
				monthlyCountMap.put(monthWord[i], 0);
			}else {
				monthlyCountMap.put(monthWord[i], mCount);
			}
		}
		ObjectMapper mapper = new ObjectMapper();
		String monthlyJson = mapper.writeValueAsString(monthlyCountMap);
		//요일별 예약횟수
		List<DayOfWeekCountBean> dayOfWeekCountList = reservationDao.getDayOfWeekCount();
		String[] dowWord = {"월", "화", "수", "목", "금", "토", "일"};
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
		mapper = new ObjectMapper();
		String dowJson = mapper.writeValueAsString(dowMap);
		mav.addObject("totalMemberCount", totalMemberCount);
		mav.addObject("hostMemberCount", hostMemberCount);
		mav.addObject("totalSpaceCount", totalSpaceCount);
		mav.addObject("completeReservationCount", completeReservationCount);
		mav.addObject("dowJson", dowJson);
		mav.addObject("monthlyJson", monthlyJson);
		mav.addObject("trBean", trBean);
		
		return mav;
	}
}