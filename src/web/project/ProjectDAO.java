package web.project;

import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import web.common.*;

public class ProjectDAO extends CommonVO {

	public ProjectDAO() {
		dbConnect = new DBConnect();
		dbDisconnect = new DBDisconnect();
	}
	
	public int create(ProjectVO projectVO) {
		int count = 0;
		
		try{
    	con = dbConnect.getConnection();
    	sql = new StringBuffer();
    	sql.append("\n INSERT INTO project(p_no, p_type, p_title, p_content, p_cnt, p_user, p_ymd, p_git, p_img, p_show) ");
    	sql.append("\n VALUES((SELECT IFNULL(MAX(x.p_no),0)+1 AS p_no FROM project x), ?, ?, ?, 0, 'ADMIN', NOW(), ?, ?, ?) ");			

    	pstmt = con.prepareStatement(sql.toString());
    	pstmt.setString(1, projectVO.getP_type());
			pstmt.setString(2, projectVO.getP_title());
			pstmt.setString(3, projectVO.getP_content());			
			pstmt.setString(4, projectVO.getP_git());			
			pstmt.setString(5, projectVO.getP_img());
			pstmt.setString(6, projectVO.getP_show());
			log.debug(getQueryString(pstmt.toString()));
			
			count = pstmt.executeUpdate();    	    
		} catch(Exception e){
			e.printStackTrace();
		} finally {
			dbDisconnect.disconnect(con, pstmt, rs);
		}
		
		return count;		
	}
		
	public int update(ProjectVO projectVO) {
		int count = 0;
		
		try{
    	con = dbConnect.getConnection();
    	sql = new StringBuffer();
    	sql.append("\n UPDATE project ");
    	sql.append("\n SET p_type = ?, p_title = ?, p_content = ?, p_ymd = NOW(), p_git = ?, p_img = ?, p_show = ? ");
    	sql.append("\n WHERE p_no = ? ");

    	pstmt = con.prepareStatement(sql.toString());
    	
    	pstmt.setString(1, projectVO.getP_type());
    	pstmt.setString(2, projectVO.getP_title());
    	pstmt.setString(3, projectVO.getP_content());
    	pstmt.setString(4, projectVO.getP_git());
    	pstmt.setString(5, projectVO.getP_img());
    	pstmt.setString(6, projectVO.getP_show());
    	pstmt.setInt(7, projectVO.getP_no());
    	log.debug(getQueryString(pstmt.toString()));
    	
			count = pstmt.executeUpdate();    	    
		} catch(Exception e){
			e.printStackTrace();
		} finally {
			dbDisconnect.disconnect(con, pstmt);
		}
		
		return count;		
	}
	
	public int update_show(int p_no, String p_show) {
		int count = 0;
		
		try{
    	con = dbConnect.getConnection();
    	sql = new StringBuffer();
    	sql.append("\n UPDATE project ");
    	sql.append("\n SET p_show = ? ");
    	sql.append("\n WHERE p_no = ? ");

    	pstmt = con.prepareStatement(sql.toString());
    	    	
    	pstmt.setString(1, p_show);
    	pstmt.setInt(2, p_no);    	
    	log.debug(getQueryString(pstmt.toString()));
    	
    	count = pstmt.executeUpdate();    	    
		} catch(Exception e){
			e.printStackTrace();
		} finally {
			dbDisconnect.disconnect(con, pstmt);
		}
		
		return count;		
	}
	
	public int delete(int p_no) {
		int count = 0;
		
		try {
			con = dbConnect.getConnection();
			sql = new StringBuffer();
			sql.append("\n DELETE FROM project");
			sql.append("\n WHERE p_no = ?");						
			
			pstmt = con.prepareStatement(sql.toString());			
			pstmt.setInt(1, p_no);
			log.debug(getQueryString(pstmt.toString()));
			
			count = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			dbDisconnect.disconnect(con, pstmt);
		}

		return count;
	}
	
	/* 게시글 전체 글 갯수 검색 */
	public int count(String adminYN) {
		int count = 0;
		
		try {
			con = dbConnect.getConnection();
    	sql = new StringBuffer();
    	sql.append("\n SELECT COUNT(p_no) as CNT");
    	sql.append("\n FROM project ");
    	if(adminYN.equals("N")) {
    		sql.append("\n			WHERE p_show = 'Y' ");
    	} 
    	
    	pstmt = con.prepareStatement(sql.toString());
    	log.debug(getQueryString(pstmt.toString()));
    	
    	rs = pstmt.executeQuery();
    	if( rs.next() == true ) {
    		count = rs.getInt("CNT");    		
    	}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			dbDisconnect.disconnect(con, pstmt, rs);
		}
		
		return count;
	}

	public ArrayList<ProjectVO> list(int skipPost, int pagePost, String adminYN){
		ArrayList<ProjectVO> list = new ArrayList<>();
		
		try{
    	con = dbConnect.getConnection();
			
    	sql = new StringBuffer();
    	sql.append("\n SELECT a.rnum, a.p_no, a.p_type, a.p_title, a.p_content, a.p_cnt, a.p_user, a.p_ymd, a.p_git, a.p_img, a.p_show, a.p_brief ");
    	sql.append("\n FROM ( 							");
    	sql.append("\n 			SELECT @rownum:=@rownum+1 as rnum, p_no, p_type, p_title, p_content, p_cnt, p_user, p_ymd, p_git, p_img, p_show, p_brief ");	
    	sql.append("\n 			FROM project 		 ");
    	sql.append("\n 			, (SELECT @rownum:=0) AS R ");
    	if(adminYN.equals("N")) {
    		sql.append("\n			WHERE p_show = 'Y' ");
    	} 
    	sql.append("\n  		) a 						 ");
    	sql.append("\n ORDER BY a.rnum DESC	 ");
    	sql.append("\n LIMIT " +skipPost+"," +pagePost);
    	
    	pstmt = con.prepareStatement(sql.toString());
    	log.debug(getQueryString(pstmt.toString()));
    	
    	rs = pstmt.executeQuery();
    	
    	while(rs.next() == true){ 
    		ProjectVO projectVO = new ProjectVO();
    		projectVO.setRnum(rs.getInt("rnum"));
    		projectVO.setP_no(rs.getInt("p_no"));
    		projectVO.setP_type(rs.getString("p_type"));
    		projectVO.setP_title(rs.getString("p_title"));
    		projectVO.setP_cnt(rs.getInt("p_cnt"));
    		projectVO.setP_user(rs.getString("p_user"));
    		projectVO.setP_ymd(rs.getString("p_ymd"));
    		projectVO.setP_img(rs.getString("p_img"));
    		projectVO.setP_show(rs.getString("p_show"));
    		projectVO.setP_brief(rs.getString("p_brief"));
    		
    		list.add(projectVO);
    	}
    	
		} catch(Exception e){
			e.printStackTrace();
		} finally {
			dbDisconnect.disconnect(con, pstmt, rs);
		}
		
		return list;
	}
	
	public ProjectVO read(int p_no, HttpServletRequest request) {
		ProjectVO projectVO = new ProjectVO();
		int cnt = 0;		
		int readCnt = 0;
		String ip = request.getHeader("Proxy-Client-IP");

    if (ip == null) {
    	ip = request.getHeader("WL-Proxy-Client-IP");
    	  		           
      if (ip == null) {
      	ip = request.getHeader("X-Forwarded-For");	           
        if (ip == null) {
        	ip = request.getRemoteAddr();	        	
        }        
      }      
    }            
		try {
			con = dbConnect.getConnection();
			sql = new StringBuffer();
			sql.append("\n SELECT p_no, p_type, p_title, p_content, p_cnt, p_user, p_ymd, p_git, p_img, p_show");
			sql.append("\n FROM project");
			sql.append("\n WHERE p_no = ?");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1,  p_no);									
			log.debug(getQueryString(pstmt.toString()));
			
			rs = pstmt.executeQuery();			
			
			if(rs.next()) {
				projectVO.setP_no(rs.getInt("p_no"));
    		projectVO.setP_type(rs.getString("p_type"));
    		projectVO.setP_title(rs.getString("p_title"));
    		projectVO.setP_content(rs.getString("p_content"));
    		projectVO.setP_cnt(rs.getInt("p_cnt"));
    		cnt = rs.getInt("p_cnt");    		    		    		
    		projectVO.setP_user(rs.getString("p_user"));
    		projectVO.setP_ymd(rs.getString("p_ymd"));
    		projectVO.setP_git(rs.getString("p_git"));
    		projectVO.setP_img(rs.getString("p_img"));
    		projectVO.setP_show(rs.getString("p_show"));	    			    	
			}			
			readCnt = readCheck(p_no, ip);
  		
			if(readCnt < 1) {
				readCreate(p_no, ip);
				cnt = cnt + 1;
				pCntUp(p_no, cnt);
				projectVO.setP_cnt(cnt);
			} 
		} catch(Exception e){
			e.printStackTrace();
		} finally {
			dbDisconnect.disconnect(con, pstmt, rs);
		}
		
		return projectVO;
	}
	
	/*
	 * 중복 조회수 방지를 위해 방문자 DB 사용
	 */
	public int readCheck(int p_no, String v_ip) {
		int count = 0;
		
		try {
    	con = dbConnect.getConnection();
    	sql = new StringBuffer();
			sql.append("\n SELECT COUNT(v_ip) as CNT ");
			sql.append("\n FROM visitor_rec ");
			sql.append("\n WHERE v_ip = ? ");			
			sql.append("\n AND DATE_FORMAT(v_ymd, '%Y%m%d')=DATE_FORMAT(NOW(), '%Y%m%d') ");			
			sql.append("\n AND p_no = ? ");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, v_ip);
			pstmt.setInt(2, p_no);
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

	/* 
	 * 방문자 DB를 이용한 게시글 조회 수 증가
	 * 각 IP가 조회한 게시글 등록
	 */
	public int readCreate(int p_no, String v_ip) {
		int count = 0;
		
		try {
    	con = dbConnect.getConnection();
    	sql = new StringBuffer();
    	sql.append("\n INSERT INTO visitor_rec ");
    	sql.append("\n VALUES(?, NOW(), ?) ");				    	
    	
    	pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, v_ip);
			pstmt.setInt(2, p_no);			
			log.debug(getQueryString(pstmt.toString()));
			
    	count = pstmt.executeUpdate();    	
		} catch(Exception e){
			e.printStackTrace();
		} finally {
			dbDisconnect.disconnect(con, pstmt);
		}
		
		return count;
	}
	
	/* 
	 * 게시글 조회 수 증가
	 */
	public int pCntUp(int p_no, int cnt) {
		int count = 0;
		
		try {
    	con = dbConnect.getConnection();
    	sql = new StringBuffer();			
			sql.append("\n UPDATE project SET p_cnt = "+ cnt +"");
		 	sql.append("\n WHERE p_no = " + p_no + "");										
			
		 	pstmt = con.prepareStatement(sql.toString());
		 	log.debug(getQueryString(pstmt.toString()));
		 	
			count = pstmt.executeUpdate();  	
		} catch(Exception e){
			e.printStackTrace();
		} finally {
			dbDisconnect.disconnect(con, pstmt);
		}
		
		return count;
	}
	
	/* 
	 * 인트로 - 프로젝트 글 등록 여부 변경
	 */
	public void briefUpdate(int p_no) {
		try {
    	con = dbConnect.getConnection();
    	sql = new StringBuffer();			
			sql.append("\n UPDATE project SET p_brief = 'Y'");
		 	sql.append("\n WHERE p_no = " + p_no + "");										
			
		 	pstmt = con.prepareStatement(sql.toString());
		 	log.debug(getQueryString(pstmt.toString()));
		 	
			pstmt.executeUpdate();  	
		} catch(Exception e){
			e.printStackTrace();
		} finally {
			dbDisconnect.disconnect(con, pstmt);
		}		
	}
}
