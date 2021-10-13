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
	private final String gotoPage = "redirect:/spaceManageDetailSpace.ho";
	
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
	
}
