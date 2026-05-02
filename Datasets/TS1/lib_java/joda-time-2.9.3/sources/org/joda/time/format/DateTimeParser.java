package org.joda.time.format;

/* loaded from: joda-time-2.9.3.jar:org/joda/time/format/DateTimeParser.class */
public interface DateTimeParser {
    int estimateParsedLength();

    int parseInto(DateTimeParserBucket dateTimeParserBucket, String str, int i);
}
