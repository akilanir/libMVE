package ch.qos.logback.core.rolling;

import ch.qos.logback.core.util.FileSize;
import ch.qos.logback.core.util.InvocationGate;
import java.io.File;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/rolling/SizeBasedTriggeringPolicy.class */
public class SizeBasedTriggeringPolicy<E> extends TriggeringPolicyBase<E> {
    public static final String SEE_SIZE_FORMAT = "http://logback.qos.ch/codes.html#sbtp_size_format";
    public static final long DEFAULT_MAX_FILE_SIZE = 10485760;
    FileSize maxFileSize;
    String maxFileSizeAsString = Long.toString(DEFAULT_MAX_FILE_SIZE);
    private InvocationGate invocationGate = new InvocationGate();

    public SizeBasedTriggeringPolicy() {
    }

    public SizeBasedTriggeringPolicy(String str) {
        setMaxFileSize(str);
    }

    @Override // ch.qos.logback.core.rolling.TriggeringPolicy
    public boolean isTriggeringEvent(File file, E e) {
        if (this.invocationGate.skipFurtherWork()) {
            return false;
        }
        this.invocationGate.updateMaskIfNecessary(System.currentTimeMillis());
        return file.length() >= this.maxFileSize.getSize();
    }

    public String getMaxFileSize() {
        return this.maxFileSizeAsString;
    }

    public void setMaxFileSize(String str) {
        this.maxFileSizeAsString = str;
        this.maxFileSize = FileSize.valueOf(str);
    }

    long toFileSize(String str) {
        if (str == null) {
            return DEFAULT_MAX_FILE_SIZE;
        }
        String upperCase = str.trim().toUpperCase();
        long j = 1;
        int indexOf = upperCase.indexOf("KB");
        if (indexOf != -1) {
            j = 1024;
            upperCase = upperCase.substring(0, indexOf);
        } else {
            int indexOf2 = upperCase.indexOf("MB");
            if (indexOf2 != -1) {
                j = 1048576;
                upperCase = upperCase.substring(0, indexOf2);
            } else {
                int indexOf3 = upperCase.indexOf("GB");
                if (indexOf3 != -1) {
                    j = 1073741824;
                    upperCase = upperCase.substring(0, indexOf3);
                }
            }
        }
        if (upperCase == null) {
            return DEFAULT_MAX_FILE_SIZE;
        }
        try {
            return Long.valueOf(upperCase).longValue() * j;
        } catch (NumberFormatException e) {
            addError("[" + upperCase + "] is not in proper int format. Please refer to " + SEE_SIZE_FORMAT);
            addError("[" + str + "] not in expected format.", e);
            return DEFAULT_MAX_FILE_SIZE;
        }
    }
}
