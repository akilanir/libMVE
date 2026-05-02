package com.bumptech.glide.request;

import android.graphics.drawable.Drawable;
import android.os.Handler;
import com.bumptech.glide.request.animation.GlideAnimation;
import com.bumptech.glide.request.target.SizeReadyCallback;
import com.bumptech.glide.util.Util;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

/* loaded from: glide-3.5.2.jar:com/bumptech/glide/request/RequestFutureTarget.class */
public class RequestFutureTarget<T, R> implements FutureTarget<R>, Runnable {
    private static final Waiter DEFAULT_WAITER = new Waiter();
    private final Handler mainHandler;
    private final int width;
    private final int height;
    private final boolean assertBackgroundThread;
    private final Waiter waiter;
    private R resource;
    private Request request;
    private boolean isCancelled;
    private Exception exception;
    private boolean resultReceived;
    private boolean exceptionReceived;

    public RequestFutureTarget(Handler mainHandler, int width, int height) {
        this(mainHandler, width, height, true, DEFAULT_WAITER);
    }

    RequestFutureTarget(Handler mainHandler, int width, int height, boolean assertBackgroundThread, Waiter waiter) {
        this.mainHandler = mainHandler;
        this.width = width;
        this.height = height;
        this.assertBackgroundThread = assertBackgroundThread;
        this.waiter = waiter;
    }

    @Override // java.util.concurrent.Future
    public synchronized boolean cancel(boolean b) {
        if (this.isCancelled) {
            return true;
        }
        boolean result = !isDone();
        if (result) {
            this.isCancelled = true;
            clear();
            this.waiter.notifyAll(this);
        }
        return result;
    }

    @Override // java.util.concurrent.Future
    public synchronized boolean isCancelled() {
        return this.isCancelled;
    }

    @Override // java.util.concurrent.Future
    public synchronized boolean isDone() {
        return this.isCancelled || this.resultReceived;
    }

    @Override // java.util.concurrent.Future
    public R get() throws InterruptedException, ExecutionException {
        try {
            return doGet(null);
        } catch (TimeoutException e) {
            throw new AssertionError(e);
        }
    }

    @Override // java.util.concurrent.Future
    public R get(long time, TimeUnit timeUnit) throws InterruptedException, ExecutionException, TimeoutException {
        return doGet(Long.valueOf(timeUnit.toMillis(time)));
    }

    @Override // com.bumptech.glide.request.target.Target
    public void getSize(SizeReadyCallback cb) {
        cb.onSizeReady(this.width, this.height);
    }

    @Override // com.bumptech.glide.request.target.Target
    public void setRequest(Request request) {
        this.request = request;
    }

    @Override // com.bumptech.glide.request.target.Target
    public Request getRequest() {
        return this.request;
    }

    @Override // com.bumptech.glide.request.target.Target
    public void onLoadCleared(Drawable placeholder) {
    }

    @Override // com.bumptech.glide.request.target.Target
    public void onLoadStarted(Drawable placeholder) {
    }

    @Override // com.bumptech.glide.request.target.Target
    public synchronized void onLoadFailed(Exception e, Drawable errorDrawable) {
        this.exceptionReceived = true;
        this.exception = e;
        this.waiter.notifyAll(this);
    }

    @Override // com.bumptech.glide.request.target.Target
    public synchronized void onResourceReady(R resource, GlideAnimation<? super R> glideAnimation) {
        this.resultReceived = true;
        this.resource = resource;
        this.waiter.notifyAll(this);
    }

    private synchronized R doGet(Long timeoutMillis) throws ExecutionException, InterruptedException, TimeoutException {
        if (this.assertBackgroundThread) {
            Util.assertBackgroundThread();
        }
        if (this.isCancelled) {
            throw new CancellationException();
        }
        if (this.exceptionReceived) {
            throw new ExecutionException(this.exception);
        }
        if (this.resultReceived) {
            return this.resource;
        }
        if (timeoutMillis == null) {
            this.waiter.waitForTimeout(this, 0L);
        } else if (timeoutMillis.longValue() > 0) {
            this.waiter.waitForTimeout(this, timeoutMillis.longValue());
        }
        if (Thread.interrupted()) {
            throw new InterruptedException();
        }
        if (this.exceptionReceived) {
            throw new ExecutionException(this.exception);
        }
        if (this.isCancelled) {
            throw new CancellationException();
        }
        if (!this.resultReceived) {
            throw new TimeoutException();
        }
        return this.resource;
    }

    @Override // java.lang.Runnable
    public void run() {
        this.request.clear();
    }

    @Override // com.bumptech.glide.request.FutureTarget
    public void clear() {
        this.mainHandler.post(this);
    }

    @Override // com.bumptech.glide.manager.LifecycleListener
    public void onStart() {
    }

    @Override // com.bumptech.glide.manager.LifecycleListener
    public void onStop() {
    }

    @Override // com.bumptech.glide.manager.LifecycleListener
    public void onDestroy() {
    }

    /* loaded from: glide-3.5.2.jar:com/bumptech/glide/request/RequestFutureTarget$Waiter.class */
    static class Waiter {
        Waiter() {
        }

        public void waitForTimeout(Object toWaitOn, long timeoutMillis) throws InterruptedException {
            toWaitOn.wait(timeoutMillis);
        }

        public void notifyAll(Object toNotify) {
            toNotify.notifyAll();
        }
    }
}
