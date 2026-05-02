package com.octo.android.robospice.persistence.binary;

import android.app.Application;
import com.octo.android.robospice.persistence.exception.CacheCreationException;
import com.octo.android.robospice.persistence.exception.CacheSavingException;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import org.apache.commons.io.IOUtils;

/* loaded from: robospice-cache-1.4.14.jar:com/octo/android/robospice/persistence/binary/InFileBigInputStreamObjectPersister.class */
public final class InFileBigInputStreamObjectPersister extends InFileInputStreamObjectPersister {
    public InFileBigInputStreamObjectPersister(Application application) throws CacheCreationException {
        super(application);
    }

    public InFileBigInputStreamObjectPersister(Application application, File cacheFolder) throws CacheCreationException {
        super(application, cacheFolder);
    }

    @Override // com.octo.android.robospice.persistence.binary.InFileInputStreamObjectPersister, com.octo.android.robospice.persistence.ObjectPersister
    public InputStream saveDataToCacheAndReturnData(InputStream data, Object cacheKey) throws CacheSavingException {
        FileOutputStream output = null;
        try {
            try {
                output = new FileOutputStream(getCacheFile(cacheKey));
                IOUtils.copy(data, output);
                FileInputStream fileInputStream = new FileInputStream(getCacheFile(cacheKey));
                IOUtils.closeQuietly(output);
                return fileInputStream;
            } catch (IOException e) {
                throw new CacheSavingException(e);
            }
        } catch (Throwable th) {
            IOUtils.closeQuietly(output);
            throw th;
        }
    }

    @Override // com.octo.android.robospice.persistence.ObjectPersister
    public void setAsyncSaveEnabled(boolean isAsyncSaveEnabled) {
        if (isAsyncSaveEnabled) {
            throw new IllegalStateException("Asynchronous saving operation not supported.");
        }
    }
}
