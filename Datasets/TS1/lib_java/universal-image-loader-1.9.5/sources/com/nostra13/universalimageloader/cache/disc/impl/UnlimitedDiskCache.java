package com.nostra13.universalimageloader.cache.disc.impl;

import com.nostra13.universalimageloader.cache.disc.naming.FileNameGenerator;
import java.io.File;

/* loaded from: universal-image-loader-1.9.5.jar:com/nostra13/universalimageloader/cache/disc/impl/UnlimitedDiskCache.class */
public class UnlimitedDiskCache extends BaseDiskCache {
    public UnlimitedDiskCache(File cacheDir) {
        super(cacheDir);
    }

    public UnlimitedDiskCache(File cacheDir, File reserveCacheDir) {
        super(cacheDir, reserveCacheDir);
    }

    public UnlimitedDiskCache(File cacheDir, File reserveCacheDir, FileNameGenerator fileNameGenerator) {
        super(cacheDir, reserveCacheDir, fileNameGenerator);
    }
}
