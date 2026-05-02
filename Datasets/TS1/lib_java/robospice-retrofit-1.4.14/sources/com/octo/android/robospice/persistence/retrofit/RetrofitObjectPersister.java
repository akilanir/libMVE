package com.octo.android.robospice.persistence.retrofit;

import android.app.Application;
import com.octo.android.robospice.persistence.exception.CacheCreationException;
import com.octo.android.robospice.persistence.exception.CacheLoadingException;
import com.octo.android.robospice.persistence.exception.CacheSavingException;
import com.octo.android.robospice.persistence.file.InFileObjectPersister;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import org.apache.commons.io.IOUtils;
import retrofit.converter.Converter;
import retrofit.mime.TypedInput;
import retrofit.mime.TypedOutput;
import roboguice.util.temp.Ln;

/* loaded from: robospice-retrofit-1.4.14.jar:com/octo/android/robospice/persistence/retrofit/RetrofitObjectPersister.class */
public class RetrofitObjectPersister<T> extends InFileObjectPersister<T> {
    private final Converter converter;

    public RetrofitObjectPersister(Application application, Converter converter, Class<T> clazz, File cacheFolder) throws CacheCreationException {
        super(application, clazz, cacheFolder);
        this.converter = converter;
    }

    public RetrofitObjectPersister(Application application, Converter converter, Class<T> clazz) throws CacheCreationException {
        this(application, converter, clazz, null);
    }

    public T saveDataToCacheAndReturnData(final T data, final Object cacheKey) throws CacheSavingException {
        try {
            if (isAsyncSaveEnabled()) {
                Thread t = new Thread() { // from class: com.octo.android.robospice.persistence.retrofit.RetrofitObjectPersister.1
                    @Override // java.lang.Thread, java.lang.Runnable
                    public void run() {
                        try {
                            RetrofitObjectPersister.this.saveData(data, cacheKey);
                        } catch (CacheSavingException e) {
                            Ln.e(e, "An error occured on saving request " + cacheKey + " data asynchronously", new Object[0]);
                        } catch (IOException e2) {
                            Ln.e(e2, "An error occured on saving request " + cacheKey + " data asynchronously", new Object[0]);
                        }
                    }
                };
                t.start();
            } else {
                saveData(data, cacheKey);
            }
            return data;
        } catch (Exception e) {
            throw new CacheSavingException(e);
        } catch (CacheSavingException e2) {
            throw e2;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void saveData(T data, Object cacheKey) throws IOException, CacheSavingException {
        TypedOutput typedBytes = this.converter.toBody(data);
        FileOutputStream out = null;
        try {
            out = new FileOutputStream(getCacheFile(cacheKey));
            typedBytes.writeTo(out);
            if (out != null) {
                out.close();
            }
        } catch (Throwable th) {
            if (out != null) {
                out.close();
            }
            throw th;
        }
    }

    protected T readCacheDataFromFile(File file) throws CacheLoadingException {
        FileInputStream fileInputStream = null;
        try {
            try {
                fileInputStream = new FileInputStream(file);
                final byte[] byteArray = IOUtils.toByteArray(fileInputStream);
                T t = (T) this.converter.fromBody(new TypedInput() { // from class: com.octo.android.robospice.persistence.retrofit.RetrofitObjectPersister.2
                    public String mimeType() {
                        return "application/json";
                    }

                    public long length() {
                        return byteArray.length;
                    }

                    public InputStream in() throws IOException {
                        return new ByteArrayInputStream(byteArray);
                    }
                }, getHandledClass());
                IOUtils.closeQuietly(fileInputStream);
                return t;
            } catch (FileNotFoundException e) {
                Ln.w("file " + file.getAbsolutePath() + " does not exists", new Object[]{e});
                IOUtils.closeQuietly(fileInputStream);
                return null;
            } catch (Exception e2) {
                throw new CacheLoadingException(e2);
            }
        } catch (Throwable th) {
            IOUtils.closeQuietly(fileInputStream);
            throw th;
        }
    }
}
