package web.visit;

import javax.servlet.http.HttpServletRequest;
import web.common.CommonVO;
import web.common.DBConnect;
import web.common.DBDisconnect;

public class VisitDAO  extends CommonVO {
	
	public VisitDAO() {
		dbConnect = new DBConnect();
		dbDisconnect = new DBDisconnect();
	}
	
	public int visit_up(String v_ip) {
		int count = 0;
	
		try {
			con = dbConnect.getConnection();
			sql = new StringBuffer();
			sql.append(" INSERT INTO visitor ");					
			sql.append(" VALUES((SELECT IFNULL(MAX(x.v_no),0)+1 AS v_no FROM visitor x), ?, DATE_FORMAT(NOW(),'%Y%m%d')) ");
			
			pstmt = con.prepareStatement(sql.toString());			
			pstmt.setString(1, v_ip);			
			
			//System.out.println("ip : " + v_ip);	
			count = pstmt.executeUpdate();			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			dbDisconnect.disconnect(con, pstmt);
		}
		return count;
	}
	
	public int total_visit() {
		int count = 0;
		
		try {
			con = dbConnect.getConnection();
			sql = new StringBuffer();
			sql.append(" SELECT COUNT(v_ip) as CNT ");					
			sql.append(" FROM visitor ");			
			
			pstmt = con.prepareStatement(sql.toString());
			
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
	
	public int today_visit() {
		int count = 0;
		
		try {
			con = dbConnect.getConnection();
			sql = new StringBuffer();
			sql.append(" SELECT COUNT(v_ip) as CNT ");					
			sql.append(" FROM visitor ");			
			sql.append(" WHERE v_ymd=DATE_FORMAT(now(),'%Y%m%d') ");		
			
			pstmt = con.prepareStatement(sql.toString());
			
			rs = pstmt.executeQuery();
			if(rs.next() == true) {
				count = rs.getInt("CNT");
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			dbDisconnect.disconnect(con, pstmt, rs);
		}
		return count;
	}
	
	public int visit_check(String v_ip) {
		int count = 0;
	
		try {
			con = dbConnect.getConnection();
			sql = new StringBuffer();
			sql.append("\n SELECT COUNT(v_ip) as CNT ");					
			sql.append("\n FROM visitor	");
			sql.append("\n WHERE v_ymd=DATE_FORMAT(now(),'%Y%m%d')	");
			sql.append("\n AND v_ip = ?");

			pstmt = con.prepareStatement(sql.toString());			
			pstmt.setString(1, v_ip);						
			log.debug(getQueryString(pstmt.toString()));			
			
			rs = pstmt.executeQuery();			
			if(rs.next() == true) {
				count = rs.getInt("CNT");
			}		
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			dbDisconnect.disconnect(con, pstmt, rs);
		}
		return count;
	}
	
	public void getIp(HttpServletRequest request) {
		int count = 0;
		String ip = request.getHeader("Proxy-Client-IP");
		String type = "";
		
    if (ip == null) {
    	ip = request.getHeader("WL-Proxy-Client-IP");
    	type = "WL-Proxy-Client-IP";    		           
      if (ip == null) {
      	ip = request.getHeader("X-Forwarded-For");
      	type = "X-Forwarded-For";        
        if (ip == null) {
        	ip = request.getRemoteAddr();
        	type = "HttpServletRequest";
        }        
      }      
    }                  
    count = visit_check(ip);
    
    if(count < 1) {
		visit_up(ip);
		log.info("----------------------------------------------------------------------------------");
	    log.info("                                    >> Type : " + type);
	    log.info("                                    >> Guest IP : " + ip);
	    log.info("----------------------------------------------------------------------------------");
		}				        
	}
	
}
