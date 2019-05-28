package web.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class Auth {
	
	public static synchronized boolean adminYN(HttpServletRequest request) {
		boolean yn = false;
		
		HttpSession session = request.getSession();
		String utype = (String)session.getAttribute("utype");
	
		if( utype != null ) {
			if( utype.equals("S") ) {
				yn = true;
			}
		}	
		
		return yn;
	}
}
