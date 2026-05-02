package org.joda.time.tz;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import org.joda.time.DateTimeUtils;

/* loaded from: joda-time-2.9.1.jar:org/joda/time/tz/DefaultNameProvider.class */
public class DefaultNameProvider implements NameProvider {
    private HashMap<Locale, Map<String, Map<String, Object>>> iByLocaleCache = createCache();
    private HashMap<Locale, Map<String, Map<Boolean, Object>>> iByLocaleCache2 = createCache();

    @Override // org.joda.time.tz.NameProvider
    public String getShortName(Locale locale, String str, String str2) {
        String[] nameSet = getNameSet(locale, str, str2);
        if (nameSet == null) {
            return null;
        }
        return nameSet[0];
    }

    @Override // org.joda.time.tz.NameProvider
    public String getName(Locale locale, String str, String str2) {
        String[] nameSet = getNameSet(locale, str, str2);
        if (nameSet == null) {
            return null;
        }
        return nameSet[1];
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v13, types: [java.util.Map] */
    /* JADX WARN: Type inference failed for: r0v9, types: [java.util.Map] */
    private synchronized String[] getNameSet(Locale locale, String str, String str2) {
        if (locale == null || str == null || str2 == null) {
            return null;
        }
        HashMap hashMap = (Map) this.iByLocaleCache.get(locale);
        if (hashMap == null) {
            HashMap<Locale, Map<String, Map<String, Object>>> hashMap2 = this.iByLocaleCache;
            HashMap createCache = createCache();
            hashMap = createCache;
            hashMap2.put(locale, createCache);
        }
        HashMap hashMap3 = (Map) hashMap.get(str);
        if (hashMap3 == null) {
            HashMap createCache2 = createCache();
            hashMap3 = createCache2;
            hashMap.put(str, createCache2);
            String[][] zoneStrings = DateTimeUtils.getDateFormatSymbols(Locale.ENGLISH).getZoneStrings();
            String[] strArr = null;
            int length = zoneStrings.length;
            int i = 0;
            while (true) {
                if (i < length) {
                    String[] strArr2 = zoneStrings[i];
                    if (strArr2 == null || strArr2.length < 5 || !str.equals(strArr2[0])) {
                        i++;
                    } else {
                        strArr = strArr2;
                        break;
                    }
                } else {
                    break;
                }
            }
            String[][] zoneStrings2 = DateTimeUtils.getDateFormatSymbols(locale).getZoneStrings();
            String[] strArr3 = null;
            int length2 = zoneStrings2.length;
            int i2 = 0;
            while (true) {
                if (i2 < length2) {
                    String[] strArr4 = zoneStrings2[i2];
                    if (strArr4 == null || strArr4.length < 5 || !str.equals(strArr4[0])) {
                        i2++;
                    } else {
                        strArr3 = strArr4;
                        break;
                    }
                } else {
                    break;
                }
            }
            if (strArr != null && strArr3 != null) {
                hashMap3.put(strArr[2], new String[]{strArr3[2], strArr3[1]});
                if (strArr[2].equals(strArr[4])) {
                    hashMap3.put(strArr[4] + "-Summer", new String[]{strArr3[4], strArr3[3]});
                } else {
                    hashMap3.put(strArr[4], new String[]{strArr3[4], strArr3[3]});
                }
            }
        }
        return (String[]) hashMap3.get(str2);
    }

    public String getShortName(Locale locale, String str, String str2, boolean z) {
        String[] nameSet = getNameSet(locale, str, str2, z);
        if (nameSet == null) {
            return null;
        }
        return nameSet[0];
    }

    public String getName(Locale locale, String str, String str2, boolean z) {
        String[] nameSet = getNameSet(locale, str, str2, z);
        if (nameSet == null) {
            return null;
        }
        return nameSet[1];
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v11, types: [java.util.Map] */
    /* JADX WARN: Type inference failed for: r0v15, types: [java.util.Map] */
    private synchronized String[] getNameSet(Locale locale, String str, String str2, boolean z) {
        if (locale == null || str == null || str2 == null) {
            return null;
        }
        if (str.startsWith("Etc/")) {
            str = str.substring(4);
        }
        HashMap hashMap = (Map) this.iByLocaleCache2.get(locale);
        if (hashMap == null) {
            HashMap<Locale, Map<String, Map<Boolean, Object>>> hashMap2 = this.iByLocaleCache2;
            HashMap createCache = createCache();
            hashMap = createCache;
            hashMap2.put(locale, createCache);
        }
        HashMap hashMap3 = (Map) hashMap.get(str);
        if (hashMap3 == null) {
            HashMap createCache2 = createCache();
            hashMap3 = createCache2;
            hashMap.put(str, createCache2);
            String[][] zoneStrings = DateTimeUtils.getDateFormatSymbols(Locale.ENGLISH).getZoneStrings();
            String[] strArr = null;
            int length = zoneStrings.length;
            int i = 0;
            while (true) {
                if (i < length) {
                    String[] strArr2 = zoneStrings[i];
                    if (strArr2 == null || strArr2.length < 5 || !str.equals(strArr2[0])) {
                        i++;
                    } else {
                        strArr = strArr2;
                        break;
                    }
                } else {
                    break;
                }
            }
            String[][] zoneStrings2 = DateTimeUtils.getDateFormatSymbols(locale).getZoneStrings();
            String[] strArr3 = null;
            int length2 = zoneStrings2.length;
            int i2 = 0;
            while (true) {
                if (i2 < length2) {
                    String[] strArr4 = zoneStrings2[i2];
                    if (strArr4 == null || strArr4.length < 5 || !str.equals(strArr4[0])) {
                        i2++;
                    } else {
                        strArr3 = strArr4;
                        break;
                    }
                } else {
                    break;
                }
            }
            if (strArr != null && strArr3 != null) {
                hashMap3.put(Boolean.TRUE, new String[]{strArr3[2], strArr3[1]});
                hashMap3.put(Boolean.FALSE, new String[]{strArr3[4], strArr3[3]});
            }
        }
        return (String[]) hashMap3.get(Boolean.valueOf(z));
    }

    private HashMap createCache() {
        return new HashMap(7);
    }
}
