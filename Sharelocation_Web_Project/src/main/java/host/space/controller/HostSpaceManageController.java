package host.space.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import detailspace.model.DetailSpaceBean;
import detailspace.model.DetailSpaceDao;
import detailspace.model.PackagePriceBean;
import income.model.IncomeBean;
import income.model.IncomeDao;
import income.model.IncomeDetailBean;
import member.model.MemberBean;
import member.model.MemberDao;
import reservation.model.BalanceBean;
import reservation.model.BalanceDao;
import reservation.model.DayOfWeekCountBean;
import reservation.model.ReservationBean;
import reservation.model.ReservationDao;
import reviewBoard.model.ReviewBoardBean;
import reviewBoard.model.ReviewBoardDao;
import space.model.AdvertiseBean;
import space.model.SpaceBean;
import space.model.SpaceCommentBean;
import space.model.SpaceDao;
import space.model.SpaceFacilityBean;
import space.model.SpaceImageBean;
import utility.Paging;

@Controller
public class HostSpaceManageController {
	private final String homeCommand = "spaceManage.ho";
	private final String modifyCommand = "spaceManageModify.ho";
	private final String detailCommand = "spaceManageDetailSpace.ho";
	private final String detailInsertCommand = "spaceManageDetailSpaceInsert.ho";
	private final String detailModifyCommand = "spaceManageDetailSpaceModify.ho";
	private final String detailDeleteCommand = "spaceManageDetailSpaceDelete.ho";
	private final String balanceCommand = "spaceManageBalance.ho";
	private final String balanceInsertCommand = "spaceManageBalanceInsert.ho";
	private final String balanceViewCommand = "spaceManageBalanceView.ho";
	private final String balanceModifyCommand = "spaceManageBalanceModify.ho";
	private final String packageCommand = "spaceManageDetailPackage.ho";
	private final String packageInsertCommand = "spaceManageDetailPackageInsert.ho";
	private final String packageDeleteCommand = "spaceManageDetailPackageDelete.ho";
	private final String approvalCommand = "spaceManageApproval.ho";
	private final String reviewCommand = "spaceManageReview.ho";
	private final String reviewReplyCommand = "spacemanageReviewReply.ho";
	private final String reviewReplyDeleteCommand = "spaceManagerReviewReplyDelete.ho";
	private final String reservationCommand = "spaceManageReservation.ho";
	private final String reservationViewCommand = "spaceManageReservationView.ho";
	private final String reservationStatusUpdateCommand = "spaceManageReservationStatusUpdate.ho";
	private final String advertiseCommand = "spaceManagerAdvertise.ho";
	private final String advertisePurchaseCommand = "spaceManagerAdvertisePurchase.ho";
	private final String statisticCommand = "spaceManageStatistic.ho";
	private final String statisticDetailCommand = "spaceManageStatisticDetail.ho";
	private final String commentCommand = "spaceManageCommentList.ho";
	private final String commentReplyCommand = "spaceManageCommentReply.ho";
	
	private final String viewPage = "manage/hostSpaceManage";
	private String getPage;
	
	@Autowired
	SpaceDao spaceDao;
	@Autowired
	DetailSpaceDao detailSpaceDao;
	@Autowired
	BalanceDao balanceDao;
	@Autowired
	ReviewBoardDao reviewBoardDao;
	@Autowired
	MemberDao memberDao;
	@Autowired
	ReservationDao reservationDao;
	@Autowired
	IncomeDao incomeDao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value=homeCommand)
	public ModelAndView goHome(@RequestParam(value="spaceNum") int spaceNum,
			@RequestParam(value="tab", required = false) String tab) {
		ModelAndView mav = new ModelAndView(viewPage);
		SpaceBean spaceBean = spaceDao.getSpace(spaceNum);
		int memberNum = spaceBean.getMembernum();
		BalanceBean balanceBean = balanceDao.getBalance(memberNum);
		List<DetailSpaceBean> dspList =  detailSpaceDao.getDetailSpaceListBySpaceNum(spaceNum);
		List<SpaceImageBean> spImgList = spaceDao.getSpaceImageListBySpaceNum(spaceNum);
		List<SpaceFacilityBean> spFacList = spaceDao.getFacility(spaceNum);
		mav.addObject("spaceNum", spaceNum);
		mav.addObject("spaceBean",spaceBean);
		mav.addObject("dspList",dspList);
		mav.addObject("spImgList", spImgList);
		mav.addObject("spFacList", spFacList);
		mav.addObject("balanceBean", balanceBean);
		
		getPage = "Home";
		mav.addObject("getPage", getPage);
		return mav;
	}
	
	@RequestMapping(value=modifyCommand, method=RequestMethod.GET)
	public ModelAndView modifySpace(@RequestParam(value="spaceNum") int spaceNum) {
		ModelAndView mav = new ModelAndView(viewPage);
		getPage = "Modify";
		mav.addObject("getPage", getPage);

		SpaceBean spaceBean = spaceDao.getSpace(spaceNum);
		List<SpaceImageBean> spaceImageList = spaceDao.getImage(spaceNum);
		List<SpaceFacilityBean> spaceFacilityList = spaceDao.getFacility(spaceNum);
		System.out.println("size : "+spaceFacilityList.size());
		mav.addObject("spaceNum", spaceNum);
		mav.addObject("spaceBean", spaceBean);
		mav.addObject("spaceImageList", spaceImageList);
		mav.addObject("spaceFacilityList", spaceFacilityList);
		
		return mav;
	}
	
	@RequestMapping(value=modifyCommand, method=RequestMethod.POST)
	public ModelAndView doModifySpace(@Valid SpaceBean spaceBean, BindingResult result,
			HttpServletRequest request, MultipartHttpServletRequest mtfRequest) throws IllegalStateException, IOException {
		ModelAndView mav = new ModelAndView();
		System.out.println(spaceBean);
		if(result.hasErrors()) {
			mav.setViewName(viewPage);
			getPage = "Modify";
			
			List<SpaceImageBean> spaceImageList = spaceDao.getImage(spaceBean.getNum());
			List<SpaceFacilityBean> spaceFacilityList = spaceDao.getFacility(spaceBean.getNum());
			mav.addObject("spaceImageList", spaceImageList);
			mav.addObject("spaceFacilityList", spaceFacilityList);
			spaceBean.setMainimage(spaceBean.getMainimageOrigin());
			mav.addObject("getPage", getPage);
			mav.addObject("spaceNum", spaceBean.getNum());
			mav.addObject("spaceBean", spaceBean);
			return mav;
		}
		
		
		//mainimage ?????? ??????
		String uploadPath = servletContext.getRealPath("/resources/spaceimage");
		File mainimage_File = null;
		MultipartFile mpfMainImage = null;
		
		if(!spaceBean.getMainimage().equals(spaceBean.getMainimageOrigin())) {
			//Origin??? ????????? ????????? ????????? ???????????? ??????.
			mpfMainImage = mtfRequest.getFile("mainimageupdatefile");
			String originFileName = mpfMainImage.getOriginalFilename();
			String safeFileName = System.currentTimeMillis()+"_"+originFileName; // ????????? ?????? ??????
			mainimage_File = new File(uploadPath+"\\"+safeFileName);
			spaceBean.setMainimage(safeFileName); 
			System.out.println("mainimage : " + spaceBean.getMainimage());
		}
		int cnt = -1;
		cnt = spaceDao.updateSpace(spaceBean);
		
		
		if(cnt != -1) {
			if(mpfMainImage != null && mainimage_File != null) {
				mpfMainImage.transferTo(mainimage_File);
				//TODO: ?????? ??????????????? ?????? ?????? ??????
				File dFile = new File(uploadPath+"\\"+spaceBean.getMainimageOrigin());
				System.out.println(dFile.getPath());
				if(dFile.exists()) {
					dFile.delete();
				}
			}
		}
		//spaceimage (???????????????) ??????
		//
		if(spaceBean.getSpaceimageupdate().size() != 0) {
			//modify Form?????? ???????????? ???????????? 0?????? ????????? ???????????? ??????.
			//????????? ??????????????? ?????? ?????? ???????????? ?????????.
			//TODO: ?????? ????????? ????????? ?????? ??????
			List<SpaceImageBean> spaceImageList = spaceDao.getImage(spaceBean.getNum());
			for(SpaceImageBean siBean:spaceImageList) {
				String imageFileName = siBean.getImage();
				File dFile = new File(uploadPath+"\\"+imageFileName);
				System.out.println(dFile.getPath());
				if(dFile.exists()) {
					dFile.delete();
				}
			}
			//DB????????? ??????
			spaceDao.deleteSpaceImageBySpaceNum(spaceBean.getNum());
			
			//????????? ????????? ???????????????.
			List<MultipartFile> spImageList = mtfRequest.getFiles("spaceimageupdatefile");
			for(int i=0;i<spImageList.size();i++) {
				MultipartFile mpfSpaceImage = spImageList.get(i);
				String spOriginFileName = mpfSpaceImage.getOriginalFilename();
				String spSafeFileName = System.currentTimeMillis()+"_"+(i+1)+"_"+spOriginFileName; // ????????? ?????? ??????
				File spaceImage_File = new File(uploadPath+"\\"+spSafeFileName);
				cnt = -1;
				SpaceImageBean spaceImageBean = new SpaceImageBean(0, spaceBean.getNum(), spSafeFileName);
				cnt = spaceDao.insertSpaceImage(spaceImageBean);
				if(cnt != -1) {
					//DB????????? ??????????????? ???????????? ????????? ?????????
					mpfSpaceImage.transferTo(spaceImage_File);
				}
			}
		}
		
		//facility ??????
		spaceDao.deleteFacility(spaceBean.getNum());
		String[] facilityList = request.getParameterValues("facility");
		for(String facStr:facilityList) {
			SpaceFacilityBean sfBean = new SpaceFacilityBean(0, spaceBean.getNum(), facStr);
			cnt = -1;
			cnt = spaceDao.insertSpaceFacility(sfBean);
		}
		
		mav.setViewName("redirect:/spaceManage.ho");
		mav.addObject("spaceNum", spaceBean.getNum());
		return mav;
	}

	@RequestMapping(value=detailCommand)
	public ModelAndView detailList(@RequestParam(value="spaceNum")int spaceNum) {
		ModelAndView mav = new ModelAndView(viewPage);
		getPage = "Detail";
		mav.addObject("getPage", getPage);
		
		List<DetailSpaceBean> dspBeanList = detailSpaceDao.getDetailSpaceListBySpaceNum(spaceNum);
		mav.addObject("dspBeanList", dspBeanList);
		mav.addObject("spaceNum", spaceNum);
		return mav;
	}
	
	@RequestMapping(value=detailInsertCommand, method=RequestMethod.GET)
	public ModelAndView detailInsert(@RequestParam(value="spaceNum") int spaceNum) {
		ModelAndView mav = new ModelAndView(viewPage);
		getPage = "DetailInsert";
		mav.addObject("getPage", getPage);
		mav.addObject("spaceNum", spaceNum);
		return mav;
	}
	
	@RequestMapping(value=detailInsertCommand, method=RequestMethod.POST)
	public ModelAndView insertDetailSpace(@Valid DetailSpaceBean detailSpaceBean,
			BindingResult result, MultipartHttpServletRequest mtfRequest) throws IllegalStateException, IOException {
		ModelAndView mav = new ModelAndView();
		System.out.println(detailSpaceBean);
		if(result.hasErrors()) {
			List<ObjectError> errList = result.getAllErrors();
			for(ObjectError err:errList) {
				System.out.println(err.getDefaultMessage()); 
			}
			System.out.println("Has Error");
			getPage = "DetailInsert";
			mav.setViewName(viewPage);
			mav.addObject("spaceNum", detailSpaceBean.getSpacenum());
			mav.addObject("getPage", getPage);
			return mav;
		}
		
		//mainimage ?????? ??????
		String uploadPath = servletContext.getRealPath("/resources/spaceimage");
		MultipartFile mpfMainImage = mtfRequest.getFile("mainimagefile");
		String originFileName = mpfMainImage.getOriginalFilename();
		String safeFileName = System.currentTimeMillis()+"_"+originFileName; // ????????? ?????? ??????
		File mainimage_File = new File(uploadPath+"\\"+safeFileName);
		detailSpaceBean.setMainimage(safeFileName);
		
		int cnt = -1;
		cnt = detailSpaceDao.insertDSpace(detailSpaceBean);
		if(cnt != -1) {
			mpfMainImage.transferTo(mainimage_File);
		}
		
		mav.addObject("spaceNum", detailSpaceBean.getSpacenum());
		mav.setViewName("redirect:/spaceManageDetailSpace.ho");
		return mav;
	}
	
	@RequestMapping(value=detailModifyCommand, method=RequestMethod.GET)
	public ModelAndView modifyDetailSpaceForm(@RequestParam(value="spaceNum")int spaceNum,
			@RequestParam(value="detailSpaceNum")int detailSpaceNum) {
		ModelAndView mav = new ModelAndView(viewPage);
		getPage = "DetailModify";
		
		DetailSpaceBean detailSpaceBean = detailSpaceDao.getselectdetailspace(detailSpaceNum);
		
		mav.addObject("getPage", getPage);
		mav.addObject("spaceNum", spaceNum);
		mav.addObject("detailSpaceBean", detailSpaceBean);
		
		return mav;
	}
	
	@RequestMapping(value=detailModifyCommand, method=RequestMethod.POST)
	public ModelAndView modifyDetailSpace(@Valid DetailSpaceBean detailSpaceBean, BindingResult result,
			MultipartHttpServletRequest mtfRequest) throws IllegalStateException, IOException {
		ModelAndView mav = new ModelAndView(viewPage);
		System.out.println(detailSpaceBean);
		System.out.println("setMainImageOrigin: "+ detailSpaceBean.getMainimageOrigin());
		if(result.hasErrors()) {
			System.out.println("has Error");
			mav.addObject("spaceNum", detailSpaceBean.getSpacenum());
			mav.setViewName(viewPage);
			getPage = "DetailModify";
			mav.addObject("getPage", getPage);
			return mav;
		}
		//mainimage ?????? ??????
		String uploadPath = servletContext.getRealPath("/resources/spaceimage");
		File mainimage_File = null;
		MultipartFile mpfMainImage = null;
		
		if(!detailSpaceBean.getMainimage().equals(detailSpaceBean.getMainimageOrigin())) {
			//Origin??? ????????? ????????? ????????? ???????????? ??????.
			mpfMainImage = mtfRequest.getFile("mainimageupdatefile");
			String originFileName = mpfMainImage.getOriginalFilename();
			String safeFileName = System.currentTimeMillis()+"_"+originFileName; // ????????? ?????? ??????
			mainimage_File = new File(uploadPath+"\\"+safeFileName);
			detailSpaceBean.setMainimage(safeFileName); 
		}		
		int cnt = -1;
		cnt = detailSpaceDao.updateDSpace(detailSpaceBean);
		if(cnt != -1) {
			if(mainimage_File != null && mpfMainImage != null) {
				mpfMainImage.transferTo(mainimage_File);
				//TODO: ?????? ??????????????? ?????? ?????? ??????
				File dFile = new File(uploadPath+"\\"+detailSpaceBean.getMainimageOrigin());
				if(dFile.exists()) {
					dFile.delete();
				}
			}
		}
		getPage = "Detail";
		mav.addObject("getPage", getPage);
		mav.addObject("spaceNum", detailSpaceBean.getSpacenum());
		mav.setViewName("redirect:/spaceManageDetailSpace.ho");
		return mav;
	}
	
	@RequestMapping(value=detailDeleteCommand)
	public ModelAndView deleteDetailSpace(@RequestParam(value="spaceNum")int spaceNum,
			@RequestParam(value="detailSpaceNum")int detailSpaceNum) {
		ModelAndView mav = new ModelAndView();
		String imgName = detailSpaceDao.getDetailSpaceImage(detailSpaceNum);
		System.out.println("Delete File : " + imgName);
		int cnt = -1;
		cnt = detailSpaceDao.deleteDSpace(detailSpaceNum);
		if(cnt != -1) {
			String uploadPath = servletContext.getRealPath("/resources/spaceimage");
			File dFile = new File(uploadPath+"\\"+imgName);
			if(dFile.exists()) {
				dFile.delete();
			}
		}
		mav.addObject("spaceNum", spaceNum);
		mav.setViewName("redirect:/spaceManageDetailSpace.ho");
		return mav;
	}
	
	@RequestMapping(value=balanceCommand)
	public ModelAndView balanceManage(@RequestParam(value="spaceNum")int spaceNum, 
			HttpSession session, HttpServletResponse response) throws IOException {
		ModelAndView mav = new ModelAndView();
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		if(loginInfo == null) {
			pw.println("<script>");
			pw.println("alert('???????????? ????????? ??????????????????.');");
			pw.println("location.href='main.ho';");
			pw.println("</script>");
			pw.flush();
			return null;
		}else if(!loginInfo.getType().equals("host")) {
			pw.println("<script>");
			pw.println("alert('???????????? ??????????????? ??????????????????.');");
			pw.println("location.href='main.ho';");
			pw.println("</script>");
			pw.flush();
			return null;
		}
		int memberNum = 0;
		memberNum = loginInfo.getNum();
		BalanceBean balanceBean = balanceDao.getBalanceByMemberNum(memberNum);
		if(balanceBean == null) {
			//???????????? ???????????? ??????
			mav.setViewName("redirect:/spaceManageBalanceInsert.ho");
		}else {
			//???????????? ??????????????? ??????
			mav.setViewName("redirect:/spaceManageBalanceView.ho");
		}
		mav.addObject("spaceNum", spaceNum);
		return mav;
	}
	
	@RequestMapping(value=balanceInsertCommand, method=RequestMethod.GET)
	public ModelAndView balanceInsert(@RequestParam(value="spaceNum")int spaceNum) {
		ModelAndView mav = new ModelAndView(viewPage);
		getPage = "BalanceInsert";
		mav.addObject("getPage", getPage);
		mav.addObject("spaceNum", spaceNum);
		return mav;
	}
	
	@RequestMapping(value=balanceInsertCommand, method=RequestMethod.POST)
	public ModelAndView balanceInsertProc(@Valid BalanceBean balanceBean, BindingResult result, 
			HttpServletRequest request, HttpSession session, HttpServletResponse response) throws IOException {
		ModelAndView mav = new ModelAndView(viewPage);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		if(loginInfo == null) {
			pw.println("<script>");
			pw.println("alert('???????????? ????????? ??????????????????.');");
			pw.println("location.href='main.ho';");
			pw.println("</script>");
			pw.flush();
			return null;
		}else if(!loginInfo.getType().equals("host")) {
			pw.println("<script>");
			pw.println("alert('???????????? ??????????????? ??????????????????.');");
			pw.println("location.href='main.ho';");
			pw.println("</script>");
			pw.flush();
			return null;
		}
		int memberNum = 0;
		memberNum = loginInfo.getNum();
		int spaceNum = Integer.parseInt(request.getParameter("spacenum"));
		if(result.hasErrors()) {
			getPage = "BalanceInsert";
			mav.addObject("getPage", getPage);
			mav.addObject("spaceNum", spaceNum);
			return mav;
		}
		balanceBean.setMembernum(memberNum);
		System.out.println(balanceBean);
		int cnt = balanceDao.insertBalance(balanceBean);
		mav.setViewName("redirect:/"+balanceViewCommand);
		mav.addObject("spaceNum", spaceNum);
		return mav;
	}
	
	@RequestMapping(value=balanceViewCommand, method=RequestMethod.GET)
	public ModelAndView balanceView(@RequestParam(value="spaceNum")int spaceNum,
			HttpSession session, HttpServletResponse response) throws IOException {
		ModelAndView mav = new ModelAndView(viewPage);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		if(loginInfo == null) {
			pw.println("<script>");
			pw.println("alert('???????????? ????????? ??????????????????.');");
			pw.println("location.href='main.ho';");
			pw.println("</script>");
			pw.flush();
			return null;
		}else if(!loginInfo.getType().equals("host")) {
			pw.println("<script>");
			pw.println("alert('???????????? ??????????????? ??????????????????.');");
			pw.println("location.href='main.ho';");
			pw.println("</script>");
			pw.flush();
			return null;
		}
		int memberNum = 0;
		memberNum = loginInfo.getNum();

		BalanceBean balanceBean = balanceDao.getBalanceByMemberNum(memberNum);
		getPage = "BalanceView";
		mav.addObject("balanceBean", balanceBean);
		mav.addObject("getPage", getPage);
		mav.addObject("spaceNum", spaceNum);
		return mav;
	}

	@RequestMapping(value=balanceModifyCommand, method=RequestMethod.GET)
	public ModelAndView balanceModifyForm(@RequestParam(value="spaceNum")int spaceNum,
			HttpSession session, HttpServletResponse response) throws IOException {
		ModelAndView mav = new ModelAndView(viewPage);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		if(loginInfo == null) {
			pw.println("<script>");
			pw.println("alert('???????????? ????????? ??????????????????.');");
			pw.println("location.href='main.ho';");
			pw.println("</script>");
			pw.flush();
			return null;
		}else if(!loginInfo.getType().equals("host")) {
			pw.println("<script>");
			pw.println("alert('???????????? ??????????????? ??????????????????.');");
			pw.println("location.href='main.ho';");
			pw.println("</script>");
			pw.flush();
			return null;
			
		}
		int memberNum = 0;
		memberNum = loginInfo.getNum();
		getPage = "BalanceModify";
		BalanceBean balanceBean = balanceDao.getBalanceByMemberNum(memberNum);
		mav.addObject("balanceBean", balanceBean);
		mav.addObject("getPage", getPage);
		mav.addObject("spaceNum", spaceNum);
		return mav;
	}
	
	@RequestMapping(value=balanceModifyCommand, method=RequestMethod.POST)
	public ModelAndView balanceModifyProc(@Valid BalanceBean balanceBean, BindingResult result, 
			HttpServletRequest request, HttpSession session, HttpServletResponse response) throws IOException {
		ModelAndView mav = new ModelAndView(viewPage);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		if(loginInfo == null) {
			pw.println("<script>");
			pw.println("alert('???????????? ????????? ??????????????????.');");
			pw.println("location.href='main.ho';");
			pw.println("</script>");
			pw.flush();
			return null;
		}else if(!loginInfo.getType().equals("host")) {
			pw.println("<script>");
			pw.println("alert('???????????? ??????????????? ??????????????????.');");
			pw.println("location.href='main.ho';");
			pw.println("</script>");
			pw.flush();
			return null;
		}
		int memberNum = 0;
		memberNum = loginInfo.getNum();
		int spaceNum = Integer.parseInt(request.getParameter("spacenum"));
		System.out.println(balanceBean);
		if(result.hasErrors()) {
			getPage = "BalanceModify";
			mav.addObject("getPage", getPage);
			mav.addObject("spaceNum", spaceNum);
			return mav;
		}
		balanceBean.setMembernum(memberNum);
		int cnt = balanceDao.updateBalance(balanceBean);
		mav.setViewName("redirect:/"+balanceViewCommand);
		mav.addObject("spaceNum", spaceNum);
		return mav;
	}
	
	@RequestMapping(value=packageCommand)
	public ModelAndView packageView(@RequestParam(value="spaceNum")int spaceNum,
			@RequestParam(value="detailSpaceNum")int detailSpaceNum) {
		ModelAndView mav = new ModelAndView(viewPage);
		getPage = "DetailPackage";
		List<PackagePriceBean> packageBeanList = detailSpaceDao.getPackageListByDetailSpaceNum(detailSpaceNum);
		mav.addObject("packageBeanList", packageBeanList);
		mav.addObject("getPage", getPage);
		mav.addObject("detailSpaceNum", detailSpaceNum);
		mav.addObject("spaceNum", spaceNum);
		return mav;
	}
	
	@RequestMapping(value=packageInsertCommand, method=RequestMethod.GET)
	public ModelAndView packageInsert(@RequestParam(value="spaceNum")int spaceNum,
			@RequestParam(value="detailSpaceNum")int detailSpaceNum) {
		ModelAndView mav = new ModelAndView(viewPage);
		getPage = "DetailPackageInsert";
		SpaceBean spaceBean = spaceDao.getSpace(spaceNum);
		List<PackagePriceBean> packageBeanList = detailSpaceDao.getPackageListByDetailSpaceNum(detailSpaceNum);
		mav.addObject("spaceBean", spaceBean);
		mav.addObject("getPage", getPage);
		mav.addObject("detailSpaceNum", detailSpaceNum);
		mav.addObject("spaceNum", spaceNum);
		return mav;
	}
	
	@RequestMapping(value=packageInsertCommand, method=RequestMethod.POST)
	public ModelAndView packageInsertProc(@Valid PackagePriceBean packagePriceBean, BindingResult result,
			HttpServletRequest request) {
		ModelAndView mav = new ModelAndView(viewPage);
		System.out.println(packagePriceBean);
		int spaceNum = Integer.parseInt(request.getParameter("spacenum"));
		int detailSpaceNum = packagePriceBean.getDetailspacenum();
		SpaceBean spaceBean = spaceDao.getSpace(spaceNum);
		if(result.hasErrors()) {
			getPage = "DetailPackageInsert";
			mav.addObject("getPage", getPage);
			mav.addObject("spaceNum", spaceNum);
			mav.addObject("detailSpaceNum", detailSpaceNum);
			mav.addObject("spaceBean", spaceBean);
			return mav;
		}
		//????????? ?????? ??????????????? ???????????????
		List<PackagePriceBean> packageBeanList = detailSpaceDao.getPackageListByDetailSpaceNum(detailSpaceNum);
		int check_in = packagePriceBean.getCheckintime();
		int check_out = packagePriceBean.getCheckouttime();
		boolean isInvalid = false;
		int invalid_index = -1;
		for(int i=0;i<packageBeanList.size();i++) {
			PackagePriceBean ppBean = packageBeanList.get(i);
			int p_check_in = ppBean.getCheckintime();
			int p_check_out = ppBean.getCheckintime();
			if(p_check_in <= check_in && check_in < p_check_out) {
				isInvalid = true;
				invalid_index = i;
				break;
			}else if(check_in <= p_check_in) {
				if(check_out > p_check_in) {
					isInvalid = true;
					invalid_index = i;
					break;
				}
			}
		}
		if(isInvalid) {
			PackagePriceBean ppBean = packageBeanList.get(invalid_index);
			System.out.println("????????? ????????? "+ppBean.getTitle()+" ???????????? ???????????????.");
			System.out.println("?????? ?????? : "+check_in+"~"+check_out);
			System.out.println(ppBean.getTitle()+" ?????? : "+ppBean.getCheckintime()+"~"+ppBean.getCheckouttime());
			getPage = "DetailPackageInsert";
			mav.addObject("getPage", getPage);
			mav.addObject("spaceNum", spaceNum);
			mav.addObject("detailSpaceNum", detailSpaceNum);
			mav.addObject("spaceBean", spaceBean);
			return mav;
		}
		//
		int cnt = detailSpaceDao.insertDPackage(packagePriceBean);
		mav.addObject("spaceNum", spaceNum);
		mav.addObject("detailSpaceNum", detailSpaceNum);
		mav.setViewName("redirect:/"+packageCommand);
		return mav;
	}
	
	@RequestMapping(value=packageDeleteCommand)
	public ModelAndView packageDelete(@RequestParam(value="spaceNum")int spaceNum,
			@RequestParam(value="detailSpaceNum")int detailSpaceNum,
			@RequestParam(value="num")int packageNum) {
		ModelAndView mav = new ModelAndView(viewPage);
		int cnt = detailSpaceDao.deleteDPackage(packageNum);
		mav.setViewName("redirect:/"+packageCommand);
		mav.addObject("spaceNum", spaceNum);
		mav.addObject("detailSpaceNum", detailSpaceNum);
		return mav;
	}
	
	@RequestMapping(value=approvalCommand)
	public ModelAndView approvalSpace(@RequestParam(value="spaceNum")int spaceNum, HttpServletResponse response,
			HttpSession session) throws IOException {
		ModelAndView mav = new ModelAndView(viewPage);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		
		int dspCount = detailSpaceDao.getDetailSpaceCountBySpaceNum(spaceNum);
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		if(loginInfo == null) {
			pw.println("<script>");
			pw.println("alert('???????????? ????????? ??????????????????.');");
			pw.println("location.href='main.ho';");
			pw.println("</script>");
			pw.flush();
			return null;
		}else if(!loginInfo.getType().equals("host")) {
			pw.println("<script>");
			pw.println("alert('???????????? ??????????????? ??????????????????.');");
			pw.println("location.href='main.ho';");
			pw.println("</script>");
			pw.flush();
			return null;
		}
		int memberNum = loginInfo.getNum();
		BalanceBean balanceBean = balanceDao.getBalanceByMemberNum(memberNum);
		if(dspCount > 0 && balanceBean != null) {
			int cnt = -1;
			cnt = spaceDao.requestApproval(spaceNum);
			if(cnt != -1) {
				pw.println("<script>");
				pw.println("alert('?????? ????????? ?????????????????????. ???????????? ?????? ?????? ?????? ????????? ???????????????.');");
				pw.println("location.href='"+homeCommand+"?spaceNum="+spaceNum+"'");
				pw.println("</script>");
				pw.flush();
				return null;
			}
		}else if(dspCount <= 0) {
			pw.println("<script>");
			pw.println("alert('????????? ?????? ????????? ????????????.');");
			pw.println("location.href='spaceManageDetailSpace.ho?spaceNum="+spaceNum+"'");
			pw.println("</script>");
			pw.flush();
			return null;
		}else if(balanceBean == null) {
			pw.println("<script>");
			pw.println("alert('????????? ?????? ????????? ????????????.');");
			pw.println("location.href='spaceManageBalanceInsert.ho?spaceNum="+spaceNum+"'");
			pw.println("</script>");
			pw.flush();
			return null;
		}
		mav.setViewName("redirect:/"+homeCommand);
		mav.addObject("spaceNum", spaceNum);
		return mav;
	}
	
	@RequestMapping(value=reviewCommand, method=RequestMethod.GET)
	public ModelAndView reviewList(@RequestParam(value="spaceNum")int spaceNum,
			@RequestParam(value="whatColumn", required =false) String whatColumn,
			@RequestParam(value="keyword", required =false) String keyword,
			@RequestParam(value="pageNumber", required =false) String pageNumber,
			HttpServletRequest request) {
		ModelAndView mav = new ModelAndView(viewPage);
		getPage = "Review";
		if(pageNumber == null) {
			pageNumber = "1";
		}
		Map<String, String> map = new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", keyword);
		map.put("spaceNum", Integer.toString(spaceNum));
		int allCount = reviewBoardDao.getOriginReviewAllCountBySpaceNum(spaceNum);
		int totalCount = reviewBoardDao.getOriginReviewTotalCountBySpaceNum(map);
		String url = request.getContextPath() + "/" + reviewCommand;
		
		Paging pageInfo = new Paging(pageNumber, "2", totalCount, url, whatColumn, keyword, null);
		List<ReviewBoardBean> reviewList = reviewBoardDao.getOriginReviewListByMap(pageInfo, map);
//		List<ReviewBoardBean> reviewList = reviewBoardDao.getOriginReviewListBySpaceNum(spaceNum);
		for(ReviewBoardBean rbBean:reviewList) {
			ReviewBoardBean replyBean = reviewBoardDao.getReviewReplyByNum(rbBean.getNum());
			System.out.println(replyBean);
			rbBean.setReviewReply(replyBean);
		}
		mav.addObject("getPage", getPage);
		mav.addObject("spaceNum", spaceNum);
		mav.addObject("pageNumber", pageNumber);
		mav.addObject("reviewList",reviewList);
		mav.addObject("allCount",allCount);
		mav.addObject("pageInfo",pageInfo);
		return mav;
	}
	
	@RequestMapping(value=reviewReplyCommand, method=RequestMethod.POST)
	public ModelAndView reviewReply(ReviewBoardBean reviewBoardBean, HttpSession session,
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		ModelAndView mav = new ModelAndView(viewPage);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		if(loginInfo == null) {
			pw.println("<script>");
			pw.println("alert('???????????? ????????? ??????????????????.');");
			pw.println("location.href='main.ho';");
			pw.println("</script>");
			pw.flush();
			return null;
		}else if(!loginInfo.getType().equals("host")) {
			pw.println("<script>");
			pw.println("alert('???????????? ??????????????? ??????????????????.');");
			pw.println("location.href='main.ho';");
			pw.println("</script>");
			pw.flush();
			return null;
		}
		int spaceNum = reviewBoardBean.getSpacenum();
		int memberNum;
		memberNum = loginInfo.getNum();
		reviewBoardBean.setMembernum(memberNum);
		reviewBoardBean.setWriter(loginInfo.getNickname());
		reviewBoardBean.setRef(reviewBoardBean.getNum());
		reviewBoardBean.setRestep(1);
		reviewBoardBean.setRelevel(1);
		System.out.println(reviewBoardBean);
		int cnt = -1;
		cnt = reviewBoardDao.insertReply(reviewBoardBean); 
		mav.addObject("spaceNum", spaceNum);
		mav.addObject("pageNumber", request.getParameter("pageNumber"));
		mav.setViewName("redirect:/"+reviewCommand);
		return mav;
	}
	
	@RequestMapping(value=reviewReplyDeleteCommand)
	public ModelAndView reviewReplyDelete(@RequestParam(value="spaceNum")int spaceNum,
		@RequestParam(value="num")int num, HttpSession session) {
		ModelAndView mav = new ModelAndView(viewPage);
		int cnt = -1;
		cnt = reviewBoardDao.deleteReviewByNum(num);
		mav.setViewName("redirect:/"+reviewCommand);
		mav.addObject("spaceNum", spaceNum);
		return mav;
	}
	
	@RequestMapping(value=reservationCommand, method=RequestMethod.GET)
	public ModelAndView reservationList(@RequestParam(value="spaceNum")int spaceNum,
			@RequestParam(value="whatColumn", required =false) String whatColumn,
			@RequestParam(value="keyword", required =false) String keyword,
			@RequestParam(value="pageNumber", required =false) String pageNumber,
			HttpServletRequest request) {
		ModelAndView mav = new ModelAndView(viewPage);
		getPage = "Reservation";
		if(pageNumber == null) {
			pageNumber = "1";
		}
		Map<String, String> map = new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", keyword);
		map.put("spaceNum", Integer.toString(spaceNum));
		String url = request.getContextPath() + "/" + reservationCommand;
		int totalCount = reservationDao.getReservationTotalCountByMap(map);
		Paging pageInfo = new Paging(pageNumber, "5", totalCount, url, whatColumn, keyword, null);
		List<ReservationBean> reservationList = reservationDao.getReservationListByMap(pageInfo, map);
		for(ReservationBean rBean:reservationList) {
			rBean.setMemberBean(memberDao.getMemberByNum(rBean.getMembernum()));
			rBean.setDetailSpaceBean(detailSpaceDao.getDetailSpaceByNum(rBean.getDetailspacenum()));
		}
		mav.addObject("getPage", getPage);
		mav.addObject("spaceNum", spaceNum);
		mav.addObject("pageNumber", pageNumber);
		mav.addObject("totalCount", totalCount);
		mav.addObject("reservationList", reservationList);
		mav.addObject("pageInfo", pageInfo);
		return mav;
	}
//	
	@RequestMapping(value=reservationViewCommand, method=RequestMethod.GET)
	public ModelAndView reservationView(@RequestParam(value="spaceNum")int spaceNum,
			@RequestParam(value="num")int num,
			@RequestParam(value="whatColumn", required =false) String whatColumn,
			@RequestParam(value="keyword", required =false) String keyword,
			@RequestParam(value="pageNumber", required =false) String pageNumber,
			HttpServletRequest request) {
		ModelAndView mav = new ModelAndView(viewPage);
		getPage = "ReservationView";
		ReservationBean reservationBean = reservationDao.getReservationByNum(num);
		reservationBean.setMemberBean(memberDao.getMemberByNum(reservationBean.getMembernum()));
		reservationBean.setDetailSpaceBean(detailSpaceDao.getDetailSpaceByNum(reservationBean.getDetailspacenum()));
		
		mav.addObject("getPage", getPage);
		mav.addObject("spaceNum", spaceNum);
		mav.addObject("pageNumber", pageNumber);
		mav.addObject("whatColumn", whatColumn);
		mav.addObject("keyword", keyword);
		mav.addObject("reservationBean", reservationBean);
		return mav;
	}
	
	@RequestMapping(value=reservationStatusUpdateCommand, method=RequestMethod.GET)
	public ModelAndView reservationStatusUpdate(@RequestParam(value="spaceNum")int spaceNum,
			@RequestParam(value="num")int num,
			@RequestParam(value="status")String status,
			@RequestParam(value="whatColumn", required =false) String whatColumn,
			@RequestParam(value="keyword", required =false) String keyword,
			@RequestParam(value="pageNumber", required =false) String pageNumber,
			HttpServletRequest request) {
		ModelAndView mav = new ModelAndView(viewPage);
		ReservationBean reservationBean = new ReservationBean();
		reservationBean.setNum(num);
		reservationBean.setStatus(status);
		int cnt = reservationDao.updateStatus(reservationBean);
		SpaceBean spaceBean = spaceDao.getSpace(spaceNum);
		if(status.equals("????????????")) {
			//????????? ?????????.
			//spacenum
			ReservationBean curResBean = reservationDao.getReservationByNum(num); 
			IncomeBean incomeBean = new IncomeBean();
			incomeBean.setSpacenum(spaceNum);
			incomeBean.setMembernum(spaceBean.getMembernum());
			incomeBean.setType("??????");
			incomeBean.setCategory("??????");
			incomeBean.setPrice(curResBean.getAmounts());
			incomeBean.setNote("????????????");
			incomeBean.setReservationnum(num);
			cnt = incomeDao.insertIncome(incomeBean);
		}
		mav.setViewName("redirect:/"+reservationViewCommand);
		mav.addObject("spaceNum", spaceNum);
		mav.addObject("num", num);
		mav.addObject("pageNumber", pageNumber);
		mav.addObject("whatColumn", whatColumn);
		mav.addObject("keyword", keyword);
		return mav;
	}

	@RequestMapping(value=advertiseCommand)
	public ModelAndView advertiseView(@RequestParam(value="spaceNum")int spaceNum) {
		ModelAndView mav = new ModelAndView(viewPage);
		getPage = "Advertise";
		AdvertiseBean advertiseBean = spaceDao.getAdvertiseBySpaceNum(spaceNum);
		mav.addObject("advertiseBean", advertiseBean);
		mav.addObject("getPage", getPage);
		mav.addObject("spaceNum", spaceNum);
		return mav;
	}
	
	@RequestMapping(value=advertisePurchaseCommand)
	public ModelAndView advertisePurchase(@RequestParam(value="spaceNum")int spaceNum,
			@RequestParam(value="plan")int plan, HttpServletResponse response,
			HttpSession session) throws IOException, ParseException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		ModelAndView mav = new ModelAndView(viewPage);
		
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		AdvertiseBean advertiseBean = spaceDao.getAdvertiseBySpaceNum(spaceNum);
		Date curDate;
		if(advertiseBean == null) {
			//????????????
			curDate = new Date();
		}else {
			//????????????
			curDate = sdf.parse(advertiseBean.getExpiredate());
		}
		cal.setTime(curDate);
		cal.add(Calendar.MONTH, plan);
        String expireDate = sdf.format(cal.getTime());
		System.out.println(expireDate);
		int cnt = -1;
		String msg = null;
		int price = 0;
		if(plan == 1) {
			price = 10000;
		}else if(plan == 3) {
			price = 27000;
		}else if(plan == 6) {
			price = 51000;
		}
		if(advertiseBean == null) {
			//????????????
			advertiseBean = new AdvertiseBean();
			advertiseBean.setSpacenum(spaceNum);
			advertiseBean.setExpiredate(expireDate);
			advertiseBean.setPrice(price);
			cnt = spaceDao.addAdvertise(advertiseBean);
			if(cnt != -1) {
				SpaceBean sBean = new SpaceBean();
				sBean.setNum(spaceNum);
				sBean.setGrade("??????");
				spaceDao.updateGrade(sBean);
			}
			msg = "?????? ????????? ?????????????????????. ???????????? "+expireDate+"?????????.";
			
		}else {
			//????????????
			advertiseBean.setExpiredate(expireDate);
			advertiseBean.setPrice(advertiseBean.getPrice()+price);
			cnt = spaceDao.updateAdvertise(advertiseBean);
			msg = "???????????? ?????????????????????. ???????????? "+expireDate+"?????????.";
		}
		//INCOME 
		MemberBean loginInfo = (MemberBean) session.getAttribute("loginInfo");
		
		IncomeBean incomeBean = new IncomeBean();
		incomeBean.setMembernum(loginInfo.getNum());
		incomeBean.setSpacenum(spaceNum);
		incomeBean.setType("??????");
		incomeBean.setCategory("??????");
		incomeBean.setPrice(price);
		incomeBean.setNote(plan+"?????? ?????? ??????");
		AdvertiseBean adBean = spaceDao.getAdvertiseBySpaceNum(spaceNum);
		incomeBean.setAdvertisenum(adBean.getNum());
		
		incomeDao.insertIncome(incomeBean);
		if(cnt != -1) {
			System.out.println("In Script");
			pw.println("<script>");
			pw.println("alert('"+msg+"');");
			pw.println("location.href='"+advertiseCommand+"?spaceNum="+spaceNum+"'");
			pw.println("</script>");
			pw.flush();
			return null;
		}
		else {
			getPage = "Advertise";
			mav.addObject("getPage", getPage);
			mav.addObject("spaceNum", spaceNum);
			return mav;
		}
	}

	@RequestMapping(value=statisticCommand)
	public ModelAndView statisticView(@RequestParam(value="spaceNum")int spaceNum,
			HttpSession session, HttpServletResponse response) throws JsonGenerationException, JsonMappingException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		ModelAndView mav = new ModelAndView(viewPage);
		SpaceBean spaceBean = spaceDao.getSpace(spaceNum);
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		if(loginInfo == null) {
			if(loginInfo == null) {
				pw.println("<script>");
				pw.println("alert('???????????? ????????? ??????????????????.');");
				pw.println("location.href='miniLogin.member';");
				pw.println("</script>");
				pw.flush();
				return null;
			}
		}
		//????????? - ??????????????? / ????????? / ????????? / ????????? 
		int comResCount = reservationDao.getCompleteReservationCountBySpaceNum(spaceNum);
		Integer totalIncomePrice = incomeDao.getTotalIncomePriceBySpaceNum(spaceNum);
		if(totalIncomePrice == null)
			totalIncomePrice = 0;
		Integer totalExpensePrice = incomeDao.getTotalExpensePriceBySpaceNum(spaceNum);
		if(totalExpensePrice == null)
			totalExpensePrice = 0;
		//??????????????? ??????
		double fixedExpense = totalIncomePrice  * 0.1;
		totalExpensePrice = (int) (totalExpensePrice + fixedExpense);
		int profit = totalIncomePrice - totalExpensePrice;
		
		//?????? ???????????? - ?????????
		//?????? ????????????
		String[] monthWord = {"1???","2???","3???","4???","5???","6???",
				"7???","8???","9???","10???","11???","12???"};
		Map<String, Integer> monthlyCountMap = new HashMap<String, Integer>();
		Map<String, Object> queryParam = new HashMap<String, Object>();
		queryParam.put("spaceNum", String.valueOf(spaceNum));
		for(int i=0;i<monthWord.length;i++) {
			String monthStr = "2021-"+String.format("%02d", (i+1));
			queryParam.put("monthStr", monthStr);
			int mCount = reservationDao.getReservtionCountByMonthAndSpaceNum(queryParam);
			if(mCount <= 0) {
				monthlyCountMap.put(monthWord[i], 0);
			}else {
				monthlyCountMap.put(monthWord[i], mCount);
			}
		}
		ObjectMapper mapper = new ObjectMapper();
		String monthlyJson = mapper.writeValueAsString(monthlyCountMap);
		//????????? ????????????
		List<DayOfWeekCountBean> dayOfWeekCountList = reservationDao.getDayOfWeekCount();
		String[] dowWord = {"???", "???", "???", "???", "???", "???", "???"};
		Map<String, Integer> dowMap = new HashMap<String, Integer>();
		boolean isFind = false;
		for(String dowStr:dowWord) {
			isFind = false;
			for(DayOfWeekCountBean dowBean:dayOfWeekCountList) {
				if(dowBean.getDayofweek().equals(dowStr)) {
					dowMap.put(dowStr, dowBean.getCount());
					isFind = true;
					break;
				}
			}
			if(!isFind) {
				dowMap.put(dowStr, 0);
			}
		}
		mapper = new ObjectMapper();
		String dowJson = mapper.writeValueAsString(dowMap);
		
		//?????? ?????? 
		Map<String, Integer> monthlyProfitMap = new HashMap<String, Integer>();
		queryParam = new HashMap<String, Object>();
		queryParam.put("spaceNum", String.valueOf(spaceNum));
		for(int i=0;i<monthWord.length;i++) {
			String monthStr = "2021-"+String.format("%02d", (i+1));
			queryParam.put("monthStr", monthStr);
			
			Integer iPrice = incomeDao.getIncomePriceByMonthAndSpaceNum(queryParam);
			if(iPrice == null)
				iPrice = 0;
			Integer ePrice = incomeDao.getExpensePriceByMonthAndSpaceNum(queryParam);
			if(ePrice == null)
				ePrice = 0;
			fixedExpense = iPrice * 0.1;
			ePrice = (int) (ePrice + fixedExpense);
			int mProfit = iPrice - ePrice;
			monthlyProfitMap.put(monthWord[i], mProfit);
		}
		String monthlyProfitJson = mapper.writeValueAsString(monthlyProfitMap);
		System.out.println(monthlyProfitJson);
		getPage = "Statistic";
		mav.addObject("spaceNum", spaceNum);
		mav.addObject("getPage", getPage);
		mav.addObject("spaceName", spaceBean.getName());
		mav.addObject("userName", loginInfo.getNickname());
		mav.addObject("monthlyJson", monthlyJson);
		mav.addObject("monthlyProfitJson", monthlyProfitJson);
		
		mav.addObject("comResCount", comResCount);
		mav.addObject("totalIncomePrice", totalIncomePrice);
		mav.addObject("totalExpensePrice", totalExpensePrice);
		mav.addObject("profit", profit);
		mav.addObject("dowJson", dowJson);
		return mav;
	}

	@RequestMapping(value=statisticDetailCommand)
	public ModelAndView statisticDetail(@RequestParam(value="spaceNum")int spaceNum,
			@RequestParam(value="year")int year,
			@RequestParam(value="month")int month) throws ParseException {
		ModelAndView mav = new ModelAndView(viewPage);
		IncomeDetailBean idBean = new IncomeDetailBean();
		idBean.setYear(year);
		idBean.setMonth(month);
		SpaceBean spaceBean = spaceDao.getSpace(spaceNum);
		idBean.setSpaceBean(spaceBean);
		
		//?????? ??? - ?????? income List
		String monthStr = String.format("%d-%02d", year,month);
		Map<String, Object> queryParam = new HashMap<String, Object>();
		queryParam.put("monthStr", monthStr);
		queryParam.put("spaceNum", spaceNum);
		List<IncomeBean> incomeList = incomeDao.getIncomeListByMonth(queryParam);
		List<IncomeBean> expenseList = new ArrayList<IncomeBean>();
		Iterator<IncomeBean> iter = incomeList.iterator();
		while(iter.hasNext()) {
			IncomeBean iBean = iter.next();
			if(iBean.getType().equals("??????")) {
				iter.remove();
				expenseList.add(iBean);
			}
		}
		List<IncomeBean> etcIncomeList = new ArrayList<IncomeBean>();
		iter = incomeList.iterator();
		while(iter.hasNext()) {
			IncomeBean iBean = iter.next();
			if(iBean.getCategory().equals("??????")) {
				iter.remove();
				etcIncomeList.add(iBean);
			}
		}
		List<IncomeBean> etcExpenseList = new ArrayList<IncomeBean>();
		iter = expenseList.iterator();
		while(iter.hasNext()) {
			IncomeBean eBean = iter.next();
			if(eBean.getCategory().equals("??????")) {
				iter.remove();
				etcExpenseList.add(eBean);
			}
		}
		int totalIncomePrice = 0;
		int totalEtcIncomePrice = 0;
		int totalExpensePrice = 0;
		for(IncomeBean iBean:incomeList ) {
			totalIncomePrice += iBean.getPrice();
		}
		for(IncomeBean iBean:etcIncomeList ) {
			totalEtcIncomePrice += iBean.getPrice();
		}
		for(IncomeBean eBean:etcExpenseList ) {
			totalExpensePrice += eBean.getPrice();
		}
		idBean.setRentalIncomeList(incomeList);
		idBean.setTotalRentalIncomePrice(totalIncomePrice);
		idBean.setEtcIncomeList(etcIncomeList);
		idBean.setTotalEtcIncomePrice(totalEtcIncomePrice);
		idBean.setTotalIncomePrice(totalIncomePrice + totalEtcIncomePrice);
		//
		idBean.setCleanExpensePrice(totalIncomePrice); 
		idBean.setMaintenanceExpensePrice(totalIncomePrice); 
		idBean.setTaxExpensePrice(totalIncomePrice); 
		idBean.setFeesExpensePrice(totalIncomePrice);
		idBean.setTotalFixedExpensePrice();
		//
		Calendar cal = Calendar.getInstance();
		AdvertiseBean advertiseBean = spaceDao.getAdvertiseBySpaceNum(spaceNum);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.s");
		if(advertiseBean == null) {
			//?????? ??????.
		}else {
			//?????? ????????? - ????????? ?????????
			String appDateStr = advertiseBean.getApplicationdate();
			Date appDate = sdf.parse(appDateStr);
			String expDateStr = advertiseBean.getExpiredate();
			Date expDate = sdf.parse(expDateStr);
			int currentYear = cal.get(Calendar.YEAR);
			int currentMonth = cal.get(Calendar.MONTH)+1;
			Calendar selectCal = Calendar.getInstance();
			selectCal.set(year, month-1, 1, 0, 0, 0);
			Date selectDateFirstDay = selectCal.getTime(); //??????????????? ????????????
			Date selectDateLastDay; //?????? ????????? ????????? ???
			if(currentYear == year && currentMonth == month) {
				//?????? ????????? ????????? ????????? ??????
				selectDateLastDay = Calendar.getInstance().getTime();
			}else {
				//????????? ????????? ????????? ?????? ?????? ????????? ???
				int maxDay = selectCal.getActualMaximum(Calendar.DAY_OF_MONTH);
				selectCal.set(Calendar.DAY_OF_MONTH, maxDay);
				selectDateLastDay = selectCal.getTime();
			}
			// ?????? ?????? : appDate - expDate
			// ?????? ?????? : selectDateFirstDay - selectDateLastDay
			int useDay = 0;
			if(selectDateFirstDay.after(appDate)) {
				//?????? ????????? ????????? ???????????????????????? ????????????
				if(selectDateFirstDay.after(expDate)) {
					//???????????????????????? ????????? - ????????? ??????
					useDay = 0;
				}else {
					//???????????????????????? ???????????? - ???????????? ??????
					if(selectDateLastDay.after(expDate)) {
						//????????? ??????????????? ?????????????????? ????????? - ?????? ??????
						//????????????????????? ?????????????????????
						long useDayMSec = expDate.getTime() - selectDateFirstDay.getTime();
						useDay = (int)(useDayMSec / (24*60*60*1000) )+1;
					}else {
						//????????? ??????????????? ?????????????????? ???????????? - ????????? ????????????
						useDay = selectCal.getActualMaximum(Calendar.DAY_OF_MONTH);
					}
				}
			}else {
				//?????? ????????? ????????? ???????????????????????? ????????????
				if(selectDateLastDay.after(appDate)) {
					//????????? ??????????????? ?????????????????? ????????? - ?????? ??????
					//?????? ??????????????? ????????????????????????
					long useDayMSec = selectDateLastDay.getTime() - appDate.getTime();
					useDay = (int)(useDayMSec / (24*60*60*1000) )+1;
				}else {
					//???????????????????????? ?????????????????? ???????????? - ???????????? ?????? ??????
					useDay = 0;
				}
			}
			System.out.println("?????? ????????? : " + sdf.format(appDate));
			System.out.println("?????? ????????? : " + sdf.format(expDate));
			System.out.println("?????? ????????? : " + sdf.format(selectDateFirstDay));
			System.out.println("?????? ????????? : " + sdf.format(selectDateLastDay));
			System.out.println("?????? ????????? : " + useDay);
			int avgPrice = 0;
			if(useDay != 0) {
				int adverPrice = advertiseBean.getPrice();
				int totalDay = (int)((expDate.getTime() - appDate.getTime())/(24*60*60*1000))+1;
				avgPrice = (int)(adverPrice / totalDay);
				System.out.println("?????? ?????? : " + adverPrice);
				System.out.println("?????? ??? ???????????? : " + avgPrice);
			}
			idBean.setAdvertiseBean(advertiseBean);
			idBean.setAdvertiseUseDay(useDay);
			idBean.setAdvertiseExpensePrice(useDay * avgPrice);
		}
		//
		idBean.setEtcExpenseList(etcExpenseList);
		idBean.setTotalEtcExpensePrice(totalExpensePrice);
		idBean.setTotalExpensePrice();
		//
		idBean.setTotalProfit();
		idBean.setProfitPerRental();
		
		getPage = "StatisticDetail";
		mav.addObject("getPage", getPage);
		mav.addObject("spaceNum", spaceNum);
		mav.addObject("idBean", idBean);
		return mav;
		
		
	}

	@RequestMapping(value=commentCommand)
	public ModelAndView commentList(@RequestParam(value="spaceNum")int spaceNum,
			@RequestParam(value="pageNumber", required = false)String pageNumber) {
		ModelAndView mav = new ModelAndView(viewPage);
		getPage = "CommentList";
		mav.addObject("getPage", getPage);
		if(pageNumber == null) {
			pageNumber = "1";
		}
		int commentTotalCount = spaceDao.getAllCommentListCountBySpaceNum(spaceNum);
		String url = servletContext.getContextPath() + "/" + commentCommand;
		Paging commentPageInfo = new Paging(pageNumber, "3", commentTotalCount, url, null, null, null);
		List<SpaceCommentBean> commentList = spaceDao.getCommentListBySpaceNum(spaceNum, commentPageInfo);
		for(SpaceCommentBean scBean:commentList) {
			SpaceCommentBean replyBean = spaceDao.getReplyCommentByReplyNum(scBean.getNum());
			scBean.setReplyComment(replyBean);
		}
		mav.addObject("commentTotalCount", commentTotalCount);
		mav.addObject("commentList", commentList);
		mav.addObject("commentPageInfo", commentPageInfo);
		mav.addObject("spaceNum", spaceNum);
		return mav;
	}
	
	@RequestMapping(value=commentReplyCommand)
	public ModelAndView commentReply(SpaceCommentBean spaceCommentBean,
		HttpSession session, HttpServletResponse response, HttpServletRequest request) throws IOException{
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		ModelAndView mav = new ModelAndView(viewPage);
		MemberBean loginInfo = (MemberBean) session.getAttribute("loginInfo");
		if(loginInfo == null) {
			pw.println("<script>");
			pw.println("alert('???????????? ????????? ??????????????????.');");
			pw.println("location.href='miniLogin.member';");
			pw.println("</script>");
			pw.flush();
			return null;
		}
		spaceCommentBean.setMembernum(loginInfo.getNum());
		spaceCommentBean.setWriter(loginInfo.getNickname());
		System.out.println(spaceCommentBean);
		int cnt = -1;
		cnt = spaceDao.insertSpaceComment(spaceCommentBean);
		mav.setViewName("redirect:/"+commentCommand);
		mav.addObject("spaceNum", spaceCommentBean.getSpacenum());
		mav.addObject("pageNumber", request.getParameter("pageNumber"));
		return mav;
	}
}
