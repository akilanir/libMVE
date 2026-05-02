package com.sun.mail.imap;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/imap/AppendUID.class */
public class AppendUID {
    public long uidvalidity;
    public long uid;

    public AppendUID(long uidvalidity, long uid) {
        this.uidvalidity = -1L;
        this.uid = -1L;
        this.uidvalidity = uidvalidity;
        this.uid = uid;
    }
}
