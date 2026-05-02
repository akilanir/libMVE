package org.joda.time.format;

/* loaded from: joda-time-2.9.1.jar:org/joda/time/format/InternalParser.class */
interface InternalParser {
    int estimateParsedLength();

    int parseInto(DateTimeParserBucket dateTimeParserBucket, CharSequence charSequence, int i);
}
