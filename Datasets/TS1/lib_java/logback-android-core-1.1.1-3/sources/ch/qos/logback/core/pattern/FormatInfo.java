package ch.qos.logback.core.pattern;

import ch.qos.logback.core.spi.ComponentTracker;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/pattern/FormatInfo.class */
public class FormatInfo {
    private int min;
    private int max;
    private boolean leftPad;
    private boolean leftTruncate;

    public FormatInfo() {
        this.min = Integer.MIN_VALUE;
        this.max = ComponentTracker.DEFAULT_MAX_COMPONENTS;
        this.leftPad = true;
        this.leftTruncate = true;
    }

    public FormatInfo(int i, int i2) {
        this.min = Integer.MIN_VALUE;
        this.max = ComponentTracker.DEFAULT_MAX_COMPONENTS;
        this.leftPad = true;
        this.leftTruncate = true;
        this.min = i;
        this.max = i2;
    }

    public FormatInfo(int i, int i2, boolean z, boolean z2) {
        this.min = Integer.MIN_VALUE;
        this.max = ComponentTracker.DEFAULT_MAX_COMPONENTS;
        this.leftPad = true;
        this.leftTruncate = true;
        this.min = i;
        this.max = i2;
        this.leftPad = z;
        this.leftTruncate = z2;
    }

    public static FormatInfo valueOf(String str) throws IllegalArgumentException {
        String str2;
        if (str == null) {
            throw new NullPointerException("Argument cannot be null");
        }
        FormatInfo formatInfo = new FormatInfo();
        int indexOf = str.indexOf(46);
        String str3 = null;
        if (indexOf != -1) {
            str2 = str.substring(0, indexOf);
            if (indexOf + 1 == str.length()) {
                throw new IllegalArgumentException("Formatting string [" + str + "] should not end with '.'");
            }
            str3 = str.substring(indexOf + 1);
        } else {
            str2 = str;
        }
        if (str2 != null && str2.length() > 0) {
            int parseInt = Integer.parseInt(str2);
            if (parseInt >= 0) {
                formatInfo.min = parseInt;
            } else {
                formatInfo.min = -parseInt;
                formatInfo.leftPad = false;
            }
        }
        if (str3 != null && str3.length() > 0) {
            int parseInt2 = Integer.parseInt(str3);
            if (parseInt2 >= 0) {
                formatInfo.max = parseInt2;
            } else {
                formatInfo.max = -parseInt2;
                formatInfo.leftTruncate = false;
            }
        }
        return formatInfo;
    }

    public boolean isLeftPad() {
        return this.leftPad;
    }

    public void setLeftPad(boolean z) {
        this.leftPad = z;
    }

    public int getMax() {
        return this.max;
    }

    public void setMax(int i) {
        this.max = i;
    }

    public int getMin() {
        return this.min;
    }

    public void setMin(int i) {
        this.min = i;
    }

    public boolean isLeftTruncate() {
        return this.leftTruncate;
    }

    public void setLeftTruncate(boolean z) {
        this.leftTruncate = z;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof FormatInfo)) {
            return false;
        }
        FormatInfo formatInfo = (FormatInfo) obj;
        return this.min == formatInfo.min && this.max == formatInfo.max && this.leftPad == formatInfo.leftPad && this.leftTruncate == formatInfo.leftTruncate;
    }

    public int hashCode() {
        return (31 * ((31 * ((31 * this.min) + this.max)) + (this.leftPad ? 1 : 0))) + (this.leftTruncate ? 1 : 0);
    }

    public String toString() {
        return "FormatInfo(" + this.min + ", " + this.max + ", " + this.leftPad + ", " + this.leftTruncate + ")";
    }
}
