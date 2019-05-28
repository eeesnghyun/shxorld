package web.guest;

import java.util.ArrayList;

public class GuestProc {
	private GuestDAO guestDAO;
	
	public GuestProc() {
		guestDAO = new GuestDAO();
	}
	
	public int create(GuestVO guestVO) {
		int count = 0;
		count = guestDAO.create(guestVO);
		return count;
	}
	
	public ArrayList<GuestVO> list(int nowPage, int pagePost) {
		ArrayList<GuestVO> list = new ArrayList<GuestVO>();
		
		int skipPost  = (nowPage - 1) * pagePost; // skip할 레코드 수
		
		list = guestDAO.list(skipPost, pagePost);
		
		return list;
	}
	
	public int pwordCheck(int g_no, String i_pw) {
		int count =0;
		count = guestDAO.pwordCheck(g_no, i_pw);
		return count;
	}
	
	public GuestVO read(int g_no) {
		GuestVO guestVO = null;
		guestVO = guestDAO.read(g_no);
		return guestVO;
	}
	
	public int delete(int g_no) {
		int count = 0;
		count = guestDAO.delete(g_no);
		return count;
	}
	
	public int count() {
		int count = 0;
		count = guestDAO.count();
		return count;
	}
}
