package admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import detailspace.model.DetailSpaceBean;
import detailspace.model.DetailSpaceDao;
import member.model.MemberBean;
import member.model.MemberDao;
import space.model.SpaceBean;
import space.model.SpaceDao;
import space.model.SpaceFacilityBean;
import space.model.SpaceImageBean;

@Controller
public class AdminApprovalController {
	private final String listCommand = "approvalList.admin";
	private final String viewCommand = "approvalView.admin";
	private final String viewListPage = "approvalList";
	private final String viewPage = "approvalView";
	@Autowired
	SpaceDao spaceDao;
	@Autowired
	MemberDao memberDao;
	@Autowired
	DetailSpaceDao detailSpaceDao;
	@RequestMapping(value=listCommand)
	public ModelAndView goList() {
		ModelAndView mav = new ModelAndView(viewListPage);
		List<SpaceBean> approvalList = spaceDao.getSpaceApprovalWaitingList();
		for(SpaceBean sBean:approvalList) {
			String mNick = memberDao.getMemberNickNameByNum(sBean.getMembernum());
			sBean.setMnickname(mNick);
		}
		mav.addObject("approvalList", approvalList);
		
		return mav;
	}
	
	@RequestMapping(value=viewCommand)
	public ModelAndView viewSpace(@RequestParam(value="spaceNum")int spaceNum) {
		ModelAndView mav = new ModelAndView(viewPage);
		SpaceBean spaceBean = spaceDao.getSpace(spaceNum);
		List<SpaceImageBean> spImgList = spaceDao.getSpaceImageListBySpaceNum(spaceNum);
		List<SpaceFacilityBean> spFacList = spaceDao.getFacility(spaceNum);
		MemberBean memberBean = memberDao.getMemberByNum(spaceBean.getMembernum());
		List<DetailSpaceBean> dspList = detailSpaceDao.getDetailSpaceBySpaceNum(spaceBean.getNum());
		mav.addObject("spaceBean", spaceBean);
		mav.addObject("memberBean", memberBean);
		mav.addObject("dspList", dspList);
		mav.addObject("spImgList", spImgList);
		mav.addObject("spFacList", spFacList);
		return mav;
	}
}
