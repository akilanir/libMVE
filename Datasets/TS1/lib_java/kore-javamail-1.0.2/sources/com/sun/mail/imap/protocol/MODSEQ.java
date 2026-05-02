package com.sun.mail.imap.protocol;

import com.sun.mail.iap.ParsingException;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/imap/protocol/MODSEQ.class */
public class MODSEQ implements Item {
    static final char[] name = {'M', 'O', 'D', 'S', 'E', 'Q'};
    public int seqnum;
    public long modseq;

    public MODSEQ(FetchResponse r) throws ParsingException {
        this.seqnum = r.getNumber();
        r.skipSpaces();
        if (r.readByte() != 40) {
            throw new ParsingException("MODSEQ parse error");
        }
        this.modseq = r.readLong();
        if (r.readByte() != 41) {
            throw new ParsingException("MODSEQ parse error");
        }
    }
}
