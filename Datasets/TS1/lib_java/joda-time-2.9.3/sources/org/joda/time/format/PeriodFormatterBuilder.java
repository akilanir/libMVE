package org.joda.time.format;

import java.io.IOException;
import java.io.Writer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.TreeSet;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;
import java.util.regex.Pattern;
import org.joda.time.DateTimeConstants;
import org.joda.time.DurationFieldType;
import org.joda.time.PeriodType;
import org.joda.time.ReadWritablePeriod;
import org.joda.time.ReadablePeriod;

/* loaded from: joda-time-2.9.3.jar:org/joda/time/format/PeriodFormatterBuilder.class */
public class PeriodFormatterBuilder {
    private static final int PRINT_ZERO_RARELY_FIRST = 1;
    private static final int PRINT_ZERO_RARELY_LAST = 2;
    private static final int PRINT_ZERO_IF_SUPPORTED = 3;
    private static final int PRINT_ZERO_ALWAYS = 4;
    private static final int PRINT_ZERO_NEVER = 5;
    private static final int YEARS = 0;
    private static final int MONTHS = 1;
    private static final int WEEKS = 2;
    private static final int DAYS = 3;
    private static final int HOURS = 4;
    private static final int MINUTES = 5;
    private static final int SECONDS = 6;
    private static final int MILLIS = 7;
    private static final int SECONDS_MILLIS = 8;
    private static final int SECONDS_OPTIONAL_MILLIS = 9;
    private static final int MAX_FIELD = 9;
    private static final ConcurrentMap<String, Pattern> PATTERNS = new ConcurrentHashMap();
    private int iMinPrintedDigits;
    private int iPrintZeroSetting;
    private int iMaxParsedDigits;
    private boolean iRejectSignedValues;
    private PeriodFieldAffix iPrefix;
    private List<Object> iElementPairs;
    private boolean iNotPrinter;
    private boolean iNotParser;
    private FieldFormatter[] iFieldFormatters;

    /* loaded from: joda-time-2.9.3.jar:org/joda/time/format/PeriodFormatterBuilder$PeriodFieldAffix.class */
    interface PeriodFieldAffix {
        int calculatePrintedLength(int i);

        void printTo(StringBuffer stringBuffer, int i);

        void printTo(Writer writer, int i) throws IOException;

        int parse(String str, int i);

        int scan(String str, int i);

        String[] getAffixes();

        void finish(Set<PeriodFieldAffix> set);
    }

    public PeriodFormatterBuilder() {
        clear();
    }

    public PeriodFormatter toFormatter() {
        PeriodFormatter formatter = toFormatter(this.iElementPairs, this.iNotPrinter, this.iNotParser);
        for (FieldFormatter fieldFormatter : this.iFieldFormatters) {
            if (fieldFormatter != null) {
                fieldFormatter.finish(this.iFieldFormatters);
            }
        }
        this.iFieldFormatters = (FieldFormatter[]) this.iFieldFormatters.clone();
        return formatter;
    }

    public PeriodPrinter toPrinter() {
        if (this.iNotPrinter) {
            return null;
        }
        return toFormatter().getPrinter();
    }

    public PeriodParser toParser() {
        if (this.iNotParser) {
            return null;
        }
        return toFormatter().getParser();
    }

    public void clear() {
        this.iMinPrintedDigits = 1;
        this.iPrintZeroSetting = 2;
        this.iMaxParsedDigits = 10;
        this.iRejectSignedValues = false;
        this.iPrefix = null;
        if (this.iElementPairs == null) {
            this.iElementPairs = new ArrayList();
        } else {
            this.iElementPairs.clear();
        }
        this.iNotPrinter = false;
        this.iNotParser = false;
        this.iFieldFormatters = new FieldFormatter[10];
    }

    public PeriodFormatterBuilder append(PeriodFormatter periodFormatter) {
        if (periodFormatter == null) {
            throw new IllegalArgumentException("No formatter supplied");
        }
        clearPrefix();
        append0(periodFormatter.getPrinter(), periodFormatter.getParser());
        return this;
    }

    public PeriodFormatterBuilder append(PeriodPrinter periodPrinter, PeriodParser periodParser) {
        if (periodPrinter == null && periodParser == null) {
            throw new IllegalArgumentException("No printer or parser supplied");
        }
        clearPrefix();
        append0(periodPrinter, periodParser);
        return this;
    }

    public PeriodFormatterBuilder appendLiteral(String str) {
        if (str == null) {
            throw new IllegalArgumentException("Literal must not be null");
        }
        clearPrefix();
        Literal literal = new Literal(str);
        append0(literal, literal);
        return this;
    }

    public PeriodFormatterBuilder minimumPrintedDigits(int i) {
        this.iMinPrintedDigits = i;
        return this;
    }

    public PeriodFormatterBuilder maximumParsedDigits(int i) {
        this.iMaxParsedDigits = i;
        return this;
    }

    public PeriodFormatterBuilder rejectSignedValues(boolean z) {
        this.iRejectSignedValues = z;
        return this;
    }

    public PeriodFormatterBuilder printZeroRarelyLast() {
        this.iPrintZeroSetting = 2;
        return this;
    }

    public PeriodFormatterBuilder printZeroRarelyFirst() {
        this.iPrintZeroSetting = 1;
        return this;
    }

    public PeriodFormatterBuilder printZeroIfSupported() {
        this.iPrintZeroSetting = 3;
        return this;
    }

    public PeriodFormatterBuilder printZeroAlways() {
        this.iPrintZeroSetting = 4;
        return this;
    }

    public PeriodFormatterBuilder printZeroNever() {
        this.iPrintZeroSetting = 5;
        return this;
    }

    public PeriodFormatterBuilder appendPrefix(String str) {
        if (str == null) {
            throw new IllegalArgumentException();
        }
        return appendPrefix(new SimpleAffix(str));
    }

    public PeriodFormatterBuilder appendPrefix(String str, String str2) {
        if (str == null || str2 == null) {
            throw new IllegalArgumentException();
        }
        return appendPrefix(new PluralAffix(str, str2));
    }

    public PeriodFormatterBuilder appendPrefix(String[] strArr, String[] strArr2) {
        if (strArr == null || strArr2 == null || strArr.length < 1 || strArr.length != strArr2.length) {
            throw new IllegalArgumentException();
        }
        return appendPrefix(new RegExAffix(strArr, strArr2));
    }

    private PeriodFormatterBuilder appendPrefix(PeriodFieldAffix periodFieldAffix) {
        if (periodFieldAffix == null) {
            throw new IllegalArgumentException();
        }
        if (this.iPrefix != null) {
            periodFieldAffix = new CompositeAffix(this.iPrefix, periodFieldAffix);
        }
        this.iPrefix = periodFieldAffix;
        return this;
    }

    public PeriodFormatterBuilder appendYears() {
        appendField(0);
        return this;
    }

    public PeriodFormatterBuilder appendMonths() {
        appendField(1);
        return this;
    }

    public PeriodFormatterBuilder appendWeeks() {
        appendField(2);
        return this;
    }

    public PeriodFormatterBuilder appendDays() {
        appendField(3);
        return this;
    }

    public PeriodFormatterBuilder appendHours() {
        appendField(4);
        return this;
    }

    public PeriodFormatterBuilder appendMinutes() {
        appendField(5);
        return this;
    }

    public PeriodFormatterBuilder appendSeconds() {
        appendField(6);
        return this;
    }

    public PeriodFormatterBuilder appendSecondsWithMillis() {
        appendField(8);
        return this;
    }

    public PeriodFormatterBuilder appendSecondsWithOptionalMillis() {
        appendField(9);
        return this;
    }

    public PeriodFormatterBuilder appendMillis() {
        appendField(7);
        return this;
    }

    public PeriodFormatterBuilder appendMillis3Digit() {
        appendField(7, 3);
        return this;
    }

    private void appendField(int i) {
        appendField(i, this.iMinPrintedDigits);
    }

    private void appendField(int i, int i2) {
        FieldFormatter fieldFormatter = new FieldFormatter(i2, this.iPrintZeroSetting, this.iMaxParsedDigits, this.iRejectSignedValues, i, this.iFieldFormatters, this.iPrefix, null);
        append0(fieldFormatter, fieldFormatter);
        this.iFieldFormatters[i] = fieldFormatter;
        this.iPrefix = null;
    }

    public PeriodFormatterBuilder appendSuffix(String str) {
        if (str == null) {
            throw new IllegalArgumentException();
        }
        return appendSuffix(new SimpleAffix(str));
    }

    public PeriodFormatterBuilder appendSuffix(String str, String str2) {
        if (str == null || str2 == null) {
            throw new IllegalArgumentException();
        }
        return appendSuffix(new PluralAffix(str, str2));
    }

    public PeriodFormatterBuilder appendSuffix(String[] strArr, String[] strArr2) {
        if (strArr == null || strArr2 == null || strArr.length < 1 || strArr.length != strArr2.length) {
            throw new IllegalArgumentException();
        }
        return appendSuffix(new RegExAffix(strArr, strArr2));
    }

    private PeriodFormatterBuilder appendSuffix(PeriodFieldAffix periodFieldAffix) {
        Object obj;
        Object obj2;
        if (this.iElementPairs.size() > 0) {
            obj = this.iElementPairs.get(this.iElementPairs.size() - 2);
            obj2 = this.iElementPairs.get(this.iElementPairs.size() - 1);
        } else {
            obj = null;
            obj2 = null;
        }
        if (obj == null || obj2 == null || obj != obj2 || !(obj instanceof FieldFormatter)) {
            throw new IllegalStateException("No field to apply suffix to");
        }
        clearPrefix();
        FieldFormatter fieldFormatter = new FieldFormatter((FieldFormatter) obj, periodFieldAffix);
        this.iElementPairs.set(this.iElementPairs.size() - 2, fieldFormatter);
        this.iElementPairs.set(this.iElementPairs.size() - 1, fieldFormatter);
        this.iFieldFormatters[fieldFormatter.getFieldType()] = fieldFormatter;
        return this;
    }

    public PeriodFormatterBuilder appendSeparator(String str) {
        return appendSeparator(str, str, null, true, true);
    }

    public PeriodFormatterBuilder appendSeparatorIfFieldsAfter(String str) {
        return appendSeparator(str, str, null, false, true);
    }

    public PeriodFormatterBuilder appendSeparatorIfFieldsBefore(String str) {
        return appendSeparator(str, str, null, true, false);
    }

    public PeriodFormatterBuilder appendSeparator(String str, String str2) {
        return appendSeparator(str, str2, null, true, true);
    }

    public PeriodFormatterBuilder appendSeparator(String str, String str2, String[] strArr) {
        return appendSeparator(str, str2, strArr, true, true);
    }

    private PeriodFormatterBuilder appendSeparator(String str, String str2, String[] strArr, boolean z, boolean z2) {
        if (str == null || str2 == null) {
            throw new IllegalArgumentException();
        }
        clearPrefix();
        List<Object> list = this.iElementPairs;
        if (list.size() == 0) {
            if (z2 && !z) {
                Separator separator = new Separator(str, str2, strArr, Literal.EMPTY, Literal.EMPTY, z, z2);
                append0(separator, separator);
            }
            return this;
        }
        Separator separator2 = null;
        int size = list.size();
        while (true) {
            int i = size - 1;
            if (i < 0) {
                break;
            }
            if (list.get(i) instanceof Separator) {
                separator2 = (Separator) list.get(i);
                list = list.subList(i + 1, list.size());
                break;
            }
            size = i - 1;
        }
        if (separator2 != null && list.size() == 0) {
            throw new IllegalStateException("Cannot have two adjacent separators");
        }
        Object[] createComposite = createComposite(list);
        list.clear();
        Separator separator3 = new Separator(str, str2, strArr, (PeriodPrinter) createComposite[0], (PeriodParser) createComposite[1], z, z2);
        list.add(separator3);
        list.add(separator3);
        return this;
    }

    private void clearPrefix() throws IllegalStateException {
        if (this.iPrefix != null) {
            throw new IllegalStateException("Prefix not followed by field");
        }
        this.iPrefix = null;
    }

    private PeriodFormatterBuilder append0(PeriodPrinter periodPrinter, PeriodParser periodParser) {
        this.iElementPairs.add(periodPrinter);
        this.iElementPairs.add(periodParser);
        this.iNotPrinter |= periodPrinter == null;
        this.iNotParser |= periodParser == null;
        return this;
    }

    private static PeriodFormatter toFormatter(List<Object> list, boolean z, boolean z2) {
        if (z && z2) {
            throw new IllegalStateException("Builder has created neither a printer nor a parser");
        }
        int size = list.size();
        if (size >= 2 && (list.get(0) instanceof Separator)) {
            Separator separator = (Separator) list.get(0);
            if (separator.iAfterParser == null && separator.iAfterPrinter == null) {
                PeriodFormatter formatter = toFormatter(list.subList(2, size), z, z2);
                Separator finish = separator.finish(formatter.getPrinter(), formatter.getParser());
                return new PeriodFormatter(finish, finish);
            }
        }
        Object[] createComposite = createComposite(list);
        if (z) {
            return new PeriodFormatter(null, (PeriodParser) createComposite[1]);
        }
        if (z2) {
            return new PeriodFormatter((PeriodPrinter) createComposite[0], null);
        }
        return new PeriodFormatter((PeriodPrinter) createComposite[0], (PeriodParser) createComposite[1]);
    }

    private static Object[] createComposite(List<Object> list) {
        switch (list.size()) {
            case 0:
                return new Object[]{Literal.EMPTY, Literal.EMPTY};
            case 1:
                return new Object[]{list.get(0), list.get(1)};
            default:
                Composite composite = new Composite(list);
                return new Object[]{composite, composite};
        }
    }

    /* loaded from: joda-time-2.9.3.jar:org/joda/time/format/PeriodFormatterBuilder$IgnorableAffix.class */
    static abstract class IgnorableAffix implements PeriodFieldAffix {
        private volatile String[] iOtherAffixes;

        IgnorableAffix() {
        }

        @Override // org.joda.time.format.PeriodFormatterBuilder.PeriodFieldAffix
        public void finish(Set<PeriodFieldAffix> set) {
            if (this.iOtherAffixes == null) {
                int i = Integer.MAX_VALUE;
                String str = null;
                for (String str2 : getAffixes()) {
                    if (str2.length() < i) {
                        i = str2.length();
                        str = str2;
                    }
                }
                HashSet hashSet = new HashSet();
                for (PeriodFieldAffix periodFieldAffix : set) {
                    if (periodFieldAffix != null) {
                        for (String str3 : periodFieldAffix.getAffixes()) {
                            if (str3.length() > i || (str3.equalsIgnoreCase(str) && !str3.equals(str))) {
                                hashSet.add(str3);
                            }
                        }
                    }
                }
                this.iOtherAffixes = (String[]) hashSet.toArray(new String[hashSet.size()]);
            }
        }

        protected boolean matchesOtherAffix(int i, String str, int i2) {
            if (this.iOtherAffixes != null) {
                for (String str2 : this.iOtherAffixes) {
                    int length = str2.length();
                    if (i < length && str.regionMatches(true, i2, str2, 0, length)) {
                        return true;
                    }
                    if (i == length && str.regionMatches(false, i2, str2, 0, length)) {
                        return true;
                    }
                }
                return false;
            }
            return false;
        }
    }

    /* loaded from: joda-time-2.9.3.jar:org/joda/time/format/PeriodFormatterBuilder$SimpleAffix.class */
    static class SimpleAffix extends IgnorableAffix {
        private final String iText;

        SimpleAffix(String str) {
            this.iText = str;
        }

        @Override // org.joda.time.format.PeriodFormatterBuilder.PeriodFieldAffix
        public int calculatePrintedLength(int i) {
            return this.iText.length();
        }

        @Override // org.joda.time.format.PeriodFormatterBuilder.PeriodFieldAffix
        public void printTo(StringBuffer stringBuffer, int i) {
            stringBuffer.append(this.iText);
        }

        @Override // org.joda.time.format.PeriodFormatterBuilder.PeriodFieldAffix
        public void printTo(Writer writer, int i) throws IOException {
            writer.write(this.iText);
        }

        @Override // org.joda.time.format.PeriodFormatterBuilder.PeriodFieldAffix
        public int parse(String str, int i) {
            String str2 = this.iText;
            int length = str2.length();
            if (str.regionMatches(true, i, str2, 0, length) && !matchesOtherAffix(length, str, i)) {
                return i + length;
            }
            return i ^ (-1);
        }

        @Override // org.joda.time.format.PeriodFormatterBuilder.PeriodFieldAffix
        public int scan(String str, int i) {
            String str2 = this.iText;
            int length = str2.length();
            int length2 = str.length();
            for (int i2 = i; i2 < length2; i2++) {
                if (!str.regionMatches(true, i2, str2, 0, length) || matchesOtherAffix(length, str, i2)) {
                    switch (str.charAt(i2)) {
                        case '+':
                        case ',':
                        case '-':
                        case '.':
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
                    }
                    return i ^ (-1);
                }
                return i2;
            }
            return i ^ (-1);
        }

        @Override // org.joda.time.format.PeriodFormatterBuilder.PeriodFieldAffix
        public String[] getAffixes() {
            return new String[]{this.iText};
        }
    }

    /* loaded from: joda-time-2.9.3.jar:org/joda/time/format/PeriodFormatterBuilder$PluralAffix.class */
    static class PluralAffix extends IgnorableAffix {
        private final String iSingularText;
        private final String iPluralText;

        PluralAffix(String str, String str2) {
            this.iSingularText = str;
            this.iPluralText = str2;
        }

        @Override // org.joda.time.format.PeriodFormatterBuilder.PeriodFieldAffix
        public int calculatePrintedLength(int i) {
            return (i == 1 ? this.iSingularText : this.iPluralText).length();
        }

        @Override // org.joda.time.format.PeriodFormatterBuilder.PeriodFieldAffix
        public void printTo(StringBuffer stringBuffer, int i) {
            stringBuffer.append(i == 1 ? this.iSingularText : this.iPluralText);
        }

        @Override // org.joda.time.format.PeriodFormatterBuilder.PeriodFieldAffix
        public void printTo(Writer writer, int i) throws IOException {
            writer.write(i == 1 ? this.iSingularText : this.iPluralText);
        }

        @Override // org.joda.time.format.PeriodFormatterBuilder.PeriodFieldAffix
        public int parse(String str, int i) {
            String str2 = this.iPluralText;
            String str3 = this.iSingularText;
            if (str2.length() < str3.length()) {
                str2 = str3;
                str3 = str2;
            }
            if (str.regionMatches(true, i, str2, 0, str2.length()) && !matchesOtherAffix(str2.length(), str, i)) {
                return i + str2.length();
            }
            if (str.regionMatches(true, i, str3, 0, str3.length()) && !matchesOtherAffix(str3.length(), str, i)) {
                return i + str3.length();
            }
            return i ^ (-1);
        }

        @Override // org.joda.time.format.PeriodFormatterBuilder.PeriodFieldAffix
        public int scan(String str, int i) {
            String str2 = this.iPluralText;
            String str3 = this.iSingularText;
            if (str2.length() < str3.length()) {
                str2 = str3;
                str3 = str2;
            }
            int length = str2.length();
            int length2 = str3.length();
            int length3 = str.length();
            for (int i2 = i; i2 < length3; i2++) {
                if (str.regionMatches(true, i2, str2, 0, length) && !matchesOtherAffix(str2.length(), str, i2)) {
                    return i2;
                }
                if (str.regionMatches(true, i2, str3, 0, length2) && !matchesOtherAffix(str3.length(), str, i2)) {
                    return i2;
                }
            }
            return i ^ (-1);
        }

        @Override // org.joda.time.format.PeriodFormatterBuilder.PeriodFieldAffix
        public String[] getAffixes() {
            return new String[]{this.iSingularText, this.iPluralText};
        }
    }

    /* loaded from: joda-time-2.9.3.jar:org/joda/time/format/PeriodFormatterBuilder$RegExAffix.class */
    static class RegExAffix extends IgnorableAffix {
        private static final Comparator<String> LENGTH_DESC_COMPARATOR = new Comparator<String>() { // from class: org.joda.time.format.PeriodFormatterBuilder.RegExAffix.1
            @Override // java.util.Comparator
            public int compare(String str, String str2) {
                return str2.length() - str.length();
            }
        };
        private final String[] iSuffixes;
        private final Pattern[] iPatterns;
        private final String[] iSuffixesSortedDescByLength;

        RegExAffix(String[] strArr, String[] strArr2) {
            this.iSuffixes = (String[]) strArr2.clone();
            this.iPatterns = new Pattern[strArr.length];
            for (int i = 0; i < strArr.length; i++) {
                Pattern pattern = (Pattern) PeriodFormatterBuilder.PATTERNS.get(strArr[i]);
                if (pattern == null) {
                    pattern = Pattern.compile(strArr[i]);
                    PeriodFormatterBuilder.PATTERNS.putIfAbsent(strArr[i], pattern);
                }
                this.iPatterns[i] = pattern;
            }
            this.iSuffixesSortedDescByLength = (String[]) this.iSuffixes.clone();
            Arrays.sort(this.iSuffixesSortedDescByLength, LENGTH_DESC_COMPARATOR);
        }

        private int selectSuffixIndex(int i) {
            String valueOf = String.valueOf(i);
            for (int i2 = 0; i2 < this.iPatterns.length; i2++) {
                if (this.iPatterns[i2].matcher(valueOf).matches()) {
                    return i2;
                }
            }
            return this.iPatterns.length - 1;
        }

        @Override // org.joda.time.format.PeriodFormatterBuilder.PeriodFieldAffix
        public int calculatePrintedLength(int i) {
            return this.iSuffixes[selectSuffixIndex(i)].length();
        }

        @Override // org.joda.time.format.PeriodFormatterBuilder.PeriodFieldAffix
        public void printTo(StringBuffer stringBuffer, int i) {
            stringBuffer.append(this.iSuffixes[selectSuffixIndex(i)]);
        }

        @Override // org.joda.time.format.PeriodFormatterBuilder.PeriodFieldAffix
        public void printTo(Writer writer, int i) throws IOException {
            writer.write(this.iSuffixes[selectSuffixIndex(i)]);
        }

        @Override // org.joda.time.format.PeriodFormatterBuilder.PeriodFieldAffix
        public int parse(String str, int i) {
            for (String str2 : this.iSuffixesSortedDescByLength) {
                if (str.regionMatches(true, i, str2, 0, str2.length()) && !matchesOtherAffix(str2.length(), str, i)) {
                    return i + str2.length();
                }
            }
            return i ^ (-1);
        }

        @Override // org.joda.time.format.PeriodFormatterBuilder.PeriodFieldAffix
        public int scan(String str, int i) {
            int length = str.length();
            for (int i2 = i; i2 < length; i2++) {
                for (String str2 : this.iSuffixesSortedDescByLength) {
                    if (str.regionMatches(true, i2, str2, 0, str2.length()) && !matchesOtherAffix(str2.length(), str, i2)) {
                        return i2;
                    }
                }
            }
            return i ^ (-1);
        }

        @Override // org.joda.time.format.PeriodFormatterBuilder.PeriodFieldAffix
        public String[] getAffixes() {
            return (String[]) this.iSuffixes.clone();
        }
    }

    /* loaded from: joda-time-2.9.3.jar:org/joda/time/format/PeriodFormatterBuilder$CompositeAffix.class */
    static class CompositeAffix extends IgnorableAffix {
        private final PeriodFieldAffix iLeft;
        private final PeriodFieldAffix iRight;
        private final String[] iLeftRightCombinations;

        CompositeAffix(PeriodFieldAffix periodFieldAffix, PeriodFieldAffix periodFieldAffix2) {
            this.iLeft = periodFieldAffix;
            this.iRight = periodFieldAffix2;
            HashSet hashSet = new HashSet();
            for (String str : this.iLeft.getAffixes()) {
                for (String str2 : this.iRight.getAffixes()) {
                    hashSet.add(str + str2);
                }
            }
            this.iLeftRightCombinations = (String[]) hashSet.toArray(new String[hashSet.size()]);
        }

        @Override // org.joda.time.format.PeriodFormatterBuilder.PeriodFieldAffix
        public int calculatePrintedLength(int i) {
            return this.iLeft.calculatePrintedLength(i) + this.iRight.calculatePrintedLength(i);
        }

        @Override // org.joda.time.format.PeriodFormatterBuilder.PeriodFieldAffix
        public void printTo(StringBuffer stringBuffer, int i) {
            this.iLeft.printTo(stringBuffer, i);
            this.iRight.printTo(stringBuffer, i);
        }

        @Override // org.joda.time.format.PeriodFormatterBuilder.PeriodFieldAffix
        public void printTo(Writer writer, int i) throws IOException {
            this.iLeft.printTo(writer, i);
            this.iRight.printTo(writer, i);
        }

        @Override // org.joda.time.format.PeriodFormatterBuilder.PeriodFieldAffix
        public int parse(String str, int i) {
            int parse = this.iLeft.parse(str, i);
            if (parse >= 0) {
                parse = this.iRight.parse(str, parse);
                if (parse >= 0 && matchesOtherAffix(parse(str, parse) - parse, str, i)) {
                    return i ^ (-1);
                }
            }
            return parse;
        }

        @Override // org.joda.time.format.PeriodFormatterBuilder.PeriodFieldAffix
        public int scan(String str, int i) {
            int scan;
            int scan2 = this.iLeft.scan(str, i);
            if (scan2 >= 0 && ((scan = this.iRight.scan(str, this.iLeft.parse(str, scan2))) < 0 || !matchesOtherAffix(this.iRight.parse(str, scan) - scan2, str, i))) {
                if (scan2 > 0) {
                    return scan2;
                }
                return scan;
            }
            return i ^ (-1);
        }

        @Override // org.joda.time.format.PeriodFormatterBuilder.PeriodFieldAffix
        public String[] getAffixes() {
            return (String[]) this.iLeftRightCombinations.clone();
        }
    }

    /* loaded from: joda-time-2.9.3.jar:org/joda/time/format/PeriodFormatterBuilder$FieldFormatter.class */
    static class FieldFormatter implements PeriodPrinter, PeriodParser {
        private final int iMinPrintedDigits;
        private final int iPrintZeroSetting;
        private final int iMaxParsedDigits;
        private final boolean iRejectSignedValues;
        private final int iFieldType;
        private final FieldFormatter[] iFieldFormatters;
        private final PeriodFieldAffix iPrefix;
        private final PeriodFieldAffix iSuffix;

        FieldFormatter(int i, int i2, int i3, boolean z, int i4, FieldFormatter[] fieldFormatterArr, PeriodFieldAffix periodFieldAffix, PeriodFieldAffix periodFieldAffix2) {
            this.iMinPrintedDigits = i;
            this.iPrintZeroSetting = i2;
            this.iMaxParsedDigits = i3;
            this.iRejectSignedValues = z;
            this.iFieldType = i4;
            this.iFieldFormatters = fieldFormatterArr;
            this.iPrefix = periodFieldAffix;
            this.iSuffix = periodFieldAffix2;
        }

        FieldFormatter(FieldFormatter fieldFormatter, PeriodFieldAffix periodFieldAffix) {
            this.iMinPrintedDigits = fieldFormatter.iMinPrintedDigits;
            this.iPrintZeroSetting = fieldFormatter.iPrintZeroSetting;
            this.iMaxParsedDigits = fieldFormatter.iMaxParsedDigits;
            this.iRejectSignedValues = fieldFormatter.iRejectSignedValues;
            this.iFieldType = fieldFormatter.iFieldType;
            this.iFieldFormatters = fieldFormatter.iFieldFormatters;
            this.iPrefix = fieldFormatter.iPrefix;
            this.iSuffix = fieldFormatter.iSuffix != null ? new CompositeAffix(fieldFormatter.iSuffix, periodFieldAffix) : periodFieldAffix;
        }

        public void finish(FieldFormatter[] fieldFormatterArr) {
            HashSet hashSet = new HashSet();
            HashSet hashSet2 = new HashSet();
            for (FieldFormatter fieldFormatter : fieldFormatterArr) {
                if (fieldFormatter != null && !equals(fieldFormatter)) {
                    hashSet.add(fieldFormatter.iPrefix);
                    hashSet2.add(fieldFormatter.iSuffix);
                }
            }
            if (this.iPrefix != null) {
                this.iPrefix.finish(hashSet);
            }
            if (this.iSuffix != null) {
                this.iSuffix.finish(hashSet2);
            }
        }

        @Override // org.joda.time.format.PeriodPrinter
        public int countFieldsToPrint(ReadablePeriod readablePeriod, int i, Locale locale) {
            if (i <= 0) {
                return 0;
            }
            if (this.iPrintZeroSetting == 4 || getFieldValue(readablePeriod) != Long.MAX_VALUE) {
                return 1;
            }
            return 0;
        }

        @Override // org.joda.time.format.PeriodPrinter
        public int calculatePrintedLength(ReadablePeriod readablePeriod, Locale locale) {
            long fieldValue = getFieldValue(readablePeriod);
            if (fieldValue == Long.MAX_VALUE) {
                return 0;
            }
            int max = Math.max(FormatUtils.calculateDigitCount(fieldValue), this.iMinPrintedDigits);
            if (this.iFieldType >= 8) {
                max = (fieldValue < 0 ? Math.max(max, 5) : Math.max(max, 4)) + 1;
                if (this.iFieldType == 9 && Math.abs(fieldValue) % 1000 == 0) {
                    max -= 4;
                }
                fieldValue /= 1000;
            }
            int i = (int) fieldValue;
            if (this.iPrefix != null) {
                max += this.iPrefix.calculatePrintedLength(i);
            }
            if (this.iSuffix != null) {
                max += this.iSuffix.calculatePrintedLength(i);
            }
            return max;
        }

        @Override // org.joda.time.format.PeriodPrinter
        public void printTo(StringBuffer stringBuffer, ReadablePeriod readablePeriod, Locale locale) {
            long fieldValue = getFieldValue(readablePeriod);
            if (fieldValue == Long.MAX_VALUE) {
                return;
            }
            int i = (int) fieldValue;
            if (this.iFieldType >= 8) {
                i = (int) (fieldValue / 1000);
            }
            if (this.iPrefix != null) {
                this.iPrefix.printTo(stringBuffer, i);
            }
            int length = stringBuffer.length();
            int i2 = this.iMinPrintedDigits;
            if (i2 <= 1) {
                FormatUtils.appendUnpaddedInteger(stringBuffer, i);
            } else {
                FormatUtils.appendPaddedInteger(stringBuffer, i, i2);
            }
            if (this.iFieldType >= 8) {
                int abs = (int) (Math.abs(fieldValue) % 1000);
                if (this.iFieldType == 8 || abs > 0) {
                    if (fieldValue < 0 && fieldValue > -1000) {
                        stringBuffer.insert(length, '-');
                    }
                    stringBuffer.append('.');
                    FormatUtils.appendPaddedInteger(stringBuffer, abs, 3);
                }
            }
            if (this.iSuffix != null) {
                this.iSuffix.printTo(stringBuffer, i);
            }
        }

        @Override // org.joda.time.format.PeriodPrinter
        public void printTo(Writer writer, ReadablePeriod readablePeriod, Locale locale) throws IOException {
            long fieldValue = getFieldValue(readablePeriod);
            if (fieldValue == Long.MAX_VALUE) {
                return;
            }
            int i = (int) fieldValue;
            if (this.iFieldType >= 8) {
                i = (int) (fieldValue / 1000);
            }
            if (this.iPrefix != null) {
                this.iPrefix.printTo(writer, i);
            }
            int i2 = this.iMinPrintedDigits;
            if (i2 <= 1) {
                FormatUtils.writeUnpaddedInteger(writer, i);
            } else {
                FormatUtils.writePaddedInteger(writer, i, i2);
            }
            if (this.iFieldType >= 8) {
                int abs = (int) (Math.abs(fieldValue) % 1000);
                if (this.iFieldType == 8 || abs > 0) {
                    writer.write(46);
                    FormatUtils.writePaddedInteger(writer, abs, 3);
                }
            }
            if (this.iSuffix != null) {
                this.iSuffix.printTo(writer, i);
            }
        }

        @Override // org.joda.time.format.PeriodParser
        public int parseInto(ReadWritablePeriod readWritablePeriod, String str, int i, Locale locale) {
            int min;
            int i2;
            char charAt;
            boolean z = this.iPrintZeroSetting == 4;
            if (i >= str.length()) {
                return z ? i ^ (-1) : i;
            }
            if (this.iPrefix != null) {
                i = this.iPrefix.parse(str, i);
                if (i >= 0) {
                    z = true;
                } else {
                    if (!z) {
                        return i ^ (-1);
                    }
                    return i;
                }
            }
            int i3 = -1;
            if (this.iSuffix != null && !z) {
                i3 = this.iSuffix.scan(str, i);
                if (i3 >= 0) {
                    z = true;
                } else {
                    if (!z) {
                        return i3 ^ (-1);
                    }
                    return i3;
                }
            }
            if (!z && !isSupported(readWritablePeriod.getPeriodType(), this.iFieldType)) {
                return i;
            }
            if (i3 > 0) {
                min = Math.min(this.iMaxParsedDigits, i3 - i);
            } else {
                min = Math.min(this.iMaxParsedDigits, str.length() - i);
            }
            int i4 = 0;
            int i5 = -1;
            boolean z2 = false;
            boolean z3 = false;
            while (i4 < min) {
                char charAt2 = str.charAt(i + i4);
                if (i4 == 0 && ((charAt2 == '-' || charAt2 == '+') && !this.iRejectSignedValues)) {
                    z3 = charAt2 == '-';
                    if (i4 + 1 >= min || (charAt = str.charAt(i + i4 + 1)) < '0' || charAt > '9') {
                        break;
                    }
                    if (z3) {
                        i4++;
                    } else {
                        i++;
                    }
                    min = Math.min(min + 1, str.length() - i);
                } else {
                    if (charAt2 >= '0' && charAt2 <= '9') {
                        z2 = true;
                    } else {
                        if ((charAt2 != '.' && charAt2 != ',') || ((this.iFieldType != 8 && this.iFieldType != 9) || i5 >= 0)) {
                            break;
                        }
                        i5 = i + i4 + 1;
                        min = Math.min(min + 1, str.length() - i);
                    }
                    i4++;
                }
            }
            if (!z2) {
                return i ^ (-1);
            }
            if (i3 >= 0 && i + i4 != i3) {
                return i;
            }
            if (this.iFieldType != 8 && this.iFieldType != 9) {
                setFieldValue(readWritablePeriod, this.iFieldType, parseInt(str, i, i4));
            } else if (i5 < 0) {
                setFieldValue(readWritablePeriod, 6, parseInt(str, i, i4));
                setFieldValue(readWritablePeriod, 7, 0);
            } else {
                int parseInt = parseInt(str, i, (i5 - i) - 1);
                setFieldValue(readWritablePeriod, 6, parseInt);
                int i6 = (i + i4) - i5;
                if (i6 <= 0) {
                    i2 = 0;
                } else {
                    if (i6 >= 3) {
                        i2 = parseInt(str, i5, 3);
                    } else {
                        int parseInt2 = parseInt(str, i5, i6);
                        if (i6 == 1) {
                            i2 = parseInt2 * 100;
                        } else {
                            i2 = parseInt2 * 10;
                        }
                    }
                    if (z3 || parseInt < 0) {
                        i2 = -i2;
                    }
                }
                setFieldValue(readWritablePeriod, 7, i2);
            }
            int i7 = i + i4;
            if (i7 >= 0 && this.iSuffix != null) {
                i7 = this.iSuffix.parse(str, i7);
            }
            return i7;
        }

        private int parseInt(String str, int i, int i2) {
            boolean z;
            if (i2 >= 10) {
                return Integer.parseInt(str.substring(i, i + i2));
            }
            if (i2 <= 0) {
                return 0;
            }
            int i3 = i + 1;
            char charAt = str.charAt(i);
            int i4 = i2 - 1;
            if (charAt == '-') {
                i4--;
                if (i4 < 0) {
                    return 0;
                }
                z = true;
                i3++;
                charAt = str.charAt(i3);
            } else {
                z = false;
            }
            int i5 = charAt - '0';
            while (true) {
                int i6 = i4;
                i4 = i6 - 1;
                if (i6 <= 0) {
                    break;
                }
                int i7 = i3;
                i3++;
                i5 = (((i5 << 3) + (i5 << 1)) + str.charAt(i7)) - 48;
            }
            return z ? -i5 : i5;
        }

        long getFieldValue(ReadablePeriod readablePeriod) {
            PeriodType periodType;
            long j;
            if (this.iPrintZeroSetting == 4) {
                periodType = null;
            } else {
                periodType = readablePeriod.getPeriodType();
            }
            if (periodType != null && !isSupported(periodType, this.iFieldType)) {
                return Long.MAX_VALUE;
            }
            switch (this.iFieldType) {
                case 0:
                    j = readablePeriod.get(DurationFieldType.years());
                    break;
                case 1:
                    j = readablePeriod.get(DurationFieldType.months());
                    break;
                case 2:
                    j = readablePeriod.get(DurationFieldType.weeks());
                    break;
                case 3:
                    j = readablePeriod.get(DurationFieldType.days());
                    break;
                case 4:
                    j = readablePeriod.get(DurationFieldType.hours());
                    break;
                case 5:
                    j = readablePeriod.get(DurationFieldType.minutes());
                    break;
                case 6:
                    j = readablePeriod.get(DurationFieldType.seconds());
                    break;
                case 7:
                    j = readablePeriod.get(DurationFieldType.millis());
                    break;
                case 8:
                case DateTimeConstants.SEPTEMBER /* 9 */:
                    j = (readablePeriod.get(DurationFieldType.seconds()) * 1000) + readablePeriod.get(DurationFieldType.millis());
                    break;
                default:
                    return Long.MAX_VALUE;
            }
            if (j == 0) {
                switch (this.iPrintZeroSetting) {
                    case 1:
                        if (isZero(readablePeriod) && this.iFieldFormatters[this.iFieldType] == this) {
                            int min = Math.min(this.iFieldType, 8);
                            while (true) {
                                min--;
                                if (min < 0 || min > 9) {
                                    break;
                                } else if (isSupported(periodType, min) && this.iFieldFormatters[min] != null) {
                                    return Long.MAX_VALUE;
                                }
                            }
                        } else {
                            return Long.MAX_VALUE;
                        }
                        break;
                    case 2:
                        if (isZero(readablePeriod) && this.iFieldFormatters[this.iFieldType] == this) {
                            for (int i = this.iFieldType + 1; i <= 9; i++) {
                                if (isSupported(periodType, i) && this.iFieldFormatters[i] != null) {
                                    return Long.MAX_VALUE;
                                }
                            }
                            break;
                        } else {
                            return Long.MAX_VALUE;
                        }
                        break;
                    case 5:
                        return Long.MAX_VALUE;
                }
            }
            return j;
        }

        boolean isZero(ReadablePeriod readablePeriod) {
            int size = readablePeriod.size();
            for (int i = 0; i < size; i++) {
                if (readablePeriod.getValue(i) != 0) {
                    return false;
                }
            }
            return true;
        }

        boolean isSupported(PeriodType periodType, int i) {
            switch (i) {
                case 0:
                    return periodType.isSupported(DurationFieldType.years());
                case 1:
                    return periodType.isSupported(DurationFieldType.months());
                case 2:
                    return periodType.isSupported(DurationFieldType.weeks());
                case 3:
                    return periodType.isSupported(DurationFieldType.days());
                case 4:
                    return periodType.isSupported(DurationFieldType.hours());
                case 5:
                    return periodType.isSupported(DurationFieldType.minutes());
                case 6:
                    return periodType.isSupported(DurationFieldType.seconds());
                case 7:
                    return periodType.isSupported(DurationFieldType.millis());
                case 8:
                case DateTimeConstants.SEPTEMBER /* 9 */:
                    return periodType.isSupported(DurationFieldType.seconds()) || periodType.isSupported(DurationFieldType.millis());
                default:
                    return false;
            }
        }

        void setFieldValue(ReadWritablePeriod readWritablePeriod, int i, int i2) {
            switch (i) {
                case 0:
                    readWritablePeriod.setYears(i2);
                    break;
                case 1:
                    readWritablePeriod.setMonths(i2);
                    break;
                case 2:
                    readWritablePeriod.setWeeks(i2);
                    break;
                case 3:
                    readWritablePeriod.setDays(i2);
                    break;
                case 4:
                    readWritablePeriod.setHours(i2);
                    break;
                case 5:
                    readWritablePeriod.setMinutes(i2);
                    break;
                case 6:
                    readWritablePeriod.setSeconds(i2);
                    break;
                case 7:
                    readWritablePeriod.setMillis(i2);
                    break;
            }
        }

        int getFieldType() {
            return this.iFieldType;
        }
    }

    /* loaded from: joda-time-2.9.3.jar:org/joda/time/format/PeriodFormatterBuilder$Literal.class */
    static class Literal implements PeriodPrinter, PeriodParser {
        static final Literal EMPTY = new Literal("");
        private final String iText;

        Literal(String str) {
            this.iText = str;
        }

        @Override // org.joda.time.format.PeriodPrinter
        public int countFieldsToPrint(ReadablePeriod readablePeriod, int i, Locale locale) {
            return 0;
        }

        @Override // org.joda.time.format.PeriodPrinter
        public int calculatePrintedLength(ReadablePeriod readablePeriod, Locale locale) {
            return this.iText.length();
        }

        @Override // org.joda.time.format.PeriodPrinter
        public void printTo(StringBuffer stringBuffer, ReadablePeriod readablePeriod, Locale locale) {
            stringBuffer.append(this.iText);
        }

        @Override // org.joda.time.format.PeriodPrinter
        public void printTo(Writer writer, ReadablePeriod readablePeriod, Locale locale) throws IOException {
            writer.write(this.iText);
        }

        @Override // org.joda.time.format.PeriodParser
        public int parseInto(ReadWritablePeriod readWritablePeriod, String str, int i, Locale locale) {
            if (str.regionMatches(true, i, this.iText, 0, this.iText.length())) {
                return i + this.iText.length();
            }
            return i ^ (-1);
        }
    }

    /* loaded from: joda-time-2.9.3.jar:org/joda/time/format/PeriodFormatterBuilder$Separator.class */
    static class Separator implements PeriodPrinter, PeriodParser {
        private final String iText;
        private final String iFinalText;
        private final String[] iParsedForms;
        private final boolean iUseBefore;
        private final boolean iUseAfter;
        private final PeriodPrinter iBeforePrinter;
        private volatile PeriodPrinter iAfterPrinter;
        private final PeriodParser iBeforeParser;
        private volatile PeriodParser iAfterParser;

        Separator(String str, String str2, String[] strArr, PeriodPrinter periodPrinter, PeriodParser periodParser, boolean z, boolean z2) {
            this.iText = str;
            this.iFinalText = str2;
            if ((str2 == null || str.equals(str2)) && (strArr == null || strArr.length == 0)) {
                this.iParsedForms = new String[]{str};
            } else {
                TreeSet treeSet = new TreeSet(String.CASE_INSENSITIVE_ORDER);
                treeSet.add(str);
                treeSet.add(str2);
                if (strArr != null) {
                    int length = strArr.length;
                    while (true) {
                        length--;
                        if (length < 0) {
                            break;
                        } else {
                            treeSet.add(strArr[length]);
                        }
                    }
                }
                ArrayList arrayList = new ArrayList(treeSet);
                Collections.reverse(arrayList);
                this.iParsedForms = (String[]) arrayList.toArray(new String[arrayList.size()]);
            }
            this.iBeforePrinter = periodPrinter;
            this.iBeforeParser = periodParser;
            this.iUseBefore = z;
            this.iUseAfter = z2;
        }

        @Override // org.joda.time.format.PeriodPrinter
        public int countFieldsToPrint(ReadablePeriod readablePeriod, int i, Locale locale) {
            int countFieldsToPrint = this.iBeforePrinter.countFieldsToPrint(readablePeriod, i, locale);
            if (countFieldsToPrint < i) {
                countFieldsToPrint += this.iAfterPrinter.countFieldsToPrint(readablePeriod, i, locale);
            }
            return countFieldsToPrint;
        }

        @Override // org.joda.time.format.PeriodPrinter
        public int calculatePrintedLength(ReadablePeriod readablePeriod, Locale locale) {
            PeriodPrinter periodPrinter = this.iBeforePrinter;
            PeriodPrinter periodPrinter2 = this.iAfterPrinter;
            int calculatePrintedLength = periodPrinter.calculatePrintedLength(readablePeriod, locale) + periodPrinter2.calculatePrintedLength(readablePeriod, locale);
            if (this.iUseBefore) {
                if (periodPrinter.countFieldsToPrint(readablePeriod, 1, locale) > 0) {
                    if (this.iUseAfter) {
                        int countFieldsToPrint = periodPrinter2.countFieldsToPrint(readablePeriod, 2, locale);
                        if (countFieldsToPrint > 0) {
                            calculatePrintedLength += (countFieldsToPrint > 1 ? this.iText : this.iFinalText).length();
                        }
                    } else {
                        calculatePrintedLength += this.iText.length();
                    }
                }
            } else if (this.iUseAfter && periodPrinter2.countFieldsToPrint(readablePeriod, 1, locale) > 0) {
                calculatePrintedLength += this.iText.length();
            }
            return calculatePrintedLength;
        }

        @Override // org.joda.time.format.PeriodPrinter
        public void printTo(StringBuffer stringBuffer, ReadablePeriod readablePeriod, Locale locale) {
            PeriodPrinter periodPrinter = this.iBeforePrinter;
            PeriodPrinter periodPrinter2 = this.iAfterPrinter;
            periodPrinter.printTo(stringBuffer, readablePeriod, locale);
            if (this.iUseBefore) {
                if (periodPrinter.countFieldsToPrint(readablePeriod, 1, locale) > 0) {
                    if (this.iUseAfter) {
                        int countFieldsToPrint = periodPrinter2.countFieldsToPrint(readablePeriod, 2, locale);
                        if (countFieldsToPrint > 0) {
                            stringBuffer.append(countFieldsToPrint > 1 ? this.iText : this.iFinalText);
                        }
                    } else {
                        stringBuffer.append(this.iText);
                    }
                }
            } else if (this.iUseAfter && periodPrinter2.countFieldsToPrint(readablePeriod, 1, locale) > 0) {
                stringBuffer.append(this.iText);
            }
            periodPrinter2.printTo(stringBuffer, readablePeriod, locale);
        }

        @Override // org.joda.time.format.PeriodPrinter
        public void printTo(Writer writer, ReadablePeriod readablePeriod, Locale locale) throws IOException {
            PeriodPrinter periodPrinter = this.iBeforePrinter;
            PeriodPrinter periodPrinter2 = this.iAfterPrinter;
            periodPrinter.printTo(writer, readablePeriod, locale);
            if (this.iUseBefore) {
                if (periodPrinter.countFieldsToPrint(readablePeriod, 1, locale) > 0) {
                    if (this.iUseAfter) {
                        int countFieldsToPrint = periodPrinter2.countFieldsToPrint(readablePeriod, 2, locale);
                        if (countFieldsToPrint > 0) {
                            writer.write(countFieldsToPrint > 1 ? this.iText : this.iFinalText);
                        }
                    } else {
                        writer.write(this.iText);
                    }
                }
            } else if (this.iUseAfter && periodPrinter2.countFieldsToPrint(readablePeriod, 1, locale) > 0) {
                writer.write(this.iText);
            }
            periodPrinter2.printTo(writer, readablePeriod, locale);
        }

        @Override // org.joda.time.format.PeriodParser
        public int parseInto(ReadWritablePeriod readWritablePeriod, String str, int i, Locale locale) {
            int parseInto = this.iBeforeParser.parseInto(readWritablePeriod, str, i, locale);
            if (parseInto < 0) {
                return parseInto;
            }
            boolean z = false;
            int i2 = -1;
            if (parseInto > i) {
                String[] strArr = this.iParsedForms;
                int length = strArr.length;
                for (int i3 = 0; i3 < length; i3++) {
                    String str2 = strArr[i3];
                    if (str2 == null || str2.length() == 0 || str.regionMatches(true, parseInto, str2, 0, str2.length())) {
                        i2 = str2 == null ? 0 : str2.length();
                        parseInto += i2;
                        z = true;
                    }
                }
            }
            int i4 = parseInto;
            int parseInto2 = this.iAfterParser.parseInto(readWritablePeriod, str, parseInto, locale);
            if (parseInto2 < 0) {
                return parseInto2;
            }
            if (z && parseInto2 == i4 && i2 > 0) {
                return i4 ^ (-1);
            }
            if (parseInto2 > i4 && !z && !this.iUseBefore) {
                return i4 ^ (-1);
            }
            return parseInto2;
        }

        Separator finish(PeriodPrinter periodPrinter, PeriodParser periodParser) {
            this.iAfterPrinter = periodPrinter;
            this.iAfterParser = periodParser;
            return this;
        }
    }

    /* loaded from: joda-time-2.9.3.jar:org/joda/time/format/PeriodFormatterBuilder$Composite.class */
    static class Composite implements PeriodPrinter, PeriodParser {
        private final PeriodPrinter[] iPrinters;
        private final PeriodParser[] iParsers;

        Composite(List<Object> list) {
            ArrayList arrayList = new ArrayList();
            ArrayList arrayList2 = new ArrayList();
            decompose(list, arrayList, arrayList2);
            if (arrayList.size() <= 0) {
                this.iPrinters = null;
            } else {
                this.iPrinters = (PeriodPrinter[]) arrayList.toArray(new PeriodPrinter[arrayList.size()]);
            }
            if (arrayList2.size() <= 0) {
                this.iParsers = null;
            } else {
                this.iParsers = (PeriodParser[]) arrayList2.toArray(new PeriodParser[arrayList2.size()]);
            }
        }

        @Override // org.joda.time.format.PeriodPrinter
        public int countFieldsToPrint(ReadablePeriod readablePeriod, int i, Locale locale) {
            int i2 = 0;
            PeriodPrinter[] periodPrinterArr = this.iPrinters;
            int length = periodPrinterArr.length;
            while (i2 < i) {
                length--;
                if (length < 0) {
                    break;
                }
                i2 += periodPrinterArr[length].countFieldsToPrint(readablePeriod, Integer.MAX_VALUE, locale);
            }
            return i2;
        }

        @Override // org.joda.time.format.PeriodPrinter
        public int calculatePrintedLength(ReadablePeriod readablePeriod, Locale locale) {
            int i = 0;
            PeriodPrinter[] periodPrinterArr = this.iPrinters;
            int length = periodPrinterArr.length;
            while (true) {
                length--;
                if (length >= 0) {
                    i += periodPrinterArr[length].calculatePrintedLength(readablePeriod, locale);
                } else {
                    return i;
                }
            }
        }

        @Override // org.joda.time.format.PeriodPrinter
        public void printTo(StringBuffer stringBuffer, ReadablePeriod readablePeriod, Locale locale) {
            for (PeriodPrinter periodPrinter : this.iPrinters) {
                periodPrinter.printTo(stringBuffer, readablePeriod, locale);
            }
        }

        @Override // org.joda.time.format.PeriodPrinter
        public void printTo(Writer writer, ReadablePeriod readablePeriod, Locale locale) throws IOException {
            for (PeriodPrinter periodPrinter : this.iPrinters) {
                periodPrinter.printTo(writer, readablePeriod, locale);
            }
        }

        @Override // org.joda.time.format.PeriodParser
        public int parseInto(ReadWritablePeriod readWritablePeriod, String str, int i, Locale locale) {
            PeriodParser[] periodParserArr = this.iParsers;
            if (periodParserArr == null) {
                throw new UnsupportedOperationException();
            }
            int length = periodParserArr.length;
            for (int i2 = 0; i2 < length && i >= 0; i2++) {
                i = periodParserArr[i2].parseInto(readWritablePeriod, str, i, locale);
            }
            return i;
        }

        private void decompose(List<Object> list, List<Object> list2, List<Object> list3) {
            int size = list.size();
            for (int i = 0; i < size; i += 2) {
                Object obj = list.get(i);
                if (obj instanceof PeriodPrinter) {
                    if (obj instanceof Composite) {
                        addArrayToList(list2, ((Composite) obj).iPrinters);
                    } else {
                        list2.add(obj);
                    }
                }
                Object obj2 = list.get(i + 1);
                if (obj2 instanceof PeriodParser) {
                    if (obj2 instanceof Composite) {
                        addArrayToList(list3, ((Composite) obj2).iParsers);
                    } else {
                        list3.add(obj2);
                    }
                }
            }
        }

        private void addArrayToList(List<Object> list, Object[] objArr) {
            if (objArr != null) {
                for (Object obj : objArr) {
                    list.add(obj);
                }
            }
        }
    }
}
