package com.sun.mail.imap;

import korex.mail.Message;
import korex.mail.search.SearchTerm;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/imap/ModifiedSinceTerm.class */
public final class ModifiedSinceTerm extends SearchTerm {
    private long modseq;
    private static final long serialVersionUID = 5151457469634727992L;

    public ModifiedSinceTerm(long modseq) {
        this.modseq = modseq;
    }

    public long getModSeq() {
        return this.modseq;
    }

    @Override // korex.mail.search.SearchTerm
    public boolean match(Message msg) {
        try {
            if (msg instanceof IMAPMessage) {
                long m = ((IMAPMessage) msg).getModSeq();
                return m >= this.modseq;
            }
            return false;
        } catch (Exception e) {
            return false;
        }
    }

    public boolean equals(Object obj) {
        return (obj instanceof ModifiedSinceTerm) && this.modseq == ((ModifiedSinceTerm) obj).modseq;
    }

    public int hashCode() {
        return (int) this.modseq;
    }
}
