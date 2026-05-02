package com.sun.mail.imap;

import com.sun.mail.iap.ProtocolException;
import com.sun.mail.imap.IMAPFolder;
import com.sun.mail.imap.protocol.IMAPProtocol;
import com.sun.mail.imap.protocol.ListInfo;
import korex.mail.Folder;
import korex.mail.Message;
import korex.mail.MessagingException;
import korex.mail.MethodNotSupportedException;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/imap/DefaultFolder.class */
public class DefaultFolder extends IMAPFolder {
    protected DefaultFolder(IMAPStore store) {
        super("", (char) 65535, store, null);
        this.exists = true;
        this.type = 2;
    }

    @Override // com.sun.mail.imap.IMAPFolder, korex.mail.Folder
    public synchronized String getName() {
        return this.fullName;
    }

    @Override // com.sun.mail.imap.IMAPFolder, korex.mail.Folder
    public Folder getParent() {
        return null;
    }

    @Override // com.sun.mail.imap.IMAPFolder, korex.mail.Folder
    public synchronized Folder[] list(final String pattern) throws MessagingException {
        ListInfo[] li = (ListInfo[]) doCommand(new IMAPFolder.ProtocolCommand() { // from class: com.sun.mail.imap.DefaultFolder.1
            @Override // com.sun.mail.imap.IMAPFolder.ProtocolCommand
            public Object doCommand(IMAPProtocol p) throws ProtocolException {
                return p.list("", pattern);
            }
        });
        if (li == null) {
            return new Folder[0];
        }
        IMAPFolder[] folders = new IMAPFolder[li.length];
        for (int i = 0; i < folders.length; i++) {
            folders[i] = ((IMAPStore) this.store).newIMAPFolder(li[i]);
        }
        return folders;
    }

    @Override // com.sun.mail.imap.IMAPFolder, korex.mail.Folder
    public synchronized Folder[] listSubscribed(final String pattern) throws MessagingException {
        ListInfo[] li = (ListInfo[]) doCommand(new IMAPFolder.ProtocolCommand() { // from class: com.sun.mail.imap.DefaultFolder.2
            @Override // com.sun.mail.imap.IMAPFolder.ProtocolCommand
            public Object doCommand(IMAPProtocol p) throws ProtocolException {
                return p.lsub("", pattern);
            }
        });
        if (li == null) {
            return new Folder[0];
        }
        IMAPFolder[] folders = new IMAPFolder[li.length];
        for (int i = 0; i < folders.length; i++) {
            folders[i] = ((IMAPStore) this.store).newIMAPFolder(li[i]);
        }
        return folders;
    }

    @Override // com.sun.mail.imap.IMAPFolder, korex.mail.Folder
    public boolean hasNewMessages() throws MessagingException {
        return false;
    }

    @Override // com.sun.mail.imap.IMAPFolder, korex.mail.Folder
    public Folder getFolder(String name) throws MessagingException {
        return ((IMAPStore) this.store).newIMAPFolder(name, (char) 65535);
    }

    @Override // com.sun.mail.imap.IMAPFolder, korex.mail.Folder
    public boolean delete(boolean recurse) throws MessagingException {
        throw new MethodNotSupportedException("Cannot delete Default Folder");
    }

    @Override // com.sun.mail.imap.IMAPFolder, korex.mail.Folder
    public boolean renameTo(Folder f) throws MessagingException {
        throw new MethodNotSupportedException("Cannot rename Default Folder");
    }

    @Override // com.sun.mail.imap.IMAPFolder, korex.mail.Folder
    public void appendMessages(Message[] msgs) throws MessagingException {
        throw new MethodNotSupportedException("Cannot append to Default Folder");
    }

    @Override // com.sun.mail.imap.IMAPFolder, korex.mail.Folder
    public Message[] expunge() throws MessagingException {
        throw new MethodNotSupportedException("Cannot expunge Default Folder");
    }
}
