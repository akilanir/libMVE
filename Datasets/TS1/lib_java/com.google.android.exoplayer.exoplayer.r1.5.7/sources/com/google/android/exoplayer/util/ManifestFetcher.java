package com.google.android.exoplayer.util;

import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import com.google.android.exoplayer.hls.HlsChunkSource;
import com.google.android.exoplayer.upstream.Loader;
import com.google.android.exoplayer.upstream.UriDataSource;
import com.google.android.exoplayer.upstream.UriLoadable;
import java.io.IOException;
import java.util.concurrent.CancellationException;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/util/ManifestFetcher.class */
public class ManifestFetcher<T> implements Loader.Callback {
    private final UriLoadable.Parser<T> parser;
    private final UriDataSource uriDataSource;
    private final Handler eventHandler;
    private final EventListener eventListener;
    volatile String manifestUri;
    private int enabledCount;
    private Loader loader;
    private UriLoadable<T> currentLoadable;
    private long currentLoadStartTimestamp;
    private int loadExceptionCount;
    private long loadExceptionTimestamp;
    private ManifestIOException loadException;
    private volatile T manifest;
    private volatile long manifestLoadStartTimestamp;
    private volatile long manifestLoadCompleteTimestamp;

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/util/ManifestFetcher$EventListener.class */
    public interface EventListener {
        void onManifestRefreshStarted();

        void onManifestRefreshed();

        void onManifestError(IOException iOException);
    }

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/util/ManifestFetcher$ManifestCallback.class */
    public interface ManifestCallback<T> {
        void onSingleManifest(T t);

        void onSingleManifestError(IOException iOException);
    }

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/util/ManifestFetcher$RedirectingManifest.class */
    public interface RedirectingManifest {
        String getNextManifestUri();
    }

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/util/ManifestFetcher$ManifestIOException.class */
    public static final class ManifestIOException extends IOException {
        public ManifestIOException(Throwable cause) {
            super(cause);
        }
    }

    public ManifestFetcher(String manifestUri, UriDataSource uriDataSource, UriLoadable.Parser<T> parser) {
        this(manifestUri, uriDataSource, parser, null, null);
    }

    public ManifestFetcher(String manifestUri, UriDataSource uriDataSource, UriLoadable.Parser<T> parser, Handler eventHandler, EventListener eventListener) {
        this.parser = parser;
        this.manifestUri = manifestUri;
        this.uriDataSource = uriDataSource;
        this.eventHandler = eventHandler;
        this.eventListener = eventListener;
    }

    public void updateManifestUri(String manifestUri) {
        this.manifestUri = manifestUri;
    }

    public void singleLoad(Looper callbackLooper, ManifestCallback<T> callback) {
        ManifestFetcher<T>.SingleFetchHelper fetchHelper = new SingleFetchHelper(new UriLoadable(this.manifestUri, this.uriDataSource, this.parser), callbackLooper, callback);
        fetchHelper.startLoading();
    }

    public T getManifest() {
        return this.manifest;
    }

    public long getManifestLoadStartTimestamp() {
        return this.manifestLoadStartTimestamp;
    }

    public long getManifestLoadCompleteTimestamp() {
        return this.manifestLoadCompleteTimestamp;
    }

    public void maybeThrowError() throws ManifestIOException {
        if (this.loadException == null || this.loadExceptionCount <= 1) {
        } else {
            throw this.loadException;
        }
    }

    public void enable() {
        int i = this.enabledCount;
        this.enabledCount = i + 1;
        if (i == 0) {
            this.loadExceptionCount = 0;
            this.loadException = null;
        }
    }

    public void disable() {
        int i = this.enabledCount - 1;
        this.enabledCount = i;
        if (i == 0 && this.loader != null) {
            this.loader.release();
            this.loader = null;
        }
    }

    public void requestRefresh() {
        if (this.loadException != null && android.os.SystemClock.elapsedRealtime() < this.loadExceptionTimestamp + getRetryDelayMillis(this.loadExceptionCount)) {
            return;
        }
        if (this.loader == null) {
            this.loader = new Loader("manifestLoader");
        }
        if (!this.loader.isLoading()) {
            this.currentLoadable = new UriLoadable<>(this.manifestUri, this.uriDataSource, this.parser);
            this.currentLoadStartTimestamp = android.os.SystemClock.elapsedRealtime();
            this.loader.startLoading(this.currentLoadable, this);
            notifyManifestRefreshStarted();
        }
    }

    @Override // com.google.android.exoplayer.upstream.Loader.Callback
    public void onLoadCompleted(Loader.Loadable loadable) {
        if (this.currentLoadable != loadable) {
            return;
        }
        this.manifest = this.currentLoadable.getResult();
        this.manifestLoadStartTimestamp = this.currentLoadStartTimestamp;
        this.manifestLoadCompleteTimestamp = android.os.SystemClock.elapsedRealtime();
        this.loadExceptionCount = 0;
        this.loadException = null;
        if (this.manifest instanceof RedirectingManifest) {
            RedirectingManifest redirectingManifest = (RedirectingManifest) this.manifest;
            String nextLocation = redirectingManifest.getNextManifestUri();
            if (!TextUtils.isEmpty(nextLocation)) {
                this.manifestUri = nextLocation;
            }
        }
        notifyManifestRefreshed();
    }

    @Override // com.google.android.exoplayer.upstream.Loader.Callback
    public void onLoadCanceled(Loader.Loadable loadable) {
    }

    @Override // com.google.android.exoplayer.upstream.Loader.Callback
    public void onLoadError(Loader.Loadable loadable, IOException exception) {
        if (this.currentLoadable != loadable) {
            return;
        }
        this.loadExceptionCount++;
        this.loadExceptionTimestamp = android.os.SystemClock.elapsedRealtime();
        this.loadException = new ManifestIOException(exception);
        notifyManifestError(this.loadException);
    }

    void onSingleFetchCompleted(T result, long loadStartTimestamp) {
        this.manifest = result;
        this.manifestLoadStartTimestamp = loadStartTimestamp;
        this.manifestLoadCompleteTimestamp = android.os.SystemClock.elapsedRealtime();
    }

    private long getRetryDelayMillis(long errorCount) {
        return Math.min((errorCount - 1) * 1000, HlsChunkSource.DEFAULT_MIN_BUFFER_TO_SWITCH_UP_MS);
    }

    private void notifyManifestRefreshStarted() {
        if (this.eventHandler != null && this.eventListener != null) {
            this.eventHandler.post(new Runnable() { // from class: com.google.android.exoplayer.util.ManifestFetcher.1
                @Override // java.lang.Runnable
                public void run() {
                    ManifestFetcher.this.eventListener.onManifestRefreshStarted();
                }
            });
        }
    }

    private void notifyManifestRefreshed() {
        if (this.eventHandler != null && this.eventListener != null) {
            this.eventHandler.post(new Runnable() { // from class: com.google.android.exoplayer.util.ManifestFetcher.2
                @Override // java.lang.Runnable
                public void run() {
                    ManifestFetcher.this.eventListener.onManifestRefreshed();
                }
            });
        }
    }

    private void notifyManifestError(final IOException e) {
        if (this.eventHandler != null && this.eventListener != null) {
            this.eventHandler.post(new Runnable() { // from class: com.google.android.exoplayer.util.ManifestFetcher.3
                @Override // java.lang.Runnable
                public void run() {
                    ManifestFetcher.this.eventListener.onManifestError(e);
                }
            });
        }
    }

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/util/ManifestFetcher$SingleFetchHelper.class */
    private class SingleFetchHelper implements Loader.Callback {
        private final UriLoadable<T> singleUseLoadable;
        private final Looper callbackLooper;
        private final ManifestCallback<T> wrappedCallback;
        private final Loader singleUseLoader = new Loader("manifestLoader:single");
        private long loadStartTimestamp;

        public SingleFetchHelper(UriLoadable<T> singleUseLoadable, Looper callbackLooper, ManifestCallback<T> wrappedCallback) {
            this.singleUseLoadable = singleUseLoadable;
            this.callbackLooper = callbackLooper;
            this.wrappedCallback = wrappedCallback;
        }

        public void startLoading() {
            this.loadStartTimestamp = android.os.SystemClock.elapsedRealtime();
            this.singleUseLoader.startLoading(this.callbackLooper, this.singleUseLoadable, this);
        }

        @Override // com.google.android.exoplayer.upstream.Loader.Callback
        public void onLoadCompleted(Loader.Loadable loadable) {
            try {
                T result = this.singleUseLoadable.getResult();
                ManifestFetcher.this.onSingleFetchCompleted(result, this.loadStartTimestamp);
                this.wrappedCallback.onSingleManifest(result);
                releaseLoader();
            } catch (Throwable th) {
                releaseLoader();
                throw th;
            }
        }

        @Override // com.google.android.exoplayer.upstream.Loader.Callback
        public void onLoadCanceled(Loader.Loadable loadable) {
            try {
                IOException exception = new ManifestIOException(new CancellationException());
                this.wrappedCallback.onSingleManifestError(exception);
                releaseLoader();
            } catch (Throwable th) {
                releaseLoader();
                throw th;
            }
        }

        @Override // com.google.android.exoplayer.upstream.Loader.Callback
        public void onLoadError(Loader.Loadable loadable, IOException exception) {
            try {
                this.wrappedCallback.onSingleManifestError(exception);
                releaseLoader();
            } catch (Throwable th) {
                releaseLoader();
                throw th;
            }
        }

        private void releaseLoader() {
            this.singleUseLoader.release();
        }
    }
}
