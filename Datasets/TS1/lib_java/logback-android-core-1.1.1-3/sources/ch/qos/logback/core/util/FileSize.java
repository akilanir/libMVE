package ch.qos.logback.core.util;

import ch.qos.logback.core.CoreConstants;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/util/FileSize.class */
public class FileSize {
    private static final String LENGTH_PART = "([0-9]+)";
    private static final int DOUBLE_GROUP = 1;
    private static final String UNIT_PART = "(|kb|mb|gb)s?";
    private static final int UNIT_GROUP = 2;
    private static final Pattern FILE_SIZE_PATTERN = Pattern.compile("([0-9]+)\\s*(|kb|mb|gb)s?", 2);
    static final long KB_COEFFICIENT = 1024;
    static final long MB_COEFFICIENT = 1048576;
    static final long GB_COEFFICIENT = 1073741824;
    final long size;

    FileSize(long j) {
        this.size = j;
    }

    public long getSize() {
        return this.size;
    }

    public static FileSize valueOf(String str) {
        long j;
        Matcher matcher = FILE_SIZE_PATTERN.matcher(str);
        if (!matcher.matches()) {
            throw new IllegalArgumentException("String value [" + str + "] is not in the expected format.");
        }
        String group = matcher.group(1);
        String group2 = matcher.group(2);
        long longValue = Long.valueOf(group).longValue();
        if (group2.equalsIgnoreCase(CoreConstants.EMPTY_STRING)) {
            j = 1;
        } else if (group2.equalsIgnoreCase("kb")) {
            j = 1024;
        } else if (group2.equalsIgnoreCase("mb")) {
            j = 1048576;
        } else {
            if (!group2.equalsIgnoreCase("gb")) {
                throw new IllegalStateException("Unexpected " + group2);
            }
            j = 1073741824;
        }
        return new FileSize(longValue * j);
    }
}
