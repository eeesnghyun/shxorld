package web.myskill;

import java.util.ArrayList;

public class MySkillProc {
	private MySkillDAO myskillDAO;
	
	public MySkillProc() {
		myskillDAO = new MySkillDAO();
	}
	
	public MySkillVO read(String s_id) {
		MySkillVO myskillVO = myskillDAO.read(s_id);
		
		return myskillVO;
	}
	
	public ArrayList<MySkillVO> list(String s_id){
		ArrayList<MySkillVO> list = myskillDAO.list(s_id);
		return list;
	}
}
