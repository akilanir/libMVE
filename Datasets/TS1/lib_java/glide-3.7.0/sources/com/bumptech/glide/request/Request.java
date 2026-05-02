package com.bumptech.glide.request;

/* loaded from: glide-3.7.0.jar:com/bumptech/glide/request/Request.class */
public interface Request {
    void begin();

    void pause();

    void clear();

    boolean isPaused();

    boolean isRunning();

    boolean isComplete();

    boolean isResourceSet();

    boolean isCancelled();

    boolean isFailed();

    void recycle();
}
