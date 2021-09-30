package host.space.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import space.model.SpaceBean;

@Controller
public class HostSpaceInsertController {
	public final String command = "insertSpace.ho";
	public final String command_tier1 = "insertSpace_1.ho";
	public final String viewPage = "insert/insertSpace";
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value=command)
	public ModelAndView doAction() {
		ModelAndView mav = new ModelAndView(viewPage);
		return mav;
	}
	
	@RequestMapping(value=command_tier1)
	public ModelAndView insert_tier1(SpaceBean spaceBean, HttpServletRequest request, MultipartHttpServletRequest mtfRequest) {
		ModelAndView mav = new ModelAndView(viewPage);
		//email처리
		String email = ((String)request.getParameter("email_id"))+"@"+((String)request.getParameter("email_domain"));
		spaceBean.setEmail(email);
		//hp처리
		String hp = ((String)request.getParameter("hp1"))+"-"+
					((String)request.getParameter("hp2"))+"-"+
					((String)request.getParameter("hp3"));
		spaceBean.setHp(hp);
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
		MultipartFile mpfMainImage = mtfRequest.getFile("mainimage_file");
		String originFileName = mpfMainImage.getOriginalFilename();
		String safeFileName = System.currentTimeMillis()+"_"+originFileName; // 파일명 중복 막기
		File mainimage_File = new File(uploadPath+"\\"+safeFileName);
		spaceBean.setMainimage(safeFileName);
		
		//spaceimage (다중이미지) 처리
		List<MultipartFile> spImageList = mtfRequest.getFiles("spaceimage_file");
		for(int i=0;i<spImageList.size();i++) {
			MultipartFile mpfSpaceImage = spImageList.get(i);
			String spOriginFileName = mpfSpaceImage.getOriginalFilename();
			String spSafeFileName = (i+1)+"_"+System.currentTimeMillis()+"_"+originFileName; // 파일명 중복 막기
			File spaceImage_File = new File(uploadPath+"\\"+spSafeFileName);
			
		}
		
		System.out.println(spaceBean);
		return mav;
	}
}
