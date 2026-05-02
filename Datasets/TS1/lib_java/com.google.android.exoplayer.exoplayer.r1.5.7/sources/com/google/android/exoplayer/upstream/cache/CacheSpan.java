package com.google.android.exoplayer.upstream.cache;

import com.google.android.exoplayer.util.Util;
import java.io.File;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/upstream/cache/CacheSpan.class */
public final class CacheSpan implements Comparable<CacheSpan> {
    private static final String SUFFIX = ".v2.exo";
    private static final Pattern CACHE_FILE_PATTERN_V1 = Pattern.compile("^(.+)\\.(\\d+)\\.(\\d+)\\.v1\\.exo$");
    private static final Pattern CACHE_FILE_PATTERN_V2 = Pattern.compile("^(.+)\\.(\\d+)\\.(\\d+)\\.v2\\.exo$");
    public final String key;
    public final long position;
    public final long length;
    public final boolean isCached;
    public final File file;
    public final long lastAccessTimestamp;

    public static File getCacheFileName(File cacheDir, String key, long offset, long lastAccessTimestamp) {
        return new File(cacheDir, Util.escapeFileName(key) + "." + offset + "." + lastAccessTimestamp + SUFFIX);
    }

    public static CacheSpan createLookup(String key, long position) {
        return new CacheSpan(key, position, -1L, false, -1L, null);
    }

    public static CacheSpan createOpenHole(String key, long position) {
        return new CacheSpan(key, position, -1L, false, -1L, null);
    }

    public static CacheSpan createClosedHole(String key, long position, long length) {
        return new CacheSpan(key, position, length, false, -1L, null);
    }

    public static CacheSpan createCacheEntry(File file) {
        String key;
        Matcher matcher = CACHE_FILE_PATTERN_V2.matcher(file.getName());
        if (matcher.matches() && (key = Util.unescapeFileName(matcher.group(1))) != null) {
            return createCacheEntry(key, Long.parseLong(matcher.group(2)), Long.parseLong(matcher.group(3)), file);
        }
        return null;
    }

    static File upgradeIfNeeded(File file) {
        Matcher matcher = CACHE_FILE_PATTERN_V1.matcher(file.getName());
        if (!matcher.matches()) {
            return file;
        }
        String key = matcher.group(1);
        File newCacheFile = getCacheFileName(file.getParentFile(), key, Long.parseLong(matcher.group(2)), Long.parseLong(matcher.group(3)));
        file.renameTo(newCacheFile);
        return newCacheFile;
    }

    private static CacheSpan createCacheEntry(String key, long position, long lastAccessTimestamp, File file) {
        return new CacheSpan(key, position, file.length(), true, lastAccessTimestamp, file);
    }

    CacheSpan(String key, long position, long length, boolean isCached, long lastAccessTimestamp, File file) {
        this.key = key;
        this.position = position;
        this.length = length;
        this.isCached = isCached;
        this.file = file;
        this.lastAccessTimestamp = lastAccessTimestamp;
    }

    public boolean isOpenEnded() {
        return this.length == -1;
    }

    public CacheSpan touch() {
        long now = System.currentTimeMillis();
        File newCacheFile = getCacheFileName(this.file.getParentFile(), this.key, this.position, now);
        this.file.renameTo(newCacheFile);
        return createCacheEntry(this.key, this.position, now, newCacheFile);
    }

    @Override // java.lang.Comparable
    public int compareTo(CacheSpan another) {
        if (!this.key.equals(another.key)) {
            return this.key.compareTo(another.key);
        }
        long startOffsetDiff = this.position - another.position;
        if (startOffsetDiff == 0) {
            return 0;
        }
        return startOffsetDiff < 0 ? -1 : 1;
    }
}
