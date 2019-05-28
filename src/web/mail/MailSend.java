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
		//mail.smtp.host : �̸��� �߼��� ó������ smtp ����
		
		Authenticator auth = new MailAuth();
		
		Session session = Session.getDefaultInstance(p, auth);
		//Properties�� ����Ǿ��ִ� �Ӽ����� ����� ������ ����
		
		MimeMessage msg = new MimeMessage(session);
		//MimeMessage Ŭ������ Message Ŭ������ ��ӹ��� �߽���,������,����, ����� ���� ���Ͽ� ���õ� ������ ������ �� �ֵ������ش�.
				
		try {
			msg.setSentDate(new Date());
			
			msg.setFrom(new InternetAddress("shxorld@gmail.com", "VISITOR"));
			InternetAddress to = new InternetAddress("szhyun2002@gmail.com");		//������ �̸���(��) 
			msg.setRecipient(Message.RecipientType.TO, to);			
			msg.setSubject("����" + "[" + sender + "]", "UTF-8");			
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
