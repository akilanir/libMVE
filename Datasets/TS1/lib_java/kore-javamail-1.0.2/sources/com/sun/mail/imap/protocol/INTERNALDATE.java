package com.sun.mail.imap.protocol;

import com.sun.mail.iap.ParsingException;
import com.sun.mail.imap.IMAPStore;
import java.text.FieldPosition;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.TimeZone;
import korex.mail.internet.MailDateFormat;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/imap/protocol/INTERNALDATE.class */
public class INTERNALDATE implements Item {
    public int msgno;
    protected Date date;
    static final char[] name = {'I', 'N', 'T', 'E', 'R', 'N', 'A', 'L', 'D', 'A', 'T', 'E'};
    private static MailDateFormat mailDateFormat = new MailDateFormat();
    private static SimpleDateFormat df = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss ", Locale.US);

    public INTERNALDATE(FetchResponse r) throws ParsingException {
        this.msgno = r.getNumber();
        r.skipSpaces();
        String s = r.readString();
        if (s == null) {
            throw new ParsingException("INTERNALDATE is NIL");
        }
        try {
            this.date = mailDateFormat.parse(s);
        } catch (ParseException e) {
            throw new ParsingException("INTERNALDATE parse error");
        }
    }

    public Date getDate() {
        return this.date;
    }

    public static String format(Date d) {
        StringBuffer sb = new StringBuffer();
        synchronized (df) {
            df.format(d, sb, new FieldPosition(0));
        }
        TimeZone tz = TimeZone.getDefault();
        int offset = tz.getOffset(d.getTime());
        int rawOffsetInMins = (offset / 60) / IMAPStore.RESPONSE;
        if (rawOffsetInMins < 0) {
            sb.append('-');
            rawOffsetInMins = -rawOffsetInMins;
        } else {
            sb.append('+');
        }
        int offsetInHrs = rawOffsetInMins / 60;
        int offsetInMins = rawOffsetInMins % 60;
        sb.append(Character.forDigit(offsetInHrs / 10, 10));
        sb.append(Character.forDigit(offsetInHrs % 10, 10));
        sb.append(Character.forDigit(offsetInMins / 10, 10));
        sb.append(Character.forDigit(offsetInMins % 10, 10));
        return sb.toString();
    }
}
