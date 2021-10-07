package host.space.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
import space.model.SpaceDao;
import space.model.SpaceFacilityBean;
import space.model.SpaceImageBean;
import space.model.SpaceTagBean;

@Controller
public class HostSpaceInsertController {
	public final String command = "insertSpace.ho";
	public final String command_tier1 = "insertSpace_1.ho";
	public final String viewPage = "insert/insertSpace";
	public final String gotoPage = "redirect:/spaceList.ho";
	
	@Autowired
	ServletContext servletContext;
	@Autowired
	SpaceDao spaceDao;
	
	@RequestMapping(value=command, method = RequestMethod.GET)
	public ModelAndView doAction() {
		ModelAndView mav = new ModelAndView(viewPage);
		return mav;
	}
	
	@RequestMapping(value=command, method = RequestMethod.POST)
	public ModelAndView insert_tier1(@Valid SpaceBean spaceBean, BindingResult result,
			HttpServletRequest request, MultipartHttpServletRequest mtfRequest,
			HttpServletResponse response, HttpSession session) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = response.getWriter();
		ModelAndView mav = new ModelAndView(viewPage);
		
		
		if(result.hasErrors()) {
			System.out.println("has Error");
			return mav;
		}
		mav.setViewName(gotoPage);
		//set memberNum (session ���� �����;���)
		spaceBean.setMembernum(1); //�ӽ�
		//set Status (��ϴ�� - �˼����/�˼��Ϸ�/���/�����) 
		spaceBean.setStatus("��ϴ��");
		//set grade (�⺻ - �⺻/����Ʈ��õ)
		spaceBean.setGrade("�⺻");
		
		//operatingtime ó��
		String operatingtime = request.getParameter("starttime");
		String operatingendtime = request.getParameter("endtime");
		spaceBean.setOperatingtime(operatingtime);
		spaceBean.setOperatingendtime(operatingendtime);
		
		//mainimage ���� ó��
		String uploadPath = servletContext.getRealPath("/resources/spaceimage");
		session.setAttribute("uploadPath", uploadPath);
		
		MultipartFile mpfMainImage = mtfRequest.getFile("mainimagefile");
		String originFileName = mpfMainImage.getOriginalFilename();
		String safeFileName = System.currentTimeMillis()+"_"+originFileName; // ���ϸ� �ߺ� ����
		File mainimage_File = new File(uploadPath+"\\"+safeFileName);
		spaceBean.setMainimage(safeFileName); 
		
	  
		
		System.out.println("test1");
		System.out.println(spaceBean);
		
		
		///DB�� ����
		int cnt = -1;
		cnt = spaceDao.insertSpace(spaceBean);
		System.out.println("test2");
		
		//DB���忡 ���������� �̹����� ������ ���ε�
		if(cnt != -1) {
			mpfMainImage.transferTo(mainimage_File);
		}
		int spaceNum = spaceDao.getRecentSpaceNum();
		
		//spaceimage (�����̹���) ó��
		List<MultipartFile> spImageList = mtfRequest.getFiles("spaceimagefile");
		for(int i=0;i<spImageList.size();i++) {
			MultipartFile mpfSpaceImage = spImageList.get(i);
			String spOriginFileName = mpfSpaceImage.getOriginalFilename();
			String spSafeFileName = System.currentTimeMillis()+"_"+(i+1)+"_"+spOriginFileName; // ���ϸ� �ߺ� ����
			File spaceImage_File = new File(uploadPath+"\\"+spSafeFileName);
			cnt = -1;
			SpaceImageBean spaceImageBean = new SpaceImageBean(0, spaceNum, spSafeFileName);
			cnt = spaceDao.insertSpaceImage(spaceImageBean);
			if(cnt != -1) {
				//DB���忡 ���������� �̹����� ������ ���ε�
				mpfSpaceImage.transferTo(spaceImage_File);
			}
		}
		
		//facility ó��
		String[] facilityList = request.getParameterValues("facility");
		for(String facStr:facilityList) {
			SpaceFacilityBean sfBean = new SpaceFacilityBean(0, spaceNum, facStr);
			cnt = -1;
			cnt = spaceDao.insertSpaceFacility(sfBean);
		}
		
		//Tag ó��
		String tagList = ((String)request.getParameter("spacetag"));
		String[] token = tagList.split(",");
		for(String tag:token) {
			SpaceTagBean stBean = new SpaceTagBean(0, spaceNum, tag);
			cnt = -1;
			cnt = spaceDao.insertSpaceTag(stBean);
		}
		
//		pw.println("<script>alert('���������� ����Ǿ����ϴ�.');</script>");
//		pw.flush();
		
		return mav;
	}
}
