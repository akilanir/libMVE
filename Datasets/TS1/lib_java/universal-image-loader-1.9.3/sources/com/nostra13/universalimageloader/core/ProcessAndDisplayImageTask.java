package com.nostra13.universalimageloader.core;

import android.graphics.Bitmap;
import android.os.Handler;
import com.nostra13.universalimageloader.core.assist.LoadedFrom;
import com.nostra13.universalimageloader.core.process.BitmapProcessor;
import com.nostra13.universalimageloader.utils.L;

/* loaded from: universal-image-loader-1.9.3.jar:com/nostra13/universalimageloader/core/ProcessAndDisplayImageTask.class */
final class ProcessAndDisplayImageTask implements Runnable {
    private static final String LOG_POSTPROCESS_IMAGE = "PostProcess image before displaying [%s]";
    private final ImageLoaderEngine engine;
    private final Bitmap bitmap;
    private final ImageLoadingInfo imageLoadingInfo;
    private final Handler handler;

    public ProcessAndDisplayImageTask(ImageLoaderEngine engine, Bitmap bitmap, ImageLoadingInfo imageLoadingInfo, Handler handler) {
        this.engine = engine;
        this.bitmap = bitmap;
        this.imageLoadingInfo = imageLoadingInfo;
        this.handler = handler;
    }

    @Override // java.lang.Runnable
    public void run() {
        L.d(LOG_POSTPROCESS_IMAGE, this.imageLoadingInfo.memoryCacheKey);
        BitmapProcessor processor = this.imageLoadingInfo.options.getPostProcessor();
        Bitmap processedBitmap = processor.process(this.bitmap);
        DisplayBitmapTask displayBitmapTask = new DisplayBitmapTask(processedBitmap, this.imageLoadingInfo, this.engine, LoadedFrom.MEMORY_CACHE);
        LoadAndDisplayImageTask.runTask(displayBitmapTask, this.imageLoadingInfo.options.isSyncLoading(), this.handler, this.engine);
    }
}
