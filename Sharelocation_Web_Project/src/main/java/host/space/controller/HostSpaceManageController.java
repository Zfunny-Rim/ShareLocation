package host.space.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

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
import member.model.MemberBean;
import reservation.model.BalanceBean;
import reservation.model.BalanceDao;
import space.model.SpaceBean;
import space.model.SpaceDao;
import space.model.SpaceFacilityBean;
import space.model.SpaceImageBean;

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
	private final String viewPage = "manage/hostSpaceManage";
	private String getPage;
	
	@Autowired
	SpaceDao spaceDao;
	@Autowired
	DetailSpaceDao detailSpaceDao;
	@Autowired
	BalanceDao balanceDao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value=homeCommand)
	public ModelAndView goHome(@RequestParam(value="spaceNum") int spaceNum,
			@RequestParam(value="tab", required = false) String tab) {
		ModelAndView mav = new ModelAndView(viewPage);
		SpaceBean spaceBean = spaceDao.getSpace(spaceNum);
		
		List<DetailSpaceBean> dspList =  detailSpaceDao.getDetailSpaceListBySpaceNum(spaceNum);
		List<SpaceImageBean> spImgList = spaceDao.getSpaceImageListBySpaceNum(spaceNum);
		mav.addObject("spaceNum", spaceNum);
		mav.addObject("spaceBean",spaceBean);
		mav.addObject("dspList",dspList);
		mav.addObject("spImgList", spImgList);
		
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
		
		
		//mainimage ���� ó��
		String uploadPath = servletContext.getRealPath("/resources/spaceimage");
		File mainimage_File = null;
		MultipartFile mpfMainImage = null;
		
		if(!spaceBean.getMainimage().equals(spaceBean.getMainimageOrigin())) {
			//Origin�� �̸��� ���ٸ� ������ �Ͼ�� ����.
			mpfMainImage = mtfRequest.getFile("mainimageupdatefile");
			String originFileName = mpfMainImage.getOriginalFilename();
			String safeFileName = System.currentTimeMillis()+"_"+originFileName; // ���ϸ� �ߺ� ����
			mainimage_File = new File(uploadPath+"\\"+safeFileName);
			spaceBean.setMainimage(safeFileName); 
			System.out.println("mainimage : " + spaceBean.getMainimage());
		}
		int cnt = -1;
		cnt = spaceDao.updateSpace(spaceBean);
		
		if(cnt != -1) {
			if(mpfMainImage != null && mainimage_File != null) {
				mpfMainImage.transferTo(mainimage_File);
				//TODO: ���� �����̹��� ���� ���� �۾�
				File dFile = new File(uploadPath+"\\"+spaceBean.getMainimageOrigin());
				System.out.println(dFile.getPath());
				if(dFile.exists()) {
					dFile.delete();
				}
			}
		}
		//spaceimage (�����̹���) ó��
		//
		if(spaceBean.getSpaceimageupdate().size() != 0) {
			//modify Form���� ���ε��� �̹����� 0���� ������ �Ͼ�� ����.
			//������ �Ͼ�ٸ� �켱 ��� �̹����� �����.
			//TODO: ���� �̹��� ���ϵ� ���� �۾�
			List<SpaceImageBean> spaceImageList = spaceDao.getImage(spaceBean.getNum());
			for(SpaceImageBean siBean:spaceImageList) {
				String imageFileName = siBean.getImage();
				File dFile = new File(uploadPath+"\\"+imageFileName);
				System.out.println(dFile.getPath());
				if(dFile.exists()) {
					dFile.delete();
				}
			}
			//DB������ ����
			spaceDao.deleteSpaceImageBySpaceNum(spaceBean.getNum());
			
			//������ ������ ���ε��Ѵ�.
			List<MultipartFile> spImageList = mtfRequest.getFiles("spaceimageupdatefile");
			for(int i=0;i<spImageList.size();i++) {
				MultipartFile mpfSpaceImage = spImageList.get(i);
				String spOriginFileName = mpfSpaceImage.getOriginalFilename();
				String spSafeFileName = System.currentTimeMillis()+"_"+(i+1)+"_"+spOriginFileName; // ���ϸ� �ߺ� ����
				File spaceImage_File = new File(uploadPath+"\\"+spSafeFileName);
				cnt = -1;
				SpaceImageBean spaceImageBean = new SpaceImageBean(0, spaceBean.getNum(), spSafeFileName);
				cnt = spaceDao.insertSpaceImage(spaceImageBean);
				if(cnt != -1) {
					//DB���忡 ���������� �̹����� ������ ���ε�
					mpfSpaceImage.transferTo(spaceImage_File);
				}
			}
		}
		
		//facility ó��
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
			mav.setViewName(viewPage);
			mav.addObject("spaceNum", detailSpaceBean.getSpacenum());
			return mav;
		}
		
		//mainimage ���� ó��
		String uploadPath = servletContext.getRealPath("/resources/spaceimage");
		MultipartFile mpfMainImage = mtfRequest.getFile("mainimagefile");
		String originFileName = mpfMainImage.getOriginalFilename();
		String safeFileName = System.currentTimeMillis()+"_"+originFileName; // ���ϸ� �ߺ� ����
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
		
		DetailSpaceBean detailSpaceBean = detailSpaceDao.getdetailspace(detailSpaceNum);
		
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
		//mainimage ���� ó��
		String uploadPath = servletContext.getRealPath("/resources/spaceimage");
		File mainimage_File = null;
		MultipartFile mpfMainImage = null;
		
		if(!detailSpaceBean.getMainimage().equals(detailSpaceBean.getMainimageOrigin())) {
			//Origin�� �̸��� ���ٸ� ������ �Ͼ�� ����.
			mpfMainImage = mtfRequest.getFile("mainimageupdatefile");
			String originFileName = mpfMainImage.getOriginalFilename();
			String safeFileName = System.currentTimeMillis()+"_"+originFileName; // ���ϸ� �ߺ� ����
			mainimage_File = new File(uploadPath+"\\"+safeFileName);
			detailSpaceBean.setMainimage(safeFileName); 
		}		
		int cnt = -1;
		cnt = detailSpaceDao.updateDSpace(detailSpaceBean);
		if(cnt != -1) {
			if(mainimage_File != null && mpfMainImage != null) {
				mpfMainImage.transferTo(mainimage_File);
				//TODO: ���� �����̹��� ���� ���� �۾�
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
			HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		int memberNum = 0;
		if(loginInfo == null) {
			System.out.println("�α��� �ȵǾ�����. �ӽ� ��ȣ ���.");
			memberNum = 1;
		}else {
			memberNum = loginInfo.getNum();
		}
		BalanceBean balanceBean = balanceDao.getBalance(memberNum);
		if(balanceBean == null) {
			//�������� �Է����� �̵�
			mav.setViewName("redirect:/spaceManageBalanceInsert.ho");
		}else {
			//�������� �󼼺���� �̵�
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
			HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView(viewPage);
		int spaceNum = Integer.parseInt(request.getParameter("spacenum"));
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		int memberNum = 0;
		if(loginInfo == null) {
			System.out.println("�α��� �ȵǾ�����. �ӽ� ��ȣ ���.");
			memberNum = 1;
		}else {
			memberNum = loginInfo.getNum();
		}
		
		System.out.println(balanceBean);
		if(result.hasErrors()) {
			getPage = "BalanceInsert";
			mav.addObject("getPage", getPage);
			mav.addObject("spaceNum", spaceNum);
			return mav;
		}
		balanceBean.setMembernum(memberNum);
		int cnt = balanceDao.insertBalance(balanceBean);
		mav.setViewName("redirect:/"+balanceViewCommand);
		mav.addObject("spaceNum", spaceNum);
		return mav;
	}
	
	@RequestMapping(value=balanceViewCommand, method=RequestMethod.GET)
	public ModelAndView balanceView(@RequestParam(value="spaceNum")int spaceNum,
			HttpSession session) {
		ModelAndView mav = new ModelAndView(viewPage);
		getPage = "BalanceView";
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		int memberNum = 0;
		if(loginInfo == null) {
			System.out.println("�α��� �ȵǾ�����. �ӽ� ��ȣ ���.");
			memberNum = 1;
		}else {
			memberNum = loginInfo.getNum();
		}
		BalanceBean balanceBean = balanceDao.getBalance(memberNum);
		mav.addObject("balanceBean", balanceBean);
		mav.addObject("getPage", getPage);
		mav.addObject("spaceNum", spaceNum);
		return mav;
	}

	@RequestMapping(value=balanceModifyCommand, method=RequestMethod.GET)
	public ModelAndView balanceModifyForm(@RequestParam(value="spaceNum")int spaceNum,
			HttpSession session) {
		ModelAndView mav = new ModelAndView(viewPage);
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		int memberNum = 0;
		if(loginInfo == null) {
			System.out.println("�α��� �ȵǾ�����. �ӽ� ��ȣ ���.");
			memberNum = 1;
		}else {
			memberNum = loginInfo.getNum();
		}
		getPage = "BalanceModify";
		BalanceBean balanceBean = balanceDao.getBalance(memberNum);
		mav.addObject("balanceBean", balanceBean);
		mav.addObject("getPage", getPage);
		mav.addObject("spaceNum", spaceNum);
		return mav;
	}
	
	@RequestMapping(value=balanceModifyCommand, method=RequestMethod.POST)
	public ModelAndView balanceModifyProc(@Valid BalanceBean balanceBean, BindingResult result, 
			HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView(viewPage);
		int spaceNum = Integer.parseInt(request.getParameter("spacenum"));
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		int memberNum = 0;
		if(loginInfo == null) {
			System.out.println("�α��� �ȵǾ�����. �ӽ� ��ȣ ���.");
			memberNum = 1;
		}else {
			memberNum = loginInfo.getNum();
		}
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
		//��Ű�� �ð� ��ø�Ǵ��� Ȯ���ؾ���
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
			System.out.println("��Ű�� �ð��� "+ppBean.getTitle()+" ��Ű���� �ߺ��˴ϴ�.");
			System.out.println("�Է� �ð� : "+check_in+"~"+check_out);
			System.out.println(ppBean.getTitle()+" �ð� : "+ppBean.getCheckintime()+"~"+ppBean.getCheckouttime());
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
}
