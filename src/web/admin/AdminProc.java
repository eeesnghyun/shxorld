package web.admin;

public class AdminProc {
	private AdminDAO adminDAO;
	
	public AdminProc() {
		adminDAO = new AdminDAO();
	}
	
	public int login(String uid, String upasswd) {
		int count = 0;		
		count = adminDAO.login(uid, upasswd);
		return count;
	}
	
	public AdminVO read(String uid) {
		AdminVO adminVO = null;
		adminVO = adminDAO.read(uid);		
		return adminVO;
	}
}
