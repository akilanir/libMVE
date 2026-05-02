package com.sun.mail.imap;

import korex.mail.Session;
import korex.mail.URLName;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/imap/IMAPSSLStore.class */
public class IMAPSSLStore extends IMAPStore {
    public IMAPSSLStore(Session session, URLName url) {
        super(session, url, "imaps", true);
    }
}
