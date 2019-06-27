package upo.gaborgalazzo.mweb.marketplace.functiolanities;

import org.simplejavamail.email.Email;
import org.simplejavamail.email.EmailBuilder;
import org.simplejavamail.mailer.Mailer;
import org.simplejavamail.mailer.MailerBuilder;
import org.simplejavamail.mailer.config.TransportStrategy;
import upo.gaborgalazzo.mweb.marketplace.Config;
import upo.gaborgalazzo.mweb.marketplace.domain.Product;
import upo.gaborgalazzo.mweb.marketplace.domain.User;
import upo.gaborgalazzo.mweb.marketplace.repository.ProductWatcherDAO;

public class NotificationService
{
	public static void productReturnedAvailable(Product product, User user)
	{
		Mailer mailer = MailerBuilder
				.withSMTPServer("smtp.gmail.com", 465, Config.MAIL_USER, Config.MAIL_PASS)
				.withTransportStrategy(TransportStrategy.SMTPS)

				.buildMailer();

		Email email = EmailBuilder.startingBlank()
				.to(user.getName() + " "+user.getSurname(), user.getEmail())
				.from("noreply@mweb.edu")
				.withSubject("The product \""+product.getName()+"\" has returned available")
				.withHTMLText("The product <a href='"+Config.SERVER_URL+"/product.php?id="+product.getId()+"'>\""+product.getName()+"\"</a> has returned available")
				.buildEmail();

		try
		{
			mailer.sendMail(email, true);
		}catch (Exception e){
			e.printStackTrace();
		}
	}

	public static void testMail()
	{
		Mailer mailer = MailerBuilder
				.withSMTPServer("smtp.gmail.com", 465, Config.MAIL_USER, Config.MAIL_PASS)
				.withTransportStrategy(TransportStrategy.SMTPS)

				.buildMailer();

		Email email = EmailBuilder.startingBlank()
				.to("gabor.galazzo@gmail.com")
				.from("noreply@mweb.edu")
				.withSubject("Test mail").withPlainText("test").buildEmail();

		try
		{
			mailer.sendMail(email, true);
		}catch (Exception e){
			e.printStackTrace();
		}
	}
}
