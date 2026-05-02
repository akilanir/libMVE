package com.nostra13.universalimageloader.cache.disc;

import android.graphics.Bitmap;
import com.nostra13.universalimageloader.utils.IoUtils;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;

@Deprecated
/* loaded from: universal-image-loader-1.9.3.jar:com/nostra13/universalimageloader/cache/disc/DiscCacheAware.class */
public interface DiscCacheAware {
    File getDirectory();

    File get(String str);

    boolean save(String str, InputStream inputStream, IoUtils.CopyListener copyListener) throws IOException;

    boolean save(String str, Bitmap bitmap) throws IOException;

    boolean remove(String str);

    void close();

    void clear();
}
