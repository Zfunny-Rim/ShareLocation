package noticeBoard.controller;


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

import member.model.MemberBean;
import member.model.MemberDao;
import noticeBoard.model.NoticeBoardBean;
import noticeBoard.model.NoticeBoardDao;

@Controller
public class NoticeBoardControllerCmd {



	private final String command = "/detailViewNoticeBoard.nb";
	private final String command1 = "/insertHelpBoard.nb";
	private final String cmdDelete = "/deleteNotice.nb";
	private final String cmdUpdate = "/updateNotice.nb";
	private final String getPage = "noticeBoardDetailView";
	private final String getToPage = "noticeBoardInsert";
	private final String getPageList = "redirect:/noticeBoardList.nb";
	private final String getPageUpdate = "noticeBoardUpdate";


	@Autowired
	NoticeBoardDao noticeBoardDao;

	@Autowired
	MemberDao memberDao;


	@RequestMapping(value= command)
	public ModelAndView doAction( ModelAndView mav,
			@RequestParam(value = "num") int num,
			HttpSession session, HttpServletResponse response
			) throws IOException{

		System.out.println("NoticeBoardListCmd");

		NoticeBoardBean nbBean = noticeBoardDao.getNoticeBoardListbyNum(num); 

		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");

		mav.addObject("nbBean",nbBean);
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
	public ModelAndView doActionPost(@Valid NoticeBoardBean noticeBoardBean,BindingResult result, ModelAndView mav, HttpSession session
			
			) {

		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");

		if(loginInfo != null) {
			mav.addObject("id",loginInfo.getId());
			mav.addObject("membernum",loginInfo.getNum());
		}
		System.out.println(noticeBoardBean);
		if(result.hasErrors()) {
			mav.setViewName(getToPage);
			return mav;	
		}

		int cnt = noticeBoardDao.insertData(noticeBoardBean);
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

		int cnt = noticeBoardDao.deleteBoardData(num);
		if(cnt !=0) {
			System.out.println("삭제 성공");
		}
		mav.setViewName("redirect:/noticeBoardList.nb");
		return mav;
	}
	@RequestMapping(value= cmdUpdate, method = RequestMethod.GET)
	public ModelAndView doUpdateGET(ModelAndView mav, NoticeBoardBean bean,
			HttpSession session,
			@RequestParam(value ="num")  int num
			) {

		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		NoticeBoardBean noticeBoard = noticeBoardDao.getNoticeBoardListbyNum(num); 

		if(loginInfo != null) {
			mav.addObject("id",loginInfo.getId());
			mav.addObject("membernum",loginInfo.getNum());
		}


		mav.addObject("noticeBoard",noticeBoard);
		mav.setViewName(getPageUpdate);

		return mav;
	}
	
	
	  @RequestMapping(value= cmdUpdate, method = RequestMethod.POST) public
	  ModelAndView doUpdatePOST(ModelAndView mav, NoticeBoardBean bean, HttpSession
	  session,
	  
	  @RequestParam(value ="num") int num ) {
	 
	 
	 int cnt = noticeBoardDao.updateNoticeBoard(bean);
	  
	  mav.setViewName(getPageList);
	 
	 return mav; 
	 }
	 

}
