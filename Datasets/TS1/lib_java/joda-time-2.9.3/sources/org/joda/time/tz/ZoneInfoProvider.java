package org.joda.time.tz;

import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.ref.SoftReference;
import java.util.Collections;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;
import java.util.concurrent.ConcurrentHashMap;
import org.joda.time.DateTimeZone;

/* loaded from: joda-time-2.9.3.jar:org/joda/time/tz/ZoneInfoProvider.class */
public class ZoneInfoProvider implements Provider {
    private final File iFileDir;
    private final String iResourcePath;
    private final ClassLoader iLoader;
    private final Map<String, Object> iZoneInfoMap;
    private final Set<String> iZoneInfoKeys;

    public ZoneInfoProvider(File file) throws IOException {
        if (file == null) {
            throw new IllegalArgumentException("No file directory provided");
        }
        if (!file.exists()) {
            throw new IOException("File directory doesn't exist: " + file);
        }
        if (!file.isDirectory()) {
            throw new IOException("File doesn't refer to a directory: " + file);
        }
        this.iFileDir = file;
        this.iResourcePath = null;
        this.iLoader = null;
        this.iZoneInfoMap = loadZoneInfoMap(openResource("ZoneInfoMap"));
        this.iZoneInfoKeys = Collections.unmodifiableSortedSet(new TreeSet(this.iZoneInfoMap.keySet()));
    }

    public ZoneInfoProvider(String str) throws IOException {
        this(str, null, false);
    }

    public ZoneInfoProvider(String str, ClassLoader classLoader) throws IOException {
        this(str, classLoader, true);
    }

    private ZoneInfoProvider(String str, ClassLoader classLoader, boolean z) throws IOException {
        if (str == null) {
            throw new IllegalArgumentException("No resource path provided");
        }
        str = str.endsWith("/") ? str : str + '/';
        this.iFileDir = null;
        this.iResourcePath = str;
        if (classLoader == null && !z) {
            classLoader = getClass().getClassLoader();
        }
        this.iLoader = classLoader;
        this.iZoneInfoMap = loadZoneInfoMap(openResource("ZoneInfoMap"));
        this.iZoneInfoKeys = Collections.unmodifiableSortedSet(new TreeSet(this.iZoneInfoMap.keySet()));
    }

    @Override // org.joda.time.tz.Provider
    public DateTimeZone getZone(String str) {
        Object obj;
        if (str == null || (obj = this.iZoneInfoMap.get(str)) == null) {
            return null;
        }
        if (obj instanceof SoftReference) {
            DateTimeZone dateTimeZone = (DateTimeZone) ((SoftReference) obj).get();
            if (dateTimeZone != null) {
                return dateTimeZone;
            }
            return loadZoneData(str);
        }
        if (str.equals(obj)) {
            return loadZoneData(str);
        }
        return getZone((String) obj);
    }

    @Override // org.joda.time.tz.Provider
    public Set<String> getAvailableIDs() {
        return this.iZoneInfoKeys;
    }

    protected void uncaughtException(Exception exc) {
        exc.printStackTrace();
    }

    private InputStream openResource(String str) throws IOException {
        InputStream systemResourceAsStream;
        if (this.iFileDir != null) {
            systemResourceAsStream = new FileInputStream(new File(this.iFileDir, str));
        } else {
            String concat = this.iResourcePath.concat(str);
            if (this.iLoader != null) {
                systemResourceAsStream = this.iLoader.getResourceAsStream(concat);
            } else {
                systemResourceAsStream = ClassLoader.getSystemResourceAsStream(concat);
            }
            if (systemResourceAsStream == null) {
                throw new IOException(new StringBuilder(40).append("Resource not found: \"").append(concat).append("\" ClassLoader: ").append(this.iLoader != null ? this.iLoader.toString() : "system").toString());
            }
        }
        return systemResourceAsStream;
    }

    private DateTimeZone loadZoneData(String str) {
        InputStream inputStream = null;
        try {
            try {
                inputStream = openResource(str);
                DateTimeZone readFrom = DateTimeZoneBuilder.readFrom(inputStream, str);
                this.iZoneInfoMap.put(str, new SoftReference(readFrom));
                if (inputStream != null) {
                    try {
                        inputStream.close();
                    } catch (IOException e) {
                    }
                }
                return readFrom;
            } catch (IOException e2) {
                uncaughtException(e2);
                this.iZoneInfoMap.remove(str);
                if (inputStream != null) {
                    try {
                        inputStream.close();
                    } catch (IOException e3) {
                        return null;
                    }
                }
                return null;
            }
        } catch (Throwable th) {
            if (inputStream != null) {
                try {
                    inputStream.close();
                } catch (IOException e4) {
                    throw th;
                }
            }
            throw th;
        }
    }

    private static Map<String, Object> loadZoneInfoMap(InputStream inputStream) throws IOException {
        ConcurrentHashMap concurrentHashMap = new ConcurrentHashMap();
        DataInputStream dataInputStream = new DataInputStream(inputStream);
        try {
            readZoneInfoMap(dataInputStream, concurrentHashMap);
            concurrentHashMap.put("UTC", new SoftReference(DateTimeZone.UTC));
            return concurrentHashMap;
        } finally {
            try {
                dataInputStream.close();
            } catch (IOException e) {
            }
        }
    }

    private static void readZoneInfoMap(DataInputStream dataInputStream, Map<String, Object> map) throws IOException {
        int readUnsignedShort = dataInputStream.readUnsignedShort();
        String[] strArr = new String[readUnsignedShort];
        for (int i = 0; i < readUnsignedShort; i++) {
            strArr[i] = dataInputStream.readUTF().intern();
        }
        int readUnsignedShort2 = dataInputStream.readUnsignedShort();
        for (int i2 = 0; i2 < readUnsignedShort2; i2++) {
            try {
                map.put(strArr[dataInputStream.readUnsignedShort()], strArr[dataInputStream.readUnsignedShort()]);
            } catch (ArrayIndexOutOfBoundsException e) {
                throw new IOException("Corrupt zone info map");
            }
        }
    }
}
