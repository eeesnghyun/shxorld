package web.common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.apache.log4j.Logger;

public class CommonVO {
	protected Connection con = null;
	protected PreparedStatement pstmt = null;
	protected ResultSet rs = null;
	protected StringBuffer sql = null;
	
	protected DBConnect dbConnect = null;
	protected DBDisconnect dbDisconnect = null;
	
	protected Logger log = Logger.getRootLogger();
	
	public String getQueryString(String pstmt) {
		String query = pstmt;
		int index =  pstmt.indexOf(":");
		
		query = query.substring(index+1);		
		
		return query;
	}
}
