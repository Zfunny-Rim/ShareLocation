package space.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import detailspace.model.DetailSpaceBean;
import detailspace.model.DetailSpaceDao;
import member.model.MemberBean;
import reservation.model.BalanceBean;
import reservation.model.BalanceDao;
import reviewBoard.model.ReviewBoardBean;
import reviewBoard.model.ReviewBoardDao;
import space.model.FavoriteBean;
import space.model.SpaceBean;
import space.model.SpaceCommentBean;
import space.model.SpaceDao;
import space.model.SpaceFacilityBean;
import space.model.SpaceImageBean;
import utility.Paging;

@Controller
public class SpaceDetailView {

	private final String command = "/detailView.sp";
	private final String commandImage = "/spaceImage.sp";
	private final String getPage = "spaceDetailView";
	private final String getImage = "detailImage";

	@Autowired
	SpaceDao spaceDao;
	
	@Autowired
	DetailSpaceDao detailSpaceDao;
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	ReviewBoardDao reviewBoardDao;
	
	@Autowired
	BalanceDao balanceDao;
	
	@RequestMapping(value= command)
	public ModelAndView doAction(@RequestParam(value = "num") int num,
				@RequestParam(value ="detailspacenum", required = false) String detailspacenum ,
				@RequestParam(value="whatColumn", required =false) String whatColumn,
				@RequestParam(value="keyword", required =false) String keyword,
				@RequestParam(value ="pagenumber",required = false) String pagenumber,
				@RequestParam(value="commentPageNumber",required=false) String commentPageNumber,
				HttpServletRequest request, HttpSession session,
				ReviewBoardBean boardBean,
			   ModelAndView mav) {
		System.out.println("spaceDetailView");
		System.out.println("넘어왔냐"+detailspacenum);
		
		
		if(pagenumber == null) {
			pagenumber = "1";
		}
		if(commentPageNumber == null) {
			commentPageNumber = "1";
		}
		if(whatColumn == null) {
			whatColumn = "";
		}
		if(keyword == null) {
			keyword = "";
		}
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		
		SpaceBean space = spaceDao.getSpace(num);
		System.out.println("space"+space);
		mav.addObject("space",space);

		List<SpaceImageBean> spaceimage = spaceDao.getImage(num);

		System.out.println("spaceimage"+spaceimage);

		mav.addObject("spaceimage",spaceimage);

		List<DetailSpaceBean> detailspace = detailSpaceDao.getListDetailSpace(num);
		System.out.println("detailspace"+detailspace);
		mav.addObject("detailspace",detailspace);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("spacenum", Integer.toString(num));
		map.put("spaceNum", Integer.toString(num));
		int allCount = reviewBoardDao.getOriginReviewAllCountBySpaceNum(num);
		System.out.println("spacenum:"+num);
		int totalCount = reviewBoardDao.getOriginReviewTotalCountBySpaceNum(map);
		String url = request.getContextPath() + "/" + command;
		System.out.println("count 확인"+allCount);
		System.out.println("count ㅇ 확인"+totalCount);
		
		Paging pageInfo = new Paging(pagenumber, "3", totalCount, url, null, null, null);
		List<ReviewBoardBean> reviewList = reviewBoardDao.getOriginReviewListByMap(pageInfo, map);
		System.out.println("리뷰 확인:"+reviewList.size());
		for(ReviewBoardBean rbBean:reviewList) {
			ReviewBoardBean replyBean = reviewBoardDao.getReviewReplyByNum(rbBean.getNum());
			System.out.println(replyBean);
			rbBean.setReviewReply(replyBean);
		}
		//리플
		int commentTotalCount = spaceDao.getAllCommentListCountBySpaceNum(num);
		Paging commentPageInfo = new Paging(commentPageNumber, "3", commentTotalCount, url, null, null, null);
		List<SpaceCommentBean> commentList = spaceDao.getCommentListBySpaceNum(num, commentPageInfo);
		for(SpaceCommentBean scBean:commentList) {
			SpaceCommentBean replyBean = spaceDao.getReplyCommentByReplyNum(scBean.getNum());
			scBean.setReplyComment(replyBean);
		}
		mav.addObject("getPage", getPage);
		mav.addObject("spacenum", num);
		mav.addObject("pagenumber", pagenumber);
		mav.addObject("reviewList",reviewList);
		mav.addObject("allCount",allCount);
		mav.addObject("pageInfo",pageInfo);
		mav.addObject("commentList",commentList);
		mav.addObject("commentTotalCount",commentTotalCount);
		mav.addObject("commentPageInfo",commentPageInfo);
		mav.addObject("loginInfo", loginInfo);
		
		if(detailspacenum != null)
		{
		int num1  =  Integer.parseInt(detailspacenum);  
		 
		DetailSpaceBean detailSpaceBean =  detailSpaceDao.getselectdetailspace(num1);
		System.out.println("detailSpaceBean"+detailSpaceBean);
		mav.addObject("detailSpaceBean",detailSpaceBean);	
		
		}
				
		//spaceImageBean
		List<SpaceImageBean> spImgList = spaceDao.getSpaceImageListBySpaceNum(num);
		mav.addObject("spImgList",spImgList);
		//balanceInfo
		BalanceBean balanceBean = balanceDao.getBalance(space.getMembernum());
		mav.addObject("balanceBean",balanceBean);
		//facility
		List<SpaceFacilityBean> spFacList = spaceDao.getFacility(num);
		mav.addObject("spFacList",spFacList);
		//dspList
		List<DetailSpaceBean> dspList = detailSpaceDao.getDetailSpaceListBySpaceNum(num);
		mav.addObject("dspList",dspList);
		mav.setViewName(getPage);
		//favorite
		FavoriteBean favoriteBean = null;
		
		if(loginInfo != null) {
			FavoriteBean fBean = new FavoriteBean();
			fBean.setSpacenum(num);
			fBean.setMembernum(loginInfo.getNum());
			favoriteBean = spaceDao.getFavoriteBySpaceNumAndMemberNum(fBean);
		}
		mav.addObject("favoriteBean", favoriteBean);
		return mav;
	}

	@RequestMapping(value= commandImage)
	public ModelAndView doActionImage(@RequestParam(value = "spacenum") int spacenum
			,   ModelAndView mav) {
		System.out.println("doActionImage");
		List<SpaceImageBean> spaceimage = spaceDao.getImage(spacenum);
		System.out.println("spaceimage확인"+spaceimage);
		mav.addObject("spaceimage",spaceimage);
		mav.setViewName(getImage);

		return mav;
	}
	
}

