package space.main.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import space.common.common.CommandMap;

@Controller
public class adminSpaceController {
	
	@RequestMapping("admin/spaceList")
	public ModelAndView AdminSpaceList(CommandMap commandMap, 
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("admin/spaceList");
		return mv;
	}

}
