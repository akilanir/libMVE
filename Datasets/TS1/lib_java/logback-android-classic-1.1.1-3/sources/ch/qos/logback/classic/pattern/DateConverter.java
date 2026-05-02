package ch.qos.logback.classic.pattern;

import ch.qos.logback.classic.spi.ILoggingEvent;
import ch.qos.logback.core.util.CachingDateFormatter;
import java.util.List;
import java.util.TimeZone;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/pattern/DateConverter.class */
public class DateConverter extends ClassicConverter {
    long lastTimestamp = -1;
    String timestampStrCache = null;
    CachingDateFormatter cachingDateFormatter = null;

    public void start() {
        String firstOption = getFirstOption();
        if (firstOption == null) {
            firstOption = "yyyy-MM-dd HH:mm:ss,SSS";
        }
        if (firstOption.equals("ISO8601")) {
            firstOption = "yyyy-MM-dd HH:mm:ss,SSS";
        }
        try {
            this.cachingDateFormatter = new CachingDateFormatter(firstOption);
        } catch (IllegalArgumentException e) {
            addWarn("Could not instantiate SimpleDateFormat with pattern " + firstOption, e);
            this.cachingDateFormatter = new CachingDateFormatter("yyyy-MM-dd HH:mm:ss,SSS");
        }
        List optionList = getOptionList();
        if (optionList == null || optionList.size() <= 1) {
            return;
        }
        this.cachingDateFormatter.setTimeZone(TimeZone.getTimeZone((String) optionList.get(1)));
    }

    public String convert(ILoggingEvent iLoggingEvent) {
        return this.cachingDateFormatter.format(iLoggingEvent.getTimeStamp());
    }
}
