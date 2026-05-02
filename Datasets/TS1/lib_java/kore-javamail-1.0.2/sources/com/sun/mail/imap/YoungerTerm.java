package com.sun.mail.imap;

import java.util.Date;
import korex.mail.Message;
import korex.mail.search.SearchTerm;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/imap/YoungerTerm.class */
public final class YoungerTerm extends SearchTerm {
    private int interval;
    private static final long serialVersionUID = 1592714210688163496L;

    public YoungerTerm(int interval) {
        this.interval = interval;
    }

    public int getInterval() {
        return this.interval;
    }

    @Override // korex.mail.search.SearchTerm
    public boolean match(Message msg) {
        try {
            Date d = msg.getReceivedDate();
            return d != null && d.getTime() >= System.currentTimeMillis() - (((long) this.interval) * 1000);
        } catch (Exception e) {
            return false;
        }
    }

    public boolean equals(Object obj) {
        return (obj instanceof YoungerTerm) && this.interval == ((YoungerTerm) obj).interval;
    }

    public int hashCode() {
        return this.interval;
    }
}
