package space.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import space.model.SpaceDao;
import space.model.FavoriteBean;

@Controller
public class SpaceFavoriteCmd {

	private final String command = "/favorite.sp";
	private final String getPage = "/detailView.sp";
	private boolean flag = false;

	@Autowired
	SpaceDao spaceDao;

	@RequestMapping(value= command)
	public ModelAndView doAction(@RequestParam(value = "spacenum") int spacenum,
			@RequestParam(value = "membernum") int membernum, 
			FavoriteBean bean, HttpServletResponse response,
			ModelAndView mav
			) throws IOException {
		System.out.println("spaceDetailView");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = response.getWriter();	
		bean.setMembernum(membernum); 
		bean.setSpacenum(spacenum);

		if(flag == true) {

			int cnt = spaceDao.delFavorite(bean);
			flag = false;
			if(cnt != 0) {
				System.out.println(" 좋아요삭제성공");
				pw.println("<script>");
				pw.println("alert('좋아요 해제 되었습니다');");
				pw.println("location.href='detailView.sp?num="+spacenum+"&membernum="+membernum+"';");
				pw.println("</script>");
				return null;
			}
		}
		else {	

			int cnt = spaceDao.addFavorite(bean);
			flag = true;
			if(cnt != 0) {
				System.out.println(" 좋아요입력성공");
				pw.println("<script>");
				pw.println("alert('좋아요 설정 되었습니다');");
				pw.println("location.href='detailView.sp?num="+spacenum+"&membernum="+membernum+"';");
				pw.println("</script>");
				return null;
			}
		}

		mav.setViewName(getPage);	
		return mav;
	}
}