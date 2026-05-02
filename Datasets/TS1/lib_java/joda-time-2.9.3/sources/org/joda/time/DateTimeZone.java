package org.joda.time;

import java.io.File;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.ObjectStreamException;
import java.io.Serializable;
import java.util.Collections;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.TimeZone;
import java.util.concurrent.atomic.AtomicReference;
import org.joda.convert.FromString;
import org.joda.convert.ToString;
import org.joda.time.chrono.BaseChronology;
import org.joda.time.field.FieldUtils;
import org.joda.time.format.DateTimeFormatter;
import org.joda.time.format.DateTimeFormatterBuilder;
import org.joda.time.format.FormatUtils;
import org.joda.time.tz.DefaultNameProvider;
import org.joda.time.tz.FixedDateTimeZone;
import org.joda.time.tz.NameProvider;
import org.joda.time.tz.Provider;
import org.joda.time.tz.UTCProvider;
import org.joda.time.tz.ZoneInfoProvider;

/* loaded from: joda-time-2.9.3.jar:org/joda/time/DateTimeZone.class */
public abstract class DateTimeZone implements Serializable {
    private static final long serialVersionUID = 5546345482340108586L;
    private static final int MAX_MILLIS = 86399999;
    private final String iID;
    public static final DateTimeZone UTC = UTCDateTimeZone.INSTANCE;
    private static final AtomicReference<Provider> cProvider = new AtomicReference<>();
    private static final AtomicReference<NameProvider> cNameProvider = new AtomicReference<>();
    private static final AtomicReference<DateTimeZone> cDefault = new AtomicReference<>();

    public abstract String getNameKey(long j);

    public abstract int getOffset(long j);

    public abstract int getStandardOffset(long j);

    public abstract boolean isFixed();

    public abstract long nextTransition(long j);

    public abstract long previousTransition(long j);

    public abstract boolean equals(Object obj);

    public static DateTimeZone getDefault() {
        DateTimeZone dateTimeZone = cDefault.get();
        if (dateTimeZone == null) {
            try {
                try {
                    String property = System.getProperty("user.timezone");
                    if (property != null) {
                        dateTimeZone = forID(property);
                    }
                } catch (IllegalArgumentException e) {
                }
            } catch (RuntimeException e2) {
            }
            if (dateTimeZone == null) {
                dateTimeZone = forTimeZone(TimeZone.getDefault());
            }
            if (dateTimeZone == null) {
                dateTimeZone = UTC;
            }
            if (!cDefault.compareAndSet(null, dateTimeZone)) {
                dateTimeZone = cDefault.get();
            }
        }
        return dateTimeZone;
    }

    public static void setDefault(DateTimeZone dateTimeZone) throws SecurityException {
        SecurityManager securityManager = System.getSecurityManager();
        if (securityManager != null) {
            securityManager.checkPermission(new JodaTimePermission("DateTimeZone.setDefault"));
        }
        if (dateTimeZone == null) {
            throw new IllegalArgumentException("The datetime zone must not be null");
        }
        cDefault.set(dateTimeZone);
    }

    @FromString
    public static DateTimeZone forID(String str) {
        if (str == null) {
            return getDefault();
        }
        if (str.equals("UTC")) {
            return UTC;
        }
        DateTimeZone zone = getProvider().getZone(str);
        if (zone != null) {
            return zone;
        }
        if (str.startsWith("+") || str.startsWith("-")) {
            int parseOffset = parseOffset(str);
            if (parseOffset == 0) {
                return UTC;
            }
            return fixedOffsetZone(printOffset(parseOffset), parseOffset);
        }
        throw new IllegalArgumentException("The datetime zone id '" + str + "' is not recognised");
    }

    public static DateTimeZone forOffsetHours(int i) throws IllegalArgumentException {
        return forOffsetHoursMinutes(i, 0);
    }

    public static DateTimeZone forOffsetHoursMinutes(int i, int i2) throws IllegalArgumentException {
        int i3;
        if (i == 0 && i2 == 0) {
            return UTC;
        }
        if (i < -23 || i > 23) {
            throw new IllegalArgumentException("Hours out of range: " + i);
        }
        if (i2 < -59 || i2 > 59) {
            throw new IllegalArgumentException("Minutes out of range: " + i2);
        }
        if (i > 0 && i2 < 0) {
            throw new IllegalArgumentException("Positive hours must not have negative minutes: " + i2);
        }
        try {
            int i4 = i * 60;
            if (i4 < 0) {
                i3 = i4 - Math.abs(i2);
            } else {
                i3 = i4 + i2;
            }
            return forOffsetMillis(FieldUtils.safeMultiply(i3, DateTimeConstants.MILLIS_PER_MINUTE));
        } catch (ArithmeticException e) {
            throw new IllegalArgumentException("Offset is too large");
        }
    }

    public static DateTimeZone forOffsetMillis(int i) {
        if (i < -86399999 || i > MAX_MILLIS) {
            throw new IllegalArgumentException("Millis out of range: " + i);
        }
        return fixedOffsetZone(printOffset(i), i);
    }

    public static DateTimeZone forTimeZone(TimeZone timeZone) {
        if (timeZone == null) {
            return getDefault();
        }
        String id = timeZone.getID();
        if (id == null) {
            throw new IllegalArgumentException("The TimeZone id must not be null");
        }
        if (id.equals("UTC")) {
            return UTC;
        }
        DateTimeZone dateTimeZone = null;
        String convertedId = getConvertedId(id);
        Provider provider = getProvider();
        if (convertedId != null) {
            dateTimeZone = provider.getZone(convertedId);
        }
        if (dateTimeZone == null) {
            dateTimeZone = provider.getZone(id);
        }
        if (dateTimeZone != null) {
            return dateTimeZone;
        }
        if (convertedId == null && (id.startsWith("GMT+") || id.startsWith("GMT-"))) {
            int parseOffset = parseOffset(id.substring(3));
            if (parseOffset == 0) {
                return UTC;
            }
            return fixedOffsetZone(printOffset(parseOffset), parseOffset);
        }
        throw new IllegalArgumentException("The datetime zone id '" + id + "' is not recognised");
    }

    private static DateTimeZone fixedOffsetZone(String str, int i) {
        if (i == 0) {
            return UTC;
        }
        return new FixedDateTimeZone(str, null, i, i);
    }

    public static Set<String> getAvailableIDs() {
        return getProvider().getAvailableIDs();
    }

    public static Provider getProvider() {
        Provider provider = cProvider.get();
        if (provider == null) {
            provider = getDefaultProvider();
            if (!cProvider.compareAndSet(null, provider)) {
                provider = cProvider.get();
            }
        }
        return provider;
    }

    public static void setProvider(Provider provider) throws SecurityException {
        SecurityManager securityManager = System.getSecurityManager();
        if (securityManager != null) {
            securityManager.checkPermission(new JodaTimePermission("DateTimeZone.setProvider"));
        }
        if (provider == null) {
            provider = getDefaultProvider();
        } else {
            validateProvider(provider);
        }
        cProvider.set(provider);
    }

    private static Provider validateProvider(Provider provider) {
        Set<String> availableIDs = provider.getAvailableIDs();
        if (availableIDs == null || availableIDs.size() == 0) {
            throw new IllegalArgumentException("The provider doesn't have any available ids");
        }
        if (!availableIDs.contains("UTC")) {
            throw new IllegalArgumentException("The provider doesn't support UTC");
        }
        if (!UTC.equals(provider.getZone("UTC"))) {
            throw new IllegalArgumentException("Invalid UTC zone provided");
        }
        return provider;
    }

    private static Provider getDefaultProvider() {
        String property;
        String property2;
        try {
            property2 = System.getProperty("org.joda.time.DateTimeZone.Provider");
        } catch (SecurityException e) {
        }
        if (property2 != null) {
            try {
                return validateProvider((Provider) Class.forName(property2).newInstance());
            } catch (Exception e2) {
                throw new RuntimeException(e2);
            }
        }
        try {
            property = System.getProperty("org.joda.time.DateTimeZone.Folder");
        } catch (SecurityException e3) {
        }
        if (property != null) {
            try {
                return validateProvider(new ZoneInfoProvider(new File(property)));
            } catch (Exception e4) {
                throw new RuntimeException(e4);
            }
        }
        try {
            return validateProvider(new ZoneInfoProvider("org/joda/time/tz/data"));
        } catch (Exception e5) {
            e5.printStackTrace();
            return new UTCProvider();
        }
    }

    public static NameProvider getNameProvider() {
        NameProvider nameProvider = cNameProvider.get();
        if (nameProvider == null) {
            nameProvider = getDefaultNameProvider();
            if (!cNameProvider.compareAndSet(null, nameProvider)) {
                nameProvider = cNameProvider.get();
            }
        }
        return nameProvider;
    }

    public static void setNameProvider(NameProvider nameProvider) throws SecurityException {
        SecurityManager securityManager = System.getSecurityManager();
        if (securityManager != null) {
            securityManager.checkPermission(new JodaTimePermission("DateTimeZone.setNameProvider"));
        }
        if (nameProvider == null) {
            nameProvider = getDefaultNameProvider();
        }
        cNameProvider.set(nameProvider);
    }

    private static NameProvider getDefaultNameProvider() {
        NameProvider nameProvider = null;
        try {
            String property = System.getProperty("org.joda.time.DateTimeZone.NameProvider");
            if (property != null) {
                try {
                    nameProvider = (NameProvider) Class.forName(property).newInstance();
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
            }
        } catch (SecurityException e2) {
        }
        if (nameProvider == null) {
            nameProvider = new DefaultNameProvider();
        }
        return nameProvider;
    }

    private static String getConvertedId(String str) {
        return LazyInit.CONVERSION_MAP.get(str);
    }

    private static int parseOffset(String str) {
        return -((int) LazyInit.OFFSET_FORMATTER.parseMillis(str));
    }

    private static String printOffset(int i) {
        StringBuffer stringBuffer = new StringBuffer();
        if (i >= 0) {
            stringBuffer.append('+');
        } else {
            stringBuffer.append('-');
            i = -i;
        }
        int i2 = i / DateTimeConstants.MILLIS_PER_HOUR;
        FormatUtils.appendPaddedInteger(stringBuffer, i2, 2);
        int i3 = i - (i2 * DateTimeConstants.MILLIS_PER_HOUR);
        int i4 = i3 / DateTimeConstants.MILLIS_PER_MINUTE;
        stringBuffer.append(':');
        FormatUtils.appendPaddedInteger(stringBuffer, i4, 2);
        int i5 = i3 - (i4 * DateTimeConstants.MILLIS_PER_MINUTE);
        if (i5 == 0) {
            return stringBuffer.toString();
        }
        int i6 = i5 / DateTimeConstants.MILLIS_PER_SECOND;
        stringBuffer.append(':');
        FormatUtils.appendPaddedInteger(stringBuffer, i6, 2);
        int i7 = i5 - (i6 * DateTimeConstants.MILLIS_PER_SECOND);
        if (i7 == 0) {
            return stringBuffer.toString();
        }
        stringBuffer.append('.');
        FormatUtils.appendPaddedInteger(stringBuffer, i7, 3);
        return stringBuffer.toString();
    }

    protected DateTimeZone(String str) {
        if (str == null) {
            throw new IllegalArgumentException("Id must not be null");
        }
        this.iID = str;
    }

    @ToString
    public final String getID() {
        return this.iID;
    }

    public final String getShortName(long j) {
        return getShortName(j, null);
    }

    public String getShortName(long j, Locale locale) {
        String shortName;
        if (locale == null) {
            locale = Locale.getDefault();
        }
        String nameKey = getNameKey(j);
        if (nameKey == null) {
            return this.iID;
        }
        NameProvider nameProvider = getNameProvider();
        if (nameProvider instanceof DefaultNameProvider) {
            shortName = ((DefaultNameProvider) nameProvider).getShortName(locale, this.iID, nameKey, isStandardOffset(j));
        } else {
            shortName = nameProvider.getShortName(locale, this.iID, nameKey);
        }
        if (shortName != null) {
            return shortName;
        }
        return printOffset(getOffset(j));
    }

    public final String getName(long j) {
        return getName(j, null);
    }

    public String getName(long j, Locale locale) {
        String name;
        if (locale == null) {
            locale = Locale.getDefault();
        }
        String nameKey = getNameKey(j);
        if (nameKey == null) {
            return this.iID;
        }
        NameProvider nameProvider = getNameProvider();
        if (nameProvider instanceof DefaultNameProvider) {
            name = ((DefaultNameProvider) nameProvider).getName(locale, this.iID, nameKey, isStandardOffset(j));
        } else {
            name = nameProvider.getName(locale, this.iID, nameKey);
        }
        if (name != null) {
            return name;
        }
        return printOffset(getOffset(j));
    }

    public final int getOffset(ReadableInstant readableInstant) {
        if (readableInstant == null) {
            return getOffset(DateTimeUtils.currentTimeMillis());
        }
        return getOffset(readableInstant.getMillis());
    }

    public boolean isStandardOffset(long j) {
        return getOffset(j) == getStandardOffset(j);
    }

    public int getOffsetFromLocal(long j) {
        int offset = getOffset(j);
        long j2 = j - offset;
        int offset2 = getOffset(j2);
        if (offset != offset2) {
            if (offset - offset2 < 0) {
                long nextTransition = nextTransition(j2);
                if (nextTransition == j - offset) {
                    nextTransition = Long.MAX_VALUE;
                }
                long nextTransition2 = nextTransition(j - offset2);
                if (nextTransition2 == j - offset2) {
                    nextTransition2 = Long.MAX_VALUE;
                }
                if (nextTransition != nextTransition2) {
                    return offset;
                }
            }
        } else if (offset >= 0) {
            long previousTransition = previousTransition(j2);
            if (previousTransition < j2) {
                int offset3 = getOffset(previousTransition);
                if (j2 - previousTransition <= offset3 - offset) {
                    return offset3;
                }
            }
        }
        return offset2;
    }

    public long convertUTCToLocal(long j) {
        int offset = getOffset(j);
        long j2 = j + offset;
        if ((j ^ j2) < 0 && (j ^ offset) >= 0) {
            throw new ArithmeticException("Adding time zone offset caused overflow");
        }
        return j2;
    }

    public long convertLocalToUTC(long j, boolean z, long j2) {
        int offset = getOffset(j2);
        long j3 = j - offset;
        if (getOffset(j3) == offset) {
            return j3;
        }
        return convertLocalToUTC(j, z);
    }

    public long convertLocalToUTC(long j, boolean z) {
        int offset = getOffset(j);
        int offset2 = getOffset(j - offset);
        if (offset != offset2 && (z || offset < 0)) {
            long nextTransition = nextTransition(j - offset);
            if (nextTransition == j - offset) {
                nextTransition = Long.MAX_VALUE;
            }
            long nextTransition2 = nextTransition(j - offset2);
            if (nextTransition2 == j - offset2) {
                nextTransition2 = Long.MAX_VALUE;
            }
            if (nextTransition != nextTransition2) {
                if (z) {
                    throw new IllegalInstantException(j, getID());
                }
                offset2 = offset;
            }
        }
        long j2 = j - offset2;
        if ((j ^ j2) < 0 && (j ^ offset2) < 0) {
            throw new ArithmeticException("Subtracting time zone offset caused overflow");
        }
        return j2;
    }

    public long getMillisKeepLocal(DateTimeZone dateTimeZone, long j) {
        if (dateTimeZone == null) {
            dateTimeZone = getDefault();
        }
        if (dateTimeZone == this) {
            return j;
        }
        return dateTimeZone.convertLocalToUTC(convertUTCToLocal(j), false, j);
    }

    public boolean isLocalDateTimeGap(LocalDateTime localDateTime) {
        if (isFixed()) {
            return false;
        }
        try {
            localDateTime.toDateTime(this);
            return false;
        } catch (IllegalInstantException e) {
            return true;
        }
    }

    public long adjustOffset(long j, boolean z) {
        long j2 = j - 10800000;
        long offset = getOffset(j2);
        long offset2 = getOffset(j + 10800000);
        if (offset <= offset2) {
            return j;
        }
        long j3 = offset - offset2;
        long nextTransition = nextTransition(j2);
        long j4 = nextTransition - j3;
        long j5 = nextTransition + j3;
        if (j < j4 || j >= j5) {
            return j;
        }
        return j - j4 >= j3 ? z ? j : j - j3 : z ? j + j3 : j;
    }

    public TimeZone toTimeZone() {
        return TimeZone.getTimeZone(this.iID);
    }

    public int hashCode() {
        return 57 + getID().hashCode();
    }

    public String toString() {
        return getID();
    }

    protected Object writeReplace() throws ObjectStreamException {
        return new Stub(this.iID);
    }

    /* loaded from: joda-time-2.9.3.jar:org/joda/time/DateTimeZone$Stub.class */
    private static final class Stub implements Serializable {
        private static final long serialVersionUID = -6471952376487863581L;
        private transient String iID;

        Stub(String str) {
            this.iID = str;
        }

        private void writeObject(ObjectOutputStream objectOutputStream) throws IOException {
            objectOutputStream.writeUTF(this.iID);
        }

        private void readObject(ObjectInputStream objectInputStream) throws IOException {
            this.iID = objectInputStream.readUTF();
        }

        private Object readResolve() throws ObjectStreamException {
            return DateTimeZone.forID(this.iID);
        }
    }

    /* loaded from: joda-time-2.9.3.jar:org/joda/time/DateTimeZone$LazyInit.class */
    static final class LazyInit {
        static final Map<String, String> CONVERSION_MAP = buildMap();
        static final DateTimeFormatter OFFSET_FORMATTER = buildFormatter();

        LazyInit() {
        }

        private static DateTimeFormatter buildFormatter() {
            return new DateTimeFormatterBuilder().appendTimeZoneOffset(null, true, 2, 4).toFormatter().withChronology(new BaseChronology() { // from class: org.joda.time.DateTimeZone.LazyInit.1
                private static final long serialVersionUID = -3128740902654445468L;

                @Override // org.joda.time.chrono.BaseChronology, org.joda.time.Chronology
                public DateTimeZone getZone() {
                    return null;
                }

                @Override // org.joda.time.chrono.BaseChronology, org.joda.time.Chronology
                public Chronology withUTC() {
                    return this;
                }

                @Override // org.joda.time.chrono.BaseChronology, org.joda.time.Chronology
                public Chronology withZone(DateTimeZone dateTimeZone) {
                    return this;
                }

                @Override // org.joda.time.chrono.BaseChronology, org.joda.time.Chronology
                public String toString() {
                    return getClass().getName();
                }
            });
        }

        private static Map<String, String> buildMap() {
            HashMap hashMap = new HashMap();
            hashMap.put("GMT", "UTC");
            hashMap.put("WET", "WET");
            hashMap.put("CET", "CET");
            hashMap.put("MET", "CET");
            hashMap.put("ECT", "CET");
            hashMap.put("EET", "EET");
            hashMap.put("MIT", "Pacific/Apia");
            hashMap.put("HST", "Pacific/Honolulu");
            hashMap.put("AST", "America/Anchorage");
            hashMap.put("PST", "America/Los_Angeles");
            hashMap.put("MST", "America/Denver");
            hashMap.put("PNT", "America/Phoenix");
            hashMap.put("CST", "America/Chicago");
            hashMap.put("EST", "America/New_York");
            hashMap.put("IET", "America/Indiana/Indianapolis");
            hashMap.put("PRT", "America/Puerto_Rico");
            hashMap.put("CNT", "America/St_Johns");
            hashMap.put("AGT", "America/Argentina/Buenos_Aires");
            hashMap.put("BET", "America/Sao_Paulo");
            hashMap.put("ART", "Africa/Cairo");
            hashMap.put("CAT", "Africa/Harare");
            hashMap.put("EAT", "Africa/Addis_Ababa");
            hashMap.put("NET", "Asia/Yerevan");
            hashMap.put("PLT", "Asia/Karachi");
            hashMap.put("IST", "Asia/Kolkata");
            hashMap.put("BST", "Asia/Dhaka");
            hashMap.put("VST", "Asia/Ho_Chi_Minh");
            hashMap.put("CTT", "Asia/Shanghai");
            hashMap.put("JST", "Asia/Tokyo");
            hashMap.put("ACT", "Australia/Darwin");
            hashMap.put("AET", "Australia/Sydney");
            hashMap.put("SST", "Pacific/Guadalcanal");
            hashMap.put("NST", "Pacific/Auckland");
            return Collections.unmodifiableMap(hashMap);
        }
    }
}
