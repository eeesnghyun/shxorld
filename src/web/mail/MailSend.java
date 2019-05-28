package web.mail;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.swing.JOptionPane;

public class MailSend {
	
	public int MailSend(String sender, String content) {
		int count = 0;
		Properties p = System.getProperties();
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.host", "smtp.gmail.com");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.port", "587");
		//mail.smtp.host : 이메일 발송을 처리해줄 smtp 서버
		
		Authenticator auth = new MailAuth();
		
		Session session = Session.getDefaultInstance(p, auth);
		//Properties에 저장되어있는 속성값을 사용해 세션을 생성
		
		MimeMessage msg = new MimeMessage(session);
		//MimeMessage 클래스는 Message 클래스를 상속받은 발신자,수신자,제목, 내용과 같은 메일에 관련된 내용을 지정할 수 있도록해준다.
				
		try {
			msg.setSentDate(new Date());
			
			msg.setFrom(new InternetAddress("shxorld@gmail.com", "VISITOR"));
			InternetAddress to = new InternetAddress("szhyun2002@gmail.com");		//수신자 이메일(나) 
			msg.setRecipient(Message.RecipientType.TO, to);			
			msg.setSubject("제목" + "[" + sender + "]", "UTF-8");			
			msg.setText(content, "UTF-8");			
			
			if( sender != "" ) {
				Transport.send(msg);
				count = count + 1;
			}			
		} catch(AddressException ae) {			
			System.out.println("AddressException : " + ae.getMessage());			
		} catch(MessagingException me) {	
			System.out.println("MessagingException : " + me.getMessage());
		} catch(UnsupportedEncodingException e) {
			System.out.println("UnsupportedEncodingException : " + e.getMessage());			
		}
		
		return count;
	}

}
