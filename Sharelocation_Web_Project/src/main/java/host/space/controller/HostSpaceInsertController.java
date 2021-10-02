package host.space.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import space.model.SpaceBean;

@Controller
public class HostSpaceInsertController {
	public final String command = "insertSpace.ho";
	public final String command_tier1 = "insertSpace_1.ho";
	public final String viewPage = "insert/insertSpace";
	public final String gotoPage = "hostSpaceList";
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value=command, method = RequestMethod.GET)
	public ModelAndView doAction() {
		ModelAndView mav = new ModelAndView(viewPage);
		return mav;
	}
	
	@RequestMapping(value=command, method = RequestMethod.POST)
	public ModelAndView insert_tier1(@Valid SpaceBean spaceBean, BindingResult result,
			HttpServletRequest request, MultipartHttpServletRequest mtfRequest,
			HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = response.getWriter();
		ModelAndView mav = new ModelAndView(viewPage);
		
		System.out.println(spaceBean);
		if(result.hasErrors()) {
			System.out.println("has Error");
			return mav;
		}
		mav.setViewName(gotoPage);
		
		//operatingtime 처리
		String operatingtime = ((String)request.getParameter("starttime"))+"~"+
				((String)request.getParameter("endtime"));
		spaceBean.setOperatingtime(operatingtime);
		
		//Tag 처리
		ArrayList<String> tagArray = new ArrayList<String>();
		String tagList = ((String)request.getParameter("spacetag"));
		String[] token = tagList.split(",");
		for(String tag:token) {
			System.out.println("Tag: " + tag);
			tagArray.add(tag);
		}
		
		//mainimage 파일 처리
		String uploadPath = servletContext.getRealPath("/resources/spaceimage");
		MultipartFile mpfMainImage = mtfRequest.getFile("mainimagefile");
		String originFileName = mpfMainImage.getOriginalFilename();
		String safeFileName = System.currentTimeMillis()+"_"+originFileName; // 파일명 중복 막기
		File mainimage_File = new File(uploadPath+"\\"+safeFileName);
		spaceBean.setMainimage(safeFileName);
		
		//spaceimage (다중이미지) 처리
		List<MultipartFile> spImageList = mtfRequest.getFiles("spaceimagefile");
		for(int i=0;i<spImageList.size();i++) {
			MultipartFile mpfSpaceImage = spImageList.get(i);
			String spOriginFileName = mpfSpaceImage.getOriginalFilename();
			String spSafeFileName = (i+1)+"_"+System.currentTimeMillis()+"_"+originFileName; // 파일명 중복 막기
			File spaceImage_File = new File(uploadPath+"\\"+spSafeFileName);
		}
		
		//facility 처리
		String[] facilityList = request.getParameterValues("facility");
		for(String facStr:facilityList) {
			System.out.println(facStr);
		}
		
		pw.println("<script>alert('공간정보가 저장되었습니다.');</script>");
		pw.flush();
		
		return mav;
	}
}
