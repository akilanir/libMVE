package com.octo.android.robospice.persistence.binary;

import android.app.Application;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import com.octo.android.robospice.persistence.exception.CacheCreationException;
import com.octo.android.robospice.persistence.exception.CacheLoadingException;
import com.octo.android.robospice.persistence.exception.CacheSavingException;
import com.octo.android.robospice.persistence.file.InFileObjectPersister;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import org.apache.commons.io.IOUtils;

/* loaded from: robospice-cache-1.4.14.jar:com/octo/android/robospice/persistence/binary/InFileBitmapObjectPersister.class */
public class InFileBitmapObjectPersister extends InFileObjectPersister<Bitmap> {
    private static final int DEFAULT_QUALITY = 100;
    private Bitmap.CompressFormat compressFormat;
    private BitmapFactory.Options decodingOptions;
    private int quality;

    public InFileBitmapObjectPersister(Application application) throws CacheCreationException {
        super(application, Bitmap.class);
        this.compressFormat = Bitmap.CompressFormat.PNG;
        this.decodingOptions = null;
        this.quality = DEFAULT_QUALITY;
    }

    public InFileBitmapObjectPersister(Application application, File cacheFolder) throws CacheCreationException {
        super(application, Bitmap.class, cacheFolder);
        this.compressFormat = Bitmap.CompressFormat.PNG;
        this.decodingOptions = null;
        this.quality = DEFAULT_QUALITY;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.octo.android.robospice.persistence.file.InFileObjectPersister
    public Bitmap readCacheDataFromFile(File file) throws CacheLoadingException {
        CacheLoadingException cacheLoadingException;
        FileInputStream is = null;
        try {
            try {
                is = new FileInputStream(file.getAbsolutePath());
                Bitmap data = BitmapFactory.decodeStream(is, null, this.decodingOptions);
                if (is != null) {
                    IOUtils.closeQuietly(is);
                }
                if (data == null) {
                    throw new CacheLoadingException(String.format("Found the file %s but could not decode bitmap.", file.getAbsolutePath()));
                }
                return data;
            } finally {
            }
        } catch (Throwable th) {
            if (is != null) {
                IOUtils.closeQuietly(is);
            }
            throw th;
        }
    }

    @Override // com.octo.android.robospice.persistence.ObjectPersister
    public Bitmap saveDataToCacheAndReturnData(Bitmap data, Object cacheKey) throws CacheSavingException {
        BufferedOutputStream out = null;
        try {
            try {
                File cacheFile = getCacheFile(cacheKey);
                out = new BufferedOutputStream(new FileOutputStream(cacheFile));
                boolean didCompress = data.compress(this.compressFormat, this.quality, out);
                if (!didCompress) {
                    throw new CacheSavingException(String.format("Could not compress bitmap for path: %s", getCacheFile(cacheKey).getAbsolutePath()));
                }
                IOUtils.closeQuietly(out);
                return data;
            } catch (IOException e) {
                throw new CacheSavingException(e);
            }
        } catch (Throwable th) {
            IOUtils.closeQuietly(out);
            throw th;
        }
    }

    public BitmapFactory.Options getDecodingOptions() {
        return this.decodingOptions;
    }

    public void setDecodingOptions(BitmapFactory.Options decodingOptions) {
        this.decodingOptions = decodingOptions;
    }

    public Bitmap.CompressFormat getCompressFormat() {
        return this.compressFormat;
    }

    public void setCompressFormat(Bitmap.CompressFormat compressFormat) {
        this.compressFormat = compressFormat;
    }

    public int getQuality() {
        return this.quality;
    }

    public void setQuality(int quality) {
        this.quality = quality;
    }
}
