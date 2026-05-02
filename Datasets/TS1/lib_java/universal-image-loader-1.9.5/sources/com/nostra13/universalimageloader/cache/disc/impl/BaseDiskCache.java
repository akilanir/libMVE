package com.nostra13.universalimageloader.cache.disc.impl;

import android.graphics.Bitmap;
import com.nostra13.universalimageloader.cache.disc.DiskCache;
import com.nostra13.universalimageloader.cache.disc.naming.FileNameGenerator;
import com.nostra13.universalimageloader.core.DefaultConfigurationFactory;
import com.nostra13.universalimageloader.utils.IoUtils;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

/* loaded from: universal-image-loader-1.9.5.jar:com/nostra13/universalimageloader/cache/disc/impl/BaseDiskCache.class */
public abstract class BaseDiskCache implements DiskCache {
    public static final int DEFAULT_BUFFER_SIZE = 32768;
    public static final Bitmap.CompressFormat DEFAULT_COMPRESS_FORMAT = Bitmap.CompressFormat.PNG;
    public static final int DEFAULT_COMPRESS_QUALITY = 100;
    private static final String ERROR_ARG_NULL = " argument must be not null";
    private static final String TEMP_IMAGE_POSTFIX = ".tmp";
    protected final File cacheDir;
    protected final File reserveCacheDir;
    protected final FileNameGenerator fileNameGenerator;
    protected int bufferSize;
    protected Bitmap.CompressFormat compressFormat;
    protected int compressQuality;

    public BaseDiskCache(File cacheDir) {
        this(cacheDir, null);
    }

    public BaseDiskCache(File cacheDir, File reserveCacheDir) {
        this(cacheDir, reserveCacheDir, DefaultConfigurationFactory.createFileNameGenerator());
    }

    public BaseDiskCache(File cacheDir, File reserveCacheDir, FileNameGenerator fileNameGenerator) {
        this.bufferSize = 32768;
        this.compressFormat = DEFAULT_COMPRESS_FORMAT;
        this.compressQuality = 100;
        if (cacheDir == null) {
            throw new IllegalArgumentException("cacheDir argument must be not null");
        }
        if (fileNameGenerator == null) {
            throw new IllegalArgumentException("fileNameGenerator argument must be not null");
        }
        this.cacheDir = cacheDir;
        this.reserveCacheDir = reserveCacheDir;
        this.fileNameGenerator = fileNameGenerator;
    }

    @Override // com.nostra13.universalimageloader.cache.disc.DiskCache
    public File getDirectory() {
        return this.cacheDir;
    }

    @Override // com.nostra13.universalimageloader.cache.disc.DiskCache
    public File get(String imageUri) {
        return getFile(imageUri);
    }

    @Override // com.nostra13.universalimageloader.cache.disc.DiskCache
    public boolean save(String imageUri, InputStream imageStream, IoUtils.CopyListener listener) throws IOException {
        File imageFile = getFile(imageUri);
        File tmpFile = new File(imageFile.getAbsolutePath() + TEMP_IMAGE_POSTFIX);
        boolean loaded = false;
        try {
            OutputStream os = new BufferedOutputStream(new FileOutputStream(tmpFile), this.bufferSize);
            try {
                loaded = IoUtils.copyStream(imageStream, os, listener, this.bufferSize);
                IoUtils.closeSilently(os);
                if (loaded && !tmpFile.renameTo(imageFile)) {
                    loaded = false;
                }
                if (!loaded) {
                    tmpFile.delete();
                }
                return loaded;
            } catch (Throwable th) {
                IoUtils.closeSilently(os);
                throw th;
            }
        } catch (Throwable th2) {
            if (loaded && !tmpFile.renameTo(imageFile)) {
                loaded = false;
            }
            if (!loaded) {
                tmpFile.delete();
            }
            throw th2;
        }
    }

    @Override // com.nostra13.universalimageloader.cache.disc.DiskCache
    public boolean save(String imageUri, Bitmap bitmap) throws IOException {
        File imageFile = getFile(imageUri);
        File tmpFile = new File(imageFile.getAbsolutePath() + TEMP_IMAGE_POSTFIX);
        OutputStream os = new BufferedOutputStream(new FileOutputStream(tmpFile), this.bufferSize);
        boolean savedSuccessfully = false;
        try {
            savedSuccessfully = bitmap.compress(this.compressFormat, this.compressQuality, os);
            IoUtils.closeSilently(os);
            if (savedSuccessfully && !tmpFile.renameTo(imageFile)) {
                savedSuccessfully = false;
            }
            if (!savedSuccessfully) {
                tmpFile.delete();
            }
            bitmap.recycle();
            return savedSuccessfully;
        } catch (Throwable th) {
            IoUtils.closeSilently(os);
            if (savedSuccessfully && !tmpFile.renameTo(imageFile)) {
                savedSuccessfully = false;
            }
            if (!savedSuccessfully) {
                tmpFile.delete();
            }
            throw th;
        }
    }

    @Override // com.nostra13.universalimageloader.cache.disc.DiskCache
    public boolean remove(String imageUri) {
        return getFile(imageUri).delete();
    }

    @Override // com.nostra13.universalimageloader.cache.disc.DiskCache
    public void close() {
    }

    @Override // com.nostra13.universalimageloader.cache.disc.DiskCache
    public void clear() {
        File[] files = this.cacheDir.listFiles();
        if (files != null) {
            for (File f : files) {
                f.delete();
            }
        }
    }

    protected File getFile(String imageUri) {
        String fileName = this.fileNameGenerator.generate(imageUri);
        File dir = this.cacheDir;
        if (!this.cacheDir.exists() && !this.cacheDir.mkdirs() && this.reserveCacheDir != null && (this.reserveCacheDir.exists() || this.reserveCacheDir.mkdirs())) {
            dir = this.reserveCacheDir;
        }
        return new File(dir, fileName);
    }

    public void setBufferSize(int bufferSize) {
        this.bufferSize = bufferSize;
    }

    public void setCompressFormat(Bitmap.CompressFormat compressFormat) {
        this.compressFormat = compressFormat;
    }

    public void setCompressQuality(int compressQuality) {
        this.compressQuality = compressQuality;
    }
}
