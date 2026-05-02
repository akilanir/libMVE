package com.sun.mail.pop3;

import korex.mail.Session;
import korex.mail.URLName;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/pop3/POP3SSLStore.class */
public class POP3SSLStore extends POP3Store {
    public POP3SSLStore(Session session, URLName url) {
        super(session, url, "pop3s", true);
    }
}
