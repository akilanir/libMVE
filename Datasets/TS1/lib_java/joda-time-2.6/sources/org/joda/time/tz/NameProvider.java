package org.joda.time.tz;

import java.util.Locale;

/* loaded from: joda-time-2.6.jar:org/joda/time/tz/NameProvider.class */
public interface NameProvider {
    String getShortName(Locale locale, String str, String str2);

    String getName(Locale locale, String str, String str2);
}
