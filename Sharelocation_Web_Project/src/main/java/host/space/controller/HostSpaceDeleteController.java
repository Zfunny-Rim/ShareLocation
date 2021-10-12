package host.space.controller;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import detailspace.model.DetailSpaceDao;
import space.model.SpaceDao;

@Controller
public class HostSpaceDeleteController {
	private final String command = "spaceDelete.ho";
	private final String viewPage = "redirect:/spaceList.ho";
	
	@Autowired
	SpaceDao spaceDao;
	@Autowired
	DetailSpaceDao detailSpaceDao;
	@Autowired
	ServletContext servletContext;
	@RequestMapping(value=command)
	public ModelAndView deleteSpace(@RequestParam(value="spaceNum")int spaceNum) {
		ModelAndView mav = new ModelAndView(viewPage);
		//관련된 테이블 - Facility, Image, detailSpace... on delete Cascade 될것임 아마도
		//이미지 파일들만 직접적으로 지워주면 된다.
		// 1. 공간의 메인 이미지 / 2. 공간의 서브 이미지들 / 3. 세부공간의 이미지들
		String mainImageName =  spaceDao.getspaceMainImage(spaceNum);
		List<String> imageFileNameList = spaceDao.getSpaceImageFileListBySpaceNum(spaceNum);  
		List<String> detailImageFileNameList = detailSpaceDao.getSpaceImageBySpaceNum(spaceNum);
		System.out.println("mainImage : " + mainImageName);
		for(String s:imageFileNameList)
			System.out.println("Image : " + s);
		for(String s:detailImageFileNameList)
			System.out.println("DetailImage : " + s);
		int cnt = -1;
		cnt = spaceDao.deleteSpace(spaceNum);
		String uploadPath = servletContext.getRealPath("/resources/spaceimage");
		if(cnt != -1) {
			//mainimage 삭제
			File dFile = new File(uploadPath+"\\"+mainImageName);
			System.out.println("File Delete : " + mainImageName);
			if(dFile.exists())
				dFile.delete();
			//sub image 삭제
			for(String fileName:imageFileNameList) {
				dFile = new File(uploadPath+"\\"+fileName);
				System.out.println("File Delete : " + fileName);
				if(dFile.exists())
					dFile.delete();
			}
			//detailspace image 삭제
			for(String fileName:detailImageFileNameList) {
				dFile = new File(uploadPath+"\\"+fileName);
				System.out.println("File Delete : " + fileName);
				if(dFile.exists())
					dFile.delete();
			}
		}
		return mav;
	}
}
