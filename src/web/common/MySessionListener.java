package web.common;

import web.visit.*;

import java.net.InetAddress;
import java.net.UnknownHostException;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class MySessionListener implements HttpSessionListener{

	@Override
	public void sessionCreated(HttpSessionEvent arg0) {
		VisitDAO visitDAO = new VisitDAO();
		HttpSession session = arg0.getSession();

		try {
			InetAddress ia = InetAddress.getLocalHost();
			String v_ip = ia.getHostAddress();

			if(session.isNew()) {					
					System.out.println("---------------------------------------------------");
					System.out.println("         >> Session created : " + v_ip + " <<      ");
					System.out.println("---------------------------------------------------");	
					int count = visitDAO.visit_check(v_ip);					
					
					if(count < 1) {
						visitDAO.visit_up(v_ip);
						System.out.println("---------------------------------------------------");
						System.out.println("            >> Guest(ip) : " + v_ip + " <<         ");
						System.out.println("---------------------------------------------------");
					}									
			}					
			
		} catch (UnknownHostException uh) {
			uh.printStackTrace();
		}	
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {
		System.out.println("---------------------------------------------------");
		System.out.println("                >> Session distroy <<              ");	
		System.out.println("---------------------------------------------------");
	}
	
}
