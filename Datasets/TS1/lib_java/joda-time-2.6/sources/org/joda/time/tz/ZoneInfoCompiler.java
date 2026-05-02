package org.joda.time.tz;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.StringTokenizer;
import java.util.TreeMap;
import org.joda.time.Chronology;
import org.joda.time.DateTimeField;
import org.joda.time.DateTimeZone;
import org.joda.time.LocalDate;
import org.joda.time.MutableDateTime;
import org.joda.time.chrono.ISOChronology;
import org.joda.time.chrono.LenientChronology;
import org.joda.time.format.DateTimeFormatter;
import org.joda.time.format.ISODateTimeFormat;

/* loaded from: joda-time-2.6.jar:org/joda/time/tz/ZoneInfoCompiler.class */
public class ZoneInfoCompiler {
    static DateTimeOfYear cStartOfYear;
    static Chronology cLenientISO;
    static ThreadLocal<Boolean> cVerbose = new ThreadLocal<Boolean>() { // from class: org.joda.time.tz.ZoneInfoCompiler.1
        /* JADX INFO: Access modifiers changed from: protected */
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // java.lang.ThreadLocal
        public Boolean initialValue() {
            return Boolean.FALSE;
        }
    };
    private Map<String, RuleSet> iRuleSets = new HashMap();
    private List<Zone> iZones = new ArrayList();
    private List<String> iLinks = new ArrayList();

    public static boolean verbose() {
        return cVerbose.get().booleanValue();
    }

    /* JADX WARN: Code restructure failed: missing block: B:19:0x006f, code lost:
    
        if ("-?".equals(r8[r12]) == false) goto L28;
     */
    /* JADX WARN: Code restructure failed: missing block: B:20:0x0072, code lost:
    
        printUsage();
     */
    /* JADX WARN: Code restructure failed: missing block: B:21:0x0075, code lost:
    
        return;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static void main(java.lang.String[] r8) throws java.lang.Exception {
        /*
            Method dump skipped, instructions count: 240
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.joda.time.tz.ZoneInfoCompiler.main(java.lang.String[]):void");
    }

    private static void printUsage() {
        System.out.println("Usage: java org.joda.time.tz.ZoneInfoCompiler <options> <source files>");
        System.out.println("where possible options include:");
        System.out.println("  -src <directory>    Specify where to read source files");
        System.out.println("  -dst <directory>    Specify where to write generated files");
        System.out.println("  -verbose            Output verbosely (default false)");
    }

    static DateTimeOfYear getStartOfYear() {
        if (cStartOfYear == null) {
            cStartOfYear = new DateTimeOfYear();
        }
        return cStartOfYear;
    }

    static Chronology getLenientISOChronology() {
        if (cLenientISO == null) {
            cLenientISO = LenientChronology.getInstance(ISOChronology.getInstanceUTC());
        }
        return cLenientISO;
    }

    static void writeZoneInfoMap(DataOutputStream dataOutputStream, Map<String, DateTimeZone> map) throws IOException {
        HashMap hashMap = new HashMap(map.size());
        TreeMap treeMap = new TreeMap();
        short s = 0;
        for (Map.Entry<String, DateTimeZone> entry : map.entrySet()) {
            String key = entry.getKey();
            if (!hashMap.containsKey(key)) {
                Short valueOf = Short.valueOf(s);
                hashMap.put(key, valueOf);
                treeMap.put(valueOf, key);
                s = (short) (s + 1);
                if (s == 0) {
                    throw new InternalError("Too many time zone ids");
                }
            }
            String id = entry.getValue().getID();
            if (!hashMap.containsKey(id)) {
                Short valueOf2 = Short.valueOf(s);
                hashMap.put(id, valueOf2);
                treeMap.put(valueOf2, id);
                s = (short) (s + 1);
                if (s == 0) {
                    throw new InternalError("Too many time zone ids");
                }
            }
        }
        dataOutputStream.writeShort(treeMap.size());
        Iterator it = treeMap.values().iterator();
        while (it.hasNext()) {
            dataOutputStream.writeUTF((String) it.next());
        }
        dataOutputStream.writeShort(map.size());
        for (Map.Entry<String, DateTimeZone> entry2 : map.entrySet()) {
            dataOutputStream.writeShort(((Short) hashMap.get(entry2.getKey())).shortValue());
            dataOutputStream.writeShort(((Short) hashMap.get(entry2.getValue().getID())).shortValue());
        }
    }

    static int parseYear(String str, int i) {
        String lowerCase = str.toLowerCase();
        if (lowerCase.equals("minimum") || lowerCase.equals("min")) {
            return Integer.MIN_VALUE;
        }
        if (lowerCase.equals("maximum") || lowerCase.equals("max")) {
            return Integer.MAX_VALUE;
        }
        if (lowerCase.equals("only")) {
            return i;
        }
        return Integer.parseInt(lowerCase);
    }

    static int parseMonth(String str) {
        DateTimeField monthOfYear = ISOChronology.getInstanceUTC().monthOfYear();
        return monthOfYear.get(monthOfYear.set(0L, str, Locale.ENGLISH));
    }

    static int parseDayOfWeek(String str) {
        DateTimeField dayOfWeek = ISOChronology.getInstanceUTC().dayOfWeek();
        return dayOfWeek.get(dayOfWeek.set(0L, str, Locale.ENGLISH));
    }

    static String parseOptional(String str) {
        if (str.equals("-")) {
            return null;
        }
        return str;
    }

    static int parseTime(String str) {
        DateTimeFormatter hourMinuteSecondFraction = ISODateTimeFormat.hourMinuteSecondFraction();
        MutableDateTime mutableDateTime = new MutableDateTime(0L, getLenientISOChronology());
        int i = 0;
        if (str.startsWith("-")) {
            i = 1;
        }
        if (hourMinuteSecondFraction.parseInto(mutableDateTime, str, i) == (i ^ (-1))) {
            throw new IllegalArgumentException(str);
        }
        int millis = (int) mutableDateTime.getMillis();
        if (i == 1) {
            millis = -millis;
        }
        return millis;
    }

    static char parseZoneChar(char c) {
        switch (c) {
            case 'G':
            case 'U':
            case 'Z':
            case 'g':
            case 'u':
            case 'z':
                return 'u';
            case 'S':
            case 's':
                return 's';
            case 'W':
            case 'w':
            default:
                return 'w';
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:27:0x0117, code lost:
    
        r11 = org.joda.time.chrono.ISOChronology.getInstanceUTC().year().set(0, 2050);
        r0 = org.joda.time.chrono.ISOChronology.getInstanceUTC().year().set(0, 1850);
        r18 = r0.size();
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x013d, code lost:
    
        r18 = r18 - 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:29:0x0142, code lost:
    
        if (r18 < 0) goto L51;
     */
    /* JADX WARN: Code restructure failed: missing block: B:30:0x0145, code lost:
    
        r0 = r10.previousTransition(r11);
     */
    /* JADX WARN: Code restructure failed: missing block: B:31:0x0150, code lost:
    
        if (r0 == r11) goto L52;
     */
    /* JADX WARN: Code restructure failed: missing block: B:33:0x0158, code lost:
    
        if (r0 >= r0) goto L35;
     */
    /* JADX WARN: Code restructure failed: missing block: B:35:0x015e, code lost:
    
        r11 = r0;
        r0 = ((java.lang.Long) r0.get(r18)).longValue();
     */
    /* JADX WARN: Code restructure failed: missing block: B:36:0x0178, code lost:
    
        if ((r0 - 1) == r11) goto L53;
     */
    /* JADX WARN: Code restructure failed: missing block: B:37:0x017b, code lost:
    
        java.lang.System.out.println("*r* Error in " + r10.getID() + " " + new org.joda.time.DateTime(r11, org.joda.time.chrono.ISOChronology.getInstanceUTC()) + " != " + new org.joda.time.DateTime(r0 - 1, org.joda.time.chrono.ISOChronology.getInstanceUTC()));
     */
    /* JADX WARN: Code restructure failed: missing block: B:38:0x01c1, code lost:
    
        return false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:0x01c5, code lost:
    
        return true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:54:?, code lost:
    
        return true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:55:?, code lost:
    
        return true;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    static boolean test(java.lang.String r9, org.joda.time.DateTimeZone r10) {
        /*
            Method dump skipped, instructions count: 455
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.joda.time.tz.ZoneInfoCompiler.test(java.lang.String, org.joda.time.DateTimeZone):boolean");
    }

    public Map<String, DateTimeZone> compile(File file, File[] fileArr) throws IOException {
        if (fileArr != null) {
            for (File file2 : fileArr) {
                BufferedReader bufferedReader = new BufferedReader(new FileReader(file2));
                parseDataFile(bufferedReader);
                bufferedReader.close();
            }
        }
        if (file != null) {
            if (!file.exists() && !file.mkdirs()) {
                throw new IOException("Destination directory doesn't exist and cannot be created: " + file);
            }
            if (!file.isDirectory()) {
                throw new IOException("Destination is not a directory: " + file);
            }
        }
        TreeMap treeMap = new TreeMap();
        System.out.println("Writing zoneinfo files");
        for (int i = 0; i < this.iZones.size(); i++) {
            Zone zone = this.iZones.get(i);
            DateTimeZoneBuilder dateTimeZoneBuilder = new DateTimeZoneBuilder();
            zone.addToBuilder(dateTimeZoneBuilder, this.iRuleSets);
            DateTimeZone dateTimeZone = dateTimeZoneBuilder.toDateTimeZone(zone.iName, true);
            if (test(dateTimeZone.getID(), dateTimeZone)) {
                treeMap.put(dateTimeZone.getID(), dateTimeZone);
                if (file == null) {
                    continue;
                } else {
                    if (verbose()) {
                        System.out.println("Writing " + dateTimeZone.getID());
                    }
                    File file3 = new File(file, dateTimeZone.getID());
                    if (!file3.getParentFile().exists()) {
                        file3.getParentFile().mkdirs();
                    }
                    FileOutputStream fileOutputStream = new FileOutputStream(file3);
                    try {
                        dateTimeZoneBuilder.writeTo(zone.iName, fileOutputStream);
                        fileOutputStream.close();
                        FileInputStream fileInputStream = new FileInputStream(file3);
                        DateTimeZone readFrom = DateTimeZoneBuilder.readFrom(fileInputStream, dateTimeZone.getID());
                        fileInputStream.close();
                        if (!dateTimeZone.equals(readFrom)) {
                            System.out.println("*e* Error in " + dateTimeZone.getID() + ": Didn't read properly from file");
                        }
                    } catch (Throwable th) {
                        fileOutputStream.close();
                        throw th;
                    }
                }
            }
        }
        for (int i2 = 0; i2 < 2; i2++) {
            for (int i3 = 0; i3 < this.iLinks.size(); i3 += 2) {
                String str = this.iLinks.get(i3);
                String str2 = this.iLinks.get(i3 + 1);
                DateTimeZone dateTimeZone2 = (DateTimeZone) treeMap.get(str);
                if (dateTimeZone2 == null) {
                    if (i2 > 0) {
                        System.out.println("Cannot find time zone '" + str + "' to link alias '" + str2 + "' to");
                    }
                } else {
                    treeMap.put(str2, dateTimeZone2);
                }
            }
        }
        if (file != null) {
            System.out.println("Writing ZoneInfoMap");
            File file4 = new File(file, "ZoneInfoMap");
            if (!file4.getParentFile().exists()) {
                file4.getParentFile().mkdirs();
            }
            DataOutputStream dataOutputStream = new DataOutputStream(new FileOutputStream(file4));
            try {
                TreeMap treeMap2 = new TreeMap(String.CASE_INSENSITIVE_ORDER);
                treeMap2.putAll(treeMap);
                writeZoneInfoMap(dataOutputStream, treeMap2);
                dataOutputStream.close();
            } catch (Throwable th2) {
                dataOutputStream.close();
                throw th2;
            }
        }
        return treeMap;
    }

    public void parseDataFile(BufferedReader bufferedReader) throws IOException {
        Zone zone = null;
        while (true) {
            String readLine = bufferedReader.readLine();
            String str = readLine;
            if (readLine == null) {
                break;
            }
            String trim = str.trim();
            if (trim.length() != 0 && trim.charAt(0) != '#') {
                int indexOf = str.indexOf(35);
                if (indexOf >= 0) {
                    str = str.substring(0, indexOf);
                }
                StringTokenizer stringTokenizer = new StringTokenizer(str, " \t");
                if (Character.isWhitespace(str.charAt(0)) && stringTokenizer.hasMoreTokens()) {
                    if (zone != null) {
                        zone.chain(stringTokenizer);
                    }
                } else {
                    if (zone != null) {
                        this.iZones.add(zone);
                    }
                    zone = null;
                    if (stringTokenizer.hasMoreTokens()) {
                        String nextToken = stringTokenizer.nextToken();
                        if (nextToken.equalsIgnoreCase("Rule")) {
                            Rule rule = new Rule(stringTokenizer);
                            RuleSet ruleSet = this.iRuleSets.get(rule.iName);
                            if (ruleSet == null) {
                                this.iRuleSets.put(rule.iName, new RuleSet(rule));
                            } else {
                                ruleSet.addRule(rule);
                            }
                        } else if (nextToken.equalsIgnoreCase("Zone")) {
                            zone = new Zone(stringTokenizer);
                        } else if (nextToken.equalsIgnoreCase("Link")) {
                            this.iLinks.add(stringTokenizer.nextToken());
                            this.iLinks.add(stringTokenizer.nextToken());
                        } else {
                            System.out.println("Unknown line: " + str);
                        }
                    }
                }
            }
        }
        if (zone != null) {
            this.iZones.add(zone);
        }
    }

    /* loaded from: joda-time-2.6.jar:org/joda/time/tz/ZoneInfoCompiler$DateTimeOfYear.class */
    static class DateTimeOfYear {
        public final int iMonthOfYear;
        public final int iDayOfMonth;
        public final int iDayOfWeek;
        public final boolean iAdvanceDayOfWeek;
        public final int iMillisOfDay;
        public final char iZoneChar;

        DateTimeOfYear() {
            this.iMonthOfYear = 1;
            this.iDayOfMonth = 1;
            this.iDayOfWeek = 0;
            this.iAdvanceDayOfWeek = false;
            this.iMillisOfDay = 0;
            this.iZoneChar = 'w';
        }

        DateTimeOfYear(StringTokenizer stringTokenizer) {
            int i = 1;
            int i2 = 1;
            int i3 = 0;
            int i4 = 0;
            boolean z = false;
            char c = 'w';
            if (stringTokenizer.hasMoreTokens()) {
                i = ZoneInfoCompiler.parseMonth(stringTokenizer.nextToken());
                if (stringTokenizer.hasMoreTokens()) {
                    String nextToken = stringTokenizer.nextToken();
                    if (nextToken.startsWith("last")) {
                        i2 = -1;
                        i3 = ZoneInfoCompiler.parseDayOfWeek(nextToken.substring(4));
                        z = false;
                    } else {
                        try {
                            i2 = Integer.parseInt(nextToken);
                            i3 = 0;
                            z = false;
                        } catch (NumberFormatException e) {
                            int indexOf = nextToken.indexOf(">=");
                            if (indexOf > 0) {
                                i2 = Integer.parseInt(nextToken.substring(indexOf + 2));
                                i3 = ZoneInfoCompiler.parseDayOfWeek(nextToken.substring(0, indexOf));
                                z = true;
                            } else {
                                int indexOf2 = nextToken.indexOf("<=");
                                if (indexOf2 > 0) {
                                    i2 = Integer.parseInt(nextToken.substring(indexOf2 + 2));
                                    i3 = ZoneInfoCompiler.parseDayOfWeek(nextToken.substring(0, indexOf2));
                                    z = false;
                                } else {
                                    throw new IllegalArgumentException(nextToken);
                                }
                            }
                        }
                    }
                    if (stringTokenizer.hasMoreTokens()) {
                        String nextToken2 = stringTokenizer.nextToken();
                        c = ZoneInfoCompiler.parseZoneChar(nextToken2.charAt(nextToken2.length() - 1));
                        if (nextToken2.equals("24:00")) {
                            LocalDate plusMonths = i2 == -1 ? new LocalDate(2001, i, 1).plusMonths(1) : new LocalDate(2001, i, i2).plusDays(1);
                            z = (i2 == -1 || i3 == 0) ? false : true;
                            i = plusMonths.getMonthOfYear();
                            i2 = plusMonths.getDayOfMonth();
                            if (i3 != 0) {
                                i3 = (((i3 - 1) + 1) % 7) + 1;
                            }
                        } else {
                            i4 = ZoneInfoCompiler.parseTime(nextToken2);
                        }
                    }
                }
            }
            this.iMonthOfYear = i;
            this.iDayOfMonth = i2;
            this.iDayOfWeek = i3;
            this.iAdvanceDayOfWeek = z;
            this.iMillisOfDay = i4;
            this.iZoneChar = c;
        }

        public void addRecurring(DateTimeZoneBuilder dateTimeZoneBuilder, String str, int i, int i2, int i3) {
            dateTimeZoneBuilder.addRecurringSavings(str, i, i2, i3, this.iZoneChar, this.iMonthOfYear, this.iDayOfMonth, this.iDayOfWeek, this.iAdvanceDayOfWeek, this.iMillisOfDay);
        }

        public void addCutover(DateTimeZoneBuilder dateTimeZoneBuilder, int i) {
            dateTimeZoneBuilder.addCutover(i, this.iZoneChar, this.iMonthOfYear, this.iDayOfMonth, this.iDayOfWeek, this.iAdvanceDayOfWeek, this.iMillisOfDay);
        }

        public String toString() {
            return "MonthOfYear: " + this.iMonthOfYear + "\nDayOfMonth: " + this.iDayOfMonth + "\nDayOfWeek: " + this.iDayOfWeek + "\nAdvanceDayOfWeek: " + this.iAdvanceDayOfWeek + "\nMillisOfDay: " + this.iMillisOfDay + "\nZoneChar: " + this.iZoneChar + "\n";
        }
    }

    /* loaded from: joda-time-2.6.jar:org/joda/time/tz/ZoneInfoCompiler$Rule.class */
    private static class Rule {
        public final String iName;
        public final int iFromYear;
        public final int iToYear;
        public final String iType;
        public final DateTimeOfYear iDateTimeOfYear;
        public final int iSaveMillis;
        public final String iLetterS;

        Rule(StringTokenizer stringTokenizer) {
            this.iName = stringTokenizer.nextToken().intern();
            this.iFromYear = ZoneInfoCompiler.parseYear(stringTokenizer.nextToken(), 0);
            this.iToYear = ZoneInfoCompiler.parseYear(stringTokenizer.nextToken(), this.iFromYear);
            if (this.iToYear < this.iFromYear) {
                throw new IllegalArgumentException();
            }
            this.iType = ZoneInfoCompiler.parseOptional(stringTokenizer.nextToken());
            this.iDateTimeOfYear = new DateTimeOfYear(stringTokenizer);
            this.iSaveMillis = ZoneInfoCompiler.parseTime(stringTokenizer.nextToken());
            this.iLetterS = ZoneInfoCompiler.parseOptional(stringTokenizer.nextToken());
        }

        public void addRecurring(DateTimeZoneBuilder dateTimeZoneBuilder, String str) {
            this.iDateTimeOfYear.addRecurring(dateTimeZoneBuilder, formatName(str), this.iSaveMillis, this.iFromYear, this.iToYear);
        }

        private String formatName(String str) {
            String str2;
            int indexOf = str.indexOf(47);
            if (indexOf > 0) {
                if (this.iSaveMillis == 0) {
                    return str.substring(0, indexOf).intern();
                }
                return str.substring(indexOf + 1).intern();
            }
            int indexOf2 = str.indexOf("%s");
            if (indexOf2 < 0) {
                return str;
            }
            String substring = str.substring(0, indexOf2);
            String substring2 = str.substring(indexOf2 + 2);
            if (this.iLetterS == null) {
                str2 = substring.concat(substring2);
            } else {
                str2 = substring + this.iLetterS + substring2;
            }
            return str2.intern();
        }

        public String toString() {
            return "[Rule]\nName: " + this.iName + "\nFromYear: " + this.iFromYear + "\nToYear: " + this.iToYear + "\nType: " + this.iType + "\n" + this.iDateTimeOfYear + "SaveMillis: " + this.iSaveMillis + "\nLetterS: " + this.iLetterS + "\n";
        }
    }

    /* loaded from: joda-time-2.6.jar:org/joda/time/tz/ZoneInfoCompiler$RuleSet.class */
    private static class RuleSet {
        private List<Rule> iRules = new ArrayList();

        RuleSet(Rule rule) {
            this.iRules.add(rule);
        }

        void addRule(Rule rule) {
            if (!rule.iName.equals(this.iRules.get(0).iName)) {
                throw new IllegalArgumentException("Rule name mismatch");
            }
            this.iRules.add(rule);
        }

        public void addRecurring(DateTimeZoneBuilder dateTimeZoneBuilder, String str) {
            for (int i = 0; i < this.iRules.size(); i++) {
                this.iRules.get(i).addRecurring(dateTimeZoneBuilder, str);
            }
        }
    }

    /* loaded from: joda-time-2.6.jar:org/joda/time/tz/ZoneInfoCompiler$Zone.class */
    private static class Zone {
        public final String iName;
        public final int iOffsetMillis;
        public final String iRules;
        public final String iFormat;
        public final int iUntilYear;
        public final DateTimeOfYear iUntilDateTimeOfYear;
        private Zone iNext;

        Zone(StringTokenizer stringTokenizer) {
            this(stringTokenizer.nextToken(), stringTokenizer);
        }

        private Zone(String str, StringTokenizer stringTokenizer) {
            this.iName = str.intern();
            this.iOffsetMillis = ZoneInfoCompiler.parseTime(stringTokenizer.nextToken());
            this.iRules = ZoneInfoCompiler.parseOptional(stringTokenizer.nextToken());
            this.iFormat = stringTokenizer.nextToken().intern();
            int i = Integer.MAX_VALUE;
            DateTimeOfYear startOfYear = ZoneInfoCompiler.getStartOfYear();
            if (stringTokenizer.hasMoreTokens()) {
                i = Integer.parseInt(stringTokenizer.nextToken());
                if (stringTokenizer.hasMoreTokens()) {
                    startOfYear = new DateTimeOfYear(stringTokenizer);
                }
            }
            this.iUntilYear = i;
            this.iUntilDateTimeOfYear = startOfYear;
        }

        void chain(StringTokenizer stringTokenizer) {
            if (this.iNext != null) {
                this.iNext.chain(stringTokenizer);
            } else {
                this.iNext = new Zone(this.iName, stringTokenizer);
            }
        }

        public void addToBuilder(DateTimeZoneBuilder dateTimeZoneBuilder, Map<String, RuleSet> map) {
            addToBuilder(this, dateTimeZoneBuilder, map);
        }

        private static void addToBuilder(Zone zone, DateTimeZoneBuilder dateTimeZoneBuilder, Map<String, RuleSet> map) {
            while (zone != null) {
                dateTimeZoneBuilder.setStandardOffset(zone.iOffsetMillis);
                if (zone.iRules == null) {
                    dateTimeZoneBuilder.setFixedSavings(zone.iFormat, 0);
                } else {
                    try {
                        dateTimeZoneBuilder.setFixedSavings(zone.iFormat, ZoneInfoCompiler.parseTime(zone.iRules));
                    } catch (Exception e) {
                        RuleSet ruleSet = map.get(zone.iRules);
                        if (ruleSet == null) {
                            throw new IllegalArgumentException("Rules not found: " + zone.iRules);
                        }
                        ruleSet.addRecurring(dateTimeZoneBuilder, zone.iFormat);
                    }
                }
                if (zone.iUntilYear != Integer.MAX_VALUE) {
                    zone.iUntilDateTimeOfYear.addCutover(dateTimeZoneBuilder, zone.iUntilYear);
                    zone = zone.iNext;
                } else {
                    return;
                }
            }
        }

        public String toString() {
            String str = "[Zone]\nName: " + this.iName + "\nOffsetMillis: " + this.iOffsetMillis + "\nRules: " + this.iRules + "\nFormat: " + this.iFormat + "\nUntilYear: " + this.iUntilYear + "\n" + this.iUntilDateTimeOfYear;
            if (this.iNext == null) {
                return str;
            }
            return str + "...\n" + this.iNext.toString();
        }
    }
}
