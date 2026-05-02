package com.octo.android.robospice.persistence.file;

import android.app.Application;
import com.octo.android.robospice.persistence.CacheCleaner;
import com.octo.android.robospice.persistence.ObjectPersisterFactory;
import com.octo.android.robospice.persistence.exception.CacheCreationException;
import com.octo.android.robospice.persistence.keysanitation.KeySanitizer;
import java.io.File;
import java.io.FileFilter;
import java.util.List;
import roboguice.util.temp.Ln;

/* loaded from: robospice-cache-1.4.14.jar:com/octo/android/robospice/persistence/file/InFileObjectPersisterFactory.class */
public abstract class InFileObjectPersisterFactory extends ObjectPersisterFactory implements CacheCleaner {
    private File cacheFolder;
    private String cachePrefix;
    private KeySanitizer keySanitizer;

    public abstract <T> InFileObjectPersister<T> createInFileObjectPersister(Class<T> cls, File file) throws CacheCreationException;

    public InFileObjectPersisterFactory(Application application) throws CacheCreationException {
        this(application, null, null);
    }

    public InFileObjectPersisterFactory(Application application, File cacheFolder) throws CacheCreationException {
        this(application, null, cacheFolder);
    }

    public InFileObjectPersisterFactory(Application application, List<Class<?>> listHandledClasses) throws CacheCreationException {
        this(application, listHandledClasses, null);
    }

    public InFileObjectPersisterFactory(Application application, List<Class<?>> listHandledClasses, File cacheFolder) throws CacheCreationException {
        super(application, listHandledClasses);
        setCacheFolder(cacheFolder);
        setCachePrefix(getClass().getSimpleName() + "_");
    }

    public void setCacheFolder(File cacheFolder) throws CacheCreationException {
        if (cacheFolder == null) {
            cacheFolder = new File(getApplication().getCacheDir(), "robospice-cache");
        }
        this.cacheFolder = cacheFolder;
        if (!cacheFolder.exists() && !cacheFolder.mkdirs()) {
            throw new CacheCreationException("The cache folder " + cacheFolder.getAbsolutePath() + " could not be created.");
        }
    }

    public void setCachePrefix(String cachePrefix) {
        this.cachePrefix = cachePrefix;
    }

    public File getCacheFolder() {
        return this.cacheFolder;
    }

    public String getCachePrefix() {
        return this.cachePrefix;
    }

    public KeySanitizer getKeySanitizer() {
        return this.keySanitizer;
    }

    public void setKeySanitizer(KeySanitizer keySanitizer) {
        this.keySanitizer = keySanitizer;
    }

    @Override // com.octo.android.robospice.persistence.ObjectPersisterFactory
    public final <T> InFileObjectPersister<T> createObjectPersister(Class<T> clazz) {
        try {
            InFileObjectPersister<T> inFileObjectPersister = createInFileObjectPersister(clazz, this.cacheFolder);
            inFileObjectPersister.setFactoryCachePrefix(this.cachePrefix);
            inFileObjectPersister.setKeySanitizer(this.keySanitizer);
            return inFileObjectPersister;
        } catch (CacheCreationException e) {
            throw new RuntimeException("Could not create cache folder of factory.", e);
        }
    }

    @Override // com.octo.android.robospice.persistence.CacheCleaner
    public void removeAllDataFromCache() {
        File cacheFolder = getCacheFolder();
        File[] cacheFileList = cacheFolder.listFiles(new FileFilter() { // from class: com.octo.android.robospice.persistence.file.InFileObjectPersisterFactory.1
            @Override // java.io.FileFilter
            public boolean accept(File file) {
                return file.getName().startsWith(InFileObjectPersisterFactory.this.getCachePrefix());
            }
        });
        boolean allDeleted = true;
        if (cacheFileList == null || cacheFileList.length == 0) {
            return;
        }
        for (File cacheFile : cacheFileList) {
            allDeleted = cacheFile.delete() && allDeleted;
        }
        if (allDeleted || cacheFileList.length == 0) {
            Ln.d("Some file could not be deleted from cache.", new Object[0]);
        }
    }
}
