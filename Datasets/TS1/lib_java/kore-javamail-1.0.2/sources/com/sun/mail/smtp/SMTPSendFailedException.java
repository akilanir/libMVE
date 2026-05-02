package com.sun.mail.smtp;

import korex.mail.Address;
import korex.mail.SendFailedException;
import korex.mail.internet.InternetAddress;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/smtp/SMTPSendFailedException.class */
public class SMTPSendFailedException extends SendFailedException {
    protected InternetAddress addr;
    protected String cmd;
    protected int rc;
    private static final long serialVersionUID = 8049122628728932894L;

    public SMTPSendFailedException(String cmd, int rc, String err, Exception ex, Address[] vs, Address[] vus, Address[] inv) {
        super(err, ex, vs, vus, inv);
        this.cmd = cmd;
        this.rc = rc;
    }

    public String getCommand() {
        return this.cmd;
    }

    public int getReturnCode() {
        return this.rc;
    }
}
