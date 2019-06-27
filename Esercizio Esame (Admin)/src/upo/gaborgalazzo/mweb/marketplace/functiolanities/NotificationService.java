package upo.gaborgalazzo.mweb.marketplace.functiolanities;

import org.simplejavamail.email.Email;
import org.simplejavamail.email.EmailBuilder;
import org.simplejavamail.mailer.Mailer;
import org.simplejavamail.mailer.MailerBuilder;
import org.simplejavamail.mailer.config.TransportStrategy;
import upo.gaborgalazzo.mweb.marketplace.Config;
import upo.gaborgalazzo.mweb.marketplace.domain.*;
import upo.gaborgalazzo.mweb.marketplace.repository.CustomerDAO;
import upo.gaborgalazzo.mweb.marketplace.repository.ProductWatcherDAO;

public class NotificationService
{
	public static void productReturnedAvailable(Product product, User user)
	{


		Email email = EmailBuilder.startingBlank()
				.to(user.getName() + " "+user.getSurname(), user.getEmail())
				.from("noreply@mweb.edu")
				.withSubject("The product \""+product.getName()+"\" has returned available")
				.withHTMLText("The product <a href='"+Config.SERVER_URL+"/product.php?id="+product.getId()+"'>\""+product.getName()+"\"</a> has returned available")
				.buildEmail();

		try
		{
			getMailer().sendMail(email, true);
		}catch (Exception e){
			e.printStackTrace();
		}
	}

	public static void orderSent(Order order)
	{
		CustomerDAO customerDAO = new CustomerDAO();
		Customer user = customerDAO.get(order.getOwnerId());


		Email email = EmailBuilder.startingBlank()
				.to(user.getName() + " "+user.getSurname(), user.getEmail())
				.from("noreply@mweb.edu")
				.withSubject("Order "+order.getCode()+" sent")
				.withHTMLText("The order <a href='"+Config.SERVER_URL+"/order.php?order_id="+order.getId()+"'>\""+order.getCode()+"\"</a> has been sent")
				.buildEmail();

		try
		{
			getMailer().sendMail(email, true);
		}catch (Exception e){
			e.printStackTrace();
		}
	}

	public static void orderDelivered(Order order) {
		CustomerDAO customerDAO = new CustomerDAO();
		Customer user = customerDAO.get(order.getOwnerId());


		Email email = EmailBuilder.startingBlank()
				.to(user.getName() + " "+user.getSurname(), user.getEmail())
				.from("noreply@mweb.edu")
				.withSubject("Order "+order.getCode()+" delivered")
				.withHTMLText("The order <a href='"+Config.SERVER_URL+"/order.php?order_id="+order.getId()+"'>\""+order.getCode()+"\"</a> has been delivered")
				.buildEmail();

		try
		{
			getMailer().sendMail(email, true);
		}catch (Exception e){
			e.printStackTrace();
		}
	}

	public static void reportResponse(Order order, Message message) {
		CustomerDAO customerDAO = new CustomerDAO();
		Customer user = customerDAO.get(order.getOwnerId());


		Email email = EmailBuilder.startingBlank()
				.to(user.getName() + " "+user.getSurname(), user.getEmail())
				.from("noreply@mweb.edu")
				.withSubject("New message on your report for the order "+order.getCode())
				.withHTMLText("A new message has been added to the report for the order <a href='"+Config.SERVER_URL+"/report.php?order_id="+order.getId()+"'>\""+order.getCode()+"\"</a><br/><br/>Message: "+message.getText())
				.buildEmail();

		try
		{
			getMailer().sendMail(email, true);
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



	private static Mailer getMailer(){
		return MailerBuilder
				.withSMTPServer(Config.MAIL_HOST, Config.MAIL_PORT, Config.MAIL_USER, Config.MAIL_PASS)
				.withTransportStrategy(TransportStrategy.SMTPS)
				.buildMailer();
	}



}
