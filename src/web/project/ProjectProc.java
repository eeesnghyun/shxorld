package web.project;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

public class ProjectProc {
	private ProjectDAO projectDAO;
	
	public ProjectProc() {
		projectDAO = new ProjectDAO();
	}
	
	public int create(ProjectVO projectVO) {
		int count = 0;
		count = projectDAO.create(projectVO);
		return count;
	}
	
	public int update(ProjectVO projectVO) {
		int count = 0;
		count = projectDAO.update(projectVO);
		return count;
	}
	
	public int update_show(int p_no, String p_show) {
		int count = 0;
		count = projectDAO.update_show(p_no, p_show);
		return count;
	}
	
	public int delete(int p_no) {
		int count = 0;
		count = projectDAO.delete(p_no);
		return count;
	}
	
	public int count(String adminYN) {
		int count = 0;
		count = projectDAO.count(adminYN);
		return count;
	}
	
	public ArrayList<ProjectVO> list(int nowPage, int pagePost, String adminYN){
		ArrayList<ProjectVO> list = new ArrayList<ProjectVO>();
		
		int skipPost  = (nowPage - 1) * pagePost; // skip할 레코드 수
		
		list = projectDAO.list(skipPost, pagePost, adminYN);
		return list;
	}
	
	public ProjectVO read(int p_no, HttpServletRequest request) {
		ProjectVO projectVO = projectDAO.read(p_no, request);
		
		return projectVO;
	}
	
}
