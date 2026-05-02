package ch.qos.logback.core.util;

import java.io.FileNotFoundException;
import java.net.MalformedURLException;
import java.net.URL;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/util/LocationUtil.class */
public class LocationUtil {
    public static final String SCHEME_PATTERN = "^\\p{Alpha}[\\p{Alnum}+.-]*:.*$";
    public static final String CLASSPATH_SCHEME = "classpath:";

    public static URL urlForResource(String str) throws MalformedURLException, FileNotFoundException {
        URL url;
        if (str == null) {
            throw new NullPointerException("location is required");
        }
        if (!str.matches(SCHEME_PATTERN)) {
            url = Loader.getResourceBySelfClassLoader(str);
        } else if (str.startsWith(CLASSPATH_SCHEME)) {
            String substring = str.substring(CLASSPATH_SCHEME.length());
            if (substring.startsWith("/")) {
                substring = substring.substring(1);
            }
            if (substring.length() == 0) {
                throw new MalformedURLException("path is required");
            }
            url = Loader.getResourceBySelfClassLoader(substring);
        } else {
            url = new URL(str);
        }
        if (url == null) {
            throw new FileNotFoundException(str);
        }
        return url;
    }
}
