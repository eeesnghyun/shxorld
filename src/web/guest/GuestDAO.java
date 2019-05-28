package web.guest;

import java.net.InetAddress;
import java.util.ArrayList;

import web.common.*;

public class GuestDAO extends CommonVO {

	public GuestDAO() {
		dbConnect = new DBConnect();		
		dbDisconnect = new DBDisconnect();
	}
	
	public int create(GuestVO guestVO){
		int count = 0;
		
		try {
			con = dbConnect.getConnection();
			sql = new StringBuffer();
			sql.append("\n INSERT INTO guest(g_no, g_show, g_name, g_content, g_password, g_ymd, g_img, g_ip)");
			sql.append("\n VALUES((SELECT IFNULL(MAX(x.g_no),0)+1 AS g_no FROM guest x), ?, ?, ?, ?, NOW(), ?, ?)");
			
			InetAddress ia = InetAddress.getLocalHost();
			String g_ip = ia.getHostAddress();
			
			pstmt = con.prepareStatement(sql.toString());			
			pstmt.setString(1, guestVO.getG_show());
			pstmt.setString(2, guestVO.getG_name());
			pstmt.setString(3, guestVO.getG_content());
			pstmt.setString(4, guestVO.getG_password());
			pstmt.setString(5, guestVO.getG_img());
			pstmt.setString(6, g_ip);
			log.debug(getQueryString(pstmt.toString()));
			
			count = pstmt.executeUpdate();			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			dbDisconnect.disconnect(con, pstmt);
		}
		return count;
	}
	
	public ArrayList<GuestVO> list(int skipPost, int pagePost){
		ArrayList<GuestVO> list = new ArrayList<GuestVO>();
		
		try{
    	con = dbConnect.getConnection();
    	sql = new StringBuffer();
    	sql.append("\n SELECT g_no, g_show, g_name, g_content, g_password, g_ymd, g_img, g_ip");
    	sql.append("\n FROM guest");			
    	sql.append("\n ORDER BY g_no DESC");
    	sql.append("\n LIMIT " +skipPost+"," +pagePost);
    	
    	pstmt = con.prepareStatement(sql.toString());
    	log.debug(getQueryString(pstmt.toString()));
    	rs = pstmt.executeQuery();
    	
    	while(rs.next() == true) {
    		GuestVO guestVO = new GuestVO();
    		guestVO.setG_no(rs.getInt("g_no"));
    		guestVO.setG_show(rs.getString("g_show"));
    		guestVO.setG_name(rs.getString("g_name"));
    		guestVO.setG_content(rs.getString("g_content"));
    		guestVO.setG_password(rs.getString("g_password"));
    		guestVO.setG_ymd(rs.getString("g_ymd"));
    		guestVO.setG_img(rs.getString("g_img"));
    		guestVO.setG_ip(rs.getString("g_ip"));
    		
    		list.add(guestVO);
    	}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			dbDisconnect.disconnect(con, pstmt, rs);
		}
		
    return list;
	}
	
	public int pwordCheck(int g_no, String i_pw) {
		int count = 0;
		
		try {
			con = dbConnect.getConnection();
			sql = new StringBuffer();			
			sql.append("\n SELECT COUNT(*) as CNT ");
			sql.append("\n FROM guest ");
			sql.append("\n WHERE g_no = ? ");			
			sql.append("\n AND g_password = ? ");
			
			pstmt = con.prepareStatement(sql.toString());	
			pstmt.setInt(1, g_no);
			pstmt.setString(2, i_pw); 
			log.debug(getQueryString(pstmt.toString()));
			
    	rs = pstmt.executeQuery();
    	if( rs.next() == true ) {
    		count = rs.getInt("cnt");
    	}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			dbDisconnect.disconnect(con, pstmt, rs);
		}
		return count;
	}
	
	public GuestVO read(int g_no) {
		GuestVO guestVO = new GuestVO();
		
		try {
			con = dbConnect.getConnection();
			sql = new StringBuffer();			
			sql.append("\n SELECT g_no, g_show, g_name, g_content, g_password, g_ymd, g_img, g_ip ");
			sql.append("\n FROM guest ");
			sql.append("\n WHERE g_no = ? ");			
			
			pstmt = con.prepareStatement(sql.toString());	
			pstmt.setInt(1, g_no);	
			log.debug(getQueryString(pstmt.toString()));
			
			rs= pstmt.executeQuery();
			
			if(rs.next() == true) {
				guestVO.setG_no(rs.getInt("g_no"));
				guestVO.setG_show(rs.getString("g_show"));
				guestVO.setG_name(rs.getString("g_name"));
				guestVO.setG_content(rs.getString("g_content"));
				guestVO.setG_password(rs.getString("g_password"));
				guestVO.setG_ymd(rs.getString("g_ymd"));
				guestVO.setG_img(rs.getString("g_img"));
				guestVO.setG_ip(rs.getString("g_ip"));				
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			dbDisconnect.disconnect(con, pstmt, rs);
		}
		return guestVO;
	}
	
	public int delete(int g_no){
		int count = 0;
		
		try {
			con = dbConnect.getConnection();
			sql = new StringBuffer();
			sql.append("\n DELETE FROM guest");
			sql.append("\n WHERE g_no = ?");				
			
			pstmt = con.prepareStatement(sql.toString());			
			pstmt.setInt(1, g_no);
			
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
	public int count() {
		int count = 0;
		
		try {
			con = dbConnect.getConnection();
    	sql = new StringBuffer();
    	sql.append("\n SELECT COUNT(g_no) as CNT");
    	sql.append("\n FROM guest ");

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
	
}
