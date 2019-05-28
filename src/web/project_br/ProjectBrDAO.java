package web.project_br;

import web.common.*;
import web.project.*;

public class ProjectBrDAO extends CommonVO {

	public ProjectBrDAO() {
		dbConnect = new DBConnect();
		dbDisconnect = new DBDisconnect();
	}
	
	public int create(ProjectBrVO projectbrVO) {
		int count = 0;
		
		try{
    	con = dbConnect.getConnection();
    	sql = new StringBuffer();
    	sql.append("\n INSERT INTO project_br(pb_no, pb_title, pb_content, pb_tool, pb_os, pb_server, pb_db, pb_skill, pb_user, pb_ymd, pb_img) ");
    	sql.append("\n VALUES(?, ?, ?, ?, ?, ?, ?, ?, 'ADMIN', NOW(), ?) ");			

    	pstmt = con.prepareStatement(sql.toString());
    	pstmt.setInt(1, projectbrVO.getPb_no());
    	pstmt.setString(2, projectbrVO.getPb_title());
			pstmt.setString(3, projectbrVO.getPb_content());
			pstmt.setString(4, projectbrVO.getPb_tool());			
			pstmt.setString(5, projectbrVO.getPb_os());			
			pstmt.setString(6, projectbrVO.getPb_server());
			pstmt.setString(7, projectbrVO.getPb_db());
			pstmt.setString(8, projectbrVO.getPb_skill());
			pstmt.setString(9, projectbrVO.getPb_img());
			
			log.debug(getQueryString(pstmt.toString()));
			
			ProjectDAO projectDAO = new ProjectDAO();
			projectDAO.briefUpdate(projectbrVO.getPb_no());
			
			count = pstmt.executeUpdate();    	    
		} catch(Exception e){
			e.printStackTrace();
		} finally {
			dbDisconnect.disconnect(con, pstmt);
		}
		
		return count;		
	}
	
	public int update(ProjectBrVO projectbrVO) {
		int count = 0;
		
		try{
    	con = dbConnect.getConnection();
    	sql = new StringBuffer();
    	sql.append("\n UPDATE project_br ");
    	sql.append("\n SET pb_title = ?, pb_content = ?, pb_tool = ?, pb_os = ?, pb_server = ?, pb_db = ?, pb_skill = ?, pb_user = 'ADMIN', pb_ymd = NOW(),  pb_img = ? ");
    	sql.append("\n WHERE pb_no = ? ");

    	pstmt = con.prepareStatement(sql.toString());
    	
    	pstmt.setString(1, projectbrVO.getPb_title());
    	pstmt.setString(2, projectbrVO.getPb_content());
    	pstmt.setString(3, projectbrVO.getPb_tool());
    	pstmt.setString(4, projectbrVO.getPb_os());
    	pstmt.setString(5, projectbrVO.getPb_server());
    	pstmt.setString(6, projectbrVO.getPb_db());
    	pstmt.setString(7, projectbrVO.getPb_skill());
    	pstmt.setString(8, projectbrVO.getPb_img());
    	pstmt.setInt(9, projectbrVO.getPb_no());
    	log.debug(getQueryString(pstmt.toString()));
    	
			count = pstmt.executeUpdate();    	    
		} catch(Exception e){
			e.printStackTrace();
		} finally {
			dbDisconnect.disconnect(con, pstmt);
		}
		
		return count;		
	}
	
	public ProjectBrVO read(int pb_no) {
		ProjectBrVO projectbrVO = new ProjectBrVO();
		
		try {					
			con = dbConnect.getConnection();
			sql = new StringBuffer();
			sql.append("\n SELECT pb_no, pb_title, pb_content, pb_tool, pb_os, pb_server, pb_db, pb_skill, pb_img");
			sql.append("\n FROM project_br");
			sql.append("\n WHERE pb_no = ?");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1,  pb_no);									
			log.debug(getQueryString(pstmt.toString()));
			
			rs = pstmt.executeQuery();			
			
			if(rs.next()) {
				//projectbrVO.setPb_no(rs.getInt("pb_no"));    		
    		projectbrVO.setPb_title(rs.getString("pb_title"));
    		projectbrVO.setPb_content(rs.getString("pb_content"));
    		projectbrVO.setPb_tool(rs.getString("pb_tool"));
    		projectbrVO.setPb_os(rs.getString("pb_os"));
    		projectbrVO.setPb_server(rs.getString("pb_server"));
    		projectbrVO.setPb_db(rs.getString("pb_db"));
    		projectbrVO.setPb_skill(rs.getString("pb_skill"));
    		projectbrVO.setPb_img(rs.getString("pb_img"));    		
			}			
			
		} catch(Exception e){
			e.printStackTrace();
		} finally {
			dbDisconnect.disconnect(con, pstmt, rs);
		}
		
		return projectbrVO;
	}
	
	public int count() {
		int count = 0;
		
		try {					
			con = dbConnect.getConnection();
			sql = new StringBuffer();
			sql.append("\n SELECT COUNT(*) as CNT");
			sql.append("\n FROM project_br");			
			
			pstmt = con.prepareStatement(sql.toString());
			
			log.debug(getQueryString(pstmt.toString()));
			
			rs = pstmt.executeQuery();			
			
			if(rs.next()) {
				count = rs.getInt("CNT");	
			}						
		} catch(Exception e){
			e.printStackTrace();
		} finally {
			dbDisconnect.disconnect(con, pstmt, rs);
		}
		
		return count;
	}
}
