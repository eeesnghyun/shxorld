package web.myskill;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.json.simple.JSONObject;

import web.common.DBConnect;
import web.common.DBDisconnect;

public class MySkillDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private StringBuffer sql = null;
	
	private DBConnect dbConnect = null;
	private DBDisconnect dbDisconnect = null;
	
	public MySkillDAO() {
		dbConnect = new DBConnect();
		dbDisconnect = new DBDisconnect();
	}
	
	public MySkillVO read(String s_id){		
		MySkillVO MySkillVO = new MySkillVO();
		
		try{
    	con = dbConnect.getConnection();
    	sql = new StringBuffer();
    	sql.append(" SELECT s_no, s_type, s_java, s_javascript, s_jquery, s_id "); 
    	sql.append(" FROM skill" );			
    	sql.append(" WHERE s_id = ? ");      
    	
    	pstmt = con.prepareStatement(sql.toString());
    	pstmt.setString(1, s_id);
    	
    	rs = pstmt.executeQuery();
    	if(rs.next()){     		
    		MySkillVO.setS_no(rs.getInt("s_no"));
    		MySkillVO.setS_type(rs.getString("s_type"));
    		MySkillVO.setS_java(rs.getInt("s_java"));
    		MySkillVO.setS_javascript(rs.getInt("s_javascript"));
    		MySkillVO.setS_jquery(rs.getInt("s_jquery"));
    		MySkillVO.setS_id(rs.getString("s_id"));
    	    	
    	}    	
		} catch(Exception e){
			e.printStackTrace();
		} finally {
			dbDisconnect.disconnect(con, pstmt, rs);
		}
		return MySkillVO;
	}
	
	public ArrayList<MySkillVO> list(String s_id){
		ArrayList<MySkillVO> list = new ArrayList<MySkillVO>();
		
		try{
    	con = dbConnect.getConnection();
    	sql = new StringBuffer();
    	sql.append(" SELECT s_no, s_type, s_name, s_rate, s_id "); 
    	sql.append(" FROM skill" );			
    	sql.append(" WHERE s_id = ? ");      
    	
    	pstmt = con.prepareStatement(sql.toString());
    	pstmt.setString(1, s_id);
    	
    	rs = pstmt.executeQuery();
    	while(rs.next()){     		
    		//MySkillVO MySkillVO = new MySkillVO();
    		//MySkillVO.setS_no(rs.getInt("s_no"));
    		//MySkillVO.setS_type(rs.getString("s_type"));
    		//MySkillVO.setS_name(rs.getString("s_name"));
    		//MySkillVO.setS_rate(rs.getInt("s_rate"));
    		//MySkillVO.setS_id(rs.getString("s_id"));
    		//list.add(MySkillVO);
    	}    	
		} catch(Exception e){
			e.printStackTrace();
		} finally {
			dbDisconnect.disconnect(con, pstmt, rs);
		}
		return list;
	}
}
