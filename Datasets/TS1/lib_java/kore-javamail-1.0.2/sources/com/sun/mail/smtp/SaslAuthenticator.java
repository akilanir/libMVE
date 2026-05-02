package com.sun.mail.smtp;

import korex.mail.MessagingException;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/smtp/SaslAuthenticator.class */
public interface SaslAuthenticator {
    boolean authenticate(String[] strArr, String str, String str2, String str3, String str4) throws MessagingException;
}
