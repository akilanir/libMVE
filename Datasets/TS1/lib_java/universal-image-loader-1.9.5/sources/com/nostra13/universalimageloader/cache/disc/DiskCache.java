package com.nostra13.universalimageloader.cache.disc;

import android.graphics.Bitmap;
import com.nostra13.universalimageloader.utils.IoUtils;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;

/* loaded from: universal-image-loader-1.9.5.jar:com/nostra13/universalimageloader/cache/disc/DiskCache.class */
public interface DiskCache {
    File getDirectory();

    File get(String str);

    boolean save(String str, InputStream inputStream, IoUtils.CopyListener copyListener) throws IOException;

    boolean save(String str, Bitmap bitmap) throws IOException;

    boolean remove(String str);

    void close();

    void clear();
}
