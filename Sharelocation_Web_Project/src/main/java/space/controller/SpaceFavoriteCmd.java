package space.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import space.model.SpaceDao;
import space.model.FavoriteBean;

@Controller
public class SpaceFavoriteCmd {

	private final String command = "/favorite.sp";
	private final String getPage = "redirect:/detailView.sp";

	@Autowired
	SpaceDao spaceDao;

	@RequestMapping(value= command)
	public ModelAndView doAction(@RequestParam(value = "spacenum") int spacenum,
			HttpServletResponse response, HttpSession session,
			ModelAndView mav
			) throws IOException {
		System.out.println("spaceDetailView");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = response.getWriter();	
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		if(loginInfo == null) {
			pw.println("<script>");
			pw.println("alert('로그인이 필요한 서비스입니다.');");
			pw.println("location.href='miniLogin.member';");
			pw.println("</script>");
			return null;
		}
		int cnt = -1;
		FavoriteBean fBean = new FavoriteBean();
		fBean.setMembernum(loginInfo.getNum());
		fBean.setSpacenum(spacenum);
		
		FavoriteBean favoriteBean = spaceDao.getFavoriteBySpaceNumAndMemberNum(fBean);
		if(favoriteBean == null) {
			cnt = spaceDao.addFavorite(fBean);
			if(cnt != -1) {
				System.out.println(" 좋아요입력성공");
				pw.println("<script>");
				pw.println("alert('좋아요가 설정 되었습니다');");
				pw.println("location.href='detailView.sp?num="+spacenum+"';");
				pw.println("</script>");
				return null;
			}
		}else {
			cnt = spaceDao.delFavorite(favoriteBean);
			if(cnt != -1) {
				System.out.println(" 좋아요삭제성공");
				pw.println("<script>");
				pw.println("alert('좋아요가 해제 되었습니다');");
				pw.println("location.href='detailView.sp?num="+spacenum+"';");
				pw.println("</script>");
				return null;
			}
		}
		mav.setViewName(getPage);	
		mav.addObject("num", spacenum);
		return mav;
	}
}