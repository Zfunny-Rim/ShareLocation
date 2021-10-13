package reservation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class reservationViewController {


	private final String command="/reserrr.rv";
	private final String getPage="reservationview";
	
	@RequestMapping(value = command)
	public String doAction() {
		
		return getPage;
	}
}
