package com.sun.mail.imap;

import com.sun.mail.iap.ProtocolException;
import com.sun.mail.imap.protocol.BODYSTRUCTURE;
import com.sun.mail.imap.protocol.ENVELOPE;
import com.sun.mail.imap.protocol.IMAPProtocol;
import korex.mail.Flags;
import korex.mail.FolderClosedException;
import korex.mail.MessageRemovedException;
import korex.mail.MessagingException;
import korex.mail.MethodNotSupportedException;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/imap/IMAPNestedMessage.class */
public class IMAPNestedMessage extends IMAPMessage {
    private IMAPMessage msg;

    IMAPNestedMessage(IMAPMessage m, BODYSTRUCTURE b, ENVELOPE e, String sid) {
        super(m._getSession());
        this.msg = m;
        this.bs = b;
        this.envelope = e;
        this.sectionId = sid;
        setPeek(m.getPeek());
    }

    @Override // com.sun.mail.imap.IMAPMessage
    protected IMAPProtocol getProtocol() throws ProtocolException, FolderClosedException {
        return this.msg.getProtocol();
    }

    @Override // com.sun.mail.imap.IMAPMessage
    protected boolean isREV1() throws FolderClosedException {
        return this.msg.isREV1();
    }

    @Override // com.sun.mail.imap.IMAPMessage
    protected Object getMessageCacheLock() {
        return this.msg.getMessageCacheLock();
    }

    @Override // com.sun.mail.imap.IMAPMessage
    protected int getSequenceNumber() {
        return this.msg.getSequenceNumber();
    }

    @Override // com.sun.mail.imap.IMAPMessage
    protected void checkExpunged() throws MessageRemovedException {
        this.msg.checkExpunged();
    }

    @Override // korex.mail.Message
    public boolean isExpunged() {
        return this.msg.isExpunged();
    }

    @Override // com.sun.mail.imap.IMAPMessage
    protected int getFetchBlockSize() {
        return this.msg.getFetchBlockSize();
    }

    @Override // com.sun.mail.imap.IMAPMessage
    protected boolean ignoreBodyStructureSize() {
        return this.msg.ignoreBodyStructureSize();
    }

    @Override // com.sun.mail.imap.IMAPMessage, korex.mail.internet.MimeMessage, korex.mail.Part
    public int getSize() throws MessagingException {
        return this.bs.size;
    }

    @Override // com.sun.mail.imap.IMAPMessage, korex.mail.internet.MimeMessage, korex.mail.Message
    public synchronized void setFlags(Flags flag, boolean set) throws MessagingException {
        throw new MethodNotSupportedException("Cannot set flags on this nested message");
    }
}
