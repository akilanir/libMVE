package com.nostra13.universalimageloader.cache.disc.impl;

import com.nostra13.universalimageloader.cache.disc.naming.FileNameGenerator;
import java.io.File;

/* loaded from: universal-image-loader-1.9.3.jar:com/nostra13/universalimageloader/cache/disc/impl/UnlimitedDiscCache.class */
public class UnlimitedDiscCache extends BaseDiscCache {
    public UnlimitedDiscCache(File cacheDir) {
        super(cacheDir);
    }

    public UnlimitedDiscCache(File cacheDir, File reserveCacheDir) {
        super(cacheDir, reserveCacheDir);
    }

    public UnlimitedDiscCache(File cacheDir, File reserveCacheDir, FileNameGenerator fileNameGenerator) {
        super(cacheDir, reserveCacheDir, fileNameGenerator);
    }
}
