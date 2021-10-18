package reservation.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import reservation.model.ReservationDao;

@Controller
public class reservationCancelController {
	
	private final String command="/reservationdelete.rv";
	
	@Autowired
	ReservationDao reservationDao;
	
	@RequestMapping(value= command)
	public ModelAndView doAction(ModelAndView mav,
			@RequestParam(value = "pageNumber",required=false) String pageNumber,
			@RequestParam(value = "num") int num,
			HttpServletResponse response
			) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		int cnt = reservationDao.reservationCancel(num); 
		PrintWriter pw = response.getWriter();
		if(cnt != -1) {
			pw.println("<script>");
			pw.println("alert('예약 취소되었습니다.');");
			pw.println("location.href='reservList.rv?pageNumber="+pageNumber+"';");
			pw.println("</script>");
			pw.flush();
			return null;
		}
		return mav;
	}
}