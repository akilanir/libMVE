package org.joda.time.tz;

import java.util.Set;
import org.joda.time.DateTimeZone;

/* loaded from: joda-time-2.9.1.jar:org/joda/time/tz/Provider.class */
public interface Provider {
    DateTimeZone getZone(String str);

    Set<String> getAvailableIDs();
}
