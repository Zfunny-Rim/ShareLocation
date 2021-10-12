package host.space.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import detailspace.model.DetailSpaceDao;
import member.model.MemberBean;
import space.model.SpaceBean;
import space.model.SpaceDao;

@Controller
public class HostSpaceListController {
	public final String command = "/spaceList.ho";
	public final String viewPage = "hostSpaceList";
	
	@Autowired
	SpaceDao spaceDao;
	@Autowired
	DetailSpaceDao detailSpaceDao;
	
	@RequestMapping(value=command)
	public ModelAndView gotoList(HttpSession session, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		if(loginInfo == null) {
			pw.println("<script>");
			pw.println("alert('로그인이 필요한 서비스입니다.');");
			pw.println("location.href='main.ho'");
			pw.println("</script>");
			return null;
		}else if(!loginInfo.getType().equals("host")) {
			pw.println("<script>");
			pw.println("alert('호스트만 이용가능한 서비스입니다.');");
			pw.println("location.href='main.ho'");
			pw.println("</script>");
			return null;
		}
		ModelAndView mav = new ModelAndView(viewPage);
		List<SpaceBean> spaceList = spaceDao.getSpaceListByMemberNum(loginInfo.getNum());
		Map<Integer, Integer> dspCountMap = new HashMap<Integer, Integer>();
		for(SpaceBean spBean:spaceList) {
			dspCountMap.put(spBean.getNum(), detailSpaceDao.getDetailSpaceCountBySpaceNum(spBean.getNum()));
		}
		mav.addObject("spList", spaceList);
		mav.addObject("dspCountMap", dspCountMap);
		return mav;
	}
}
