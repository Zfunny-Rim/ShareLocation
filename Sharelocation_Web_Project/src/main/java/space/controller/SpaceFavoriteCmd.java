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
			System.out.println(" ���ƿ��������");
			/* ���ϱ� �޼��� ���� */
			/*
			 * pw.println("<script>alert('���ϱ� ���� �Ǿ����ϴ�');</script>"); pw.flush(); // ȭ�� ���
			 * �κ�
			 */			}
		}
		else {	
		
			int cnt = spaceDao.addFavorite(bean);
			flag = true;
			if(cnt != 0) {
				System.out.println(" ���ƿ��Է¼���");
				/* ���ϱ� �޼��� ���� */
				/*
				 * pw.println("<script>alert('���ϱ� ���� �Ǿ����ϴ�');</script>"); pw.flush(); // ȭ�� ���
				 * �κ�
				 */			}
		}

		return getPage+"?num="+spaceNum;
	}
}
