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
	private final String getPage = "redirect:/detailView.sp";
	private boolean flag = false;
	
	@Autowired
	SpaceDao spaceDao;
	
	@RequestMapping(value= command)
	public String doAction(@RequestParam(value = "spaceNum") int spaceNum,
			@RequestParam(value = "memberNum") int memberNum, 
			FavoriteBean bean, HttpServletResponse response
			) throws IOException {
		System.out.println("spaceDetailView");
		
		bean.setMembernum(memberNum); 
		bean.setSpacenum(spaceNum);
		
		if(flag == true) {
			
			int cnt = spaceDao.delFavorite(bean);
			flag = false;
			if(cnt != 0) {
			System.out.println(" 좋아요삭제성공");
			/* 찜하기 메세지 설정 */
			/*
			 * pw.println("<script>alert('찜하기 해제 되었습니다');</script>"); pw.flush(); // 화면 출력
			 * 부분
			 */			}
		}
		else {	
		
			int cnt = spaceDao.addFavorite(bean);
			flag = true;
			if(cnt != 0) {
				System.out.println(" 좋아요입력성공");
				/* 찜하기 메세지 설정 */
				/*
				 * pw.println("<script>alert('찜하기 설정 되었습니다');</script>"); pw.flush(); // 화면 출력
				 * 부분
				 */			}
		}

		return getPage+"?num="+spaceNum;
	}
}
