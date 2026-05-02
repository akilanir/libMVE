package com.sun.mail.smtp;

import korex.mail.SendFailedException;
import korex.mail.internet.InternetAddress;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/smtp/SMTPAddressFailedException.class */
public class SMTPAddressFailedException extends SendFailedException {
    protected InternetAddress addr;
    protected String cmd;
    protected int rc;
    private static final long serialVersionUID = 804831199768630097L;

    public SMTPAddressFailedException(InternetAddress addr, String cmd, int rc, String err) {
        super(err);
        this.addr = addr;
        this.cmd = cmd;
        this.rc = rc;
    }

    public InternetAddress getAddress() {
        return this.addr;
    }

    public String getCommand() {
        return this.cmd;
    }

    public int getReturnCode() {
        return this.rc;
    }
}
