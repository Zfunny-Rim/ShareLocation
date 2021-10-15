package admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import detailspace.model.DetailSpaceBean;
import detailspace.model.DetailSpaceDao;
import member.model.MemberBean;
import member.model.MemberDao;
import reservation.model.BalanceBean;
import reservation.model.BalanceDao;
import space.model.SpaceBean;
import space.model.SpaceDao;
import space.model.SpaceFacilityBean;
import space.model.SpaceImageBean;

@Controller
public class AdminApprovalController {
	private final String listCommand = "approvalList.admin";
	private final String viewCommand = "approvalView.admin";
	private final String procCommand = "approvalProc.admin";
	private final String viewListPage = "approvalList";
	private final String viewPage = "approvalView";
	@Autowired
	SpaceDao spaceDao;
	@Autowired
	MemberDao memberDao;
	@Autowired
	DetailSpaceDao detailSpaceDao;
	@Autowired
	BalanceDao balanceDao;
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
		BalanceBean balanceBean= balanceDao.getBalanceByMemberNum(spaceBean.getMembernum());
		List<DetailSpaceBean> dspList = detailSpaceDao.getDetailSpaceBySpaceNum(spaceBean.getNum());
		mav.addObject("spaceBean", spaceBean);
		mav.addObject("memberBean", memberBean);
		mav.addObject("balanceBean", balanceBean);
		mav.addObject("dspList", dspList);
		mav.addObject("spImgList", spImgList);
		mav.addObject("spFacList", spFacList);
		return mav;
	}
	
	@RequestMapping(value=procCommand)
	public ModelAndView approvalProc(@RequestParam(value="spaceNum")int spaceNum,
			@RequestParam(value="flag")boolean flag, HttpServletResponse response) throws IOException {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter pw = response.getWriter();
			ModelAndView mav = new ModelAndView(viewPage);
			SpaceBean spaceBean = new SpaceBean();
			spaceBean.setNum(spaceNum);
			if(flag) {
				spaceBean.setStatus("운영중");
			}else {
				spaceBean.setStatus("검수반려");
			}
			int cnt = -1;
			cnt = spaceDao.updateSpaceStatus(spaceBean);
			if(cnt != -1) {
				pw.println("<script>");
				pw.println("alert('검수가 처리되었습니다.');");
				pw.println("location.href='"+listCommand+"';");
				pw.println("</script>");
				pw.flush();
				return null;
			}
			mav.setViewName("redirect:/"+viewCommand);
			mav.addObject("spaceNum", spaceNum);
			return mav;
	}
}