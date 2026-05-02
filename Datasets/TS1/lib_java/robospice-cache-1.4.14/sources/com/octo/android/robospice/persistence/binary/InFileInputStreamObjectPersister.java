package com.octo.android.robospice.persistence.binary;

import android.app.Application;
import com.octo.android.robospice.persistence.exception.CacheCreationException;
import com.octo.android.robospice.persistence.exception.CacheLoadingException;
import com.octo.android.robospice.persistence.exception.CacheSavingException;
import com.octo.android.robospice.persistence.file.InFileObjectPersister;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import roboguice.util.temp.Ln;

/* loaded from: robospice-cache-1.4.14.jar:com/octo/android/robospice/persistence/binary/InFileInputStreamObjectPersister.class */
public class InFileInputStreamObjectPersister extends InFileObjectPersister<InputStream> {
    public InFileInputStreamObjectPersister(Application application) throws CacheCreationException {
        super(application, InputStream.class);
    }

    public InFileInputStreamObjectPersister(Application application, File cacheFolder) throws CacheCreationException {
        super(application, InputStream.class, cacheFolder);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.octo.android.robospice.persistence.file.InFileObjectPersister
    public InputStream readCacheDataFromFile(File file) throws CacheLoadingException {
        try {
            return new FileInputStream(file);
        } catch (FileNotFoundException e) {
            Ln.w("file " + file.getAbsolutePath() + " does not exists", e);
            return null;
        }
    }

    @Override // com.octo.android.robospice.persistence.ObjectPersister
    public InputStream saveDataToCacheAndReturnData(InputStream data, final Object cacheKey) throws CacheSavingException {
        try {
            final byte[] byteArray = IOUtils.toByteArray(data);
            if (isAsyncSaveEnabled()) {
                Thread t = new Thread() { // from class: com.octo.android.robospice.persistence.binary.InFileInputStreamObjectPersister.1
                    @Override // java.lang.Thread, java.lang.Runnable
                    public void run() {
                        try {
                            FileUtils.writeByteArrayToFile(InFileInputStreamObjectPersister.this.getCacheFile(cacheKey), byteArray);
                        } catch (IOException e) {
                            Ln.e(e, "An error occured on saving request " + cacheKey + " data asynchronously", new Object[0]);
                        }
                    }
                };
                t.start();
            } else {
                FileUtils.writeByteArrayToFile(getCacheFile(cacheKey), byteArray);
            }
            return new ByteArrayInputStream(byteArray);
        } catch (IOException e) {
            throw new CacheSavingException(e);
        }
    }

    @Override // com.octo.android.robospice.persistence.ObjectPersister, com.octo.android.robospice.persistence.Persister
    public boolean canHandleClass(Class<?> clazz) {
        try {
            clazz.asSubclass(InputStream.class);
            return true;
        } catch (ClassCastException e) {
            return false;
        }
    }
}
