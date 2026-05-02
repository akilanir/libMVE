package com.sun.mail.imap;

import com.sun.mail.imap.protocol.UIDSet;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/imap/ResyncData.class */
public class ResyncData {
    private long uidvalidity;
    private long modseq;
    private UIDSet[] uids;
    public static final ResyncData CONDSTORE = new ResyncData(-1, -1);

    public ResyncData(long uidvalidity, long modseq) {
        this.uidvalidity = -1L;
        this.modseq = -1L;
        this.uids = null;
        this.uidvalidity = uidvalidity;
        this.modseq = modseq;
        this.uids = null;
    }

    public ResyncData(long uidvalidity, long modseq, long uidFirst, long uidLast) {
        this.uidvalidity = -1L;
        this.modseq = -1L;
        this.uids = null;
        this.uidvalidity = uidvalidity;
        this.modseq = modseq;
        this.uids = new UIDSet[]{new UIDSet(uidFirst, uidLast)};
    }

    public ResyncData(long uidvalidity, long modseq, long[] uids) {
        this.uidvalidity = -1L;
        this.modseq = -1L;
        this.uids = null;
        this.uidvalidity = uidvalidity;
        this.modseq = modseq;
        this.uids = UIDSet.createUIDSets(uids);
    }

    public long getUIDValidity() {
        return this.uidvalidity;
    }

    public long getModSeq() {
        return this.modseq;
    }

    UIDSet[] getUIDSet() {
        return this.uids;
    }
}
