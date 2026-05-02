package org.dmfs.rfc5545.recur;

import org.dmfs.rfc5545.Instance;
import org.dmfs.rfc5545.calendarmetrics.CalendarMetrics;

/* loaded from: lib-recur-0.9.3.jar:org/dmfs/rfc5545/recur/Freq.class */
public enum Freq {
    YEARLY { // from class: org.dmfs.rfc5545.recur.Freq.1
        @Override // org.dmfs.rfc5545.recur.Freq
        long next(CalendarMetrics calendarMetrics, long j, int i) {
            return Instance.setYear(j, Instance.year(j) + i);
        }

        @Override // org.dmfs.rfc5545.recur.Freq
        long next(CalendarMetrics calendarMetrics, long j, int i, long j2) {
            int year = Instance.year(j2);
            int year2 = Instance.year(j);
            return year <= year2 ? j : Instance.setYear(j, year2 + (((((year - year2) - 1) / i) + 1) * i));
        }
    },
    MONTHLY { // from class: org.dmfs.rfc5545.recur.Freq.2
        @Override // org.dmfs.rfc5545.recur.Freq
        long next(CalendarMetrics calendarMetrics, long j, int i) {
            return i == 1 ? calendarMetrics.nextMonth(j) : calendarMetrics.nextMonth(j, i);
        }
    },
    WEEKLY { // from class: org.dmfs.rfc5545.recur.Freq.3
        @Override // org.dmfs.rfc5545.recur.Freq
        long next(CalendarMetrics calendarMetrics, long j, int i) {
            return calendarMetrics.nextDay(j, i * 7);
        }
    },
    DAILY { // from class: org.dmfs.rfc5545.recur.Freq.4
        @Override // org.dmfs.rfc5545.recur.Freq
        long next(CalendarMetrics calendarMetrics, long j, int i) {
            return i == 1 ? calendarMetrics.nextDay(j) : calendarMetrics.nextDay(j, i);
        }
    },
    HOURLY { // from class: org.dmfs.rfc5545.recur.Freq.5
        @Override // org.dmfs.rfc5545.recur.Freq
        long next(CalendarMetrics calendarMetrics, long j, int i) {
            int hour = Instance.hour(j) + i;
            if (hour > 23) {
                j = DAILY.next(calendarMetrics, j, hour / 24);
                hour %= 24;
            }
            return Instance.setHour(j, hour);
        }
    },
    MINUTELY { // from class: org.dmfs.rfc5545.recur.Freq.6
        @Override // org.dmfs.rfc5545.recur.Freq
        long next(CalendarMetrics calendarMetrics, long j, int i) {
            int minute = Instance.minute(j) + i;
            if (minute > 59) {
                j = HOURLY.next(calendarMetrics, j, minute / 60);
                minute %= 60;
            }
            return Instance.setMinute(j, minute);
        }
    },
    SECONDLY { // from class: org.dmfs.rfc5545.recur.Freq.7
        @Override // org.dmfs.rfc5545.recur.Freq
        long next(CalendarMetrics calendarMetrics, long j, int i) {
            int second = Instance.second(j) + i;
            if (second > 59) {
                j = MINUTELY.next(calendarMetrics, j, second / 60);
                second %= 60;
            }
            return Instance.setSecond(j, second);
        }
    };

    abstract long next(CalendarMetrics calendarMetrics, long j, int i);

    long next(CalendarMetrics calendarMetrics, long j, int i, long j2) {
        long j3 = j;
        while (true) {
            long j4 = j3;
            if (j4 >= j2) {
                return j;
            }
            j = j4;
            j3 = next(calendarMetrics, j, i);
        }
    }
}
