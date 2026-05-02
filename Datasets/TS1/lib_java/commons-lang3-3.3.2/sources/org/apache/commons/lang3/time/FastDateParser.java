package org.apache.commons.lang3.time;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.Serializable;
import java.text.DateFormatSymbols;
import java.text.ParseException;
import java.text.ParsePosition;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.SortedMap;
import java.util.TimeZone;
import java.util.TreeMap;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* loaded from: commons-lang3-3.3.2.jar:org/apache/commons/lang3/time/FastDateParser.class */
public class FastDateParser implements DateParser, Serializable {
    private static final long serialVersionUID = 2;
    private final String pattern;
    private final TimeZone timeZone;
    private final Locale locale;
    private final int century;
    private final int startYear;
    private transient Pattern parsePattern;
    private transient Strategy[] strategies;
    private transient String currentFormatField;
    private transient Strategy nextStrategy;
    static final Locale JAPANESE_IMPERIAL = new Locale("ja", "JP", "JP");
    private static final Pattern formatPattern = Pattern.compile("D+|E+|F+|G+|H+|K+|M+|S+|W+|Z+|a+|d+|h+|k+|m+|s+|w+|y+|z+|''|'[^']++(''[^']*+)*+'|[^'A-Za-z]++");
    private static final ConcurrentMap<Locale, Strategy>[] caches = new ConcurrentMap[17];
    private static final Strategy ABBREVIATED_YEAR_STRATEGY = new NumberStrategy(1) { // from class: org.apache.commons.lang3.time.FastDateParser.1
        @Override // org.apache.commons.lang3.time.FastDateParser.NumberStrategy, org.apache.commons.lang3.time.FastDateParser.Strategy
        void setCalendar(FastDateParser parser, Calendar cal, String value) {
            int iValue = Integer.parseInt(value);
            if (iValue < 100) {
                iValue = parser.adjustYear(iValue);
            }
            cal.set(1, iValue);
        }
    };
    private static final Strategy NUMBER_MONTH_STRATEGY = new NumberStrategy(2) { // from class: org.apache.commons.lang3.time.FastDateParser.2
        @Override // org.apache.commons.lang3.time.FastDateParser.NumberStrategy
        int modify(int iValue) {
            return iValue - 1;
        }
    };
    private static final Strategy LITERAL_YEAR_STRATEGY = new NumberStrategy(1);
    private static final Strategy WEEK_OF_YEAR_STRATEGY = new NumberStrategy(3);
    private static final Strategy WEEK_OF_MONTH_STRATEGY = new NumberStrategy(4);
    private static final Strategy DAY_OF_YEAR_STRATEGY = new NumberStrategy(6);
    private static final Strategy DAY_OF_MONTH_STRATEGY = new NumberStrategy(5);
    private static final Strategy DAY_OF_WEEK_IN_MONTH_STRATEGY = new NumberStrategy(8);
    private static final Strategy HOUR_OF_DAY_STRATEGY = new NumberStrategy(11);
    private static final Strategy MODULO_HOUR_OF_DAY_STRATEGY = new NumberStrategy(11) { // from class: org.apache.commons.lang3.time.FastDateParser.3
        @Override // org.apache.commons.lang3.time.FastDateParser.NumberStrategy
        int modify(int iValue) {
            return iValue % 24;
        }
    };
    private static final Strategy MODULO_HOUR_STRATEGY = new NumberStrategy(10) { // from class: org.apache.commons.lang3.time.FastDateParser.4
        @Override // org.apache.commons.lang3.time.FastDateParser.NumberStrategy
        int modify(int iValue) {
            return iValue % 12;
        }
    };
    private static final Strategy HOUR_STRATEGY = new NumberStrategy(10);
    private static final Strategy MINUTE_STRATEGY = new NumberStrategy(12);
    private static final Strategy SECOND_STRATEGY = new NumberStrategy(13);
    private static final Strategy MILLISECOND_STRATEGY = new NumberStrategy(14);

    protected FastDateParser(String pattern, TimeZone timeZone, Locale locale) {
        this(pattern, timeZone, locale, null);
    }

    protected FastDateParser(String pattern, TimeZone timeZone, Locale locale, Date centuryStart) {
        int centuryStartYear;
        this.pattern = pattern;
        this.timeZone = timeZone;
        this.locale = locale;
        Calendar definingCalendar = Calendar.getInstance(timeZone, locale);
        if (centuryStart != null) {
            definingCalendar.setTime(centuryStart);
            centuryStartYear = definingCalendar.get(1);
        } else if (locale.equals(JAPANESE_IMPERIAL)) {
            centuryStartYear = 0;
        } else {
            definingCalendar.setTime(new Date());
            centuryStartYear = definingCalendar.get(1) - 80;
        }
        this.century = (centuryStartYear / 100) * 100;
        this.startYear = centuryStartYear - this.century;
        init(definingCalendar);
    }

    private void init(Calendar definingCalendar) {
        Strategy currentStrategy;
        StringBuilder regex = new StringBuilder();
        List<Strategy> collector = new ArrayList<>();
        Matcher patternMatcher = formatPattern.matcher(this.pattern);
        if (!patternMatcher.lookingAt()) {
            throw new IllegalArgumentException("Illegal pattern character '" + this.pattern.charAt(patternMatcher.regionStart()) + "'");
        }
        this.currentFormatField = patternMatcher.group();
        Strategy strategy = getStrategy(this.currentFormatField, definingCalendar);
        while (true) {
            currentStrategy = strategy;
            patternMatcher.region(patternMatcher.end(), patternMatcher.regionEnd());
            if (!patternMatcher.lookingAt()) {
                break;
            }
            String nextFormatField = patternMatcher.group();
            this.nextStrategy = getStrategy(nextFormatField, definingCalendar);
            if (currentStrategy.addRegex(this, regex)) {
                collector.add(currentStrategy);
            }
            this.currentFormatField = nextFormatField;
            strategy = this.nextStrategy;
        }
        this.nextStrategy = null;
        if (patternMatcher.regionStart() != patternMatcher.regionEnd()) {
            throw new IllegalArgumentException("Failed to parse \"" + this.pattern + "\" ; gave up at index " + patternMatcher.regionStart());
        }
        if (currentStrategy.addRegex(this, regex)) {
            collector.add(currentStrategy);
        }
        this.currentFormatField = null;
        this.strategies = (Strategy[]) collector.toArray(new Strategy[collector.size()]);
        this.parsePattern = Pattern.compile(regex.toString());
    }

    @Override // org.apache.commons.lang3.time.DateParser, org.apache.commons.lang3.time.DatePrinter
    public String getPattern() {
        return this.pattern;
    }

    @Override // org.apache.commons.lang3.time.DateParser, org.apache.commons.lang3.time.DatePrinter
    public TimeZone getTimeZone() {
        return this.timeZone;
    }

    @Override // org.apache.commons.lang3.time.DateParser, org.apache.commons.lang3.time.DatePrinter
    public Locale getLocale() {
        return this.locale;
    }

    Pattern getParsePattern() {
        return this.parsePattern;
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof FastDateParser)) {
            return false;
        }
        FastDateParser other = (FastDateParser) obj;
        return this.pattern.equals(other.pattern) && this.timeZone.equals(other.timeZone) && this.locale.equals(other.locale);
    }

    public int hashCode() {
        return this.pattern.hashCode() + (13 * (this.timeZone.hashCode() + (13 * this.locale.hashCode())));
    }

    public String toString() {
        return "FastDateParser[" + this.pattern + "," + this.locale + "," + this.timeZone.getID() + "]";
    }

    private void readObject(ObjectInputStream in) throws IOException, ClassNotFoundException {
        in.defaultReadObject();
        Calendar definingCalendar = Calendar.getInstance(this.timeZone, this.locale);
        init(definingCalendar);
    }

    @Override // org.apache.commons.lang3.time.DateParser
    public Object parseObject(String source) throws ParseException {
        return parse(source);
    }

    @Override // org.apache.commons.lang3.time.DateParser
    public Date parse(String source) throws ParseException {
        Date date = parse(source, new ParsePosition(0));
        if (date == null) {
            if (this.locale.equals(JAPANESE_IMPERIAL)) {
                throw new ParseException("(The " + this.locale + " locale does not support dates before 1868 AD)\nUnparseable date: \"" + source + "\" does not match " + this.parsePattern.pattern(), 0);
            }
            throw new ParseException("Unparseable date: \"" + source + "\" does not match " + this.parsePattern.pattern(), 0);
        }
        return date;
    }

    @Override // org.apache.commons.lang3.time.DateParser
    public Object parseObject(String source, ParsePosition pos) {
        return parse(source, pos);
    }

    @Override // org.apache.commons.lang3.time.DateParser
    public Date parse(String source, ParsePosition pos) {
        int offset = pos.getIndex();
        Matcher matcher = this.parsePattern.matcher(source.substring(offset));
        if (!matcher.lookingAt()) {
            return null;
        }
        Calendar cal = Calendar.getInstance(this.timeZone, this.locale);
        cal.clear();
        int i = 0;
        while (i < this.strategies.length) {
            int i2 = i;
            i++;
            Strategy strategy = this.strategies[i2];
            strategy.setCalendar(this, cal, matcher.group(i));
        }
        pos.setIndex(offset + matcher.end());
        return cal.getTime();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static StringBuilder escapeRegex(StringBuilder regex, String value, boolean unquote) {
        regex.append("\\Q");
        int i = 0;
        while (i < value.length()) {
            char c = value.charAt(i);
            switch (c) {
                case '\'':
                    if (unquote) {
                        i++;
                        if (i == value.length()) {
                            return regex;
                        }
                        c = value.charAt(i);
                        break;
                    } else {
                        continue;
                    }
                case '\\':
                    i++;
                    if (i != value.length()) {
                        regex.append(c);
                        c = value.charAt(i);
                        if (c != 'E') {
                            break;
                        } else {
                            regex.append("E\\\\E\\");
                            c = 'Q';
                            break;
                        }
                    } else {
                        break;
                    }
            }
            regex.append(c);
            i++;
        }
        regex.append("\\E");
        return regex;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static Map<String, Integer> getDisplayNames(int field, Calendar definingCalendar, Locale locale) {
        return definingCalendar.getDisplayNames(field, 0, locale);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public int adjustYear(int twoDigitYear) {
        int trial = this.century + twoDigitYear;
        return twoDigitYear >= this.startYear ? trial : trial + 100;
    }

    boolean isNextNumber() {
        return this.nextStrategy != null && this.nextStrategy.isNumber();
    }

    int getFieldWidth() {
        return this.currentFormatField.length();
    }

    /* loaded from: commons-lang3-3.3.2.jar:org/apache/commons/lang3/time/FastDateParser$Strategy.class */
    private static abstract class Strategy {
        abstract boolean addRegex(FastDateParser fastDateParser, StringBuilder sb);

        private Strategy() {
        }

        boolean isNumber() {
            return false;
        }

        void setCalendar(FastDateParser parser, Calendar cal, String value) {
        }
    }

    private Strategy getStrategy(String formatField, Calendar definingCalendar) {
        switch (formatField.charAt(0)) {
            case '\'':
                if (formatField.length() > 2) {
                    return new CopyQuotedStrategy(formatField.substring(1, formatField.length() - 1));
                }
                break;
            case 'D':
                return DAY_OF_YEAR_STRATEGY;
            case 'E':
                return getLocaleSpecificStrategy(7, definingCalendar);
            case 'F':
                return DAY_OF_WEEK_IN_MONTH_STRATEGY;
            case 'G':
                return getLocaleSpecificStrategy(0, definingCalendar);
            case 'H':
                return MODULO_HOUR_OF_DAY_STRATEGY;
            case 'K':
                return HOUR_STRATEGY;
            case 'M':
                return formatField.length() >= 3 ? getLocaleSpecificStrategy(2, definingCalendar) : NUMBER_MONTH_STRATEGY;
            case 'S':
                return MILLISECOND_STRATEGY;
            case 'W':
                return WEEK_OF_MONTH_STRATEGY;
            case 'Z':
            case 'z':
                return getLocaleSpecificStrategy(15, definingCalendar);
            case 'a':
                return getLocaleSpecificStrategy(9, definingCalendar);
            case 'd':
                return DAY_OF_MONTH_STRATEGY;
            case 'h':
                return MODULO_HOUR_STRATEGY;
            case 'k':
                return HOUR_OF_DAY_STRATEGY;
            case 'm':
                return MINUTE_STRATEGY;
            case 's':
                return SECOND_STRATEGY;
            case 'w':
                return WEEK_OF_YEAR_STRATEGY;
            case 'y':
                return formatField.length() > 2 ? LITERAL_YEAR_STRATEGY : ABBREVIATED_YEAR_STRATEGY;
        }
        return new CopyQuotedStrategy(formatField);
    }

    private static ConcurrentMap<Locale, Strategy> getCache(int field) {
        ConcurrentMap<Locale, Strategy> concurrentMap;
        synchronized (caches) {
            if (caches[field] == null) {
                caches[field] = new ConcurrentHashMap(3);
            }
            concurrentMap = caches[field];
        }
        return concurrentMap;
    }

    private Strategy getLocaleSpecificStrategy(int field, Calendar definingCalendar) {
        ConcurrentMap<Locale, Strategy> cache = getCache(field);
        Strategy strategy = cache.get(this.locale);
        if (strategy == null) {
            strategy = field == 15 ? new TimeZoneStrategy(this.locale) : new TextStrategy(field, definingCalendar, this.locale);
            Strategy inCache = cache.putIfAbsent(this.locale, strategy);
            if (inCache != null) {
                return inCache;
            }
        }
        return strategy;
    }

    /* loaded from: commons-lang3-3.3.2.jar:org/apache/commons/lang3/time/FastDateParser$CopyQuotedStrategy.class */
    private static class CopyQuotedStrategy extends Strategy {
        private final String formatField;

        CopyQuotedStrategy(String formatField) {
            super();
            this.formatField = formatField;
        }

        @Override // org.apache.commons.lang3.time.FastDateParser.Strategy
        boolean isNumber() {
            char c = this.formatField.charAt(0);
            if (c == '\'') {
                c = this.formatField.charAt(1);
            }
            return Character.isDigit(c);
        }

        @Override // org.apache.commons.lang3.time.FastDateParser.Strategy
        boolean addRegex(FastDateParser parser, StringBuilder regex) {
            FastDateParser.escapeRegex(regex, this.formatField, true);
            return false;
        }
    }

    /* loaded from: commons-lang3-3.3.2.jar:org/apache/commons/lang3/time/FastDateParser$TextStrategy.class */
    private static class TextStrategy extends Strategy {
        private final int field;
        private final Map<String, Integer> keyValues;

        TextStrategy(int field, Calendar definingCalendar, Locale locale) {
            super();
            this.field = field;
            this.keyValues = FastDateParser.getDisplayNames(field, definingCalendar, locale);
        }

        @Override // org.apache.commons.lang3.time.FastDateParser.Strategy
        boolean addRegex(FastDateParser parser, StringBuilder regex) {
            regex.append('(');
            for (String textKeyValue : this.keyValues.keySet()) {
                FastDateParser.escapeRegex(regex, textKeyValue, false).append('|');
            }
            regex.setCharAt(regex.length() - 1, ')');
            return true;
        }

        @Override // org.apache.commons.lang3.time.FastDateParser.Strategy
        void setCalendar(FastDateParser parser, Calendar cal, String value) {
            Integer iVal = this.keyValues.get(value);
            if (iVal == null) {
                StringBuilder sb = new StringBuilder(value);
                sb.append(" not in (");
                for (String textKeyValue : this.keyValues.keySet()) {
                    sb.append(textKeyValue).append(' ');
                }
                sb.setCharAt(sb.length() - 1, ')');
                throw new IllegalArgumentException(sb.toString());
            }
            cal.set(this.field, iVal.intValue());
        }
    }

    /* loaded from: commons-lang3-3.3.2.jar:org/apache/commons/lang3/time/FastDateParser$NumberStrategy.class */
    private static class NumberStrategy extends Strategy {
        private final int field;

        NumberStrategy(int field) {
            super();
            this.field = field;
        }

        @Override // org.apache.commons.lang3.time.FastDateParser.Strategy
        boolean isNumber() {
            return true;
        }

        @Override // org.apache.commons.lang3.time.FastDateParser.Strategy
        boolean addRegex(FastDateParser parser, StringBuilder regex) {
            if (parser.isNextNumber()) {
                regex.append("(\\p{Nd}{").append(parser.getFieldWidth()).append("}+)");
                return true;
            }
            regex.append("(\\p{Nd}++)");
            return true;
        }

        @Override // org.apache.commons.lang3.time.FastDateParser.Strategy
        void setCalendar(FastDateParser parser, Calendar cal, String value) {
            cal.set(this.field, modify(Integer.parseInt(value)));
        }

        int modify(int iValue) {
            return iValue;
        }
    }

    /* loaded from: commons-lang3-3.3.2.jar:org/apache/commons/lang3/time/FastDateParser$TimeZoneStrategy.class */
    private static class TimeZoneStrategy extends Strategy {
        private final String validTimeZoneChars;
        private final SortedMap<String, TimeZone> tzNames;
        private static final int ID = 0;
        private static final int LONG_STD = 1;
        private static final int SHORT_STD = 2;
        private static final int LONG_DST = 3;
        private static final int SHORT_DST = 4;

        TimeZoneStrategy(Locale locale) {
            super();
            this.tzNames = new TreeMap(String.CASE_INSENSITIVE_ORDER);
            String[][] zones = DateFormatSymbols.getInstance(locale).getZoneStrings();
            for (String[] zone : zones) {
                if (!zone[0].startsWith("GMT")) {
                    TimeZone tz = TimeZone.getTimeZone(zone[0]);
                    if (!this.tzNames.containsKey(zone[1])) {
                        this.tzNames.put(zone[1], tz);
                    }
                    if (!this.tzNames.containsKey(zone[2])) {
                        this.tzNames.put(zone[2], tz);
                    }
                    if (tz.useDaylightTime()) {
                        if (!this.tzNames.containsKey(zone[3])) {
                            this.tzNames.put(zone[3], tz);
                        }
                        if (!this.tzNames.containsKey(zone[4])) {
                            this.tzNames.put(zone[4], tz);
                        }
                    }
                }
            }
            StringBuilder sb = new StringBuilder();
            sb.append("(GMT[+\\-]\\d{0,1}\\d{2}|[+\\-]\\d{2}:?\\d{2}|");
            for (String id : this.tzNames.keySet()) {
                FastDateParser.escapeRegex(sb, id, false).append('|');
            }
            sb.setCharAt(sb.length() - 1, ')');
            this.validTimeZoneChars = sb.toString();
        }

        @Override // org.apache.commons.lang3.time.FastDateParser.Strategy
        boolean addRegex(FastDateParser parser, StringBuilder regex) {
            regex.append(this.validTimeZoneChars);
            return true;
        }

        @Override // org.apache.commons.lang3.time.FastDateParser.Strategy
        void setCalendar(FastDateParser parser, Calendar cal, String value) {
            TimeZone tz;
            if (value.charAt(0) == '+' || value.charAt(0) == '-') {
                tz = TimeZone.getTimeZone("GMT" + value);
            } else if (value.startsWith("GMT")) {
                tz = TimeZone.getTimeZone(value);
            } else {
                tz = this.tzNames.get(value);
                if (tz == null) {
                    throw new IllegalArgumentException(value + " is not a supported timezone name");
                }
            }
            cal.setTimeZone(tz);
        }
    }
}
