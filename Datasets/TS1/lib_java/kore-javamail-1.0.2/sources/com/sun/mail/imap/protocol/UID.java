package com.sun.mail.imap.protocol;

import com.sun.mail.iap.ParsingException;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/imap/protocol/UID.class */
public class UID implements Item {
    static final char[] name = {'U', 'I', 'D'};
    public int seqnum;
    public long uid;

    public UID(FetchResponse r) throws ParsingException {
        this.seqnum = r.getNumber();
        r.skipSpaces();
        this.uid = r.readLong();
    }
}
