package com.sun.mail.imap;

import java.util.Date;
import korex.mail.Message;
import korex.mail.search.SearchTerm;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/imap/OlderTerm.class */
public final class OlderTerm extends SearchTerm {
    private int interval;
    private static final long serialVersionUID = 3951078948727995682L;

    public OlderTerm(int interval) {
        this.interval = interval;
    }

    public int getInterval() {
        return this.interval;
    }

    @Override // korex.mail.search.SearchTerm
    public boolean match(Message msg) {
        try {
            Date d = msg.getReceivedDate();
            return d != null && d.getTime() <= System.currentTimeMillis() - (((long) this.interval) * 1000);
        } catch (Exception e) {
            return false;
        }
    }

    public boolean equals(Object obj) {
        return (obj instanceof OlderTerm) && this.interval == ((OlderTerm) obj).interval;
    }

    public int hashCode() {
        return this.interval;
    }
}
