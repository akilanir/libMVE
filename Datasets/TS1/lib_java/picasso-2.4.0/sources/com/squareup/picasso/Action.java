package com.squareup.picasso;

import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import com.squareup.picasso.Picasso;
import java.lang.ref.ReferenceQueue;
import java.lang.ref.WeakReference;

/* loaded from: picasso-2.4.0.jar:com/squareup/picasso/Action.class */
abstract class Action<T> {
    final Picasso picasso;
    final Request request;
    final WeakReference<T> target;
    final boolean skipCache;
    final boolean noFade;
    final int errorResId;
    final Drawable errorDrawable;
    final String key;
    final Object tag;
    boolean willReplay;
    boolean cancelled;

    abstract void complete(Bitmap bitmap, Picasso.LoadedFrom loadedFrom);

    abstract void error();

    /* loaded from: picasso-2.4.0.jar:com/squareup/picasso/Action$RequestWeakReference.class */
    static class RequestWeakReference<M> extends WeakReference<M> {
        final Action action;

        public RequestWeakReference(Action action, M referent, ReferenceQueue<? super M> q) {
            super(referent, q);
            this.action = action;
        }
    }

    Action(Picasso picasso, T target, Request request, boolean skipCache, boolean noFade, int errorResId, Drawable errorDrawable, String key, Object tag) {
        this.picasso = picasso;
        this.request = request;
        this.target = target == null ? null : new RequestWeakReference(this, target, picasso.referenceQueue);
        this.skipCache = skipCache;
        this.noFade = noFade;
        this.errorResId = errorResId;
        this.errorDrawable = errorDrawable;
        this.key = key;
        this.tag = tag != null ? tag : this;
    }

    void cancel() {
        this.cancelled = true;
    }

    Request getRequest() {
        return this.request;
    }

    T getTarget() {
        if (this.target == null) {
            return null;
        }
        return this.target.get();
    }

    String getKey() {
        return this.key;
    }

    boolean isCancelled() {
        return this.cancelled;
    }

    boolean willReplay() {
        return this.willReplay;
    }

    Picasso getPicasso() {
        return this.picasso;
    }

    Picasso.Priority getPriority() {
        return this.request.priority;
    }

    Object getTag() {
        return this.tag;
    }
}
