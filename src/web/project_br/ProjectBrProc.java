package web.project_br;

public class ProjectBrProc {
	private ProjectBrDAO projectbrDAO;
	
	public ProjectBrProc() {
		projectbrDAO = new ProjectBrDAO();
	}
	
	public int create(ProjectBrVO projectbrVO) {
		int count = 0;
		count = projectbrDAO.create(projectbrVO);
		return count;
	}
	
	public ProjectBrVO read(int pb_no) {
		ProjectBrVO projectbrVO = projectbrDAO.read(pb_no);
		
		return projectbrVO;
	}
	
	public int update(ProjectBrVO projectbrVO) {
		int count = 0;
		count = projectbrDAO.update(projectbrVO);
		return count;
	}
	
	public int count() {
		int count = 0;		
		count = projectbrDAO.count();
		return count;
	}
}
