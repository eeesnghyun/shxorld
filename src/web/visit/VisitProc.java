package web.visit;

import javax.servlet.http.HttpServletRequest;

public class VisitProc {
	private VisitDAO visitDAO;
	
	public VisitProc() {
		visitDAO = new VisitDAO();
	}
	
	public int total_visit() {
		int count = 0;
		count = visitDAO.total_visit();
		return count;
	}
	
	public int today_visit() {
		int count = 0;
		count = visitDAO.today_visit();
		return count;
	}
	
	public void getIp(HttpServletRequest request) {
		visitDAO.getIp(request);		
	}
	
}
