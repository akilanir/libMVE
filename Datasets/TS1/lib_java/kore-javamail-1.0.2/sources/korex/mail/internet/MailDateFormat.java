package korex.mail.internet;

import com.sun.mail.imap.IMAPStore;
import com.sun.mail.util.MailLogger;
import java.text.FieldPosition;
import java.text.NumberFormat;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Locale;
import java.util.TimeZone;
import java.util.logging.Level;

/* loaded from: kore-javamail-1.0.2.jar:korex/mail/internet/MailDateFormat.class */
public class MailDateFormat extends SimpleDateFormat {
    private static final long serialVersionUID = -8148227605210628779L;
    static boolean debug = false;
    private static MailLogger logger = new MailLogger((Class<?>) MailDateFormat.class, "DEBUG", debug, System.out);
    private static final Calendar cal = new GregorianCalendar(TimeZone.getTimeZone("GMT"));

    public MailDateFormat() {
        super("EEE, d MMM yyyy HH:mm:ss 'XXXXX' (z)", Locale.US);
    }

    @Override // java.text.SimpleDateFormat, java.text.DateFormat
    public StringBuffer format(Date date, StringBuffer dateStrBuf, FieldPosition fieldPosition) {
        int pos;
        int start = dateStrBuf.length();
        super.format(date, dateStrBuf, fieldPosition);
        int pos2 = start + 25;
        while (dateStrBuf.charAt(pos2) != 'X') {
            pos2++;
        }
        this.calendar.clear();
        this.calendar.setTime(date);
        int offset = this.calendar.get(15) + this.calendar.get(16);
        if (offset < 0) {
            int i = pos2;
            pos = pos2 + 1;
            dateStrBuf.setCharAt(i, '-');
            offset = -offset;
        } else {
            int i2 = pos2;
            pos = pos2 + 1;
            dateStrBuf.setCharAt(i2, '+');
        }
        int rawOffsetInMins = (offset / 60) / IMAPStore.RESPONSE;
        int offsetInHrs = rawOffsetInMins / 60;
        int offsetInMins = rawOffsetInMins % 60;
        int i3 = pos;
        int pos3 = pos + 1;
        dateStrBuf.setCharAt(i3, Character.forDigit(offsetInHrs / 10, 10));
        int pos4 = pos3 + 1;
        dateStrBuf.setCharAt(pos3, Character.forDigit(offsetInHrs % 10, 10));
        int pos5 = pos4 + 1;
        dateStrBuf.setCharAt(pos4, Character.forDigit(offsetInMins / 10, 10));
        int i4 = pos5 + 1;
        dateStrBuf.setCharAt(pos5, Character.forDigit(offsetInMins % 10, 10));
        return dateStrBuf;
    }

    @Override // java.text.SimpleDateFormat, java.text.DateFormat
    public Date parse(String text, ParsePosition pos) {
        return parseDate(text.toCharArray(), pos, isLenient());
    }

    private static Date parseDate(char[] orig, ParsePosition pos, boolean lenient) {
        try {
            int seconds = 0;
            int offset = 0;
            MailDateParser p = new MailDateParser(orig, pos.getIndex());
            p.skipUntilNumber();
            int day = p.parseNumber();
            if (!p.skipIfChar('-')) {
                p.skipWhiteSpace();
            }
            int month = p.parseMonth();
            if (!p.skipIfChar('-')) {
                p.skipWhiteSpace();
            }
            int year = p.parseNumber();
            if (year < 50) {
                year += 2000;
            } else if (year < 100) {
                year += 1900;
            }
            p.skipWhiteSpace();
            int hours = p.parseNumber();
            p.skipChar(':');
            int minutes = p.parseNumber();
            if (p.skipIfChar(':')) {
                seconds = p.parseNumber();
            }
            try {
                p.skipWhiteSpace();
                offset = p.parseTimeZone();
            } catch (java.text.ParseException pe) {
                if (logger.isLoggable(Level.FINE)) {
                    logger.log(Level.FINE, "No timezone? : '" + new String(orig) + "'", (Throwable) pe);
                }
            }
            pos.setIndex(p.getIndex());
            Date d = ourUTC(year, month, day, hours, minutes, seconds, offset, lenient);
            return d;
        } catch (Exception e) {
            if (logger.isLoggable(Level.FINE)) {
                logger.log(Level.FINE, "Bad date: '" + new String(orig) + "'", (Throwable) e);
            }
            pos.setIndex(1);
            return null;
        }
    }

    private static synchronized Date ourUTC(int year, int mon, int mday, int hour, int min, int sec, int tzoffset, boolean lenient) {
        cal.clear();
        cal.setLenient(lenient);
        cal.set(1, year);
        cal.set(2, mon);
        cal.set(5, mday);
        cal.set(11, hour);
        cal.set(12, min);
        cal.add(12, tzoffset);
        cal.set(13, sec);
        return cal.getTime();
    }

    @Override // java.text.DateFormat
    public void setCalendar(Calendar newCalendar) {
        throw new RuntimeException("Method setCalendar() shouldn't be called");
    }

    @Override // java.text.DateFormat
    public void setNumberFormat(NumberFormat newNumberFormat) {
        throw new RuntimeException("Method setNumberFormat() shouldn't be called");
    }
}
