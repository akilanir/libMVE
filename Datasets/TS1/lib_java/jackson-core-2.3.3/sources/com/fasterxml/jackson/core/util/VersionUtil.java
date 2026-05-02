package com.fasterxml.jackson.core.util;

import com.fasterxml.jackson.core.Version;
import com.fasterxml.jackson.core.Versioned;
import java.io.BufferedReader;
import java.io.Closeable;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.io.UnsupportedEncodingException;
import java.util.Properties;
import java.util.regex.Pattern;

/* loaded from: jackson-core-2.3.3.jar:com/fasterxml/jackson/core/util/VersionUtil.class */
public class VersionUtil {
    private static final Pattern VERSION_SEPARATOR = Pattern.compile("[-_./;:]");
    private final Version _version;

    protected VersionUtil() {
        Version version = null;
        try {
            version = versionFor(getClass());
        } catch (Exception e) {
            System.err.println("ERROR: Failed to load Version information from " + getClass());
        }
        this._version = version == null ? Version.unknownVersion() : version;
    }

    public Version version() {
        return this._version;
    }

    public static Version versionFor(Class<?> cls) {
        Version packageVersionFor = packageVersionFor(cls);
        if (packageVersionFor != null) {
            return packageVersionFor;
        }
        InputStream resourceAsStream = cls.getResourceAsStream("VERSION.txt");
        if (resourceAsStream == null) {
            return Version.unknownVersion();
        }
        try {
            try {
                Version doReadVersion = doReadVersion(new InputStreamReader(resourceAsStream, "UTF-8"));
                _close(resourceAsStream);
                return doReadVersion;
            } catch (UnsupportedEncodingException e) {
                Version unknownVersion = Version.unknownVersion();
                _close(resourceAsStream);
                return unknownVersion;
            }
        } catch (Throwable th) {
            _close(resourceAsStream);
            throw th;
        }
    }

    public static Version packageVersionFor(Class<?> cls) {
        try {
            Class<?> cls2 = Class.forName(cls.getPackage().getName() + ".PackageVersion", true, cls.getClassLoader());
            try {
                return ((Versioned) cls2.newInstance()).version();
            } catch (Exception e) {
                throw new IllegalArgumentException("Failed to get Versioned out of " + cls2);
            }
        } catch (Exception e2) {
            return null;
        }
    }

    private static Version doReadVersion(Reader reader) {
        String str = null;
        String str2 = null;
        String str3 = null;
        BufferedReader bufferedReader = new BufferedReader(reader);
        try {
            str = bufferedReader.readLine();
            if (str != null) {
                str2 = bufferedReader.readLine();
                if (str2 != null) {
                    str3 = bufferedReader.readLine();
                }
            }
            _close(bufferedReader);
        } catch (IOException e) {
            _close(bufferedReader);
        } catch (Throwable th) {
            _close(bufferedReader);
            throw th;
        }
        if (str2 != null) {
            str2 = str2.trim();
        }
        if (str3 != null) {
            str3 = str3.trim();
        }
        return parseVersion(str, str2, str3);
    }

    public static Version mavenVersionFor(ClassLoader classLoader, String str, String str2) {
        InputStream resourceAsStream = classLoader.getResourceAsStream("META-INF/maven/" + str.replaceAll("\\.", "/") + "/" + str2 + "/pom.properties");
        if (resourceAsStream != null) {
            try {
                Properties properties = new Properties();
                properties.load(resourceAsStream);
                Version parseVersion = parseVersion(properties.getProperty("version"), properties.getProperty("groupId"), properties.getProperty("artifactId"));
                _close(resourceAsStream);
                return parseVersion;
            } catch (IOException e) {
                _close(resourceAsStream);
            } catch (Throwable th) {
                _close(resourceAsStream);
                throw th;
            }
        }
        return Version.unknownVersion();
    }

    public static Version parseVersion(String str, String str2, String str3) {
        if (str == null) {
            return null;
        }
        String trim = str.trim();
        if (trim.length() > 0) {
            String[] split = VERSION_SEPARATOR.split(trim);
            return new Version(parseVersionPart(split[0]), split.length > 1 ? parseVersionPart(split[1]) : 0, split.length > 2 ? parseVersionPart(split[2]) : 0, split.length > 3 ? split[3] : null, str2, str3);
        }
        return null;
    }

    protected static int parseVersionPart(String str) {
        char charAt;
        int i = 0;
        int length = str.length();
        for (int i2 = 0; i2 < length && (charAt = str.charAt(i2)) <= '9' && charAt >= '0'; i2++) {
            i = (i * 10) + (charAt - '0');
        }
        return i;
    }

    private static final void _close(Closeable closeable) {
        try {
            closeable.close();
        } catch (IOException e) {
        }
    }

    public static final void throwInternal() {
        throw new RuntimeException("Internal error: this code path should never get executed");
    }
}
