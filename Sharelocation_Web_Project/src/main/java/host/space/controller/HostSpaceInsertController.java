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

import member.model.MemberBean;
import space.model.SpaceBean;
import space.model.SpaceDao;
import space.model.SpaceFacilityBean;
import space.model.SpaceImageBean;

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
	public ModelAndView doAction(HttpSession session, HttpServletResponse response) throws IOException {
		ModelAndView mav = new ModelAndView(viewPage);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		if(loginInfo == null) {
			pw.println("<script>");
			pw.println("alert('로그인이 필요한 서비스입니다.');");
			pw.println("location.href='miniLogin.member';");
			pw.println("</script>");
			return null;
		}else if(!loginInfo.getType().equals("host")) {
			pw.println("<script>");
			pw.println("alert('호스트만 이용가능한 서비스입니다.');");
			pw.println("location.href='main.ho';");
			pw.println("</script>");  
			return null;
		}
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
		//set memberNum (session 에서 가져와야함)
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");
		if(loginInfo == null) {
			pw.println("<script>");
			pw.println("alert('로그인 세션이 만료되었습니다.');");
			pw.println("location.href='main.ho';");
			pw.println("</script>");
			return null;
		}
		spaceBean.setMembernum(loginInfo.getNum()); //임시
		//set Status (등록대기 - 검수대기/검수완료/운영중/비공개) 
		spaceBean.setStatus("등록대기");
		//set grade (기본 - 기본/사이트추천)
		spaceBean.setGrade("기본");
		
		//mainimage 파일 처리
		String uploadPath = servletContext.getRealPath("/resources/spaceimage");
		session.setAttribute("uploadPath", uploadPath);
		
		MultipartFile mpfMainImage = mtfRequest.getFile("mainimagefile");
		String originFileName = mpfMainImage.getOriginalFilename();
		String safeFileName = System.currentTimeMillis()+"_"+originFileName; // 파일명 중복 막기
		File mainimage_File = new File(uploadPath+"\\"+safeFileName);
		spaceBean.setMainimage(safeFileName); 
		
		System.out.println("test1");
		System.out.println(spaceBean);
		
		
		///DB에 저장
		int cnt = -1;
		cnt = spaceDao.insertSpace(spaceBean);
		System.out.println("test2");
		
		//DB저장에 성공했으면 이미지도 서버에 업로드
		if(cnt != -1) {
			mpfMainImage.transferTo(mainimage_File);
		}
		int spaceNum = spaceDao.getRecentSpaceNum();
		
		//spaceimage (다중이미지) 처리
		List<MultipartFile> spImageList = mtfRequest.getFiles("spaceimagefile");
		for(int i=0;i<spImageList.size();i++) {
			MultipartFile mpfSpaceImage = spImageList.get(i);
			String spOriginFileName = mpfSpaceImage.getOriginalFilename();
			String spSafeFileName = System.currentTimeMillis()+"_"+(i+1)+"_"+spOriginFileName; // 파일명 중복 막기
			File spaceImage_File = new File(uploadPath+"\\"+spSafeFileName);
			cnt = -1;
			SpaceImageBean spaceImageBean = new SpaceImageBean(0, spaceNum, spSafeFileName);
			cnt = spaceDao.insertSpaceImage(spaceImageBean);
			if(cnt != -1) {
				//DB저장에 성공했으면 이미지도 서버에 업로드
				mpfSpaceImage.transferTo(spaceImage_File);
			}
		}
		
		//facility 처리
		String[] facilityList = request.getParameterValues("facility");
		for(String facStr:facilityList) {
			SpaceFacilityBean sfBean = new SpaceFacilityBean(0, spaceNum, facStr);
			cnt = -1;
			cnt = spaceDao.insertSpaceFacility(sfBean);
		}
		
//		pw.println("<script>alert('공간정보가 저장되었습니다.');</script>");
//		pw.flush();
		
		return mav;
	}
}