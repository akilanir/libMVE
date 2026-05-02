package ch.qos.logback.core.rolling.helper;

import ch.qos.logback.core.CoreConstants;
import ch.qos.logback.core.net.SyslogConstants;
import ch.qos.logback.core.spi.ContextAwareBase;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Locale;
import java.util.TimeZone;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/rolling/helper/RollingCalendar.class */
public class RollingCalendar extends GregorianCalendar {
    private static final long serialVersionUID = -5937537740925066161L;
    static final TimeZone GMT_TIMEZONE = TimeZone.getTimeZone("GMT");
    PeriodicityType periodicityType;

    /* renamed from: ch.qos.logback.core.rolling.helper.RollingCalendar$1, reason: invalid class name */
    /* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/rolling/helper/RollingCalendar$1.class */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$ch$qos$logback$core$rolling$helper$PeriodicityType = new int[PeriodicityType.values().length];

        static {
            try {
                $SwitchMap$ch$qos$logback$core$rolling$helper$PeriodicityType[PeriodicityType.TOP_OF_MILLISECOND.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$ch$qos$logback$core$rolling$helper$PeriodicityType[PeriodicityType.TOP_OF_SECOND.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$ch$qos$logback$core$rolling$helper$PeriodicityType[PeriodicityType.TOP_OF_MINUTE.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$ch$qos$logback$core$rolling$helper$PeriodicityType[PeriodicityType.TOP_OF_HOUR.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                $SwitchMap$ch$qos$logback$core$rolling$helper$PeriodicityType[PeriodicityType.HALF_DAY.ordinal()] = 5;
            } catch (NoSuchFieldError e5) {
            }
            try {
                $SwitchMap$ch$qos$logback$core$rolling$helper$PeriodicityType[PeriodicityType.TOP_OF_DAY.ordinal()] = 6;
            } catch (NoSuchFieldError e6) {
            }
            try {
                $SwitchMap$ch$qos$logback$core$rolling$helper$PeriodicityType[PeriodicityType.TOP_OF_WEEK.ordinal()] = 7;
            } catch (NoSuchFieldError e7) {
            }
            try {
                $SwitchMap$ch$qos$logback$core$rolling$helper$PeriodicityType[PeriodicityType.TOP_OF_MONTH.ordinal()] = 8;
            } catch (NoSuchFieldError e8) {
            }
        }
    }

    public RollingCalendar() {
        this.periodicityType = PeriodicityType.ERRONEOUS;
    }

    public RollingCalendar(TimeZone timeZone, Locale locale) {
        super(timeZone, locale);
        this.periodicityType = PeriodicityType.ERRONEOUS;
    }

    public void init(String str) {
        this.periodicityType = computePeriodicityType(str);
    }

    private void setPeriodicityType(PeriodicityType periodicityType) {
        this.periodicityType = periodicityType;
    }

    public PeriodicityType getPeriodicityType() {
        return this.periodicityType;
    }

    public long getNextTriggeringMillis(Date date) {
        return getNextTriggeringDate(date).getTime();
    }

    public PeriodicityType computePeriodicityType(String str) {
        RollingCalendar rollingCalendar = new RollingCalendar(GMT_TIMEZONE, Locale.getDefault());
        Date date = new Date(0L);
        if (str != null) {
            for (PeriodicityType periodicityType : PeriodicityType.VALID_ORDERED_LIST) {
                SimpleDateFormat simpleDateFormat = new SimpleDateFormat(str);
                simpleDateFormat.setTimeZone(GMT_TIMEZONE);
                String format = simpleDateFormat.format(date);
                rollingCalendar.setPeriodicityType(periodicityType);
                String format2 = simpleDateFormat.format(new Date(rollingCalendar.getNextTriggeringMillis(date)));
                if (format != null && format2 != null && !format.equals(format2)) {
                    return periodicityType;
                }
            }
        }
        return PeriodicityType.ERRONEOUS;
    }

    public void printPeriodicity(ContextAwareBase contextAwareBase) {
        switch (AnonymousClass1.$SwitchMap$ch$qos$logback$core$rolling$helper$PeriodicityType[this.periodicityType.ordinal()]) {
            case 1:
                contextAwareBase.addInfo("Roll-over every millisecond.");
                break;
            case 2:
                contextAwareBase.addInfo("Roll-over every second.");
                break;
            case SyslogConstants.ERROR_SEVERITY /* 3 */:
                contextAwareBase.addInfo("Roll-over every minute.");
                break;
            case 4:
                contextAwareBase.addInfo("Roll-over at the top of every hour.");
                break;
            case SyslogConstants.NOTICE_SEVERITY /* 5 */:
                contextAwareBase.addInfo("Roll-over at midday and midnight.");
                break;
            case SyslogConstants.INFO_SEVERITY /* 6 */:
                contextAwareBase.addInfo("Roll-over at midnight.");
                break;
            case SyslogConstants.DEBUG_SEVERITY /* 7 */:
                contextAwareBase.addInfo("Rollover at the start of week.");
                break;
            case SyslogConstants.LOG_USER /* 8 */:
                contextAwareBase.addInfo("Rollover at start of every month.");
                break;
            default:
                contextAwareBase.addInfo("Unknown periodicity.");
                break;
        }
    }

    public long periodsElapsed(long j, long j2) {
        if (j > j2) {
            throw new IllegalArgumentException("Start cannot come before end");
        }
        long j3 = j2 - j;
        switch (AnonymousClass1.$SwitchMap$ch$qos$logback$core$rolling$helper$PeriodicityType[this.periodicityType.ordinal()]) {
            case 1:
                return j3;
            case 2:
                return j3 / 1000;
            case SyslogConstants.ERROR_SEVERITY /* 3 */:
                return j3 / 60000;
            case 4:
                return ((int) j3) / CoreConstants.MILLIS_IN_ONE_HOUR;
            case SyslogConstants.NOTICE_SEVERITY /* 5 */:
            default:
                throw new IllegalStateException("Unknown periodicity type.");
            case SyslogConstants.INFO_SEVERITY /* 6 */:
                return j3 / 86400000;
            case SyslogConstants.DEBUG_SEVERITY /* 7 */:
                return j3 / 604800000;
            case SyslogConstants.LOG_USER /* 8 */:
                return diffInMonths(j, j2);
        }
    }

    public static int diffInMonths(long j, long j2) {
        if (j > j2) {
            throw new IllegalArgumentException("startTime cannot be larger than endTime");
        }
        Calendar calendar = Calendar.getInstance();
        calendar.setTimeInMillis(j);
        Calendar calendar2 = Calendar.getInstance();
        calendar2.setTimeInMillis(j2);
        int i = calendar2.get(1) - calendar.get(1);
        return (i * 12) + (calendar2.get(2) - calendar.get(2));
    }

    public Date getRelativeDate(Date date, int i) {
        setTime(date);
        switch (AnonymousClass1.$SwitchMap$ch$qos$logback$core$rolling$helper$PeriodicityType[this.periodicityType.ordinal()]) {
            case 1:
                add(14, i);
                break;
            case 2:
                set(14, 0);
                add(13, i);
                break;
            case SyslogConstants.ERROR_SEVERITY /* 3 */:
                set(13, 0);
                set(14, 0);
                add(12, i);
                break;
            case 4:
                set(12, 0);
                set(13, 0);
                set(14, 0);
                add(11, i);
                break;
            case SyslogConstants.NOTICE_SEVERITY /* 5 */:
            default:
                throw new IllegalStateException("Unknown periodicity type.");
            case SyslogConstants.INFO_SEVERITY /* 6 */:
                set(11, 0);
                set(12, 0);
                set(13, 0);
                set(14, 0);
                add(5, i);
                break;
            case SyslogConstants.DEBUG_SEVERITY /* 7 */:
                set(7, getFirstDayOfWeek());
                set(11, 0);
                set(12, 0);
                set(13, 0);
                set(14, 0);
                add(3, i);
                break;
            case SyslogConstants.LOG_USER /* 8 */:
                set(5, 1);
                set(11, 0);
                set(12, 0);
                set(13, 0);
                set(14, 0);
                add(2, i);
                break;
        }
        return getTime();
    }

    public Date getNextTriggeringDate(Date date) {
        return getRelativeDate(date, 1);
    }
}
