package host.space.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
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

@Controller
public class HostDetailSpaceInsertController {
	private final String command = "/detailSpaceInsert.ho";
	private final String viewPage = "insert/hostDetailSpaceInsert";
	private final String gotoPage = "redirect:/detailSpaceList.ho";
	
	@Autowired
	DetailSpaceDao detailSpaceDao;
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public ModelAndView gotoInsertPage(@RequestParam("spaceNum") int spaceNum) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewPage);
		mav.addObject("spaceNum", spaceNum);
		return mav;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
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
		
		//mainimage 파일 처리
		String uploadPath = servletContext.getRealPath("/resources/spaceimage");
		MultipartFile mpfMainImage = mtfRequest.getFile("mainimagefile");
		String originFileName = mpfMainImage.getOriginalFilename();
		String safeFileName = System.currentTimeMillis()+"_"+originFileName; // 파일명 중복 막기
		File mainimage_File = new File(uploadPath+"\\"+safeFileName);
		detailSpaceBean.setMainimage(safeFileName);
		
		int cnt = -1;
		cnt = detailSpaceDao.insertDSpace(detailSpaceBean);
		if(cnt != -1) {
			mpfMainImage.transferTo(mainimage_File);
		}
		
		mav.addObject("spaceNum", detailSpaceBean.getSpacenum());
		mav.setViewName(gotoPage);
		return mav;
	}
}
