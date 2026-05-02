package org.acra.collector;

import java.io.IOException;
import java.io.Reader;

/* loaded from: acra-4.6.2.jar:org/acra/collector/CollectorUtil.class */
public final class CollectorUtil {
    public static void safeClose(Reader reader) {
        if (reader == null) {
            return;
        }
        try {
            reader.close();
        } catch (IOException e) {
        }
    }
}
