package space.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import member.model.MemberDao;
import space.model.FavoriteBean;
import space.model.SpaceBean;
import space.model.SpaceDao;

@Controller
public class SpaceFavoriteListCmd {

	private final String command = "/favoriteList.sp";
	private final String getPage = "favoriteList";
	
	
	@Autowired
	SpaceDao spaceDao;	
	@Autowired
	MemberDao memberDao;
	
	
	@RequestMapping(value= command)
	public ModelAndView doAction( ModelAndView mav,
			HttpSession session
			) {
		System.out.println("FavoriteListCmd");
		System.out.println(session.getAttribute("loginInfo"));
				
		
		
			
		System.out.println("3");
		
		MemberBean mb = (MemberBean)session.getAttribute("loginInfo");
		
		System.out.println("±Ê¿Ã"+ mb.getAddress());
		System.out.println("»Æü›:"+mb.getId());
		
		MemberBean member = memberDao.getData(mb.getId());
		
		List<FavoriteBean> favoriteBean  = spaceDao.getFavoriteList(mb.getNum());
		List<SpaceBean> favoriteResult = new ArrayList<SpaceBean>();
		for(FavoriteBean i: favoriteBean) {
			
			SpaceBean bean= spaceDao.getSpace(i.getSpacenum());
			favoriteResult.add(bean);
		}
		
		mav.addObject("favoriteResult",favoriteResult);	
		mav.addObject("favoriteBean",favoriteBean);	
		System.out.println(favoriteBean.size());
	
		
		mav.setViewName(getPage);	
		return mav;
	}
	
	
	
}
