package org.apache.commons.lang3.time;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.Serializable;
import java.text.DateFormatSymbols;
import java.text.FieldPosition;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;
import java.util.TimeZone;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;
import org.apache.commons.lang3.ClassUtils;
import org.apache.commons.lang3.Validate;

/* loaded from: commons-lang3-3.3.2.jar:org/apache/commons/lang3/time/FastDatePrinter.class */
public class FastDatePrinter implements DatePrinter, Serializable {
    private static final long serialVersionUID = 1;
    public static final int FULL = 0;
    public static final int LONG = 1;
    public static final int MEDIUM = 2;
    public static final int SHORT = 3;
    private final String mPattern;
    private final TimeZone mTimeZone;
    private final Locale mLocale;
    private transient Rule[] mRules;
    private transient int mMaxLengthEstimate;
    private static final ConcurrentMap<TimeZoneDisplayKey, String> cTimeZoneDisplayCache = new ConcurrentHashMap(7);

    /* loaded from: commons-lang3-3.3.2.jar:org/apache/commons/lang3/time/FastDatePrinter$NumberRule.class */
    private interface NumberRule extends Rule {
        void appendTo(StringBuffer stringBuffer, int i);
    }

    /* loaded from: commons-lang3-3.3.2.jar:org/apache/commons/lang3/time/FastDatePrinter$Rule.class */
    private interface Rule {
        int estimateLength();

        void appendTo(StringBuffer stringBuffer, Calendar calendar);
    }

    protected FastDatePrinter(String pattern, TimeZone timeZone, Locale locale) {
        this.mPattern = pattern;
        this.mTimeZone = timeZone;
        this.mLocale = locale;
        init();
    }

    private void init() {
        List<Rule> rulesList = parsePattern();
        this.mRules = (Rule[]) rulesList.toArray(new Rule[rulesList.size()]);
        int len = 0;
        int i = this.mRules.length;
        while (true) {
            i--;
            if (i >= 0) {
                len += this.mRules[i].estimateLength();
            } else {
                this.mMaxLengthEstimate = len;
                return;
            }
        }
    }

    protected List<Rule> parsePattern() {
        Rule stringLiteral;
        DateFormatSymbols symbols = new DateFormatSymbols(this.mLocale);
        List<Rule> rules = new ArrayList<>();
        String[] ERAs = symbols.getEras();
        String[] months = symbols.getMonths();
        String[] shortMonths = symbols.getShortMonths();
        String[] weekdays = symbols.getWeekdays();
        String[] shortWeekdays = symbols.getShortWeekdays();
        String[] AmPmStrings = symbols.getAmPmStrings();
        int length = this.mPattern.length();
        int[] indexRef = new int[1];
        int i = 0;
        while (i < length) {
            indexRef[0] = i;
            String token = parseToken(this.mPattern, indexRef);
            int i2 = indexRef[0];
            int tokenLen = token.length();
            if (tokenLen != 0) {
                char c = token.charAt(0);
                switch (c) {
                    case '\'':
                        String sub = token.substring(1);
                        if (sub.length() == 1) {
                            stringLiteral = new CharacterLiteral(sub.charAt(0));
                            break;
                        } else {
                            stringLiteral = new StringLiteral(sub);
                            break;
                        }
                    case '(':
                    case ')':
                    case '*':
                    case '+':
                    case ',':
                    case '-':
                    case ClassUtils.PACKAGE_SEPARATOR_CHAR /* 46 */:
                    case '/':
                    case '0':
                    case '1':
                    case '2':
                    case '3':
                    case '4':
                    case '5':
                    case '6':
                    case '7':
                    case '8':
                    case '9':
                    case ':':
                    case ';':
                    case '<':
                    case '=':
                    case '>':
                    case '?':
                    case '@':
                    case 'A':
                    case 'B':
                    case 'C':
                    case 'I':
                    case 'J':
                    case 'L':
                    case 'N':
                    case 'O':
                    case 'P':
                    case 'Q':
                    case 'R':
                    case 'T':
                    case 'U':
                    case 'V':
                    case 'X':
                    case 'Y':
                    case '[':
                    case '\\':
                    case ']':
                    case '^':
                    case '_':
                    case '`':
                    case 'b':
                    case 'c':
                    case 'e':
                    case 'f':
                    case 'g':
                    case 'i':
                    case 'j':
                    case 'l':
                    case 'n':
                    case 'o':
                    case 'p':
                    case 'q':
                    case 'r':
                    case 't':
                    case 'u':
                    case 'v':
                    case 'x':
                    default:
                        throw new IllegalArgumentException("Illegal pattern component: " + token);
                    case 'D':
                        stringLiteral = selectNumberRule(6, tokenLen);
                        break;
                    case 'E':
                        stringLiteral = new TextField(7, tokenLen < 4 ? shortWeekdays : weekdays);
                        break;
                    case 'F':
                        stringLiteral = selectNumberRule(8, tokenLen);
                        break;
                    case 'G':
                        stringLiteral = new TextField(0, ERAs);
                        break;
                    case 'H':
                        stringLiteral = selectNumberRule(11, tokenLen);
                        break;
                    case 'K':
                        stringLiteral = selectNumberRule(10, tokenLen);
                        break;
                    case 'M':
                        if (tokenLen >= 4) {
                            stringLiteral = new TextField(2, months);
                            break;
                        } else if (tokenLen == 3) {
                            stringLiteral = new TextField(2, shortMonths);
                            break;
                        } else if (tokenLen == 2) {
                            stringLiteral = TwoDigitMonthField.INSTANCE;
                            break;
                        } else {
                            stringLiteral = UnpaddedMonthField.INSTANCE;
                            break;
                        }
                    case 'S':
                        stringLiteral = selectNumberRule(14, tokenLen);
                        break;
                    case 'W':
                        stringLiteral = selectNumberRule(4, tokenLen);
                        break;
                    case 'Z':
                        if (tokenLen == 1) {
                            stringLiteral = TimeZoneNumberRule.INSTANCE_NO_COLON;
                            break;
                        } else {
                            stringLiteral = TimeZoneNumberRule.INSTANCE_COLON;
                            break;
                        }
                    case 'a':
                        stringLiteral = new TextField(9, AmPmStrings);
                        break;
                    case 'd':
                        stringLiteral = selectNumberRule(5, tokenLen);
                        break;
                    case 'h':
                        stringLiteral = new TwelveHourField(selectNumberRule(10, tokenLen));
                        break;
                    case 'k':
                        stringLiteral = new TwentyFourHourField(selectNumberRule(11, tokenLen));
                        break;
                    case 'm':
                        stringLiteral = selectNumberRule(12, tokenLen);
                        break;
                    case 's':
                        stringLiteral = selectNumberRule(13, tokenLen);
                        break;
                    case 'w':
                        stringLiteral = selectNumberRule(3, tokenLen);
                        break;
                    case 'y':
                        if (tokenLen == 2) {
                            stringLiteral = TwoDigitYearField.INSTANCE;
                            break;
                        } else {
                            stringLiteral = selectNumberRule(1, tokenLen < 4 ? 4 : tokenLen);
                            break;
                        }
                    case 'z':
                        if (tokenLen >= 4) {
                            stringLiteral = new TimeZoneNameRule(this.mTimeZone, this.mLocale, 1);
                            break;
                        } else {
                            stringLiteral = new TimeZoneNameRule(this.mTimeZone, this.mLocale, 0);
                            break;
                        }
                }
                Rule rule = stringLiteral;
                rules.add(rule);
                i = i2 + 1;
            } else {
                return rules;
            }
        }
        return rules;
    }

    protected String parseToken(String pattern, int[] indexRef) {
        StringBuilder buf = new StringBuilder();
        int i = indexRef[0];
        int length = pattern.length();
        char c = pattern.charAt(i);
        if ((c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z')) {
            buf.append(c);
            while (i + 1 < length) {
                char peek = pattern.charAt(i + 1);
                if (peek != c) {
                    break;
                }
                buf.append(c);
                i++;
            }
        } else {
            buf.append('\'');
            boolean inLiteral = false;
            while (i < length) {
                char c2 = pattern.charAt(i);
                if (c2 == '\'') {
                    if (i + 1 < length && pattern.charAt(i + 1) == '\'') {
                        i++;
                        buf.append(c2);
                    } else {
                        inLiteral = !inLiteral;
                    }
                } else {
                    if (!inLiteral && ((c2 >= 'A' && c2 <= 'Z') || (c2 >= 'a' && c2 <= 'z'))) {
                        i--;
                        break;
                    }
                    buf.append(c2);
                }
                i++;
            }
        }
        indexRef[0] = i;
        return buf.toString();
    }

    protected NumberRule selectNumberRule(int field, int padding) {
        switch (padding) {
            case 1:
                return new UnpaddedNumberField(field);
            case 2:
                return new TwoDigitNumberField(field);
            default:
                return new PaddedNumberField(field, padding);
        }
    }

    @Override // org.apache.commons.lang3.time.DatePrinter
    public StringBuffer format(Object obj, StringBuffer toAppendTo, FieldPosition pos) {
        if (obj instanceof Date) {
            return format((Date) obj, toAppendTo);
        }
        if (obj instanceof Calendar) {
            return format((Calendar) obj, toAppendTo);
        }
        if (obj instanceof Long) {
            return format(((Long) obj).longValue(), toAppendTo);
        }
        throw new IllegalArgumentException("Unknown class: " + (obj == null ? "<null>" : obj.getClass().getName()));
    }

    @Override // org.apache.commons.lang3.time.DatePrinter
    public String format(long millis) {
        Calendar c = newCalendar();
        c.setTimeInMillis(millis);
        return applyRulesToString(c);
    }

    private String applyRulesToString(Calendar c) {
        return applyRules(c, new StringBuffer(this.mMaxLengthEstimate)).toString();
    }

    private GregorianCalendar newCalendar() {
        return new GregorianCalendar(this.mTimeZone, this.mLocale);
    }

    @Override // org.apache.commons.lang3.time.DatePrinter
    public String format(Date date) {
        Calendar c = newCalendar();
        c.setTime(date);
        return applyRulesToString(c);
    }

    @Override // org.apache.commons.lang3.time.DatePrinter
    public String format(Calendar calendar) {
        return format(calendar, new StringBuffer(this.mMaxLengthEstimate)).toString();
    }

    @Override // org.apache.commons.lang3.time.DatePrinter
    public StringBuffer format(long millis, StringBuffer buf) {
        return format(new Date(millis), buf);
    }

    @Override // org.apache.commons.lang3.time.DatePrinter
    public StringBuffer format(Date date, StringBuffer buf) {
        Calendar c = newCalendar();
        c.setTime(date);
        return applyRules(c, buf);
    }

    @Override // org.apache.commons.lang3.time.DatePrinter
    public StringBuffer format(Calendar calendar, StringBuffer buf) {
        return applyRules(calendar, buf);
    }

    protected StringBuffer applyRules(Calendar calendar, StringBuffer buf) {
        Rule[] arr$ = this.mRules;
        for (Rule rule : arr$) {
            rule.appendTo(buf, calendar);
        }
        return buf;
    }

    @Override // org.apache.commons.lang3.time.DatePrinter
    public String getPattern() {
        return this.mPattern;
    }

    @Override // org.apache.commons.lang3.time.DatePrinter
    public TimeZone getTimeZone() {
        return this.mTimeZone;
    }

    @Override // org.apache.commons.lang3.time.DatePrinter
    public Locale getLocale() {
        return this.mLocale;
    }

    public int getMaxLengthEstimate() {
        return this.mMaxLengthEstimate;
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof FastDatePrinter)) {
            return false;
        }
        FastDatePrinter other = (FastDatePrinter) obj;
        return this.mPattern.equals(other.mPattern) && this.mTimeZone.equals(other.mTimeZone) && this.mLocale.equals(other.mLocale);
    }

    public int hashCode() {
        return this.mPattern.hashCode() + (13 * (this.mTimeZone.hashCode() + (13 * this.mLocale.hashCode())));
    }

    public String toString() {
        return "FastDatePrinter[" + this.mPattern + "," + this.mLocale + "," + this.mTimeZone.getID() + "]";
    }

    private void readObject(ObjectInputStream in) throws IOException, ClassNotFoundException {
        in.defaultReadObject();
        init();
    }

    /* loaded from: commons-lang3-3.3.2.jar:org/apache/commons/lang3/time/FastDatePrinter$CharacterLiteral.class */
    private static class CharacterLiteral implements Rule {
        private final char mValue;

        CharacterLiteral(char value) {
            this.mValue = value;
        }

        @Override // org.apache.commons.lang3.time.FastDatePrinter.Rule
        public int estimateLength() {
            return 1;
        }

        @Override // org.apache.commons.lang3.time.FastDatePrinter.Rule
        public void appendTo(StringBuffer buffer, Calendar calendar) {
            buffer.append(this.mValue);
        }
    }

    /* loaded from: commons-lang3-3.3.2.jar:org/apache/commons/lang3/time/FastDatePrinter$StringLiteral.class */
    private static class StringLiteral implements Rule {
        private final String mValue;

        StringLiteral(String value) {
            this.mValue = value;
        }

        @Override // org.apache.commons.lang3.time.FastDatePrinter.Rule
        public int estimateLength() {
            return this.mValue.length();
        }

        @Override // org.apache.commons.lang3.time.FastDatePrinter.Rule
        public void appendTo(StringBuffer buffer, Calendar calendar) {
            buffer.append(this.mValue);
        }
    }

    /* loaded from: commons-lang3-3.3.2.jar:org/apache/commons/lang3/time/FastDatePrinter$TextField.class */
    private static class TextField implements Rule {
        private final int mField;
        private final String[] mValues;

        TextField(int field, String[] values) {
            this.mField = field;
            this.mValues = values;
        }

        @Override // org.apache.commons.lang3.time.FastDatePrinter.Rule
        public int estimateLength() {
            int max = 0;
            int i = this.mValues.length;
            while (true) {
                i--;
                if (i >= 0) {
                    int len = this.mValues[i].length();
                    if (len > max) {
                        max = len;
                    }
                } else {
                    return max;
                }
            }
        }

        @Override // org.apache.commons.lang3.time.FastDatePrinter.Rule
        public void appendTo(StringBuffer buffer, Calendar calendar) {
            buffer.append(this.mValues[calendar.get(this.mField)]);
        }
    }

    /* loaded from: commons-lang3-3.3.2.jar:org/apache/commons/lang3/time/FastDatePrinter$UnpaddedNumberField.class */
    private static class UnpaddedNumberField implements NumberRule {
        private final int mField;

        UnpaddedNumberField(int field) {
            this.mField = field;
        }

        @Override // org.apache.commons.lang3.time.FastDatePrinter.Rule
        public int estimateLength() {
            return 4;
        }

        @Override // org.apache.commons.lang3.time.FastDatePrinter.Rule
        public void appendTo(StringBuffer buffer, Calendar calendar) {
            appendTo(buffer, calendar.get(this.mField));
        }

        @Override // org.apache.commons.lang3.time.FastDatePrinter.NumberRule
        public final void appendTo(StringBuffer buffer, int value) {
            if (value < 10) {
                buffer.append((char) (value + 48));
            } else if (value < 100) {
                buffer.append((char) ((value / 10) + 48));
                buffer.append((char) ((value % 10) + 48));
            } else {
                buffer.append(Integer.toString(value));
            }
        }
    }

    /* loaded from: commons-lang3-3.3.2.jar:org/apache/commons/lang3/time/FastDatePrinter$UnpaddedMonthField.class */
    private static class UnpaddedMonthField implements NumberRule {
        static final UnpaddedMonthField INSTANCE = new UnpaddedMonthField();

        UnpaddedMonthField() {
        }

        @Override // org.apache.commons.lang3.time.FastDatePrinter.Rule
        public int estimateLength() {
            return 2;
        }

        @Override // org.apache.commons.lang3.time.FastDatePrinter.Rule
        public void appendTo(StringBuffer buffer, Calendar calendar) {
            appendTo(buffer, calendar.get(2) + 1);
        }

        @Override // org.apache.commons.lang3.time.FastDatePrinter.NumberRule
        public final void appendTo(StringBuffer buffer, int value) {
            if (value < 10) {
                buffer.append((char) (value + 48));
            } else {
                buffer.append((char) ((value / 10) + 48));
                buffer.append((char) ((value % 10) + 48));
            }
        }
    }

    /* loaded from: commons-lang3-3.3.2.jar:org/apache/commons/lang3/time/FastDatePrinter$PaddedNumberField.class */
    private static class PaddedNumberField implements NumberRule {
        private final int mField;
        private final int mSize;

        PaddedNumberField(int field, int size) {
            if (size < 3) {
                throw new IllegalArgumentException();
            }
            this.mField = field;
            this.mSize = size;
        }

        @Override // org.apache.commons.lang3.time.FastDatePrinter.Rule
        public int estimateLength() {
            return 4;
        }

        @Override // org.apache.commons.lang3.time.FastDatePrinter.Rule
        public void appendTo(StringBuffer buffer, Calendar calendar) {
            appendTo(buffer, calendar.get(this.mField));
        }

        @Override // org.apache.commons.lang3.time.FastDatePrinter.NumberRule
        public final void appendTo(StringBuffer buffer, int value) {
            int digits;
            if (value < 100) {
                int i = this.mSize;
                while (true) {
                    i--;
                    if (i >= 2) {
                        buffer.append('0');
                    } else {
                        buffer.append((char) ((value / 10) + 48));
                        buffer.append((char) ((value % 10) + 48));
                        return;
                    }
                }
            } else {
                if (value < 1000) {
                    digits = 3;
                } else {
                    Validate.isTrue(value > -1, "Negative values should not be possible", value);
                    digits = Integer.toString(value).length();
                }
                int i2 = this.mSize;
                while (true) {
                    i2--;
                    if (i2 >= digits) {
                        buffer.append('0');
                    } else {
                        buffer.append(Integer.toString(value));
                        return;
                    }
                }
            }
        }
    }

    /* loaded from: commons-lang3-3.3.2.jar:org/apache/commons/lang3/time/FastDatePrinter$TwoDigitNumberField.class */
    private static class TwoDigitNumberField implements NumberRule {
        private final int mField;

        TwoDigitNumberField(int field) {
            this.mField = field;
        }

        @Override // org.apache.commons.lang3.time.FastDatePrinter.Rule
        public int estimateLength() {
            return 2;
        }

        @Override // org.apache.commons.lang3.time.FastDatePrinter.Rule
        public void appendTo(StringBuffer buffer, Calendar calendar) {
            appendTo(buffer, calendar.get(this.mField));
        }

        @Override // org.apache.commons.lang3.time.FastDatePrinter.NumberRule
        public final void appendTo(StringBuffer buffer, int value) {
            if (value < 100) {
                buffer.append((char) ((value / 10) + 48));
                buffer.append((char) ((value % 10) + 48));
            } else {
                buffer.append(Integer.toString(value));
            }
        }
    }

    /* loaded from: commons-lang3-3.3.2.jar:org/apache/commons/lang3/time/FastDatePrinter$TwoDigitYearField.class */
    private static class TwoDigitYearField implements NumberRule {
        static final TwoDigitYearField INSTANCE = new TwoDigitYearField();

        TwoDigitYearField() {
        }

        @Override // org.apache.commons.lang3.time.FastDatePrinter.Rule
        public int estimateLength() {
            return 2;
        }

        @Override // org.apache.commons.lang3.time.FastDatePrinter.Rule
        public void appendTo(StringBuffer buffer, Calendar calendar) {
            appendTo(buffer, calendar.get(1) % 100);
        }

        @Override // org.apache.commons.lang3.time.FastDatePrinter.NumberRule
        public final void appendTo(StringBuffer buffer, int value) {
            buffer.append((char) ((value / 10) + 48));
            buffer.append((char) ((value % 10) + 48));
        }
    }

    /* loaded from: commons-lang3-3.3.2.jar:org/apache/commons/lang3/time/FastDatePrinter$TwoDigitMonthField.class */
    private static class TwoDigitMonthField implements NumberRule {
        static final TwoDigitMonthField INSTANCE = new TwoDigitMonthField();

        TwoDigitMonthField() {
        }

        @Override // org.apache.commons.lang3.time.FastDatePrinter.Rule
        public int estimateLength() {
            return 2;
        }

        @Override // org.apache.commons.lang3.time.FastDatePrinter.Rule
        public void appendTo(StringBuffer buffer, Calendar calendar) {
            appendTo(buffer, calendar.get(2) + 1);
        }

        @Override // org.apache.commons.lang3.time.FastDatePrinter.NumberRule
        public final void appendTo(StringBuffer buffer, int value) {
            buffer.append((char) ((value / 10) + 48));
            buffer.append((char) ((value % 10) + 48));
        }
    }

    /* loaded from: commons-lang3-3.3.2.jar:org/apache/commons/lang3/time/FastDatePrinter$TwelveHourField.class */
    private static class TwelveHourField implements NumberRule {
        private final NumberRule mRule;

        TwelveHourField(NumberRule rule) {
            this.mRule = rule;
        }

        @Override // org.apache.commons.lang3.time.FastDatePrinter.Rule
        public int estimateLength() {
            return this.mRule.estimateLength();
        }

        @Override // org.apache.commons.lang3.time.FastDatePrinter.Rule
        public void appendTo(StringBuffer buffer, Calendar calendar) {
            int value = calendar.get(10);
            if (value == 0) {
                value = calendar.getLeastMaximum(10) + 1;
            }
            this.mRule.appendTo(buffer, value);
        }

        @Override // org.apache.commons.lang3.time.FastDatePrinter.NumberRule
        public void appendTo(StringBuffer buffer, int value) {
            this.mRule.appendTo(buffer, value);
        }
    }

    /* loaded from: commons-lang3-3.3.2.jar:org/apache/commons/lang3/time/FastDatePrinter$TwentyFourHourField.class */
    private static class TwentyFourHourField implements NumberRule {
        private final NumberRule mRule;

        TwentyFourHourField(NumberRule rule) {
            this.mRule = rule;
        }

        @Override // org.apache.commons.lang3.time.FastDatePrinter.Rule
        public int estimateLength() {
            return this.mRule.estimateLength();
        }

        @Override // org.apache.commons.lang3.time.FastDatePrinter.Rule
        public void appendTo(StringBuffer buffer, Calendar calendar) {
            int value = calendar.get(11);
            if (value == 0) {
                value = calendar.getMaximum(11) + 1;
            }
            this.mRule.appendTo(buffer, value);
        }

        @Override // org.apache.commons.lang3.time.FastDatePrinter.NumberRule
        public void appendTo(StringBuffer buffer, int value) {
            this.mRule.appendTo(buffer, value);
        }
    }

    static String getTimeZoneDisplay(TimeZone tz, boolean daylight, int style, Locale locale) {
        TimeZoneDisplayKey key = new TimeZoneDisplayKey(tz, daylight, style, locale);
        String value = cTimeZoneDisplayCache.get(key);
        if (value == null) {
            value = tz.getDisplayName(daylight, style, locale);
            String prior = cTimeZoneDisplayCache.putIfAbsent(key, value);
            if (prior != null) {
                value = prior;
            }
        }
        return value;
    }

    /* loaded from: commons-lang3-3.3.2.jar:org/apache/commons/lang3/time/FastDatePrinter$TimeZoneNameRule.class */
    private static class TimeZoneNameRule implements Rule {
        private final Locale mLocale;
        private final int mStyle;
        private final String mStandard;
        private final String mDaylight;

        TimeZoneNameRule(TimeZone timeZone, Locale locale, int style) {
            this.mLocale = locale;
            this.mStyle = style;
            this.mStandard = FastDatePrinter.getTimeZoneDisplay(timeZone, false, style, locale);
            this.mDaylight = FastDatePrinter.getTimeZoneDisplay(timeZone, true, style, locale);
        }

        @Override // org.apache.commons.lang3.time.FastDatePrinter.Rule
        public int estimateLength() {
            return Math.max(this.mStandard.length(), this.mDaylight.length());
        }

        @Override // org.apache.commons.lang3.time.FastDatePrinter.Rule
        public void appendTo(StringBuffer buffer, Calendar calendar) {
            TimeZone zone = calendar.getTimeZone();
            if (zone.useDaylightTime() && calendar.get(16) != 0) {
                buffer.append(FastDatePrinter.getTimeZoneDisplay(zone, true, this.mStyle, this.mLocale));
            } else {
                buffer.append(FastDatePrinter.getTimeZoneDisplay(zone, false, this.mStyle, this.mLocale));
            }
        }
    }

    /* loaded from: commons-lang3-3.3.2.jar:org/apache/commons/lang3/time/FastDatePrinter$TimeZoneNumberRule.class */
    private static class TimeZoneNumberRule implements Rule {
        static final TimeZoneNumberRule INSTANCE_COLON = new TimeZoneNumberRule(true);
        static final TimeZoneNumberRule INSTANCE_NO_COLON = new TimeZoneNumberRule(false);
        final boolean mColon;

        TimeZoneNumberRule(boolean colon) {
            this.mColon = colon;
        }

        @Override // org.apache.commons.lang3.time.FastDatePrinter.Rule
        public int estimateLength() {
            return 5;
        }

        @Override // org.apache.commons.lang3.time.FastDatePrinter.Rule
        public void appendTo(StringBuffer buffer, Calendar calendar) {
            int offset = calendar.get(15) + calendar.get(16);
            if (offset < 0) {
                buffer.append('-');
                offset = -offset;
            } else {
                buffer.append('+');
            }
            int hours = offset / 3600000;
            buffer.append((char) ((hours / 10) + 48));
            buffer.append((char) ((hours % 10) + 48));
            if (this.mColon) {
                buffer.append(':');
            }
            int minutes = (offset / 60000) - (60 * hours);
            buffer.append((char) ((minutes / 10) + 48));
            buffer.append((char) ((minutes % 10) + 48));
        }
    }

    /* loaded from: commons-lang3-3.3.2.jar:org/apache/commons/lang3/time/FastDatePrinter$TimeZoneDisplayKey.class */
    private static class TimeZoneDisplayKey {
        private final TimeZone mTimeZone;
        private final int mStyle;
        private final Locale mLocale;

        TimeZoneDisplayKey(TimeZone timeZone, boolean daylight, int style, Locale locale) {
            this.mTimeZone = timeZone;
            if (daylight) {
                this.mStyle = style | Integer.MIN_VALUE;
            } else {
                this.mStyle = style;
            }
            this.mLocale = locale;
        }

        public int hashCode() {
            return (((this.mStyle * 31) + this.mLocale.hashCode()) * 31) + this.mTimeZone.hashCode();
        }

        public boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (obj instanceof TimeZoneDisplayKey) {
                TimeZoneDisplayKey other = (TimeZoneDisplayKey) obj;
                return this.mTimeZone.equals(other.mTimeZone) && this.mStyle == other.mStyle && this.mLocale.equals(other.mLocale);
            }
            return false;
        }
    }
}
