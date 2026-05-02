package com.sun.mail.pop3;

import korex.mail.Flags;
import korex.mail.Folder;
import korex.mail.Message;
import korex.mail.MessagingException;
import korex.mail.MethodNotSupportedException;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/pop3/DefaultFolder.class */
public class DefaultFolder extends Folder {
    DefaultFolder(POP3Store store) {
        super(store);
    }

    @Override // korex.mail.Folder
    public String getName() {
        return "";
    }

    @Override // korex.mail.Folder
    public String getFullName() {
        return "";
    }

    @Override // korex.mail.Folder
    public Folder getParent() {
        return null;
    }

    @Override // korex.mail.Folder
    public boolean exists() {
        return true;
    }

    @Override // korex.mail.Folder
    public Folder[] list(String pattern) throws MessagingException {
        Folder[] f = {getInbox()};
        return f;
    }

    @Override // korex.mail.Folder
    public char getSeparator() {
        return '/';
    }

    @Override // korex.mail.Folder
    public int getType() {
        return 2;
    }

    @Override // korex.mail.Folder
    public boolean create(int type) throws MessagingException {
        return false;
    }

    @Override // korex.mail.Folder
    public boolean hasNewMessages() throws MessagingException {
        return false;
    }

    @Override // korex.mail.Folder
    public Folder getFolder(String name) throws MessagingException {
        if (!name.equalsIgnoreCase("INBOX")) {
            throw new MessagingException("only INBOX supported");
        }
        return getInbox();
    }

    protected Folder getInbox() throws MessagingException {
        return getStore().getFolder("INBOX");
    }

    @Override // korex.mail.Folder
    public boolean delete(boolean recurse) throws MessagingException {
        throw new MethodNotSupportedException("delete");
    }

    @Override // korex.mail.Folder
    public boolean renameTo(Folder f) throws MessagingException {
        throw new MethodNotSupportedException("renameTo");
    }

    @Override // korex.mail.Folder
    public void open(int mode) throws MessagingException {
        throw new MethodNotSupportedException("open");
    }

    @Override // korex.mail.Folder
    public void close(boolean expunge) throws MessagingException {
        throw new MethodNotSupportedException("close");
    }

    @Override // korex.mail.Folder
    public boolean isOpen() {
        return false;
    }

    @Override // korex.mail.Folder
    public Flags getPermanentFlags() {
        return new Flags();
    }

    @Override // korex.mail.Folder
    public int getMessageCount() throws MessagingException {
        return 0;
    }

    @Override // korex.mail.Folder
    public Message getMessage(int msgno) throws MessagingException {
        throw new MethodNotSupportedException("getMessage");
    }

    @Override // korex.mail.Folder
    public void appendMessages(Message[] msgs) throws MessagingException {
        throw new MethodNotSupportedException("Append not supported");
    }

    @Override // korex.mail.Folder
    public Message[] expunge() throws MessagingException {
        throw new MethodNotSupportedException("expunge");
    }
}
