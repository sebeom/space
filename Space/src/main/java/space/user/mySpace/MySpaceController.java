package space.user.mySpace;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import space.common.common.CommandMap;


@Controller
@SessionAttributes
public class MySpaceController {

	Logger log=Logger.getLogger(this.getClass());
		
		@Resource(name = "mySpaceService")
		private MySpaceService mySpaceService;
		
		@RequestMapping(value="/mypage/myFavList")
		public ModelAndView favSpaceList(CommandMap commandMap,HttpSession session) throws Exception{
			ModelAndView mv=new ModelAndView("myFav");
			commandMap.put("USER_ID", "admin");
			
			List<Map<String,Object>> list = mySpaceService.selectFavList(commandMap.getMap());
			
			mv.addObject("LIKE_LIST",list);
			return mv;
		}
		
		@RequestMapping(value="/mypage/deleteFav")
		public ModelAndView updateFav(CommandMap map)throws Exception{
			
			ModelAndView mav = new ModelAndView("redirect:/mypage/myFavList");
			mySpaceService.deleteFav(map.getMap());
			//mySpaceService.updateFavCountDec(map.getMap());

			return mav;
		}
		
		//�����Ȳ
	@RequestMapping("/mySpace/ResPage")
	public ModelAndView mySpaceResPage(CommandMap map,HttpSession session) {
		ModelAndView mv = new ModelAndView("mySpaceResList");
		map.put("USER_ID", session.getAttribute("USER_ID"));
		List<Map<String,Object>> list = mySpaceService.selectResDateList(map.getMap());
		
		mv.addObject("DATE_LIST",list);
		return mv;
	}
	@RequestMapping("/mySpace/ResList")
	public ModelAndView getResList(CommandMap map,HttpSession session) {
		ModelAndView mav = new ModelAndView("jsonView");
		if(session.getAttribute("USER_ID") == null) {
			return new ModelAndView("redirect:/space/SpaceList");
		}
		map.put("USER_ID", session.getAttribute("USER_ID"));
		List<Map<String,Object>> list = mySpaceService.searchResSpaceList(map.getMap());
		
		mav.addObject("list", list);
		return mav;
	}
	@RequestMapping("/mySpace/modifySpaceForm")
	public ModelAndView modifySpaceForm(CommandMap map) {
		ModelAndView mv = new ModelAndView("mySpace/modifySpaceForm");
		
		return mv;
	}
	
	@RequestMapping("/mySpace/SpaceControl")
	public ModelAndView mySpaceControlView(CommandMap map) {
		ModelAndView mav = new ModelAndView("mySpace/controlList");
		
		return mav;
	}
	@RequestMapping("/mySpace/getSpaceList")
	public ModelAndView getSpaceList(CommandMap map,HttpSession session) {
		ModelAndView mv = new ModelAndView("jsonView");
		map.put("USER_ID", session.getAttribute("USER_ID"));
		List<Map<String,Object>> list = mySpaceService.selectMySpaceList(map.getMap());
		
		if(list.size()>0) {
			mv.addObject("total",list.get(0).get("TOTAL_COUNT"));
		}else {
			mv.addObject("total",0);
		}
		
		mv.addObject("list",list);
		return mv;
	}
	@RequestMapping("/mySpace/deleteSpace")
	public ModelAndView deleteSpaceList(CommandMap map) {
		ModelAndView mv = new ModelAndView("alert/alertPage");
		int result;
		result=mySpaceService.deleteSpaceBoard(map.getMap());
		if(result == MySpaceDao.ERR_RES_LIST) {
			mv.addObject("MESSAGE","�ش� ������ �����ִ� ������ �ֽ��ϴ�.");
		}else {
			mv.addObject("MESSAGE","�����Ǿ����ϴ�.");
		}
		
		return mv;
	}
	@RequestMapping("/mySpace/holdSpace")
	public ModelAndView holdSpaceList(CommandMap map) {
		ModelAndView mv = new ModelAndView("redirect:/mySpace/SpaceControl");
		
		mySpaceService.holdSpaceBoard(map.getMap());
		
		return mv;
	}
	
	
	@RequestMapping("/mySpace/getQnAList")
	public ModelAndView getQnAList(CommandMap map,HttpSession session) {
		ModelAndView mv = new ModelAndView("jsonView");
		
		map.put("USER_ID", session.getAttribute("USER_ID"));
		List<Map<String,Object>> list = mySpaceService.selectMyQnAList(map.getMap());
		
		if(list.size()>0) {
			mv.addObject("total",list.get(0).get("TOTAL_COUNT"));
		}else {
			mv.addObject("total",0);
		}
		
		mv.addObject("list",list);
		
		return mv;
	}
	@RequestMapping("/mySpace/QnAcomment")
	public ModelAndView insertQnAcomment(CommandMap map) {
		ModelAndView mv = new ModelAndView("redirect:/mySpace/SpaceControl");
		
		mySpaceService.spaceQNAComment(map.getMap());
		
		return mv;
	}
	
	@RequestMapping("/mySpace/deleteQnA")
	public ModelAndView deleteQnAcomment(CommandMap map) {
		ModelAndView mv = new ModelAndView("redirect:/mySpace/SpaceControl");
		
		mySpaceService.deleteQNAComment(map.getMap());
		
		return mv;
	}
	@RequestMapping("/mySpace/getReplyList")
	public ModelAndView getReplyList(CommandMap map,HttpSession session) {
		ModelAndView mv = new ModelAndView("jsonView");
		
		map.put("USER_ID", session.getAttribute("USER_ID"));
		List<Map<String,Object>> list = mySpaceService.selectMyReplyList(map.getMap());
		
		if(list.size()>0) {
			mv.addObject("total",list.get(0).get("TOTAL_COUNT"));
		}else {
			mv.addObject("total",0);
		}
		
		mv.addObject("list",list);
		
		return mv;
	}
	@RequestMapping("mySpace/deleteReply")
	public ModelAndView deleteReply(CommandMap map) {
		ModelAndView mv = new ModelAndView("redirect:/mySpace/SpaceControl");
		
		mySpaceService.deleteReply(map.getMap());
		
		return mv;
	}
	
	private List<Map<String,Object>> textReplace(List<Map<String,Object>> list,String type) {
		String temp;
		
		for(int i = 0;i<list.size();i++) {
			temp = (String)list.get(i).get(type);
			temp = temp.replace("\r\n", "<br>");
			list.get(i).put("type", temp);
			if(type.equals("QNA_CNT")&&list.get(i).get("QNA_CMT")!=null) {
				temp = (String)list.get(i).get("QNA_CMT");
				temp = temp.replace("\r\n", "<br>");
				list.get(i).put("QNA_CMT", temp);
			}
		}
		
		return list;
		
	}
//����������ϱ�
	@RequestMapping(value="/space/Form")
	public ModelAndView myspacelist(CommandMap map) {
		ModelAndView mv = new ModelAndView("form");
		
		return mv;
	}
	@RequestMapping(value="/space/Myspace_list")
	public ModelAndView myspacelist2(CommandMap map) {
		ModelAndView mv = new ModelAndView("mypage_list");
		
		return mv;
	}
}