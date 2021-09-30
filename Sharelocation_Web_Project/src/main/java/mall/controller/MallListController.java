package mall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import mall.model.MallDao;

@Controller
public class MallListController {
	private final String command ="/list.mall";
	private final String getPage ="mallMain";
	
	@Autowired
	MallDao mdao;
	
	@RequestMapping(value = command,method = RequestMethod.GET)
	public String doAction() {
		return getPage;
	}
	
}
