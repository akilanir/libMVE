package com.sun.mail.imap.protocol;

import com.sun.mail.iap.ParsingException;
import com.sun.mail.iap.Response;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import korex.mail.internet.InternetAddress;
import korex.mail.internet.MailDateFormat;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/imap/protocol/ENVELOPE.class */
public class ENVELOPE implements Item {
    public int msgno;
    public Date date;
    public String subject;
    public InternetAddress[] from;
    public InternetAddress[] sender;
    public InternetAddress[] replyTo;
    public InternetAddress[] to;
    public InternetAddress[] cc;
    public InternetAddress[] bcc;
    public String inReplyTo;
    public String messageId;
    static final char[] name = {'E', 'N', 'V', 'E', 'L', 'O', 'P', 'E'};
    private static MailDateFormat mailDateFormat = new MailDateFormat();

    public ENVELOPE(FetchResponse r) throws ParsingException {
        this.date = null;
        this.msgno = r.getNumber();
        r.skipSpaces();
        if (r.readByte() != 40) {
            throw new ParsingException("ENVELOPE parse error");
        }
        String s = r.readString();
        if (s != null) {
            try {
                this.date = mailDateFormat.parse(s);
            } catch (RuntimeException e) {
            } catch (ParseException e2) {
            }
        }
        this.subject = r.readString();
        this.from = parseAddressList(r);
        this.sender = parseAddressList(r);
        this.replyTo = parseAddressList(r);
        this.to = parseAddressList(r);
        this.cc = parseAddressList(r);
        this.bcc = parseAddressList(r);
        this.inReplyTo = r.readString();
        this.messageId = r.readString();
        if (r.readByte() != 41) {
            throw new ParsingException("ENVELOPE parse error");
        }
    }

    private InternetAddress[] parseAddressList(Response r) throws ParsingException {
        r.skipSpaces();
        byte b = r.readByte();
        if (b == 40) {
            if (r.peekByte() == 41) {
                r.skip(1);
                return null;
            }
            List<InternetAddress> v = new ArrayList<>();
            do {
                IMAPAddress a = new IMAPAddress(r);
                if (!a.isEndOfGroup()) {
                    v.add(a);
                }
            } while (r.peekByte() != 41);
            r.skip(1);
            return (InternetAddress[]) v.toArray(new InternetAddress[v.size()]);
        }
        if (b == 78 || b == 110) {
            r.skip(2);
            return null;
        }
        throw new ParsingException("ADDRESS parse error");
    }
}
