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

/* loaded from: jackson-core-2.5.1.jar:com/fasterxml/jackson/core/util/VersionUtil.class */
public class VersionUtil {
    private static final Pattern V_SEP = Pattern.compile("[-_./;:]");
    private final Version _v;

    protected VersionUtil() {
        Version v = null;
        try {
            v = versionFor(getClass());
        } catch (Exception e) {
            System.err.println("ERROR: Failed to load Version information from " + getClass());
        }
        this._v = v == null ? Version.unknownVersion() : v;
    }

    public Version version() {
        return this._v;
    }

    public static Version versionFor(Class<?> cls) {
        Version packageVersion = packageVersionFor(cls);
        if (packageVersion != null) {
            return packageVersion;
        }
        InputStream in = cls.getResourceAsStream("VERSION.txt");
        if (in == null) {
            return Version.unknownVersion();
        }
        try {
            try {
                InputStreamReader reader = new InputStreamReader(in, "UTF-8");
                Version doReadVersion = doReadVersion(reader);
                _close(in);
                return doReadVersion;
            } catch (UnsupportedEncodingException e) {
                Version unknownVersion = Version.unknownVersion();
                _close(in);
                return unknownVersion;
            }
        } catch (Throwable th) {
            _close(in);
            throw th;
        }
    }

    public static Version packageVersionFor(Class<?> cls) {
        try {
            String versionInfoClassName = cls.getPackage().getName() + ".PackageVersion";
            Class<?> vClass = Class.forName(versionInfoClassName, true, cls.getClassLoader());
            try {
                return ((Versioned) vClass.newInstance()).version();
            } catch (Exception e) {
                throw new IllegalArgumentException("Failed to get Versioned out of " + vClass);
            }
        } catch (Exception e2) {
            return null;
        }
    }

    private static Version doReadVersion(Reader r) {
        String version = null;
        String group = null;
        String artifact = null;
        BufferedReader br = new BufferedReader(r);
        try {
            version = br.readLine();
            if (version != null) {
                group = br.readLine();
                if (group != null) {
                    artifact = br.readLine();
                }
            }
            _close(br);
        } catch (IOException e) {
            _close(br);
        } catch (Throwable th) {
            _close(br);
            throw th;
        }
        if (group != null) {
            group = group.trim();
        }
        if (artifact != null) {
            artifact = artifact.trim();
        }
        return parseVersion(version, group, artifact);
    }

    public static Version mavenVersionFor(ClassLoader cl, String groupId, String artifactId) {
        InputStream pomProperties = cl.getResourceAsStream("META-INF/maven/" + groupId.replaceAll("\\.", "/") + "/" + artifactId + "/pom.properties");
        if (pomProperties != null) {
            try {
                Properties props = new Properties();
                props.load(pomProperties);
                String versionStr = props.getProperty("version");
                String pomPropertiesArtifactId = props.getProperty("artifactId");
                String pomPropertiesGroupId = props.getProperty("groupId");
                Version parseVersion = parseVersion(versionStr, pomPropertiesGroupId, pomPropertiesArtifactId);
                _close(pomProperties);
                return parseVersion;
            } catch (IOException e) {
                _close(pomProperties);
            } catch (Throwable th) {
                _close(pomProperties);
                throw th;
            }
        }
        return Version.unknownVersion();
    }

    public static Version parseVersion(String s, String groupId, String artifactId) {
        if (s == null) {
            return null;
        }
        String s2 = s.trim();
        if (s2.length() > 0) {
            String[] parts = V_SEP.split(s2);
            return new Version(parseVersionPart(parts[0]), parts.length > 1 ? parseVersionPart(parts[1]) : 0, parts.length > 2 ? parseVersionPart(parts[2]) : 0, parts.length > 3 ? parts[3] : null, groupId, artifactId);
        }
        return null;
    }

    protected static int parseVersionPart(String s) {
        char c;
        int number = 0;
        int len = s.length();
        for (int i = 0; i < len && (c = s.charAt(i)) <= '9' && c >= '0'; i++) {
            number = (number * 10) + (c - '0');
        }
        return number;
    }

    private static final void _close(Closeable c) {
        try {
            c.close();
        } catch (IOException e) {
        }
    }

    public static final void throwInternal() {
        throw new RuntimeException("Internal error: this code path should never get executed");
    }
}
