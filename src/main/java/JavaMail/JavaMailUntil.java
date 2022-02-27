
package JavaMail;

import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class JavaMailUntil 
{
    public static void sendMail(String recepient , String Link) throws Exception
    {
        Properties properties = new Properties();
        
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        
        final String myAccountEmail = "asosdeneme9@gmail.com";
        final String password = "15935712369";
        
        Session session = Session.getInstance(properties,new Authenticator() 
        {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(myAccountEmail,password);
            } 
        });
        
        Message message = prepareMessage(session , myAccountEmail,recepient,Link);    
        
        Transport.send(message);
        System.out.println("Mesaj yollandı");
    }
    
    private static Message prepareMessage(Session session , String myAccountEmail,String recepient , String Link) throws MessagingException
    {
        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(myAccountEmail));
            message.setRecipient(Message.RecipientType.TO,new InternetAddress(recepient));
            message.setSubject("Benim ilk mailim");
            message.setText("Merhaba , \n Hadi başlayalım " + Link);
            return message;
        } catch (AddressException ex) {
            Logger.getLogger(JavaMailUntil.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
