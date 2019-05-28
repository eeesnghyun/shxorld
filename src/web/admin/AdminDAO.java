package web.admin;

import web.common.*;

public class AdminDAO extends CommonVO {

	public AdminDAO() {
		dbConnect = new DBConnect();
		dbDisconnect = new DBDisconnect();
	}
	
	/* ·Î±×ÀÎ */
	public int login(String uid, String upasswd) {
		int count = 0;
		
		try {
			con = dbConnect.getConnection();
			sql = new StringBuffer();
			//System.out.println(uid + "+" + upasswd);
			sql.append("\n SELECT COUNT(*) as cnt ");
			sql.append("\n FROM useri ");
			sql.append("\n WHERE u_id=? ");
			sql.append("\n AND u_passwd=? ");
			
			pstmt = con.prepareStatement(sql.toString());			
			pstmt.setString(1, uid);
			pstmt.setString(2, upasswd);
			log.debug(getQueryString(pstmt.toString()));
			
			rs= pstmt.executeQuery();
		  if(rs.next()) {
		  	count = rs.getInt("cnt");
		  }  		   
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			dbDisconnect.disconnect(con, pstmt);
		}

		return count;
	}
	
	public AdminVO read(String uid) {
		AdminVO adminVO = null;
		
		try {
			con = dbConnect.getConnection();
			sql = new StringBuffer();			
			sql.append("\n SELECT u_no, u_type, u_id, u_passwd, u_name, u_tel, u_mail, u_ip, u_date, u_file, u_filesize, u_useyn ");
			sql.append("\n FROM useri ");
			sql.append("\n WHERE u_id=? ");			
			
			pstmt = con.prepareStatement(sql.toString());	
			pstmt.setString(1, uid);
			log.debug(getQueryString(pstmt.toString()));
			
			rs= pstmt.executeQuery();
		    
			adminVO = new AdminVO();			
			if( rs.next() == true ) {
				adminVO.setU_no(rs.getInt("u_no"));
				adminVO.setU_type(rs.getString("u_type"));
				adminVO.setU_id(rs.getString("u_id"));
				adminVO.setU_name(rs.getString("u_name"));
				adminVO.setU_tel(rs.getString("u_tel"));
				adminVO.setU_mail(rs.getString("u_mail"));
				adminVO.setU_ip(rs.getString("u_ip"));
				adminVO.setU_date(rs.getString("u_date"));
				adminVO.setU_file(rs.getString("u_file"));
				adminVO.setU_useyn(rs.getString("u_useyn"));
			}		         
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			dbDisconnect.disconnect(con, pstmt, rs);
		}
		
		return adminVO;
	}
	

}
