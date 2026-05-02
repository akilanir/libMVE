package org.apache.commons.net.ftp.parser;

import java.text.DateFormatSymbols;
import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;
import org.apache.commons.net.ftp.Configurable;
import org.apache.commons.net.ftp.FTPClientConfig;

/* loaded from: commons-net-3.3.jar:org/apache/commons/net/ftp/parser/FTPTimestampParserImpl.class */
public class FTPTimestampParserImpl implements FTPTimestampParser, Configurable {
    private SimpleDateFormat defaultDateFormat;
    private SimpleDateFormat recentDateFormat;
    private boolean lenientFutureDates = false;

    public FTPTimestampParserImpl() {
        setDefaultDateFormat(FTPTimestampParser.DEFAULT_SDF);
        setRecentDateFormat(FTPTimestampParser.DEFAULT_RECENT_SDF);
    }

    @Override // org.apache.commons.net.ftp.parser.FTPTimestampParser
    public Calendar parseTimestamp(String timestampStr) throws ParseException {
        Calendar now = Calendar.getInstance();
        return parseTimestamp(timestampStr, now);
    }

    public Calendar parseTimestamp(String timestampStr, Calendar serverTime) throws ParseException {
        Calendar working = (Calendar) serverTime.clone();
        working.setTimeZone(getServerTimeZone());
        if (this.recentDateFormat != null) {
            Calendar now = (Calendar) serverTime.clone();
            now.setTimeZone(getServerTimeZone());
            if (this.lenientFutureDates) {
                now.add(5, 1);
            }
            String year = Integer.toString(now.get(1));
            String timeStampStrPlusYear = timestampStr + " " + year;
            SimpleDateFormat hackFormatter = new SimpleDateFormat(this.recentDateFormat.toPattern() + " yyyy", this.recentDateFormat.getDateFormatSymbols());
            hackFormatter.setLenient(false);
            hackFormatter.setTimeZone(this.recentDateFormat.getTimeZone());
            ParsePosition pp = new ParsePosition(0);
            Date parsed = hackFormatter.parse(timeStampStrPlusYear, pp);
            if (parsed != null && pp.getIndex() == timeStampStrPlusYear.length()) {
                working.setTime(parsed);
                if (working.after(now)) {
                    working.add(1, -1);
                }
                return working;
            }
        }
        ParsePosition pp2 = new ParsePosition(0);
        Date parsed2 = this.defaultDateFormat.parse(timestampStr, pp2);
        if (parsed2 != null && pp2.getIndex() == timestampStr.length()) {
            working.setTime(parsed2);
            return working;
        }
        throw new ParseException("Timestamp '" + timestampStr + "' could not be parsed using a server time of " + serverTime.getTime().toString(), pp2.getErrorIndex());
    }

    public SimpleDateFormat getDefaultDateFormat() {
        return this.defaultDateFormat;
    }

    public String getDefaultDateFormatString() {
        return this.defaultDateFormat.toPattern();
    }

    private void setDefaultDateFormat(String format) {
        if (format != null) {
            this.defaultDateFormat = new SimpleDateFormat(format);
            this.defaultDateFormat.setLenient(false);
        }
    }

    public SimpleDateFormat getRecentDateFormat() {
        return this.recentDateFormat;
    }

    public String getRecentDateFormatString() {
        return this.recentDateFormat.toPattern();
    }

    private void setRecentDateFormat(String format) {
        if (format != null) {
            this.recentDateFormat = new SimpleDateFormat(format);
            this.recentDateFormat.setLenient(false);
        }
    }

    public String[] getShortMonths() {
        return this.defaultDateFormat.getDateFormatSymbols().getShortMonths();
    }

    public TimeZone getServerTimeZone() {
        return this.defaultDateFormat.getTimeZone();
    }

    private void setServerTimeZone(String serverTimeZoneId) {
        TimeZone serverTimeZone = TimeZone.getDefault();
        if (serverTimeZoneId != null) {
            serverTimeZone = TimeZone.getTimeZone(serverTimeZoneId);
        }
        this.defaultDateFormat.setTimeZone(serverTimeZone);
        if (this.recentDateFormat != null) {
            this.recentDateFormat.setTimeZone(serverTimeZone);
        }
    }

    @Override // org.apache.commons.net.ftp.Configurable
    public void configure(FTPClientConfig config) {
        DateFormatSymbols dfs;
        String languageCode = config.getServerLanguageCode();
        String shortmonths = config.getShortMonthNames();
        if (shortmonths != null) {
            dfs = FTPClientConfig.getDateFormatSymbols(shortmonths);
        } else if (languageCode != null) {
            dfs = FTPClientConfig.lookupDateFormatSymbols(languageCode);
        } else {
            dfs = FTPClientConfig.lookupDateFormatSymbols("en");
        }
        String recentFormatString = config.getRecentDateFormatStr();
        if (recentFormatString == null) {
            this.recentDateFormat = null;
        } else {
            this.recentDateFormat = new SimpleDateFormat(recentFormatString, dfs);
            this.recentDateFormat.setLenient(false);
        }
        String defaultFormatString = config.getDefaultDateFormatStr();
        if (defaultFormatString == null) {
            throw new IllegalArgumentException("defaultFormatString cannot be null");
        }
        this.defaultDateFormat = new SimpleDateFormat(defaultFormatString, dfs);
        this.defaultDateFormat.setLenient(false);
        setServerTimeZone(config.getServerTimeZoneId());
        this.lenientFutureDates = config.isLenientFutureDates();
    }

    boolean isLenientFutureDates() {
        return this.lenientFutureDates;
    }

    void setLenientFutureDates(boolean lenientFutureDates) {
        this.lenientFutureDates = lenientFutureDates;
    }
}
