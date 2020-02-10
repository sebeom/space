package space.myInfo.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import space.common.common.CommandMap;
import space.myInfo.service.myInfoService;
import space.myInfo.service.myInfoServiceImpl;

@Controller
public class myInfoController {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="myInfoService")
	private myInfoServiceImpl myInfoService;
	
	@RequestMapping("mypage/Mymenu")
	public ModelAndView Mymenu(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("mypage/myPageMenu");
		
		return mv;
			
	}

	@RequestMapping("mypage/Myqnalist")
	public ModelAndView Myqnalist(Map<String, Object> commandMap) throws Exception{
	ModelAndView mv = new ModelAndView("mypage/myQnaList");
	List<Map<String, Object>> list = myInfoService.selectUserAdQNAList(commandMap);
	mv.addObject("list", list);
	
	return mv;
	
   }
	
	@RequestMapping("mypage/Myqnawrite") // �۾��� �� ����
	public ModelAndView Myqnawrite(CommandMap commandMap) throws Exception{
	ModelAndView mv = new ModelAndView("mypage/myQnaWrite");
	
	return mv;
	
	}
	
	@RequestMapping("mypage/MyqnaWrite") // �۾��� ����Ʈ�� ������
	public ModelAndView MyqnaWrite(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/mypage/Myqnalist");
		myInfoService.insertUserAdQNAWrite(commandMap.getMap());
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
		ModelAndView mv = new ModelAndView("redirect:/mypage/Myqnalist");
		myInfoService.deleteQNA(commandMap.getMap());
		
		return mv;
		
	}
}

