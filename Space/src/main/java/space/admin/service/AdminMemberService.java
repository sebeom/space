package space.admin.service;

import java.util.List;
import java.util.Map;

public interface AdminMemberService {
	
	
	List<Map<String, Object>> memberPageList(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> selectMemberList(Map<String, Object> map) throws Exception;
	
	

}
