package com.nostra13.universalimageloader.core;

import com.nostra13.universalimageloader.core.assist.ImageSize;
import com.nostra13.universalimageloader.core.imageaware.ImageAware;
import com.nostra13.universalimageloader.core.listener.ImageLoadingListener;
import com.nostra13.universalimageloader.core.listener.ImageLoadingProgressListener;
import java.util.concurrent.locks.ReentrantLock;

/* loaded from: universal-image-loader-1.9.5.jar:com/nostra13/universalimageloader/core/ImageLoadingInfo.class */
final class ImageLoadingInfo {
    final String uri;
    final String memoryCacheKey;
    final ImageAware imageAware;
    final ImageSize targetSize;
    final DisplayImageOptions options;
    final ImageLoadingListener listener;
    final ImageLoadingProgressListener progressListener;
    final ReentrantLock loadFromUriLock;

    public ImageLoadingInfo(String uri, ImageAware imageAware, ImageSize targetSize, String memoryCacheKey, DisplayImageOptions options, ImageLoadingListener listener, ImageLoadingProgressListener progressListener, ReentrantLock loadFromUriLock) {
        this.uri = uri;
        this.imageAware = imageAware;
        this.targetSize = targetSize;
        this.options = options;
        this.listener = listener;
        this.progressListener = progressListener;
        this.loadFromUriLock = loadFromUriLock;
        this.memoryCacheKey = memoryCacheKey;
    }
}
