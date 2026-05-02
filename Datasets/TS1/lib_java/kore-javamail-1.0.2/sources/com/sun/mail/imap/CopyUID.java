package com.sun.mail.imap;

import com.sun.mail.imap.protocol.UIDSet;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/imap/CopyUID.class */
public class CopyUID {
    public long uidvalidity;
    public UIDSet[] src;
    public UIDSet[] dst;

    public CopyUID(long uidvalidity, UIDSet[] src, UIDSet[] dst) {
        this.uidvalidity = -1L;
        this.uidvalidity = uidvalidity;
        this.src = src;
        this.dst = dst;
    }
}
