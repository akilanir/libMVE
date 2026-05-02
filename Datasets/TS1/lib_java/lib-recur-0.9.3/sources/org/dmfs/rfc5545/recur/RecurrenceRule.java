package org.dmfs.rfc5545.recur;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.EnumMap;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TimeZone;
import org.dmfs.rfc5545.DateTime;
import org.dmfs.rfc5545.Weekday;
import org.dmfs.rfc5545.calendarmetrics.CalendarMetrics;
import org.dmfs.rfc5545.calendarmetrics.GregorianCalendarMetrics;

/* loaded from: lib-recur-0.9.3.jar:org/dmfs/rfc5545/recur/RecurrenceRule.class */
public final class RecurrenceRule {
    public final RfcMode mode;
    private EnumMap<Part, Object> mParts;
    private Map<String, String> mXParts;
    private CalendarMetrics mCalendarMetrics;
    private static final Integer ONE = 1;
    private static final String FREQ_PREFIX = Part.FREQ.name() + "=";
    private static final CalendarMetrics DEFAULT_CALENDAR_SCALE = new GregorianCalendarMetrics(Weekday.MO, 4);
    private static final Skip SKIP_DEFAULT = Skip.OMIT;
    private static final ValueConverter<Void> ERROR_CONVERTER = new ValueConverter<Void>() { // from class: org.dmfs.rfc5545.recur.RecurrenceRule.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // org.dmfs.rfc5545.recur.RecurrenceRule.ValueConverter
        public Void parse(String str, CalendarMetrics calendarMetrics, CalendarMetrics calendarMetrics2, boolean z) throws InvalidRecurrenceRuleException {
            throw new InvalidRecurrenceRuleException("part not allowed in an RRULE");
        }
    };

    /* loaded from: lib-recur-0.9.3.jar:org/dmfs/rfc5545/recur/RecurrenceRule$DateTimeConverter.class */
    private static class DateTimeConverter extends ValueConverter<DateTime> {
        private DateTimeConverter() {
            super();
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // org.dmfs.rfc5545.recur.RecurrenceRule.ValueConverter
        public DateTime parse(String str, CalendarMetrics calendarMetrics, CalendarMetrics calendarMetrics2, boolean z) throws InvalidRecurrenceRuleException {
            try {
                DateTime parse = DateTime.parse(calendarMetrics, (TimeZone) null, str);
                return calendarMetrics.scaleEquals(calendarMetrics2) ? parse : new DateTime(calendarMetrics2, parse);
            } catch (Exception e) {
                if (z && str != null && str.endsWith("ZZ")) {
                    try {
                        DateTime parse2 = DateTime.parse(calendarMetrics, (TimeZone) null, str.substring(0, str.length() - 1));
                        return calendarMetrics.scaleEquals(calendarMetrics2) ? parse2 : new DateTime(calendarMetrics2, parse2);
                    } catch (Exception e2) {
                        throw new InvalidRecurrenceRuleException("Invalid UNTIL date: " + str, e);
                    }
                }
                throw new InvalidRecurrenceRuleException("Invalid UNTIL date: " + str, e);
            }
        }
    }

    /* loaded from: lib-recur-0.9.3.jar:org/dmfs/rfc5545/recur/RecurrenceRule$FreqConverter.class */
    private static class FreqConverter extends ValueConverter<Freq> {
        private FreqConverter() {
            super();
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // org.dmfs.rfc5545.recur.RecurrenceRule.ValueConverter
        public Freq parse(String str, CalendarMetrics calendarMetrics, CalendarMetrics calendarMetrics2, boolean z) throws InvalidRecurrenceRuleException {
            try {
                return Freq.valueOf(str);
            } catch (IllegalArgumentException e) {
                throw new InvalidRecurrenceRuleException("Unknown FREQ value " + str);
            }
        }
    }

    /* loaded from: lib-recur-0.9.3.jar:org/dmfs/rfc5545/recur/RecurrenceRule$IntegerConverter.class */
    private static class IntegerConverter extends ValueConverter<Integer> {
        private final int mMinValue;
        private final int mMaxValue;
        private boolean mNoZero;

        public IntegerConverter(int i, int i2) {
            super();
            this.mNoZero = false;
            this.mMaxValue = i2;
            this.mMinValue = i;
        }

        public IntegerConverter noZero() {
            this.mNoZero = true;
            return this;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // org.dmfs.rfc5545.recur.RecurrenceRule.ValueConverter
        public Integer parse(String str, CalendarMetrics calendarMetrics, CalendarMetrics calendarMetrics2, boolean z) throws InvalidRecurrenceRuleException {
            try {
                int parseInt = Integer.parseInt(str);
                if (parseInt < this.mMinValue || parseInt > this.mMaxValue || (this.mNoZero && parseInt == 0)) {
                    throw new InvalidRecurrenceRuleException("int value out of range: " + parseInt);
                }
                return Integer.valueOf(parseInt);
            } catch (NumberFormatException e) {
                throw new InvalidRecurrenceRuleException("illegal int value: " + str);
            }
        }
    }

    /* loaded from: lib-recur-0.9.3.jar:org/dmfs/rfc5545/recur/RecurrenceRule$ListValueConverter.class */
    private static class ListValueConverter<T> extends ValueConverter<Collection<T>> {
        private final ValueConverter<T> mElementConverter;

        public ListValueConverter(ValueConverter<T> valueConverter) {
            super();
            this.mElementConverter = valueConverter;
        }

        @Override // org.dmfs.rfc5545.recur.RecurrenceRule.ValueConverter
        public Collection<T> parse(String str, CalendarMetrics calendarMetrics, CalendarMetrics calendarMetrics2, boolean z) throws InvalidRecurrenceRuleException {
            ArrayList arrayList = new ArrayList(32);
            for (String str2 : str.split(",")) {
                try {
                    arrayList.add(this.mElementConverter.parse(str2, calendarMetrics, calendarMetrics2, z));
                } catch (InvalidRecurrenceRuleException e) {
                    if (!z) {
                        throw e;
                    }
                } catch (Exception e2) {
                    if (!z) {
                        throw new InvalidRecurrenceRuleException("could not parse list '" + str + "'", e2);
                    }
                }
            }
            if (arrayList.size() > 0) {
                return arrayList;
            }
            throw new InvalidRecurrenceRuleException("empty lists are not allowed");
        }

        @Override // org.dmfs.rfc5545.recur.RecurrenceRule.ValueConverter
        public void serialize(StringBuilder sb, Object obj, CalendarMetrics calendarMetrics) {
            boolean z = true;
            for (Object obj2 : (Collection) obj) {
                if (z) {
                    z = false;
                } else {
                    sb.append(",");
                }
                this.mElementConverter.serialize(sb, obj2, calendarMetrics);
            }
        }
    }

    /* loaded from: lib-recur-0.9.3.jar:org/dmfs/rfc5545/recur/RecurrenceRule$MonthConverter.class */
    private static class MonthConverter extends ValueConverter<Integer> {
        private MonthConverter() {
            super();
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // org.dmfs.rfc5545.recur.RecurrenceRule.ValueConverter
        public Integer parse(String str, CalendarMetrics calendarMetrics, CalendarMetrics calendarMetrics2, boolean z) throws InvalidRecurrenceRuleException {
            return Integer.valueOf(calendarMetrics2.packedMonth(str));
        }

        @Override // org.dmfs.rfc5545.recur.RecurrenceRule.ValueConverter
        public void serialize(StringBuilder sb, Object obj, CalendarMetrics calendarMetrics) {
            sb.append(calendarMetrics.packedMonthToString(((Integer) obj).intValue()));
        }
    }

    /* loaded from: lib-recur-0.9.3.jar:org/dmfs/rfc5545/recur/RecurrenceRule$Part.class */
    public enum Part {
        FREQ(new FreqConverter()) { // from class: org.dmfs.rfc5545.recur.RecurrenceRule.Part.1
            @Override // org.dmfs.rfc5545.recur.RecurrenceRule.Part
            RuleIterator getExpander(RecurrenceRule recurrenceRule, RuleIterator ruleIterator, CalendarMetrics calendarMetrics, long j, TimeZone timeZone) {
                return new FreqIterator(recurrenceRule, calendarMetrics, j);
            }

            @Override // org.dmfs.rfc5545.recur.RecurrenceRule.Part
            ByFilter getFilter(RecurrenceRule recurrenceRule, CalendarMetrics calendarMetrics) throws UnsupportedOperationException {
                throw new UnsupportedOperationException("FREQ doesn't have a filter.");
            }

            @Override // org.dmfs.rfc5545.recur.RecurrenceRule.Part
            boolean expands(RecurrenceRule recurrenceRule) {
                return true;
            }
        },
        INTERVAL(new IntegerConverter(1, Integer.MAX_VALUE)) { // from class: org.dmfs.rfc5545.recur.RecurrenceRule.Part.2
            @Override // org.dmfs.rfc5545.recur.RecurrenceRule.Part
            RuleIterator getExpander(RecurrenceRule recurrenceRule, RuleIterator ruleIterator, CalendarMetrics calendarMetrics, long j, TimeZone timeZone) {
                throw new UnsupportedOperationException("INTERVAL doesn't have an iterator.");
            }

            @Override // org.dmfs.rfc5545.recur.RecurrenceRule.Part
            ByFilter getFilter(RecurrenceRule recurrenceRule, CalendarMetrics calendarMetrics) throws UnsupportedOperationException {
                throw new UnsupportedOperationException("INTERVAL doesn't have a filter.");
            }

            @Override // org.dmfs.rfc5545.recur.RecurrenceRule.Part
            boolean expands(RecurrenceRule recurrenceRule) {
                throw new UnsupportedOperationException("INTERVAL doesn't support expansion nor filtering");
            }
        },
        RSCALE(new RScaleConverter()) { // from class: org.dmfs.rfc5545.recur.RecurrenceRule.Part.3
            @Override // org.dmfs.rfc5545.recur.RecurrenceRule.Part
            RuleIterator getExpander(RecurrenceRule recurrenceRule, RuleIterator ruleIterator, CalendarMetrics calendarMetrics, long j, TimeZone timeZone) throws UnsupportedOperationException {
                throw new UnsupportedOperationException("RSCALE doesn't have an expander.");
            }

            @Override // org.dmfs.rfc5545.recur.RecurrenceRule.Part
            ByFilter getFilter(RecurrenceRule recurrenceRule, CalendarMetrics calendarMetrics) throws UnsupportedOperationException {
                throw new UnsupportedOperationException("RSCALE doesn't have a filter.");
            }

            @Override // org.dmfs.rfc5545.recur.RecurrenceRule.Part
            boolean expands(RecurrenceRule recurrenceRule) {
                throw new UnsupportedOperationException("RSCALE doesn't support expansion nor filtering");
            }
        },
        WKST(new WeekdayConverter()) { // from class: org.dmfs.rfc5545.recur.RecurrenceRule.Part.4
            @Override // org.dmfs.rfc5545.recur.RecurrenceRule.Part
            RuleIterator getExpander(RecurrenceRule recurrenceRule, RuleIterator ruleIterator, CalendarMetrics calendarMetrics, long j, TimeZone timeZone) {
                throw new UnsupportedOperationException("WKST doesn't have an iterator.");
            }

            @Override // org.dmfs.rfc5545.recur.RecurrenceRule.Part
            ByFilter getFilter(RecurrenceRule recurrenceRule, CalendarMetrics calendarMetrics) throws UnsupportedOperationException {
                throw new UnsupportedOperationException("WKST doesn't have a filter.");
            }

            @Override // org.dmfs.rfc5545.recur.RecurrenceRule.Part
            boolean expands(RecurrenceRule recurrenceRule) {
                throw new UnsupportedOperationException("WKST doesn't support expansion nor filtering.");
            }
        },
        BYMONTH(new ListValueConverter(new MonthConverter())) { // from class: org.dmfs.rfc5545.recur.RecurrenceRule.Part.5
            @Override // org.dmfs.rfc5545.recur.RecurrenceRule.Part
            RuleIterator getExpander(RecurrenceRule recurrenceRule, RuleIterator ruleIterator, CalendarMetrics calendarMetrics, long j, TimeZone timeZone) {
                return new ByMonthExpander(recurrenceRule, ruleIterator, calendarMetrics, j);
            }

            @Override // org.dmfs.rfc5545.recur.RecurrenceRule.Part
            ByFilter getFilter(RecurrenceRule recurrenceRule, CalendarMetrics calendarMetrics) throws UnsupportedOperationException {
                return new ByMonthFilter(recurrenceRule, calendarMetrics);
            }

            @Override // org.dmfs.rfc5545.recur.RecurrenceRule.Part
            boolean expands(RecurrenceRule recurrenceRule) {
                return recurrenceRule.getFreq() == Freq.YEARLY;
            }
        },
        _BYMONTHSKIP(RecurrenceRule.ERROR_CONVERTER) { // from class: org.dmfs.rfc5545.recur.RecurrenceRule.Part.6
            @Override // org.dmfs.rfc5545.recur.RecurrenceRule.Part
            RuleIterator getExpander(RecurrenceRule recurrenceRule, RuleIterator ruleIterator, CalendarMetrics calendarMetrics, long j, TimeZone timeZone) throws UnsupportedOperationException {
                return new ByMonthSkipFilter(recurrenceRule, ruleIterator, calendarMetrics, j);
            }

            @Override // org.dmfs.rfc5545.recur.RecurrenceRule.Part
            ByFilter getFilter(RecurrenceRule recurrenceRule, CalendarMetrics calendarMetrics) throws UnsupportedOperationException {
                throw new UnsupportedOperationException("_BYMONTHSKIP doesn't support  filtering");
            }

            @Override // org.dmfs.rfc5545.recur.RecurrenceRule.Part
            boolean expands(RecurrenceRule recurrenceRule) {
                return true;
            }
        },
        BYWEEKNO(new ListValueConverter(new IntegerConverter(-53, 53).noZero())) { // from class: org.dmfs.rfc5545.recur.RecurrenceRule.Part.7
            @Override // org.dmfs.rfc5545.recur.RecurrenceRule.Part
            RuleIterator getExpander(RecurrenceRule recurrenceRule, RuleIterator ruleIterator, CalendarMetrics calendarMetrics, long j, TimeZone timeZone) {
                return new ByWeekNoExpander(recurrenceRule, ruleIterator, calendarMetrics, j);
            }

            @Override // org.dmfs.rfc5545.recur.RecurrenceRule.Part
            ByFilter getFilter(RecurrenceRule recurrenceRule, CalendarMetrics calendarMetrics) throws UnsupportedOperationException {
                return null;
            }

            @Override // org.dmfs.rfc5545.recur.RecurrenceRule.Part
            boolean expands(RecurrenceRule recurrenceRule) {
                return true;
            }
        },
        BYYEARDAY(new ListValueConverter(new IntegerConverter(-366, 366).noZero())) { // from class: org.dmfs.rfc5545.recur.RecurrenceRule.Part.8
            @Override // org.dmfs.rfc5545.recur.RecurrenceRule.Part
            RuleIterator getExpander(RecurrenceRule recurrenceRule, RuleIterator ruleIterator, CalendarMetrics calendarMetrics, long j, TimeZone timeZone) {
                return new ByYearDayExpander(recurrenceRule, ruleIterator, calendarMetrics, j);
            }

            @Override // org.dmfs.rfc5545.recur.RecurrenceRule.Part
            ByFilter getFilter(RecurrenceRule recurrenceRule, CalendarMetrics calendarMetrics) throws UnsupportedOperationException {
                return new ByYearDayFilter(recurrenceRule, calendarMetrics);
            }

            @Override // org.dmfs.rfc5545.recur.RecurrenceRule.Part
            boolean expands(RecurrenceRule recurrenceRule) {
                Freq freq = recurrenceRule.getFreq();
                return freq == Freq.YEARLY || freq == Freq.MONTHLY || freq == Freq.WEEKLY;
            }
        },
        BYMONTHDAY(new ListValueConverter(new IntegerConverter(-31, 31).noZero())) { // from class: org.dmfs.rfc5545.recur.RecurrenceRule.Part.9
            @Override // org.dmfs.rfc5545.recur.RecurrenceRule.Part
            RuleIterator getExpander(RecurrenceRule recurrenceRule, RuleIterator ruleIterator, CalendarMetrics calendarMetrics, long j, TimeZone timeZone) {
                return new ByMonthDayExpander(recurrenceRule, ruleIterator, calendarMetrics, j);
            }

            @Override // org.dmfs.rfc5545.recur.RecurrenceRule.Part
            ByFilter getFilter(RecurrenceRule recurrenceRule, CalendarMetrics calendarMetrics) throws UnsupportedOperationException {
                return new ByMonthDayFilter(recurrenceRule, calendarMetrics);
            }

            @Override // org.dmfs.rfc5545.recur.RecurrenceRule.Part
            boolean expands(RecurrenceRule recurrenceRule) {
                Freq freq = recurrenceRule.getFreq();
                return (freq == Freq.YEARLY || freq == Freq.MONTHLY || freq == Freq.WEEKLY) && !recurrenceRule.hasPart(Part.BYYEARDAY);
            }
        },
        _BYMONTHDAYSKIP(RecurrenceRule.ERROR_CONVERTER) { // from class: org.dmfs.rfc5545.recur.RecurrenceRule.Part.10
            @Override // org.dmfs.rfc5545.recur.RecurrenceRule.Part
            RuleIterator getExpander(RecurrenceRule recurrenceRule, RuleIterator ruleIterator, CalendarMetrics calendarMetrics, long j, TimeZone timeZone) throws UnsupportedOperationException {
                return new ByMonthDaySkipFilter(recurrenceRule, ruleIterator, calendarMetrics, j);
            }

            @Override // org.dmfs.rfc5545.recur.RecurrenceRule.Part
            ByFilter getFilter(RecurrenceRule recurrenceRule, CalendarMetrics calendarMetrics) throws UnsupportedOperationException {
                throw new UnsupportedOperationException("_BYMONTHDAYSKIP doesn't support filtering");
            }

            @Override // org.dmfs.rfc5545.recur.RecurrenceRule.Part
            boolean expands(RecurrenceRule recurrenceRule) {
                return true;
            }
        },
        BYDAY(new ListValueConverter(new WeekdayNumConverter())) { // from class: org.dmfs.rfc5545.recur.RecurrenceRule.Part.11
            @Override // org.dmfs.rfc5545.recur.RecurrenceRule.Part
            RuleIterator getExpander(RecurrenceRule recurrenceRule, RuleIterator ruleIterator, CalendarMetrics calendarMetrics, long j, TimeZone timeZone) {
                return new ByDayExpander(recurrenceRule, ruleIterator, calendarMetrics, j);
            }

            @Override // org.dmfs.rfc5545.recur.RecurrenceRule.Part
            ByFilter getFilter(RecurrenceRule recurrenceRule, CalendarMetrics calendarMetrics) throws UnsupportedOperationException {
                return new ByDayFilter(recurrenceRule, calendarMetrics);
            }

            @Override // org.dmfs.rfc5545.recur.RecurrenceRule.Part
            boolean expands(RecurrenceRule recurrenceRule) {
                Freq freq = recurrenceRule.getFreq();
                return !((freq != Freq.YEARLY && freq != Freq.MONTHLY) || recurrenceRule.hasPart(Part.BYYEARDAY) || recurrenceRule.hasPart(Part.BYMONTHDAY)) || freq == Freq.WEEKLY;
            }
        },
        BYHOUR(new ListValueConverter(new IntegerConverter(0, 23))) { // from class: org.dmfs.rfc5545.recur.RecurrenceRule.Part.12
            @Override // org.dmfs.rfc5545.recur.RecurrenceRule.Part
            RuleIterator getExpander(RecurrenceRule recurrenceRule, RuleIterator ruleIterator, CalendarMetrics calendarMetrics, long j, TimeZone timeZone) {
                return new ByHourExpander(recurrenceRule, ruleIterator, calendarMetrics, j);
            }

            @Override // org.dmfs.rfc5545.recur.RecurrenceRule.Part
            ByFilter getFilter(RecurrenceRule recurrenceRule, CalendarMetrics calendarMetrics) throws UnsupportedOperationException {
                return new ByHourFilter(recurrenceRule, calendarMetrics);
            }

            @Override // org.dmfs.rfc5545.recur.RecurrenceRule.Part
            boolean expands(RecurrenceRule recurrenceRule) {
                Freq freq = recurrenceRule.getFreq();
                return (freq == Freq.SECONDLY || freq == Freq.MINUTELY || freq == Freq.HOURLY) ? false : true;
            }
        },
        BYMINUTE(new ListValueConverter(new IntegerConverter(0, 59))) { // from class: org.dmfs.rfc5545.recur.RecurrenceRule.Part.13
            @Override // org.dmfs.rfc5545.recur.RecurrenceRule.Part
            RuleIterator getExpander(RecurrenceRule recurrenceRule, RuleIterator ruleIterator, CalendarMetrics calendarMetrics, long j, TimeZone timeZone) {
                return new ByMinuteExpander(recurrenceRule, ruleIterator, calendarMetrics, j);
            }

            @Override // org.dmfs.rfc5545.recur.RecurrenceRule.Part
            ByFilter getFilter(RecurrenceRule recurrenceRule, CalendarMetrics calendarMetrics) throws UnsupportedOperationException {
                return new ByMinuteFilter(recurrenceRule, calendarMetrics);
            }

            @Override // org.dmfs.rfc5545.recur.RecurrenceRule.Part
            boolean expands(RecurrenceRule recurrenceRule) {
                Freq freq = recurrenceRule.getFreq();
                return (freq == Freq.SECONDLY || freq == Freq.MINUTELY) ? false : true;
            }
        },
        BYSECOND(new ListValueConverter(new IntegerConverter(0, 60))) { // from class: org.dmfs.rfc5545.recur.RecurrenceRule.Part.14
            @Override // org.dmfs.rfc5545.recur.RecurrenceRule.Part
            RuleIterator getExpander(RecurrenceRule recurrenceRule, RuleIterator ruleIterator, CalendarMetrics calendarMetrics, long j, TimeZone timeZone) {
                return new BySecondExpander(recurrenceRule, ruleIterator, calendarMetrics, j);
            }

            @Override // org.dmfs.rfc5545.recur.RecurrenceRule.Part
            ByFilter getFilter(RecurrenceRule recurrenceRule, CalendarMetrics calendarMetrics) throws UnsupportedOperationException {
                return new BySecondFilter(recurrenceRule, calendarMetrics);
            }

            @Override // org.dmfs.rfc5545.recur.RecurrenceRule.Part
            boolean expands(RecurrenceRule recurrenceRule) {
                return recurrenceRule.getFreq() != Freq.SECONDLY;
            }
        },
        SKIP(new SkipValueConverter()) { // from class: org.dmfs.rfc5545.recur.RecurrenceRule.Part.15
            @Override // org.dmfs.rfc5545.recur.RecurrenceRule.Part
            RuleIterator getExpander(RecurrenceRule recurrenceRule, RuleIterator ruleIterator, CalendarMetrics calendarMetrics, long j, TimeZone timeZone) {
                if (recurrenceRule.getFreq() == Freq.YEARLY && recurrenceRule.getSkip() == Skip.FORWARD) {
                    return new SkipBuffer(recurrenceRule, ruleIterator, calendarMetrics, j);
                }
                return null;
            }

            @Override // org.dmfs.rfc5545.recur.RecurrenceRule.Part
            ByFilter getFilter(RecurrenceRule recurrenceRule, CalendarMetrics calendarMetrics) throws UnsupportedOperationException {
                throw new UnsupportedOperationException("SKIP doesn't support  filtering");
            }

            @Override // org.dmfs.rfc5545.recur.RecurrenceRule.Part
            boolean expands(RecurrenceRule recurrenceRule) {
                return true;
            }
        },
        _SANITY_FILTER(RecurrenceRule.ERROR_CONVERTER) { // from class: org.dmfs.rfc5545.recur.RecurrenceRule.Part.16
            @Override // org.dmfs.rfc5545.recur.RecurrenceRule.Part
            RuleIterator getExpander(RecurrenceRule recurrenceRule, RuleIterator ruleIterator, CalendarMetrics calendarMetrics, long j, TimeZone timeZone) throws UnsupportedOperationException {
                return new SanityFilter(recurrenceRule, ruleIterator, calendarMetrics, j);
            }

            @Override // org.dmfs.rfc5545.recur.RecurrenceRule.Part
            ByFilter getFilter(RecurrenceRule recurrenceRule, CalendarMetrics calendarMetrics) throws UnsupportedOperationException {
                throw new UnsupportedOperationException("_SANITY doesn't support filtering");
            }

            @Override // org.dmfs.rfc5545.recur.RecurrenceRule.Part
            boolean expands(RecurrenceRule recurrenceRule) {
                return true;
            }
        },
        BYSETPOS(new ListValueConverter(new IntegerConverter(-500, 500).noZero())) { // from class: org.dmfs.rfc5545.recur.RecurrenceRule.Part.17
            @Override // org.dmfs.rfc5545.recur.RecurrenceRule.Part
            RuleIterator getExpander(RecurrenceRule recurrenceRule, RuleIterator ruleIterator, CalendarMetrics calendarMetrics, long j, TimeZone timeZone) {
                return new BySetPosFilter(recurrenceRule, ruleIterator, j);
            }

            @Override // org.dmfs.rfc5545.recur.RecurrenceRule.Part
            ByFilter getFilter(RecurrenceRule recurrenceRule, CalendarMetrics calendarMetrics) throws UnsupportedOperationException {
                throw new UnsupportedOperationException("BYSETPOS doesn't support  filtering");
            }

            @Override // org.dmfs.rfc5545.recur.RecurrenceRule.Part
            boolean expands(RecurrenceRule recurrenceRule) {
                return true;
            }
        },
        UNTIL(new DateTimeConverter()) { // from class: org.dmfs.rfc5545.recur.RecurrenceRule.Part.18
            @Override // org.dmfs.rfc5545.recur.RecurrenceRule.Part
            RuleIterator getExpander(RecurrenceRule recurrenceRule, RuleIterator ruleIterator, CalendarMetrics calendarMetrics, long j, TimeZone timeZone) {
                return new UntilLimiter(recurrenceRule, ruleIterator, calendarMetrics, timeZone);
            }

            @Override // org.dmfs.rfc5545.recur.RecurrenceRule.Part
            ByFilter getFilter(RecurrenceRule recurrenceRule, CalendarMetrics calendarMetrics) throws UnsupportedOperationException {
                throw new UnsupportedOperationException("UNTIL doesn't support filtering");
            }

            @Override // org.dmfs.rfc5545.recur.RecurrenceRule.Part
            boolean expands(RecurrenceRule recurrenceRule) {
                return true;
            }
        },
        COUNT(new IntegerConverter(1, Integer.MAX_VALUE)) { // from class: org.dmfs.rfc5545.recur.RecurrenceRule.Part.19
            @Override // org.dmfs.rfc5545.recur.RecurrenceRule.Part
            RuleIterator getExpander(RecurrenceRule recurrenceRule, RuleIterator ruleIterator, CalendarMetrics calendarMetrics, long j, TimeZone timeZone) {
                return new CountLimiter(recurrenceRule, ruleIterator);
            }

            @Override // org.dmfs.rfc5545.recur.RecurrenceRule.Part
            ByFilter getFilter(RecurrenceRule recurrenceRule, CalendarMetrics calendarMetrics) throws UnsupportedOperationException {
                throw new UnsupportedOperationException("COUNT doesn't support  filtering");
            }

            @Override // org.dmfs.rfc5545.recur.RecurrenceRule.Part
            boolean expands(RecurrenceRule recurrenceRule) {
                return true;
            }
        };

        final ValueConverter<?> converter;

        Part(ValueConverter valueConverter) {
            this.converter = valueConverter;
        }

        abstract RuleIterator getExpander(RecurrenceRule recurrenceRule, RuleIterator ruleIterator, CalendarMetrics calendarMetrics, long j, TimeZone timeZone) throws UnsupportedOperationException;

        abstract ByFilter getFilter(RecurrenceRule recurrenceRule, CalendarMetrics calendarMetrics) throws UnsupportedOperationException;

        abstract boolean expands(RecurrenceRule recurrenceRule);
    }

    /* loaded from: lib-recur-0.9.3.jar:org/dmfs/rfc5545/recur/RecurrenceRule$RScaleConverter.class */
    private static class RScaleConverter extends ValueConverter<CalendarMetrics> {
        private RScaleConverter() {
            super();
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // org.dmfs.rfc5545.recur.RecurrenceRule.ValueConverter
        public CalendarMetrics parse(String str, CalendarMetrics calendarMetrics, CalendarMetrics calendarMetrics2, boolean z) throws InvalidRecurrenceRuleException {
            CalendarMetrics.CalendarMetricsFactory calendarMetricsForName = UnicodeCalendarScales.getCalendarMetricsForName(str);
            if (calendarMetricsForName == null) {
                throw new InvalidRecurrenceRuleException("unknown calendar scale '" + str + "'");
            }
            return calendarMetricsForName.getCalendarMetrics(Weekday.SU);
        }
    }

    /* loaded from: lib-recur-0.9.3.jar:org/dmfs/rfc5545/recur/RecurrenceRule$RfcMode.class */
    public enum RfcMode {
        RFC2445_STRICT,
        RFC2445_LAX,
        RFC5545_STRICT,
        RFC5545_LAX
    }

    /* loaded from: lib-recur-0.9.3.jar:org/dmfs/rfc5545/recur/RecurrenceRule$Skip.class */
    public enum Skip {
        OMIT,
        BACKWARD,
        FORWARD
    }

    /* loaded from: lib-recur-0.9.3.jar:org/dmfs/rfc5545/recur/RecurrenceRule$SkipValueConverter.class */
    private static class SkipValueConverter extends ValueConverter<Skip> {
        private SkipValueConverter() {
            super();
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // org.dmfs.rfc5545.recur.RecurrenceRule.ValueConverter
        public Skip parse(String str, CalendarMetrics calendarMetrics, CalendarMetrics calendarMetrics2, boolean z) throws InvalidRecurrenceRuleException {
            try {
                return Skip.valueOf(str);
            } catch (IllegalArgumentException e) {
                throw new InvalidRecurrenceRuleException("Unknown SKIP value " + str);
            }
        }
    }

    /* loaded from: lib-recur-0.9.3.jar:org/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter.class */
    private static abstract class ValueConverter<T> {
        private ValueConverter() {
        }

        public abstract T parse(String str, CalendarMetrics calendarMetrics, CalendarMetrics calendarMetrics2, boolean z) throws InvalidRecurrenceRuleException;

        public void serialize(StringBuilder sb, Object obj, CalendarMetrics calendarMetrics) {
            sb.append(obj.toString());
        }
    }

    /* loaded from: lib-recur-0.9.3.jar:org/dmfs/rfc5545/recur/RecurrenceRule$WeekdayConverter.class */
    private static class WeekdayConverter extends ValueConverter<Weekday> {
        private WeekdayConverter() {
            super();
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // org.dmfs.rfc5545.recur.RecurrenceRule.ValueConverter
        public Weekday parse(String str, CalendarMetrics calendarMetrics, CalendarMetrics calendarMetrics2, boolean z) throws InvalidRecurrenceRuleException {
            try {
                return Weekday.valueOf(str);
            } catch (IllegalArgumentException e) {
                throw new InvalidRecurrenceRuleException("illegal weekday: " + str);
            }
        }
    }

    /* loaded from: lib-recur-0.9.3.jar:org/dmfs/rfc5545/recur/RecurrenceRule$WeekdayNum.class */
    public static class WeekdayNum {
        public final int pos;
        public final Weekday weekday;

        public WeekdayNum(int i, Weekday weekday) {
            if (i < -53 || i > 53) {
                throw new IllegalArgumentException("position " + i + " of week day out of range");
            }
            this.pos = i;
            this.weekday = weekday;
        }

        public static WeekdayNum valueOf(String str, boolean z) throws InvalidRecurrenceRuleException {
            try {
                int length = str.length();
                if (length <= 2) {
                    return new WeekdayNum(0, Weekday.valueOf(str));
                }
                int parseInt = Integer.parseInt(str.substring(str.charAt(0) == '+' ? 1 : 0, length - 2));
                if (z || (parseInt != 0 && parseInt >= -53 && parseInt <= 53)) {
                    return new WeekdayNum(parseInt, Weekday.valueOf(str.substring(length - 2)));
                }
                throw new InvalidRecurrenceRuleException("invalid weeknum: '" + str + "'");
            } catch (Exception e) {
                throw new InvalidRecurrenceRuleException("invalid weeknum: '" + str + "'", e);
            }
        }

        public static WeekdayNum valueOf(String str) throws InvalidRecurrenceRuleException {
            return valueOf(str, false);
        }

        public String toString() {
            return this.pos == 0 ? this.weekday.name() : Integer.valueOf(this.pos) + this.weekday.name();
        }
    }

    /* loaded from: lib-recur-0.9.3.jar:org/dmfs/rfc5545/recur/RecurrenceRule$WeekdayNumConverter.class */
    private static class WeekdayNumConverter extends ValueConverter<WeekdayNum> {
        private WeekdayNumConverter() {
            super();
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // org.dmfs.rfc5545.recur.RecurrenceRule.ValueConverter
        public WeekdayNum parse(String str, CalendarMetrics calendarMetrics, CalendarMetrics calendarMetrics2, boolean z) throws InvalidRecurrenceRuleException {
            return WeekdayNum.valueOf(str, z);
        }
    }

    public RecurrenceRule(String str) throws InvalidRecurrenceRuleException {
        this(str, RfcMode.RFC5545_LAX);
    }

    public RecurrenceRule(String str, RfcMode rfcMode) throws InvalidRecurrenceRuleException {
        this.mParts = new EnumMap<>(Part.class);
        this.mXParts = null;
        this.mCalendarMetrics = DEFAULT_CALENDAR_SCALE;
        this.mode = rfcMode;
        parseString(str);
    }

    public RecurrenceRule(Freq freq) {
        this(freq, RfcMode.RFC5545_STRICT);
    }

    public RecurrenceRule(Freq freq, RfcMode rfcMode) {
        this.mParts = new EnumMap<>(Part.class);
        this.mXParts = null;
        this.mCalendarMetrics = DEFAULT_CALENDAR_SCALE;
        this.mode = rfcMode;
        this.mParts.put((EnumMap<Part, Object>) Part.FREQ, (Part) freq);
    }

    private void parseString(String str) throws InvalidRecurrenceRuleException {
        if (str == null) {
            throw new IllegalArgumentException("recur must not be null");
        }
        boolean z = this.mode == RfcMode.RFC2445_LAX || this.mode == RfcMode.RFC5545_LAX;
        if (z) {
            str = str.trim();
        }
        String upperCase = str.toUpperCase(Locale.ENGLISH);
        String[] split = upperCase.split(";");
        if (this.mode == RfcMode.RFC2445_STRICT && !split[0].startsWith(FREQ_PREFIX)) {
            throw new InvalidRecurrenceRuleException("RFC 2445 requires FREQ to be the first part of the rule: " + upperCase);
        }
        CalendarMetrics calendarMetrics = this.mCalendarMetrics;
        CalendarMetrics calendarMetrics2 = DEFAULT_CALENDAR_SCALE;
        EnumMap<Part, Object> enumMap = this.mParts;
        String name = Part.RSCALE.name();
        int length = split.length;
        int i = 0;
        while (true) {
            if (i >= length) {
                break;
            }
            String str2 = split[i];
            if (str2.startsWith(name)) {
                int indexOf = str2.indexOf("=");
                if (indexOf > 0) {
                    if (str2.substring(0, indexOf).equals(name)) {
                        calendarMetrics2 = (CalendarMetrics) Part.RSCALE.converter.parse(str2.substring(indexOf + 1), calendarMetrics, null, z);
                        enumMap.put((EnumMap<Part, Object>) Part.RSCALE, (Part) calendarMetrics2);
                        break;
                    }
                } else if (!z) {
                    throw new InvalidRecurrenceRuleException("Missing '=' in part '" + str2 + "'");
                }
            }
            i++;
        }
        for (String str3 : split) {
            int indexOf2 = str3.indexOf("=");
            if (indexOf2 > 0) {
                String substring = str3.substring(0, indexOf2);
                String substring2 = str3.substring(indexOf2 + 1);
                try {
                    Part valueOf = Part.valueOf(substring);
                    if (valueOf == Part.RSCALE) {
                        continue;
                    } else {
                        if (!z && enumMap.containsKey(valueOf)) {
                            throw new InvalidRecurrenceRuleException("duplicate part " + valueOf + " in " + upperCase);
                        }
                        try {
                            Object parse = valueOf.converter.parse(substring2, calendarMetrics, calendarMetrics2, z);
                            if (parse != null && (valueOf != Part.INTERVAL || !ONE.equals(parse))) {
                                enumMap.put((EnumMap<Part, Object>) valueOf, (Part) parse);
                            }
                        } catch (InvalidRecurrenceRuleException e) {
                            if (!z) {
                                throw e;
                            }
                        }
                    }
                } catch (IllegalArgumentException e2) {
                    if (substring.length() > 2 && substring.charAt(0) == 'X' && substring.charAt(1) == '-') {
                        switch (this.mode) {
                            case RFC2445_LAX:
                            case RFC2445_STRICT:
                                setXPart(substring, substring2);
                                break;
                            case RFC5545_STRICT:
                                throw new InvalidRecurrenceRuleException("invalid part " + substring + " in " + upperCase);
                        }
                    } else if (!z) {
                        throw new InvalidRecurrenceRuleException("invalid part " + substring + " in " + upperCase);
                    }
                }
            } else if (!z) {
                throw new InvalidRecurrenceRuleException("Missing '=' in part '" + str3 + "'");
            }
        }
        if (enumMap.containsKey(Part.RSCALE) && !enumMap.containsKey(Part.SKIP)) {
            enumMap.put((EnumMap<Part, Object>) Part.SKIP, (Part) SKIP_DEFAULT);
        }
        if (getSkip() != Skip.OMIT) {
            switch (getFreq()) {
                case YEARLY:
                    this.mParts.put((EnumMap<Part, Object>) Part._BYMONTHSKIP, (Part) null);
                case MONTHLY:
                    this.mParts.put((EnumMap<Part, Object>) Part._BYMONTHDAYSKIP, (Part) null);
                    break;
            }
        }
        validate();
    }

    private void checkForInvalidNumericInByDay(Freq freq) throws InvalidRecurrenceRuleException {
        EnumMap<Part, Object> enumMap = this.mParts;
        if (enumMap.containsKey(Part.BYDAY)) {
            Iterator it = ((ArrayList) enumMap.get(Part.BYDAY)).iterator();
            while (it.hasNext()) {
                if (((WeekdayNum) it.next()).pos != 0) {
                    if (freq == Freq.YEARLY || freq == Freq.MONTHLY) {
                        if (freq == Freq.YEARLY && enumMap.containsKey(Part.BYWEEKNO)) {
                            if (this.mode == RfcMode.RFC5545_STRICT) {
                                throw new InvalidRecurrenceRuleException("The BYDAY rule part must not be specified with a numeric value with the FREQ rule part set to YEARLY when BYWEEKNO is set");
                            }
                            enumMap.remove(Part.BYDAY);
                        }
                    } else {
                        if (this.mode == RfcMode.RFC5545_STRICT) {
                            throw new InvalidRecurrenceRuleException("The BYDAY rule part must not be specified with a numeric value when the FREQ rule part is not set to MONTHLY or YEARLY.");
                        }
                        enumMap.remove(Part.BYDAY);
                    }
                }
            }
        }
    }

    private void validate() throws InvalidRecurrenceRuleException {
        EnumMap<Part, Object> enumMap = this.mParts;
        Freq freq = (Freq) enumMap.get(Part.FREQ);
        if (freq == null) {
            throw new InvalidRecurrenceRuleException("FREQ part is missing");
        }
        boolean z = this.mode == RfcMode.RFC2445_STRICT || this.mode == RfcMode.RFC5545_STRICT;
        if (enumMap.containsKey(Part.UNTIL) && enumMap.containsKey(Part.COUNT)) {
            throw new InvalidRecurrenceRuleException("UNTIL and COUNT must not occur in the same rule.");
        }
        if (getInterval() <= 0) {
            if (z) {
                throw new InvalidRecurrenceRuleException("INTERVAL must not be <= 0");
            }
            enumMap.remove(Part.INTERVAL);
        }
        if (freq != Freq.YEARLY && enumMap.containsKey(Part.BYWEEKNO)) {
            if (z) {
                throw new InvalidRecurrenceRuleException("BYWEEKNO is allowed in YEARLY rules only");
            }
            enumMap.put((EnumMap<Part, Object>) Part.FREQ, (Part) Freq.YEARLY);
        }
        if (this.mode == RfcMode.RFC5545_STRICT) {
            if ((freq == Freq.DAILY || freq == Freq.WEEKLY || freq == Freq.MONTHLY) && enumMap.containsKey(Part.BYYEARDAY)) {
                throw new InvalidRecurrenceRuleException("In RFC 5545, BYYEARDAY is not allowed in DAILY, WEEKLY or MONTHLY rules");
            }
            if (freq == Freq.WEEKLY && enumMap.containsKey(Part.BYMONTHDAY)) {
                throw new InvalidRecurrenceRuleException("In RFC 5545, BYMONTHDAY is not allowed in WEEKLY rules");
            }
        }
        if (enumMap.containsKey(Part.BYSETPOS) && !enumMap.containsKey(Part.BYDAY) && !enumMap.containsKey(Part.BYMONTHDAY) && !enumMap.containsKey(Part.BYMONTH) && !enumMap.containsKey(Part.BYHOUR) && !enumMap.containsKey(Part.BYMINUTE) && !enumMap.containsKey(Part.BYSECOND) && !enumMap.containsKey(Part.BYWEEKNO) && !enumMap.containsKey(Part.BYYEARDAY)) {
            if (z) {
                throw new InvalidRecurrenceRuleException("BYSETPOS must only be used in conjunction with another BYxxx rule.");
            }
            enumMap.remove(Part.BYSETPOS);
        }
        checkForInvalidNumericInByDay(freq);
    }

    private void validate(Part part, List<Integer> list) throws InvalidRecurrenceRuleException {
        Freq freq = (Freq) this.mParts.get(Part.FREQ);
        if (this.mode == RfcMode.RFC5545_STRICT) {
            if (freq != Freq.YEARLY && part == Part.BYWEEKNO) {
                throw new InvalidRecurrenceRuleException("In RFC 5545, BYWEEKNO is allowed in YEARLY rules only");
            }
            if ((freq == Freq.DAILY || freq == Freq.WEEKLY || freq == Freq.MONTHLY) && part == Part.BYYEARDAY) {
                throw new InvalidRecurrenceRuleException("In RFC 5545, BYYEARDAY is not allowed in DAILY, WEEKLY or MONTHLY rules");
            }
            if (freq == Freq.WEEKLY && part == Part.BYMONTHDAY) {
                throw new InvalidRecurrenceRuleException("In RFC 5545, BYMONTHDAY is not allowed in WEEKLY rules");
            }
        }
    }

    public Freq getFreq() {
        return (Freq) this.mParts.get(Part.FREQ);
    }

    public void setFreq(Freq freq, boolean z) {
        this.mParts.put((EnumMap<Part, Object>) Part.FREQ, (Part) freq);
        if (this.mode == RfcMode.RFC5545_STRICT || this.mode == RfcMode.RFC5545_LAX) {
        }
    }

    public Skip getSkip() {
        Skip skip = (Skip) this.mParts.get(Part.SKIP);
        return skip == null ? Skip.OMIT : skip;
    }

    public void setSkip(Skip skip) {
        if (skip == null || skip == Skip.OMIT) {
            this.mParts.remove(Part.SKIP);
            this.mParts.remove(Part._BYMONTHSKIP);
            this.mParts.remove(Part._BYMONTHDAYSKIP);
            return;
        }
        this.mParts.put((EnumMap<Part, Object>) Part.SKIP, (Part) skip);
        if (!this.mParts.containsKey(Part.RSCALE)) {
            this.mParts.put((EnumMap<Part, Object>) Part.RSCALE, (Part) DEFAULT_CALENDAR_SCALE);
        }
        Freq freq = getFreq();
        if (freq == Freq.YEARLY || freq == Freq.MONTHLY) {
            this.mParts.put((EnumMap<Part, Object>) Part._BYMONTHSKIP, (Part) null);
            this.mParts.put((EnumMap<Part, Object>) Part._BYMONTHDAYSKIP, (Part) null);
        }
    }

    public int getInterval() {
        Integer num = (Integer) this.mParts.get(Part.INTERVAL);
        if (num == null) {
            return 1;
        }
        return num.intValue();
    }

    public void setInterval(int i) {
        if (i > 1) {
            this.mParts.put((EnumMap<Part, Object>) Part.INTERVAL, (Part) Integer.valueOf(i));
        } else {
            if (i <= 0) {
                throw new IllegalArgumentException("Interval must be a positive integer value");
            }
            this.mParts.remove(Part.INTERVAL);
        }
    }

    public DateTime getUntil() {
        return (DateTime) this.mParts.get(Part.UNTIL);
    }

    public void setUntil(DateTime dateTime) {
        if (dateTime == null) {
            this.mParts.remove(Part.UNTIL);
            this.mParts.remove(Part.COUNT);
            return;
        }
        if ((dateTime.isFloating() || DateTime.UTC.equals(dateTime.getTimeZone())) && this.mCalendarMetrics.equals(dateTime.getCalendarMetrics())) {
            this.mParts.put((EnumMap<Part, Object>) Part.UNTIL, (Part) dateTime);
        } else {
            this.mParts.put((EnumMap<Part, Object>) Part.UNTIL, (Part) new DateTime(this.mCalendarMetrics, DateTime.UTC, dateTime.getTimestamp()));
        }
        this.mParts.remove(Part.COUNT);
    }

    public Integer getCount() {
        return (Integer) this.mParts.get(Part.COUNT);
    }

    public void setCount(int i) {
        this.mParts.put((EnumMap<Part, Object>) Part.COUNT, (Part) Integer.valueOf(i));
        this.mParts.remove(Part.UNTIL);
    }

    public boolean isInfinite() {
        return (this.mParts.containsKey(Part.UNTIL) || this.mParts.containsKey(Part.COUNT)) ? false : true;
    }

    public boolean hasPart(Part part) {
        return this.mParts.containsKey(part);
    }

    public List<Integer> getByPart(Part part) {
        switch (part) {
            case BYSECOND:
            case BYMINUTE:
            case BYHOUR:
            case BYMONTHDAY:
            case BYYEARDAY:
            case BYWEEKNO:
            case BYMONTH:
            case BYSETPOS:
                return (List) this.mParts.get(part);
            default:
                throw new IllegalArgumentException(part.name() + " is not a list type");
        }
    }

    public void setByPart(Part part, List<Integer> list) throws InvalidRecurrenceRuleException {
        if (list == null || list.size() == 0) {
            this.mParts.remove(part);
            return;
        }
        switch (part) {
            case BYSECOND:
            case BYMINUTE:
            case BYHOUR:
            case BYMONTHDAY:
            case BYYEARDAY:
            case BYWEEKNO:
            case BYMONTH:
            case BYSETPOS:
                validate(part, list);
                this.mParts.put((EnumMap<Part, Object>) part, (Part) list);
                return;
            default:
                throw new IllegalArgumentException(part.name() + " is not a list type");
        }
    }

    public void setByPart(Part part, Integer... numArr) throws InvalidRecurrenceRuleException {
        if (numArr == null || numArr.length == 0) {
            this.mParts.remove(part);
        } else {
            setByPart(part, Arrays.asList(numArr));
        }
    }

    public void setByDayPart(List<WeekdayNum> list) {
        if (list == null || list.size() == 0) {
            this.mParts.remove(Part.BYDAY);
        }
        this.mParts.put((EnumMap<Part, Object>) Part.BYDAY, (Part) list);
    }

    public List<WeekdayNum> getByDayPart() {
        return (List) this.mParts.get(Part.BYDAY);
    }

    public Weekday getWeekStart() {
        Weekday weekday = (Weekday) this.mParts.get(Part.WKST);
        return weekday == null ? Weekday.MO : weekday;
    }

    public void setWeekStart(Weekday weekday) {
        setWeekStart(weekday, false);
    }

    public void setWeekStart(Weekday weekday, boolean z) {
        if (weekday != Weekday.MO || z) {
            this.mParts.put((EnumMap<Part, Object>) Part.WKST, (Part) weekday);
        } else {
            this.mParts.remove(Part.WKST);
        }
    }

    public void setXPart(String str, String str2) {
        if (this.mode == RfcMode.RFC5545_STRICT) {
            throw new UnsupportedOperationException("x-parts are not supported by RFC5545.");
        }
        if ((str2 == null && this.mXParts == null) || str == null || this.mode == RfcMode.RFC5545_LAX) {
            return;
        }
        if (str2 == null) {
            if (this.mXParts.remove(str) == null) {
                this.mXParts.remove(str.toUpperCase(Locale.ENGLISH));
            }
        } else {
            if (str.length() <= 2 || !((str.charAt(0) == 'X' || str.charAt(0) == 'x') && str.charAt(1) == '-')) {
                throw new IllegalArgumentException("invalid x-name: '" + str + "'");
            }
            if (this.mXParts == null) {
                this.mXParts = new HashMap(8);
            }
            this.mXParts.put(str.toUpperCase(Locale.ENGLISH), str2);
        }
    }

    public boolean hasXPart(String str) {
        if (str == null || this.mXParts == null || this.mode == RfcMode.RFC5545_LAX || this.mode == RfcMode.RFC5545_STRICT) {
            return false;
        }
        return this.mXParts.containsKey(str) || this.mXParts.containsKey(str.toUpperCase(Locale.ENGLISH));
    }

    public String getXPart(String str) {
        if (str == null || this.mXParts == null || this.mode == RfcMode.RFC5545_LAX || this.mode == RfcMode.RFC5545_STRICT) {
            return null;
        }
        String str2 = this.mXParts.get(str);
        return str2 != null ? str2 : this.mXParts.get(str.toUpperCase(Locale.ENGLISH));
    }

    public RecurrenceRuleIterator iterator(long j, TimeZone timeZone) {
        DateTime dateTime = new DateTime(this.mCalendarMetrics, timeZone, j);
        DateTime until = getUntil();
        if (until != null && until.isAllDay()) {
            dateTime = dateTime.toAllDay();
        }
        return iterator(dateTime);
    }

    public RecurrenceRuleIterator iterator(DateTime dateTime) {
        RuleIterator ruleIterator;
        DateTime until = getUntil();
        if (until != null) {
            if (until.isAllDay() != dateTime.isAllDay()) {
                throw new IllegalArgumentException("using allday start times with non-allday until values (and vice versa) is not allowed");
            }
            if (until.isFloating() != dateTime.isFloating()) {
                throw new IllegalArgumentException("using floating start times with absolute until values (and vice versa) is not allowed");
            }
        }
        GregorianCalendarMetrics gregorianCalendarMetrics = (CalendarMetrics) this.mParts.get(Part.RSCALE);
        if (gregorianCalendarMetrics == null) {
            gregorianCalendarMetrics = new GregorianCalendarMetrics(getWeekStart(), 4);
        }
        long dateTime2 = !gregorianCalendarMetrics.scaleEquals(dateTime.getCalendarMetrics()) ? new DateTime(gregorianCalendarMetrics, dateTime).getInstance() : dateTime.getInstance();
        FastBirthdayIterator fastBirthdayIterator = FastBirthdayIterator.getInstance(this, gregorianCalendarMetrics, dateTime2);
        TimeZone timeZone = dateTime.isFloating() ? null : dateTime.getTimeZone();
        if (fastBirthdayIterator != null) {
            ruleIterator = hasPart(Part.UNTIL) ? Part.UNTIL.getExpander(this, new SanityFilter(this, fastBirthdayIterator, gregorianCalendarMetrics, dateTime2), gregorianCalendarMetrics, dateTime2, timeZone) : hasPart(Part.COUNT) ? Part.COUNT.getExpander(this, new SanityFilter(this, fastBirthdayIterator, gregorianCalendarMetrics, dateTime2), gregorianCalendarMetrics, dateTime2, timeZone) : new SanityFilter(this, fastBirthdayIterator, gregorianCalendarMetrics, dateTime2);
        } else {
            RuleIterator fastWeeklyIterator = FastWeeklyIterator.getInstance(this, gregorianCalendarMetrics, dateTime2);
            ruleIterator = fastWeeklyIterator;
            if (fastWeeklyIterator == null) {
                this.mParts.put((EnumMap<Part, Object>) Part._SANITY_FILTER, (Part) null);
                for (K k : this.mParts.keySet()) {
                    if (k != Part.INTERVAL && k != Part.WKST && k != Part.RSCALE) {
                        if (k.expands(this)) {
                            RuleIterator expander = k.getExpander(this, ruleIterator, gregorianCalendarMetrics, dateTime2, timeZone);
                            ruleIterator = expander == null ? ruleIterator : expander;
                        } else {
                            ((ByExpander) ruleIterator).addFilter(k.getFilter(this, gregorianCalendarMetrics));
                        }
                    }
                }
            } else if (hasPart(Part.UNTIL)) {
                ruleIterator = Part.UNTIL.getExpander(this, ruleIterator, gregorianCalendarMetrics, dateTime2, timeZone);
            }
        }
        return new RecurrenceRuleIterator(ruleIterator, dateTime, gregorianCalendarMetrics);
    }

    public String toString() {
        Object obj;
        StringBuilder sb = new StringBuilder(160);
        boolean z = true;
        CalendarMetrics calendarMetrics = (CalendarMetrics) this.mParts.get(Part.RSCALE);
        if (calendarMetrics == null) {
            calendarMetrics = DEFAULT_CALENDAR_SCALE;
        }
        for (Part part : Part.values()) {
            if (part != Part._BYMONTHDAYSKIP && part != Part._BYMONTHSKIP && part != Part._SANITY_FILTER && (obj = this.mParts.get(part)) != null) {
                if (z) {
                    z = false;
                } else {
                    sb.append(";");
                }
                sb.append(part.name());
                sb.append("=");
                part.converter.serialize(sb, obj, calendarMetrics);
            }
        }
        if ((this.mode == RfcMode.RFC2445_LAX || this.mode == RfcMode.RFC2445_STRICT) && this.mXParts != null && this.mXParts.size() != 0) {
            for (Map.Entry<String, String> entry : this.mXParts.entrySet()) {
                sb.append(";");
                sb.append(entry.getKey());
                sb.append("=");
                sb.append(entry.getValue());
            }
        }
        return sb.toString();
    }
}
