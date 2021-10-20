package helpBoard.controller;


import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import helpBoard.model.HelpBoardBean;
import helpBoard.model.HelpBoardDao;
import member.model.MemberBean;
import member.model.MemberDao;
import noticeBoard.model.NoticeBoardBean;
import noticeBoard.model.NoticeBoardDao;

@Controller
public class HelpBoardControllerCmd {



	private final String command = "/detailViewHelpBoard.hb";
	private final String command1 = "/insertHelpBoard.hb";
	private final String cmdDelete = "/deleteHelp.hb";
	private final String cmdUpdate = "/updateHelp.hb";
	private final String getPage = "helpBoardDetailView";
	private final String getToPage = "helpBoardInsert";
	private final String getPageList = "redirect:/helpBoardList.hb";
	private final String getPageUpdate = "helpBoardUpdate";


	@Autowired
	HelpBoardDao helpBoardDao;

	@Autowired
	MemberDao memberDao;


	@RequestMapping(value= command)
	public ModelAndView doAction( ModelAndView mav,
			@RequestParam(value = "num") int num,
			HttpSession session, HttpServletResponse response
			) throws IOException{

		System.out.println("helpBoardListCmd");

		HelpBoardBean hbBean = helpBoardDao.getHelpBoardListbyNum(num); 

		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");

		mav.addObject("hbBean",hbBean);
		if(loginInfo != null) {
			mav.addObject("id",loginInfo.getId());
		}
		mav.setViewName(getPage);
		return mav;
	}
	@RequestMapping(value= command1, method = RequestMethod.GET )
	public ModelAndView doActionGet(ModelAndView mav, HttpSession session) {

		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");

		if(loginInfo != null) {
			mav.addObject("id",loginInfo.getId());
			mav.addObject("membernum",loginInfo.getNum());
		}

		mav.setViewName(getToPage);
		return mav;
	}
	@RequestMapping(value= command1, method = RequestMethod.POST)
	public ModelAndView doActionPost(@Valid HelpBoardBean helpBoardBean,BindingResult result, ModelAndView mav, HttpSession session

			) {

		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");

		if(loginInfo != null) {
			mav.addObject("id",loginInfo.getId());
			mav.addObject("membernum",loginInfo.getNum());
		}
		System.out.println(helpBoardBean);
		if(result.hasErrors()) {
			mav.setViewName(getToPage);
			return mav;	
		}

		int cnt = helpBoardDao.insertData(helpBoardBean);
		if(cnt!=0) {
			System.out.println("삽입성공");
			mav.setViewName(getPageList);
		}
		return mav;

	}
	@RequestMapping(value= cmdDelete, method = RequestMethod.GET)
	public ModelAndView doAction(ModelAndView mav,
			@RequestParam(value ="num")  int num
			) {

		int cnt = helpBoardDao.deleteBoardData(num);
		if(cnt !=0) {
			System.out.println("삭제 성공");
		}
		mav.setViewName("redirect:/helpBoardList.hb");
		return mav;
	}
	@RequestMapping(value= cmdUpdate, method = RequestMethod.GET)
	public ModelAndView doUpdate(ModelAndView mav, HelpBoardBean bean,
			HttpSession session,
			@RequestParam(value ="num")  int num
			) {

		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		HelpBoardBean helpBoard = helpBoardDao.getHelpBoardListbyNum(num); 

		if(loginInfo != null) {
			mav.addObject("id",loginInfo.getId());
			mav.addObject("membernum",loginInfo.getNum());
		}


		mav.addObject("helpBoard",helpBoard);
		mav.setViewName(getPageUpdate);

		return mav;
	}
	@RequestMapping(value= cmdUpdate, method = RequestMethod.POST) public
	ModelAndView doUpdatePOST(ModelAndView mav, HelpBoardBean bean, HttpSession
			session, @RequestParam(value ="num") int num ) {
		int cnt = helpBoardDao.updateHelpBoard(bean);
		mav.setViewName(getPageList);

		return mav; 
	}

}
