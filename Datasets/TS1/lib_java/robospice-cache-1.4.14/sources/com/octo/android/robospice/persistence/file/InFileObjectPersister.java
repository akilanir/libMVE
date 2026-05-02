package com.octo.android.robospice.persistence.file;

import android.app.Application;
import com.octo.android.robospice.persistence.ObjectPersister;
import com.octo.android.robospice.persistence.exception.CacheCreationException;
import com.octo.android.robospice.persistence.exception.CacheLoadingException;
import com.octo.android.robospice.persistence.exception.KeySanitationExcepion;
import com.octo.android.robospice.persistence.keysanitation.KeySanitizer;
import java.io.File;
import java.io.FileFilter;
import java.io.FilenameFilter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import roboguice.util.temp.Ln;

/* loaded from: robospice-cache-1.4.14.jar:com/octo/android/robospice/persistence/file/InFileObjectPersister.class */
public abstract class InFileObjectPersister<T> extends ObjectPersister<T> {
    static final String CACHE_PREFIX_END = "_";
    static final String DEFAULT_ROOT_CACHE_DIR = "robospice-cache";
    private KeySanitizer keySanitizer;
    private File cacheFolder;
    private String factoryCachePrefix;

    protected abstract T readCacheDataFromFile(File file) throws CacheLoadingException;

    public InFileObjectPersister(Application application, Class<T> clazz) throws CacheCreationException {
        super(application, clazz);
        this.factoryCachePrefix = "";
        setCacheFolder(null);
    }

    public InFileObjectPersister(Application application, Class<T> clazz, File cacheFolder) throws CacheCreationException {
        super(application, clazz);
        this.factoryCachePrefix = "";
        setCacheFolder(cacheFolder);
    }

    public void setCacheFolder(File cacheFolder) throws CacheCreationException {
        if (cacheFolder == null) {
            cacheFolder = new File(getApplication().getCacheDir(), DEFAULT_ROOT_CACHE_DIR);
        }
        synchronized (cacheFolder.getAbsolutePath().intern()) {
            if (!cacheFolder.exists() && !cacheFolder.mkdirs()) {
                throw new CacheCreationException("The cache folder " + cacheFolder.getAbsolutePath() + " could not be created.");
            }
        }
        this.cacheFolder = cacheFolder;
    }

    public final File getCacheFolder() {
        return this.cacheFolder;
    }

    @Override // com.octo.android.robospice.persistence.ObjectPersister
    public long getCreationDateInCache(Object cacheKey) throws CacheLoadingException {
        File cacheFile = getCacheFile(cacheKey);
        if (cacheFile.exists()) {
            return cacheFile.lastModified();
        }
        throw new CacheLoadingException("Data could not be found in cache for cacheKey=" + cacheKey);
    }

    @Override // com.octo.android.robospice.persistence.ObjectPersister
    public List<Object> getAllCacheKeys() {
        final String prefix = getCachePrefix();
        int prefixLength = prefix.length();
        String[] cacheFileNameList = getCacheFolder().list(new FilenameFilter() { // from class: com.octo.android.robospice.persistence.file.InFileObjectPersister.1
            @Override // java.io.FilenameFilter
            public boolean accept(File dir, String filename) {
                return filename.startsWith(prefix);
            }
        });
        if (cacheFileNameList == null) {
            return Collections.emptyList();
        }
        List<Object> result = new ArrayList<>(cacheFileNameList.length);
        for (String cacheFileName : cacheFileNameList) {
            String cacheKey = cacheFileName.substring(prefixLength);
            result.add(fromKey(cacheKey));
        }
        return result;
    }

    @Override // com.octo.android.robospice.persistence.ObjectPersister
    public List<T> loadAllDataFromCache() throws CacheLoadingException {
        List<Object> allCacheKeys = getAllCacheKeys();
        List<T> result = new ArrayList<>(allCacheKeys.size());
        for (Object key : allCacheKeys) {
            result.add(loadDataFromCache(key, 0L));
        }
        return result;
    }

    @Override // com.octo.android.robospice.persistence.ObjectPersister
    public boolean removeDataFromCache(Object cacheKey) {
        return getCacheFile(cacheKey).delete();
    }

    @Override // com.octo.android.robospice.persistence.ObjectPersister, com.octo.android.robospice.persistence.CacheCleaner
    public void removeAllDataFromCache() {
        File cacheFolder = getCacheFolder();
        File[] cacheFileList = cacheFolder.listFiles(new FileFilter() { // from class: com.octo.android.robospice.persistence.file.InFileObjectPersister.2
            @Override // java.io.FileFilter
            public boolean accept(File file) {
                return file.getName().startsWith(InFileObjectPersister.this.getCachePrefix());
            }
        });
        boolean allDeleted = true;
        for (File cacheFile : cacheFileList) {
            allDeleted = cacheFile.delete() && allDeleted;
        }
        if (allDeleted || cacheFileList.length == 0) {
            Ln.d("Some file could not be deleted from cache.", new Object[0]);
        }
    }

    @Override // com.octo.android.robospice.persistence.ObjectPersister
    public T loadDataFromCache(Object cacheKey, long maxTimeInCache) throws CacheLoadingException {
        File file = getCacheFile(cacheKey);
        if (isCachedAndNotExpired(file, maxTimeInCache)) {
            return readCacheDataFromFile(file);
        }
        return null;
    }

    @Override // com.octo.android.robospice.persistence.ObjectPersister
    public boolean isDataInCache(Object cacheKey, long maxTimeInCacheBeforeExpiry) {
        File file = getCacheFile(cacheKey);
        return isCachedAndNotExpired(file, maxTimeInCacheBeforeExpiry);
    }

    public boolean isUsingKeySanitizer() {
        return this.keySanitizer != null;
    }

    public void setKeySanitizer(KeySanitizer keySanitizer) {
        this.keySanitizer = keySanitizer;
    }

    public KeySanitizer getKeySanitizer() {
        return this.keySanitizer;
    }

    public final File getCacheFile(Object cacheKey) {
        return new File(getCacheFolder(), getCachePrefix() + toKey(cacheKey.toString()));
    }

    void setFactoryCachePrefix(String factoryCachePrefix) {
        this.factoryCachePrefix = factoryCachePrefix;
    }

    protected final String toKey(String cacheKey) {
        if (isUsingKeySanitizer()) {
            try {
                return (String) this.keySanitizer.sanitizeKey(cacheKey);
            } catch (KeySanitationExcepion e) {
                Ln.e(e, "Key could not be sanitized, falling back on original key.", new Object[0]);
                return cacheKey;
            }
        }
        return cacheKey;
    }

    protected final String fromKey(String cacheKey) {
        if (isUsingKeySanitizer()) {
            try {
                return (String) this.keySanitizer.desanitizeKey(cacheKey);
            } catch (KeySanitationExcepion e) {
                Ln.e(e, "Key could not be desanitized, falling back on original key.", new Object[0]);
                return cacheKey;
            }
        }
        return cacheKey;
    }

    protected final String getCachePrefix() {
        return this.factoryCachePrefix + getClass().getSimpleName() + CACHE_PREFIX_END + getHandledClass().getSimpleName() + CACHE_PREFIX_END;
    }

    protected boolean isCachedAndNotExpired(Object cacheKey, long maxTimeInCacheBeforeExpiry) {
        File cacheFile = getCacheFile(cacheKey);
        return isCachedAndNotExpired(cacheFile, maxTimeInCacheBeforeExpiry);
    }

    protected boolean isCachedAndNotExpired(File cacheFile, long maxTimeInCacheBeforeExpiry) {
        if (cacheFile.exists()) {
            long timeInCache = System.currentTimeMillis() - cacheFile.lastModified();
            if (maxTimeInCacheBeforeExpiry == 0 || timeInCache <= maxTimeInCacheBeforeExpiry) {
                return true;
            }
            return false;
        }
        return false;
    }
}
