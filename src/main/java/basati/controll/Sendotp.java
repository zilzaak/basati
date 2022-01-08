package basati.controll;



import java.util.Date;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public  class Sendotp {
private final  String host="smtp.gmail.com";
private final   String port="587";
private final  Properties pro = new Properties();
public  boolean sendotp(String code,String to,String subject,String user,String pass){
        pro.put("mail.smtp.host", host);
		pro.put("mail.smtp.port",port);
		pro.put("mail.smtp.auth","true");
		pro.put("mail.smtp.starttls.enable","true");
	    boolean s=false;	
				
	            Session session = Session.getInstance(pro, 
				new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(user,pass);
					                }
					});
		            
 
					try {
				           InternetAddress internetAddress = new InternetAddress(to);
							internetAddress.validate();
							s = true;
						} catch (AddressException e) {
							s = false;
						
						}
						
				if(s) {
					
					MimeMessage msg = new MimeMessage(session);
					try {
						msg.setSubject(subject);
						msg.setFrom(new InternetAddress(user));
						msg.setSentDate(new Date());
						msg.setText(code);
					    msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
						Transport.send(msg);
					} catch (AddressException e1) {
						
						e1.printStackTrace();
					} catch (MessagingException e1) {
					
						e1.printStackTrace();
					}
                 
						
				
				}
				else {
				}
                    return s;	
				
				}
	
	

}
	

	
