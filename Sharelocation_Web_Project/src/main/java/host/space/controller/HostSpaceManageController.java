package host.space.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import detailspace.model.DetailSpaceBean;
import detailspace.model.DetailSpaceDao;
import space.model.SpaceBean;
import space.model.SpaceDao;
import space.model.SpaceFacilityBean;
import space.model.SpaceImageBean;

@Controller
public class HostSpaceManageController {
	private final String homeCommand = "spaceManage.ho";
	private final String modifyCommand = "spaceManageModify.ho";
	private final String viewPage = "manage/hostSpaceManage";
	private String getPage;
	
	@Autowired
	SpaceDao spaceDao;
	@Autowired
	DetailSpaceDao detailSpaceDao;
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value=homeCommand)
	public ModelAndView goHome(@RequestParam(value="spaceNum") int spaceNum,
			@RequestParam(value="tab", required = false) String tab) {
		ModelAndView mav = new ModelAndView(viewPage);
		SpaceBean spaceBean = spaceDao.getSpace(spaceNum);
		
		List<DetailSpaceBean> dspList =  detailSpaceDao.getDetailSpaceListBySpaceNum(spaceNum);
		List<SpaceImageBean> spImgList = spaceDao.getSpaceImageListBySpaceNum(spaceNum);
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
		
		System.out.println(spaceBean.getMainimage() + " ?= " + spaceBean.getMainimageOrigin());
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
}
