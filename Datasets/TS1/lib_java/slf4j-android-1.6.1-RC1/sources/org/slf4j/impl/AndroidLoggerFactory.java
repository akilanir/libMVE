package org.slf4j.impl;

import android.util.Log;
import java.util.HashMap;
import java.util.Map;
import java.util.StringTokenizer;
import org.slf4j.ILoggerFactory;

/* loaded from: slf4j-android-1.6.1-RC1.jar:org/slf4j/impl/AndroidLoggerFactory.class */
public class AndroidLoggerFactory implements ILoggerFactory {
    private final Map<String, AndroidLogger> loggerMap = new HashMap();
    static final int TAG_MAX_LENGTH = 23;

    @Override // org.slf4j.ILoggerFactory
    public AndroidLogger getLogger(String name) {
        AndroidLogger slogger;
        String actualName = forceValidName(name);
        synchronized (this) {
            slogger = this.loggerMap.get(actualName);
            if (slogger == null) {
                if (!actualName.equals(name)) {
                    Log.i(AndroidLoggerFactory.class.getSimpleName(), "Logger name '" + name + "' exceeds maximum length of " + TAG_MAX_LENGTH + " characters, using '" + actualName + "' instead.");
                }
                slogger = new AndroidLogger(actualName);
                this.loggerMap.put(actualName, slogger);
            }
        }
        return slogger;
    }

    private final String forceValidName(String name) {
        if (name != null && name.length() > TAG_MAX_LENGTH) {
            StringTokenizer st = new StringTokenizer(name, ".");
            if (st.hasMoreTokens()) {
                StringBuilder sb = new StringBuilder();
                do {
                    String token = st.nextToken();
                    if (token.length() == 1) {
                        sb.append(token);
                        sb.append('.');
                    } else if (st.hasMoreTokens()) {
                        sb.append(token.charAt(0));
                        sb.append("*.");
                    } else {
                        sb.append(token);
                    }
                } while (st.hasMoreTokens());
                name = sb.toString();
            }
            if (name.length() > TAG_MAX_LENGTH) {
                name = name.substring(0, 22) + '*';
            }
        }
        return name;
    }
}
