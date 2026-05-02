package freemarker.template.utility;

import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Locale;
import java.util.TimeZone;

/* loaded from: freemarker-2.3.20.jar:freemarker/template/utility/DateUtil.class */
public class DateUtil {
    public static final int ACCURACY_HOURS = 4;
    public static final int ACCURACY_MINUTES = 5;
    public static final int ACCURACY_SECONDS = 6;
    public static final int ACCURACY_MILLISECONDS = 7;
    public static final TimeZone UTC = TimeZone.getTimeZone("UTC");
    private static final TimeZoneOffsetCalculator TIME_ZONE_OFFSET_CALCULATOR = getTimeZoneOffsetCalculator();

    /* loaded from: freemarker-2.3.20.jar:freemarker/template/utility/DateUtil$DateToISO8601CalendarFactory.class */
    public interface DateToISO8601CalendarFactory {
        GregorianCalendar get(TimeZone timeZone, Date date);
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/template/utility/DateUtil$TimeZoneOffsetCalculator.class */
    interface TimeZoneOffsetCalculator {
        int getOffset(TimeZone timeZone, Date date);
    }

    private static TimeZoneOffsetCalculator getTimeZoneOffsetCalculator() {
        try {
            Class cl = Class.forName("freemarker.template.utility.J2SE14TimeZoneOffsetCalculator");
            return (TimeZoneOffsetCalculator) cl.newInstance();
        } catch (Throwable e) {
            return new TimeZoneOffsetCalculator(e) { // from class: freemarker.template.utility.DateUtil.1
                private final Throwable val$e;

                {
                    this.val$e = e;
                }

                @Override // freemarker.template.utility.DateUtil.TimeZoneOffsetCalculator
                public int getOffset(TimeZone tz, Date date) {
                    throw new RuntimeException(new StringBuffer().append("Failed to create TimeZoneOffsetCalculator. Note that this feature requires at least Java 1.4.\nCause exception: ").append(this.val$e).toString());
                }
            };
        }
    }

    private DateUtil() {
    }

    public static TimeZone getTimeZone(String name) throws UnrecognizedTimeZoneException {
        if (isGMTish(name)) {
            if (name.equalsIgnoreCase("UTC")) {
                return UTC;
            }
            return TimeZone.getTimeZone(name);
        }
        TimeZone tz = TimeZone.getTimeZone(name);
        if (isGMTish(tz.getID())) {
            throw new UnrecognizedTimeZoneException(name);
        }
        return tz;
    }

    private static boolean isGMTish(String name) {
        if (name.length() < 3) {
            return false;
        }
        char c1 = name.charAt(0);
        char c2 = name.charAt(1);
        char c3 = name.charAt(2);
        if (((c1 != 'G' && c1 != 'g') || ((c2 != 'M' && c2 != 'm') || (c3 != 'T' && c3 != 't'))) && ((c1 != 'U' && c1 != 'u') || ((c2 != 'T' && c2 != 't') || (c3 != 'C' && c3 != 'c')))) {
            if (c1 != 'U' && c1 != 'u') {
                return false;
            }
            if ((c2 != 'T' && c2 != 't') || c3 != '1') {
                return false;
            }
        }
        if (name.length() == 3) {
            return true;
        }
        String offset = name.substring(3);
        return offset.startsWith("+") ? offset.equals("+0") || offset.equals("+00") || offset.equals("+00:00") : offset.equals("-0") || offset.equals("-00") || offset.equals("-00:00");
    }

    public static String dateToISO8601String(Date date, boolean datePart, boolean timePart, boolean offsetPart, int accuracy, TimeZone timeZone, DateToISO8601CalendarFactory calendarFactory) {
        int maxLength;
        boolean positive;
        if (!timePart && offsetPart) {
            throw new IllegalArgumentException("ISO 8601:2004 doesn't specify any formats where the offset is shown but the time isn't.");
        }
        if (timeZone == null) {
            timeZone = UTC;
        }
        GregorianCalendar cal = calendarFactory.get(timeZone, date);
        if (!timePart) {
            maxLength = 10;
        } else if (!datePart) {
            maxLength = 18;
        } else {
            maxLength = 29;
        }
        char[] res = new char[maxLength];
        int dstIdx = 0;
        if (datePart) {
            int x = cal.get(1);
            if (x > 0 && cal.get(0) == 0) {
                x = (-x) + 1;
            }
            if (x >= 0 && x < 9999) {
                int dstIdx2 = 0 + 1;
                res[0] = (char) (48 + (x / 1000));
                int dstIdx3 = dstIdx2 + 1;
                res[dstIdx2] = (char) (48 + ((x % 1000) / 100));
                int dstIdx4 = dstIdx3 + 1;
                res[dstIdx3] = (char) (48 + ((x % 100) / 10));
                dstIdx = dstIdx4 + 1;
                res[dstIdx4] = (char) (48 + (x % 10));
            } else {
                String yearString = String.valueOf(x);
                res = new char[(maxLength - 4) + yearString.length()];
                for (int i = 0; i < yearString.length(); i++) {
                    int i2 = dstIdx;
                    dstIdx++;
                    res[i2] = yearString.charAt(i);
                }
            }
            res[dstIdx] = '-';
            int x2 = cal.get(2) + 1;
            int dstIdx5 = append00(res, dstIdx + 1, x2);
            int dstIdx6 = dstIdx5 + 1;
            res[dstIdx5] = '-';
            int x3 = cal.get(5);
            dstIdx = append00(res, dstIdx6, x3);
            if (timePart) {
                dstIdx++;
                res[dstIdx] = 'T';
            }
        }
        if (timePart) {
            int x4 = cal.get(11);
            dstIdx = append00(res, dstIdx, x4);
            if (accuracy >= 5) {
                res[dstIdx] = ':';
                int x5 = cal.get(12);
                dstIdx = append00(res, dstIdx + 1, x5);
                if (accuracy >= 6) {
                    res[dstIdx] = ':';
                    int x6 = cal.get(13);
                    dstIdx = append00(res, dstIdx + 1, x6);
                    if (accuracy >= 7) {
                        int x7 = cal.get(14);
                        if (x7 != 0) {
                            if (x7 > 999) {
                                throw new RuntimeException("Calendar.MILLISECOND > 999");
                            }
                            dstIdx++;
                            res[dstIdx] = '.';
                            do {
                                int i3 = dstIdx;
                                dstIdx++;
                                res[i3] = (char) (48 + (x7 / 100));
                                x7 = (x7 % 100) * 10;
                            } while (x7 != 0);
                        }
                    }
                }
            }
        }
        if (offsetPart) {
            if (timeZone == UTC) {
                int i4 = dstIdx;
                dstIdx++;
                res[i4] = 'Z';
            } else {
                int dt = TIME_ZONE_OFFSET_CALCULATOR.getOffset(timeZone, date);
                if (dt < 0) {
                    positive = false;
                    dt = -dt;
                } else {
                    positive = true;
                }
                int dt2 = dt / 1000;
                int offS = dt2 % 60;
                int dt3 = dt2 / 60;
                int offM = dt3 % 60;
                int dt4 = dt3 / 60;
                if (offS == 0 && offM == 0 && dt4 == 0) {
                    int i5 = dstIdx;
                    dstIdx++;
                    res[i5] = 'Z';
                } else {
                    int i6 = dstIdx;
                    int dstIdx7 = dstIdx + 1;
                    res[i6] = positive ? '+' : '-';
                    int dstIdx8 = append00(res, dstIdx7, dt4);
                    res[dstIdx8] = ':';
                    dstIdx = append00(res, dstIdx8 + 1, offM);
                    if (offS != 0) {
                        res[dstIdx] = ':';
                        dstIdx = append00(res, dstIdx + 1, offS);
                    }
                }
            }
        }
        return new String(res, 0, dstIdx);
    }

    private static int append00(char[] res, int dstIdx, int x) {
        int dstIdx2 = dstIdx + 1;
        res[dstIdx] = (char) (48 + (x / 10));
        int dstIdx3 = dstIdx2 + 1;
        res[dstIdx2] = (char) (48 + (x % 10));
        return dstIdx3;
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/template/utility/DateUtil$TrivialDateToISO8601CalendarFactory.class */
    public static final class TrivialDateToISO8601CalendarFactory implements DateToISO8601CalendarFactory {
        private GregorianCalendar calendar;

        @Override // freemarker.template.utility.DateUtil.DateToISO8601CalendarFactory
        public GregorianCalendar get(TimeZone tz, Date date) {
            if (this.calendar == null) {
                this.calendar = new GregorianCalendar(tz, Locale.US);
            } else {
                this.calendar.setTimeZone(tz);
            }
            this.calendar.setTime(date);
            return this.calendar;
        }
    }
}
