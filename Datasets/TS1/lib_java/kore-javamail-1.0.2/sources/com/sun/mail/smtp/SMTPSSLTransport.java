package com.sun.mail.smtp;

import korex.mail.Session;
import korex.mail.URLName;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/smtp/SMTPSSLTransport.class */
public class SMTPSSLTransport extends SMTPTransport {
    public SMTPSSLTransport(Session session, URLName urlname) {
        super(session, urlname, "smtps", true);
    }
}
