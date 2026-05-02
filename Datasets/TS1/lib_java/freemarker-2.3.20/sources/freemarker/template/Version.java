package freemarker.template;

import freemarker.template.utility.StringUtil;
import java.io.Serializable;
import java.util.Date;

/* loaded from: freemarker-2.3.20.jar:freemarker/template/Version.class */
public final class Version implements Serializable {
    private final int major;
    private final int minor;
    private final int micro;
    private final String extraInfo;
    private final Boolean gaeCompliant;
    private final Date buildDate;
    private int intValue;
    private String stringValue;
    private Integer hashCode;

    public Version(String stringValue) {
        this(stringValue, (Boolean) null, (Date) null);
    }

    public Version(String stringValue, Boolean gaeCompliant, Date buildDate) {
        char firstChar;
        String stringValue2 = stringValue.trim();
        int[] parts = new int[3];
        String extraInfoTmp = null;
        int partIdx = 0;
        boolean valid = false;
        int i = 0;
        while (true) {
            if (i >= stringValue2.length()) {
                break;
            }
            char c = stringValue2.charAt(i);
            if (c >= '0' && c <= '9') {
                parts[partIdx] = (parts[partIdx] * 10) + (c - '0');
                valid = true;
            } else if (c == '.') {
                if (partIdx == 2) {
                    extraInfoTmp = stringValue2.substring(i);
                    break;
                }
                partIdx++;
            } else {
                extraInfoTmp = stringValue2.substring(i);
                break;
            }
            i++;
        }
        if (!valid) {
            throw new IllegalArgumentException(new StringBuffer().append("A version number string ").append(StringUtil.jQuote(stringValue2)).append(" must start with a number.").toString());
        }
        if (extraInfoTmp != null && ((firstChar = extraInfoTmp.charAt(0)) == '.' || firstChar == '-' || firstChar == '_')) {
            extraInfoTmp = extraInfoTmp.substring(1);
        }
        this.extraInfo = extraInfoTmp;
        this.major = parts[0];
        this.minor = parts[1];
        this.micro = parts[2];
        calculateIntValue();
        this.stringValue = stringValue2;
        this.gaeCompliant = gaeCompliant;
        this.buildDate = buildDate;
    }

    public Version(int major, int minor, int micro) {
        this(major, minor, micro, null, null, null);
    }

    public Version(int major, int minor, int micro, String extraInfo, Boolean gaeCompatible, Date buildDate) {
        this.major = major;
        this.minor = minor;
        this.micro = micro;
        this.extraInfo = extraInfo;
        this.gaeCompliant = gaeCompatible;
        this.buildDate = buildDate;
        calculateIntValue();
    }

    private void calculateIntValue() {
        this.intValue = intValueFor(this.major, this.minor, this.micro);
    }

    public static int intValueFor(int major, int minor, int micro) {
        return (major * 1000000) + (minor * 1000) + micro;
    }

    public synchronized String toString() {
        if (this.stringValue == null) {
            this.stringValue = new StringBuffer().append(this.major).append(".").append(this.minor).append(".").append(this.micro).toString();
            if (this.extraInfo != null) {
                this.stringValue = new StringBuffer().append(this.stringValue).append("-").append(this.extraInfo).toString();
            }
        }
        return this.stringValue;
    }

    public int getMajor() {
        return this.major;
    }

    public int getMinor() {
        return this.minor;
    }

    public int getMicro() {
        return this.micro;
    }

    public String getExtraInfo() {
        return this.extraInfo;
    }

    public Boolean isGAECompliant() {
        return this.gaeCompliant;
    }

    public Date getBuildDate() {
        return this.buildDate;
    }

    public int intValue() {
        return this.intValue;
    }

    public int hashCode() {
        if (this.hashCode == null) {
            int result = (31 * 1) + (this.buildDate == null ? 0 : this.buildDate.hashCode());
            this.hashCode = new Integer((31 * ((31 * ((31 * ((31 * ((31 * result) + (this.extraInfo == null ? 0 : this.extraInfo.hashCode()))) + (this.gaeCompliant == null ? 0 : this.gaeCompliant.hashCode()))) + (this.hashCode == null ? 0 : this.hashCode.hashCode()))) + this.intValue)) + (this.stringValue == null ? 0 : this.stringValue.hashCode()));
        }
        return this.hashCode.intValue();
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        Version other = (Version) obj;
        if (this.intValue != other.intValue || other.hashCode() != hashCode()) {
            return false;
        }
        if (this.buildDate == null) {
            if (other.buildDate != null) {
                return false;
            }
        } else if (!this.buildDate.equals(other.buildDate)) {
            return false;
        }
        if (this.extraInfo == null) {
            if (other.extraInfo != null) {
                return false;
            }
        } else if (!this.extraInfo.equals(other.extraInfo)) {
            return false;
        }
        if (this.gaeCompliant == null) {
            return other.gaeCompliant == null;
        }
        if (!this.gaeCompliant.equals(other.gaeCompliant)) {
            return false;
        }
        return true;
    }
}
