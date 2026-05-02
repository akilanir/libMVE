package korex.mail;

import korex.activation.DataSource;

/* loaded from: kore-javamail-1.0.2.jar:korex/mail/MultipartDataSource.class */
public interface MultipartDataSource extends DataSource {
    int getCount();

    BodyPart getBodyPart(int i) throws MessagingException;
}
