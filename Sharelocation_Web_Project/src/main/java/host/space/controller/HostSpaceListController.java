package host.space.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import detailspace.model.DetailSpaceDao;
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
	public ModelAndView gotoList() {
		ModelAndView mav = new ModelAndView(viewPage);
		List<SpaceBean> spaceList = spaceDao.getSpaceListByMemberNum(1);
		Map<Integer, Integer> dspCountMap = new HashMap<Integer, Integer>();
		for(SpaceBean spBean:spaceList) {
			dspCountMap.put(spBean.getNum(), detailSpaceDao.getDetailSpaceCountBySpaceNum(spBean.getNum()));
		}
		mav.addObject("spList", spaceList);
		mav.addObject("dspCountMap", dspCountMap);
		return mav;
	}
}
