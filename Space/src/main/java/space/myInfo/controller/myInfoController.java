package space.myInfo.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import space.common.common.CommandMap;
import space.common.logger.LoggerAspect;
import space.myInfo.service.myInfoService;

@Controller
public class myInfoController {

	Logger log = Logger.getLogger(LoggerAspect.class);
	
	@Resource(name="myInfoService")
	private myInfoService myInfoService;
	
	@RequestMapping("mypage/Mymenu")
	public ModelAndView Mymenu(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("mypage/myPageMenu");
		
		return mv;
			
	}

	@RequestMapping(value="/myInfo/QNAList",method = RequestMethod.GET)
	public ModelAndView Myqnalist(CommandMap commandMap) throws Exception{
	ModelAndView mv = new ModelAndView("QNAList");
		
	return mv;
	
   }
	@RequestMapping(value="/myInfo/QNAList",method = RequestMethod.POST) // �۾��� ����Ʈ�� ������

	public ModelAndView MyqnaWrite(CommandMap commandMap,HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/myInfo/QNAList");
		commandMap.put("USER_ID", session.getAttribute("USER_ID"));
		myInfoService.insertUserAdQNAWrite(commandMap.getMap());
		return mv;
		
	}
	@RequestMapping("mypage/selectqnalist")
	public ModelAndView selectqnalist(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		
		List<Map<String, Object>> list = myInfoService.selectUserAdQNAList(commandMap.getMap());
		mv.addObject("list", list);
		if(list.size() > 0) {
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		}
		
		else {
		mv.addObject("TOTAL", 0);	
		}
		
		return mv;
}
	@RequestMapping("/mypage/Myqnawrite") // �۾��� �� ����
	public ModelAndView Myqnawrite(CommandMap commandMap) throws Exception{
	ModelAndView mv = new ModelAndView("myQnaWrite");
	
	return mv;
	
	}
	

	
	@RequestMapping("mypage/Myqnadetail")
	public ModelAndView Myqnadetail(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("mypage/myQnaDetail");
		Map<String, Object> map = myInfoService.selectAdminQNADetail(commandMap.getMap());
		mv.addObject("map", map);
		
		return mv;
		
	}
	
	@RequestMapping("mypage/Myqnaupdate") // ���� �� ����
	public ModelAndView Myqnaupdate(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/mypage/myQnaUpdate");
		Map<String, Object> map = myInfoService.selectAdminQNADetail(commandMap.getMap());
		mv.addObject("map", map);
		
		return mv;
		
	}
	
	@RequestMapping("mypage/MyqnaUpdate") // ���� �ϱ�
	public ModelAndView MyqnaUpdate(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/mypage/Myqnadetail");
		myInfoService.updateAdQNA(commandMap.getMap());
		mv.addObject("ADQNA_NUM", commandMap.get("ADQNA_NUM"));
		
		return mv;
		
	}
	
	@RequestMapping("mypage/Myqnadelete")
	public ModelAndView Myqnadelete(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("QNAList");
		myInfoService.deleteQNA(commandMap.getMap());
		
		return mv;
		
	}
}

