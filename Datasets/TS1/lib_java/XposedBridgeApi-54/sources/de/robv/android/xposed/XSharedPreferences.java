package de.robv.android.xposed;

import android.content.SharedPreferences;
import android.os.Environment;
import android.util.Log;
import com.android.internal.util.XmlUtils;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: XposedBridgeApi-54.jar:de/robv/android/xposed/XSharedPreferences.class */
public final class XSharedPreferences implements SharedPreferences {
    private static final String TAG = "ReadOnlySharedPreferences";
    private final File mFile;
    private Map<String, Object> mMap;
    private boolean mLoaded;
    private long mLastModified;
    private long mFileSize;

    public XSharedPreferences(File prefFile) {
        this.mLoaded = false;
        this.mFile = prefFile;
        startLoadFromDisk();
    }

    public XSharedPreferences(String packageName) {
        this(packageName, String.valueOf(packageName) + "_preferences");
    }

    public XSharedPreferences(String packageName, String prefFileName) {
        this.mLoaded = false;
        this.mFile = new File(Environment.getDataDirectory(), "data/" + packageName + "/shared_prefs/" + prefFileName + ".xml");
        startLoadFromDisk();
    }

    public boolean makeWorldReadable() {
        if (!this.mFile.exists()) {
            return false;
        }
        return this.mFile.setReadable(true, false);
    }

    public File getFile() {
        return this.mFile;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v0 */
    /* JADX WARN: Type inference failed for: r0v1, types: [java.lang.Throwable] */
    /* JADX WARN: Type inference failed for: r0v3 */
    /* JADX WARN: Type inference failed for: r0v4, types: [de.robv.android.xposed.XSharedPreferences$1] */
    private void startLoadFromDisk() {
        ?? r0 = this;
        synchronized (r0) {
            this.mLoaded = false;
            r0 = r0;
            new Thread("XSharedPreferences-load") { // from class: de.robv.android.xposed.XSharedPreferences.1
                /* JADX WARN: Multi-variable type inference failed */
                /* JADX WARN: Type inference failed for: r0v1, types: [de.robv.android.xposed.XSharedPreferences] */
                /* JADX WARN: Type inference failed for: r0v2, types: [java.lang.Throwable] */
                /* JADX WARN: Type inference failed for: r0v5 */
                @Override // java.lang.Thread, java.lang.Runnable
                public void run() {
                    ?? r02 = XSharedPreferences.this;
                    synchronized (r02) {
                        XSharedPreferences.this.loadFromDiskLocked();
                        r02 = r02;
                    }
                }
            }.start();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void loadFromDiskLocked() {
        if (this.mLoaded) {
            return;
        }
        Map map = null;
        long lastModified = 0;
        long fileSize = 0;
        if (this.mFile.canRead()) {
            lastModified = this.mFile.lastModified();
            fileSize = this.mFile.length();
            BufferedInputStream str = null;
            try {
                try {
                    str = new BufferedInputStream(new FileInputStream(this.mFile), 16384);
                    map = XmlUtils.readMapXml(str);
                    str.close();
                    if (str != null) {
                        try {
                            str.close();
                        } catch (RuntimeException rethrown) {
                            throw rethrown;
                        } catch (Exception e) {
                        }
                    }
                } catch (Throwable th) {
                    if (str != null) {
                        try {
                            str.close();
                        } catch (RuntimeException rethrown2) {
                            throw rethrown2;
                        } catch (Exception e2) {
                        }
                    }
                    throw th;
                }
            } catch (IOException e3) {
                Log.w(TAG, "getSharedPreferences", e3);
                if (str != null) {
                    try {
                        str.close();
                    } catch (RuntimeException rethrown3) {
                        throw rethrown3;
                    } catch (Exception e4) {
                    }
                }
            } catch (XmlPullParserException e5) {
                Log.w(TAG, "getSharedPreferences", e5);
                if (str != null) {
                    try {
                        str.close();
                    } catch (RuntimeException rethrown4) {
                        throw rethrown4;
                    } catch (Exception e6) {
                    }
                }
            }
        }
        this.mLoaded = true;
        if (map != null) {
            this.mMap = map;
            this.mLastModified = lastModified;
            this.mFileSize = fileSize;
        } else {
            this.mMap = new HashMap();
        }
        notifyAll();
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v0 */
    /* JADX WARN: Type inference failed for: r0v1, types: [java.lang.Throwable] */
    /* JADX WARN: Type inference failed for: r0v4 */
    public void reload() {
        ?? r0 = this;
        synchronized (r0) {
            if (hasFileChanged()) {
                startLoadFromDisk();
            }
            r0 = r0;
        }
    }

    public synchronized boolean hasFileChanged() {
        if (!this.mFile.canRead()) {
            return true;
        }
        long lastModified = this.mFile.lastModified();
        long fileSize = this.mFile.length();
        return (this.mLastModified == lastModified && this.mFileSize == fileSize) ? false : true;
    }

    private void awaitLoadedLocked() {
        while (!this.mLoaded) {
            try {
                wait();
            } catch (InterruptedException e) {
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v0 */
    /* JADX WARN: Type inference failed for: r0v1, types: [java.lang.Throwable] */
    /* JADX WARN: Type inference failed for: r0v3, types: [java.util.HashMap, java.util.Map<java.lang.String, ?>] */
    @Override // android.content.SharedPreferences
    public Map<String, ?> getAll() {
        ?? r0 = this;
        synchronized (r0) {
            awaitLoadedLocked();
            r0 = new HashMap(this.mMap);
        }
        return r0;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v0 */
    /* JADX WARN: Type inference failed for: r0v1, types: [java.lang.Throwable] */
    /* JADX WARN: Type inference failed for: r0v10 */
    /* JADX WARN: Type inference failed for: r0v8 */
    /* JADX WARN: Type inference failed for: r0v9, types: [java.lang.String] */
    @Override // android.content.SharedPreferences
    public String getString(String key, String defValue) {
        ?? r0 = this;
        synchronized (r0) {
            awaitLoadedLocked();
            String v = (String) this.mMap.get(key);
            r0 = v != null ? v : defValue;
        }
        return r0;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v0 */
    /* JADX WARN: Type inference failed for: r0v1, types: [java.lang.Throwable] */
    /* JADX WARN: Type inference failed for: r0v10 */
    /* JADX WARN: Type inference failed for: r0v8 */
    /* JADX WARN: Type inference failed for: r0v9, types: [java.util.Set<java.lang.String>] */
    @Override // android.content.SharedPreferences
    public Set<String> getStringSet(String key, Set<String> defValues) {
        ?? r0 = this;
        synchronized (r0) {
            awaitLoadedLocked();
            Set<String> v = (Set) this.mMap.get(key);
            r0 = v != null ? v : defValues;
        }
        return r0;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v0 */
    /* JADX WARN: Type inference failed for: r0v1, types: [java.lang.Throwable] */
    /* JADX WARN: Type inference failed for: r0v12 */
    /* JADX WARN: Type inference failed for: r0v8 */
    /* JADX WARN: Type inference failed for: r0v9, types: [int] */
    @Override // android.content.SharedPreferences
    public int getInt(String str, int i) {
        ?? r0 = this;
        synchronized (r0) {
            awaitLoadedLocked();
            Integer num = (Integer) this.mMap.get(str);
            r0 = num != null ? num.intValue() : i;
        }
        return r0;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v0 */
    /* JADX WARN: Type inference failed for: r0v1, types: [java.lang.Throwable] */
    /* JADX WARN: Type inference failed for: r0v12 */
    /* JADX WARN: Type inference failed for: r0v8 */
    /* JADX WARN: Type inference failed for: r0v9, types: [long] */
    @Override // android.content.SharedPreferences
    public long getLong(String str, long j) {
        ?? r0 = this;
        synchronized (r0) {
            awaitLoadedLocked();
            Long l = (Long) this.mMap.get(str);
            r0 = l != null ? l.longValue() : j;
        }
        return r0;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v0 */
    /* JADX WARN: Type inference failed for: r0v1, types: [java.lang.Throwable] */
    /* JADX WARN: Type inference failed for: r0v12 */
    /* JADX WARN: Type inference failed for: r0v8 */
    /* JADX WARN: Type inference failed for: r0v9, types: [float] */
    @Override // android.content.SharedPreferences
    public float getFloat(String str, float f) {
        ?? r0 = this;
        synchronized (r0) {
            awaitLoadedLocked();
            Float f2 = (Float) this.mMap.get(str);
            r0 = f2 != null ? f2.floatValue() : f;
        }
        return r0;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v0 */
    /* JADX WARN: Type inference failed for: r0v1, types: [java.lang.Throwable] */
    /* JADX WARN: Type inference failed for: r0v12 */
    /* JADX WARN: Type inference failed for: r0v8 */
    /* JADX WARN: Type inference failed for: r0v9, types: [boolean] */
    @Override // android.content.SharedPreferences
    public boolean getBoolean(String str, boolean z) {
        ?? r0 = this;
        synchronized (r0) {
            awaitLoadedLocked();
            Boolean bool = (Boolean) this.mMap.get(str);
            r0 = bool != null ? bool.booleanValue() : z;
        }
        return r0;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v0 */
    /* JADX WARN: Type inference failed for: r0v1, types: [java.lang.Throwable] */
    /* JADX WARN: Type inference failed for: r0v5, types: [boolean] */
    @Override // android.content.SharedPreferences
    public boolean contains(String key) {
        ?? r0 = this;
        synchronized (r0) {
            awaitLoadedLocked();
            r0 = this.mMap.containsKey(key);
        }
        return r0;
    }

    @Override // android.content.SharedPreferences
    public SharedPreferences.Editor edit() {
        throw new UnsupportedOperationException("read-only implementation");
    }

    @Override // android.content.SharedPreferences
    public void registerOnSharedPreferenceChangeListener(SharedPreferences.OnSharedPreferenceChangeListener listener) {
        throw new UnsupportedOperationException("listeners are not supported in this implementation");
    }

    @Override // android.content.SharedPreferences
    public void unregisterOnSharedPreferenceChangeListener(SharedPreferences.OnSharedPreferenceChangeListener listener) {
        throw new UnsupportedOperationException("listeners are not supported in this implementation");
    }
}
