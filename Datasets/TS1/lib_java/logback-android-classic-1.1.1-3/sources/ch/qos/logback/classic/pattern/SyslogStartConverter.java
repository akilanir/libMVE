package ch.qos.logback.classic.pattern;

import ch.qos.logback.classic.spi.ILoggingEvent;
import ch.qos.logback.classic.util.LevelToSyslogSeverity;
import ch.qos.logback.core.net.SyslogAppenderBase;
import java.text.DateFormatSymbols;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/pattern/SyslogStartConverter.class */
public class SyslogStartConverter extends ClassicConverter {
    SimpleDateFormat simpleFormat;
    int facility;
    long lastTimestamp = -1;
    String timesmapStr = null;
    final String localHostName = "localhost";

    public void start() {
        int i = 0;
        String firstOption = getFirstOption();
        if (firstOption == null) {
            addError("was expecting a facility string as an option");
            return;
        }
        this.facility = SyslogAppenderBase.facilityStringToint(firstOption);
        try {
            this.simpleFormat = new SimpleDateFormat("MMM dd HH:mm:ss", new DateFormatSymbols(Locale.US));
        } catch (IllegalArgumentException e) {
            addError("Could not instantiate SimpleDateFormat", e);
            i = 0 + 1;
        }
        if (i == 0) {
            super.start();
        }
    }

    public String convert(ILoggingEvent iLoggingEvent) {
        StringBuilder sb = new StringBuilder();
        int convert = this.facility + LevelToSyslogSeverity.convert(iLoggingEvent);
        sb.append("<");
        sb.append(convert);
        sb.append(">");
        sb.append(computeTimeStampString(iLoggingEvent.getTimeStamp()));
        sb.append(' ');
        sb.append("localhost");
        sb.append(' ');
        return sb.toString();
    }

    String computeTimeStampString(long j) {
        String str;
        synchronized (this) {
            if (j != this.lastTimestamp) {
                this.lastTimestamp = j;
                this.timesmapStr = this.simpleFormat.format(new Date(j));
            }
            str = this.timesmapStr;
        }
        return str;
    }
}
