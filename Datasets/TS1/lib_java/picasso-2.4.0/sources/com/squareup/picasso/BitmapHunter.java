package com.squareup.picasso;

import android.graphics.Bitmap;
import android.graphics.Matrix;
import android.net.NetworkInfo;
import com.squareup.picasso.Downloader;
import com.squareup.picasso.Picasso;
import com.squareup.picasso.RequestHandler;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Future;
import java.util.concurrent.atomic.AtomicInteger;

/* loaded from: picasso-2.4.0.jar:com/squareup/picasso/BitmapHunter.class */
class BitmapHunter implements Runnable {
    private static final Object DECODE_LOCK = new Object();
    private static final ThreadLocal<StringBuilder> NAME_BUILDER = new ThreadLocal<StringBuilder>() { // from class: com.squareup.picasso.BitmapHunter.1
        /* JADX INFO: Access modifiers changed from: protected */
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // java.lang.ThreadLocal
        public StringBuilder initialValue() {
            return new StringBuilder("Picasso-");
        }
    };
    private static final AtomicInteger SEQUENCE_GENERATOR = new AtomicInteger();
    private static final RequestHandler ERRORING_HANDLER = new RequestHandler() { // from class: com.squareup.picasso.BitmapHunter.2
        @Override // com.squareup.picasso.RequestHandler
        public boolean canHandleRequest(Request data) {
            return true;
        }

        @Override // com.squareup.picasso.RequestHandler
        public RequestHandler.Result load(Request data) throws IOException {
            throw new IllegalStateException("Unrecognized type of request: " + data);
        }
    };
    final int sequence = SEQUENCE_GENERATOR.incrementAndGet();
    final Picasso picasso;
    final Dispatcher dispatcher;
    final Cache cache;
    final Stats stats;
    final String key;
    final Request data;
    final boolean skipMemoryCache;
    final RequestHandler requestHandler;
    Action action;
    List<Action> actions;
    Bitmap result;
    Future<?> future;
    Picasso.LoadedFrom loadedFrom;
    Exception exception;
    int exifRotation;
    int retryCount;
    Picasso.Priority priority;

    BitmapHunter(Picasso picasso, Dispatcher dispatcher, Cache cache, Stats stats, Action action, RequestHandler requestHandler) {
        this.picasso = picasso;
        this.dispatcher = dispatcher;
        this.cache = cache;
        this.stats = stats;
        this.action = action;
        this.key = action.getKey();
        this.data = action.getRequest();
        this.priority = action.getPriority();
        this.skipMemoryCache = action.skipCache;
        this.requestHandler = requestHandler;
        this.retryCount = requestHandler.getRetryCount();
    }

    @Override // java.lang.Runnable
    public void run() {
        try {
            try {
                try {
                    try {
                        try {
                            updateThreadName(this.data);
                            if (this.picasso.loggingEnabled) {
                                Utils.log("Hunter", "executing", Utils.getLogIdsForHunter(this));
                            }
                            this.result = hunt();
                            if (this.result == null) {
                                this.dispatcher.dispatchFailed(this);
                            } else {
                                this.dispatcher.dispatchComplete(this);
                            }
                            Thread.currentThread().setName("Picasso-Idle");
                        } catch (Downloader.ResponseException e) {
                            this.exception = e;
                            this.dispatcher.dispatchFailed(this);
                            Thread.currentThread().setName("Picasso-Idle");
                        }
                    } catch (Exception e2) {
                        this.exception = e2;
                        this.dispatcher.dispatchFailed(this);
                        Thread.currentThread().setName("Picasso-Idle");
                    }
                } catch (OutOfMemoryError e3) {
                    StringWriter writer = new StringWriter();
                    this.stats.createSnapshot().dump(new PrintWriter(writer));
                    this.exception = new RuntimeException(writer.toString(), e3);
                    this.dispatcher.dispatchFailed(this);
                    Thread.currentThread().setName("Picasso-Idle");
                }
            } catch (IOException e4) {
                this.exception = e4;
                this.dispatcher.dispatchRetry(this);
                Thread.currentThread().setName("Picasso-Idle");
            }
        } catch (Throwable th) {
            Thread.currentThread().setName("Picasso-Idle");
            throw th;
        }
    }

    Bitmap hunt() throws IOException {
        Bitmap bitmap = null;
        if (!this.skipMemoryCache) {
            bitmap = this.cache.get(this.key);
            if (bitmap != null) {
                this.stats.dispatchCacheHit();
                this.loadedFrom = Picasso.LoadedFrom.MEMORY;
                if (this.picasso.loggingEnabled) {
                    Utils.log("Hunter", "decoded", this.data.logId(), "from cache");
                }
                return bitmap;
            }
        }
        this.data.loadFromLocalCacheOnly = this.retryCount == 0;
        RequestHandler.Result result = this.requestHandler.load(this.data);
        if (result != null) {
            bitmap = result.getBitmap();
            this.loadedFrom = result.getLoadedFrom();
            this.exifRotation = result.getExifOrientation();
        }
        if (bitmap != null) {
            if (this.picasso.loggingEnabled) {
                Utils.log("Hunter", "decoded", this.data.logId());
            }
            this.stats.dispatchBitmapDecoded(bitmap);
            if (this.data.needsTransformation() || this.exifRotation != 0) {
                synchronized (DECODE_LOCK) {
                    if (this.data.needsMatrixTransform() || this.exifRotation != 0) {
                        bitmap = transformResult(this.data, bitmap, this.exifRotation);
                        if (this.picasso.loggingEnabled) {
                            Utils.log("Hunter", "transformed", this.data.logId());
                        }
                    }
                    if (this.data.hasCustomTransformations()) {
                        bitmap = applyCustomTransformations(this.data.transformations, bitmap);
                        if (this.picasso.loggingEnabled) {
                            Utils.log("Hunter", "transformed", this.data.logId(), "from custom transformations");
                        }
                    }
                }
                if (bitmap != null) {
                    this.stats.dispatchBitmapTransformed(bitmap);
                }
            }
        }
        return bitmap;
    }

    void attach(Action action) {
        boolean loggingEnabled = this.picasso.loggingEnabled;
        Request request = action.request;
        if (this.action == null) {
            this.action = action;
            if (loggingEnabled) {
                if (this.actions == null || this.actions.isEmpty()) {
                    Utils.log("Hunter", "joined", request.logId(), "to empty hunter");
                    return;
                } else {
                    Utils.log("Hunter", "joined", request.logId(), Utils.getLogIdsForHunter(this, "to "));
                    return;
                }
            }
            return;
        }
        if (this.actions == null) {
            this.actions = new ArrayList(3);
        }
        this.actions.add(action);
        if (loggingEnabled) {
            Utils.log("Hunter", "joined", request.logId(), Utils.getLogIdsForHunter(this, "to "));
        }
        Picasso.Priority actionPriority = action.getPriority();
        if (actionPriority.ordinal() > this.priority.ordinal()) {
            this.priority = actionPriority;
        }
    }

    void detach(Action action) {
        boolean detached = false;
        if (this.action == action) {
            this.action = null;
            detached = true;
        } else if (this.actions != null) {
            detached = this.actions.remove(action);
        }
        if (detached && action.getPriority() == this.priority) {
            this.priority = computeNewPriority();
        }
        if (this.picasso.loggingEnabled) {
            Utils.log("Hunter", "removed", action.request.logId(), Utils.getLogIdsForHunter(this, "from "));
        }
    }

    private Picasso.Priority computeNewPriority() {
        Picasso.Priority newPriority = Picasso.Priority.LOW;
        boolean hasMultiple = (this.actions == null || this.actions.isEmpty()) ? false : true;
        boolean hasAny = this.action != null || hasMultiple;
        if (!hasAny) {
            return newPriority;
        }
        if (this.action != null) {
            newPriority = this.action.getPriority();
        }
        if (hasMultiple) {
            int n = this.actions.size();
            for (int i = 0; i < n; i++) {
                Picasso.Priority actionPriority = this.actions.get(i).getPriority();
                if (actionPriority.ordinal() > newPriority.ordinal()) {
                    newPriority = actionPriority;
                }
            }
        }
        return newPriority;
    }

    boolean cancel() {
        return this.action == null && (this.actions == null || this.actions.isEmpty()) && this.future != null && this.future.cancel(false);
    }

    boolean isCancelled() {
        return this.future != null && this.future.isCancelled();
    }

    boolean shouldSkipMemoryCache() {
        return this.skipMemoryCache;
    }

    boolean shouldRetry(boolean airplaneMode, NetworkInfo info) {
        boolean hasRetries = this.retryCount > 0;
        if (!hasRetries) {
            return false;
        }
        this.retryCount--;
        return this.requestHandler.shouldRetry(airplaneMode, info);
    }

    boolean supportsReplay() {
        return this.requestHandler.supportsReplay();
    }

    Bitmap getResult() {
        return this.result;
    }

    String getKey() {
        return this.key;
    }

    Request getData() {
        return this.data;
    }

    Action getAction() {
        return this.action;
    }

    Picasso getPicasso() {
        return this.picasso;
    }

    List<Action> getActions() {
        return this.actions;
    }

    Exception getException() {
        return this.exception;
    }

    Picasso.LoadedFrom getLoadedFrom() {
        return this.loadedFrom;
    }

    Picasso.Priority getPriority() {
        return this.priority;
    }

    static void updateThreadName(Request data) {
        String name = data.getName();
        StringBuilder builder = NAME_BUILDER.get();
        builder.ensureCapacity("Picasso-".length() + name.length());
        builder.replace("Picasso-".length(), builder.length(), name);
        Thread.currentThread().setName(builder.toString());
    }

    static BitmapHunter forRequest(Picasso picasso, Dispatcher dispatcher, Cache cache, Stats stats, Action action) {
        Request request = action.getRequest();
        List<RequestHandler> requestHandlers = picasso.getRequestHandlers();
        int count = requestHandlers.size();
        for (int i = 0; i < count; i++) {
            RequestHandler requestHandler = requestHandlers.get(i);
            if (requestHandler.canHandleRequest(request)) {
                return new BitmapHunter(picasso, dispatcher, cache, stats, action, requestHandler);
            }
        }
        return new BitmapHunter(picasso, dispatcher, cache, stats, action, ERRORING_HANDLER);
    }

    static Bitmap applyCustomTransformations(List<Transformation> transformations, Bitmap result) {
        int count = transformations.size();
        for (int i = 0; i < count; i++) {
            final Transformation transformation = transformations.get(i);
            try {
                Bitmap newResult = transformation.transform(result);
                if (newResult == null) {
                    final StringBuilder builder = new StringBuilder().append("Transformation ").append(transformation.key()).append(" returned null after ").append(i).append(" previous transformation(s).\n\nTransformation list:\n");
                    for (Transformation t : transformations) {
                        builder.append(t.key()).append('\n');
                    }
                    Picasso.HANDLER.post(new Runnable() { // from class: com.squareup.picasso.BitmapHunter.4
                        @Override // java.lang.Runnable
                        public void run() {
                            throw new NullPointerException(builder.toString());
                        }
                    });
                    return null;
                }
                if (newResult == result && result.isRecycled()) {
                    Picasso.HANDLER.post(new Runnable() { // from class: com.squareup.picasso.BitmapHunter.5
                        @Override // java.lang.Runnable
                        public void run() {
                            throw new IllegalStateException("Transformation " + transformation.key() + " returned input Bitmap but recycled it.");
                        }
                    });
                    return null;
                }
                if (newResult != result && !result.isRecycled()) {
                    Picasso.HANDLER.post(new Runnable() { // from class: com.squareup.picasso.BitmapHunter.6
                        @Override // java.lang.Runnable
                        public void run() {
                            throw new IllegalStateException("Transformation " + transformation.key() + " mutated input Bitmap but failed to recycle the original.");
                        }
                    });
                    return null;
                }
                result = newResult;
            } catch (RuntimeException e) {
                Picasso.HANDLER.post(new Runnable() { // from class: com.squareup.picasso.BitmapHunter.3
                    @Override // java.lang.Runnable
                    public void run() {
                        throw new RuntimeException("Transformation " + transformation.key() + " crashed with exception.", e);
                    }
                });
                return null;
            }
        }
        return result;
    }

    static Bitmap transformResult(Request data, Bitmap result, int exifRotation) {
        float scale;
        int inWidth = result.getWidth();
        int inHeight = result.getHeight();
        int drawX = 0;
        int drawY = 0;
        int drawWidth = inWidth;
        int drawHeight = inHeight;
        Matrix matrix = new Matrix();
        if (data.needsMatrixTransform()) {
            int targetWidth = data.targetWidth;
            int targetHeight = data.targetHeight;
            float targetRotation = data.rotationDegrees;
            if (targetRotation != 0.0f) {
                if (data.hasRotationPivot) {
                    matrix.setRotate(targetRotation, data.rotationPivotX, data.rotationPivotY);
                } else {
                    matrix.setRotate(targetRotation);
                }
            }
            if (data.centerCrop) {
                float widthRatio = targetWidth / inWidth;
                float heightRatio = targetHeight / inHeight;
                if (widthRatio > heightRatio) {
                    scale = widthRatio;
                    int newSize = (int) Math.ceil(inHeight * (heightRatio / widthRatio));
                    drawY = (inHeight - newSize) / 2;
                    drawHeight = newSize;
                } else {
                    scale = heightRatio;
                    int newSize2 = (int) Math.ceil(inWidth * (widthRatio / heightRatio));
                    drawX = (inWidth - newSize2) / 2;
                    drawWidth = newSize2;
                }
                matrix.preScale(scale, scale);
            } else if (data.centerInside) {
                float widthRatio2 = targetWidth / inWidth;
                float heightRatio2 = targetHeight / inHeight;
                float scale2 = widthRatio2 < heightRatio2 ? widthRatio2 : heightRatio2;
                matrix.preScale(scale2, scale2);
            } else if ((targetWidth != 0 || targetHeight != 0) && (targetWidth != inWidth || targetHeight != inHeight)) {
                float sx = targetWidth != 0 ? targetWidth / inWidth : targetHeight / inHeight;
                float sy = targetHeight != 0 ? targetHeight / inHeight : targetWidth / inWidth;
                matrix.preScale(sx, sy);
            }
        }
        if (exifRotation != 0) {
            matrix.preRotate(exifRotation);
        }
        Bitmap newResult = Bitmap.createBitmap(result, drawX, drawY, drawWidth, drawHeight, matrix, true);
        if (newResult != result) {
            result.recycle();
            result = newResult;
        }
        return result;
    }
}
