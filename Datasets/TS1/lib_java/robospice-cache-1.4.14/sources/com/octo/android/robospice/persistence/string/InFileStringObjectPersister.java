package com.octo.android.robospice.persistence.string;

import android.app.Application;
import com.octo.android.robospice.persistence.exception.CacheCreationException;
import com.octo.android.robospice.persistence.exception.CacheLoadingException;
import com.octo.android.robospice.persistence.exception.CacheSavingException;
import com.octo.android.robospice.persistence.file.InFileObjectPersister;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import org.apache.commons.io.FileUtils;
import roboguice.util.temp.Ln;

/* loaded from: robospice-cache-1.4.14.jar:com/octo/android/robospice/persistence/string/InFileStringObjectPersister.class */
public class InFileStringObjectPersister extends InFileObjectPersister<String> {
    public InFileStringObjectPersister(Application application) throws CacheCreationException {
        super(application, String.class);
    }

    @Override // com.octo.android.robospice.persistence.ObjectPersister, com.octo.android.robospice.persistence.Persister
    public boolean canHandleClass(Class<?> clazz) {
        return clazz.equals(String.class);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.octo.android.robospice.persistence.file.InFileObjectPersister
    public String readCacheDataFromFile(File file) throws CacheLoadingException {
        try {
            return FileUtils.readFileToString(file, "UTF-8");
        } catch (FileNotFoundException e) {
            Ln.w("file " + file.getAbsolutePath() + " does not exists", e);
            return null;
        } catch (Exception e2) {
            throw new CacheLoadingException(e2);
        }
    }

    @Override // com.octo.android.robospice.persistence.ObjectPersister
    public String saveDataToCacheAndReturnData(final String data, final Object cacheKey) throws CacheSavingException {
        Ln.v("Saving String " + data + " into cacheKey = " + cacheKey, new Object[0]);
        try {
            if (isAsyncSaveEnabled()) {
                Thread t = new Thread() { // from class: com.octo.android.robospice.persistence.string.InFileStringObjectPersister.1
                    @Override // java.lang.Thread, java.lang.Runnable
                    public void run() {
                        try {
                            FileUtils.writeStringToFile(InFileStringObjectPersister.this.getCacheFile(cacheKey), data, "UTF-8");
                        } catch (IOException e) {
                            Ln.e(e, "An error occured on saving request " + cacheKey + " data asynchronously", new Object[0]);
                        }
                    }
                };
                t.start();
            } else {
                FileUtils.writeStringToFile(getCacheFile(cacheKey), data, "UTF-8");
            }
            return data;
        } catch (Exception e) {
            throw new CacheSavingException(e);
        }
    }
}
