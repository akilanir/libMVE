package com.bumptech.glide.request.target;

import android.app.Notification;
import android.app.NotificationManager;
import android.content.Context;
import android.graphics.Bitmap;
import android.widget.RemoteViews;
import com.bumptech.glide.request.animation.GlideAnimation;

/* loaded from: glide-3.7.0.jar:com/bumptech/glide/request/target/NotificationTarget.class */
public class NotificationTarget extends SimpleTarget<Bitmap> {
    private final RemoteViews remoteViews;
    private final Context context;
    private final int notificationId;
    private final Notification notification;
    private final int viewId;

    @Override // com.bumptech.glide.request.target.Target
    public /* bridge */ /* synthetic */ void onResourceReady(Object x0, GlideAnimation x1) {
        onResourceReady((Bitmap) x0, (GlideAnimation<? super Bitmap>) x1);
    }

    public NotificationTarget(Context context, RemoteViews remoteViews, int viewId, Notification notification, int notificationId) {
        this(context, remoteViews, viewId, Target.SIZE_ORIGINAL, Target.SIZE_ORIGINAL, notification, notificationId);
    }

    public NotificationTarget(Context context, RemoteViews remoteViews, int viewId, int width, int height, Notification notification, int notificationId) {
        super(width, height);
        if (context == null) {
            throw new NullPointerException("Context must not be null!");
        }
        if (notification == null) {
            throw new NullPointerException("Notification object can not be null!");
        }
        if (remoteViews == null) {
            throw new NullPointerException("RemoteViews object can not be null!");
        }
        this.context = context;
        this.viewId = viewId;
        this.notification = notification;
        this.notificationId = notificationId;
        this.remoteViews = remoteViews;
    }

    private void update() {
        NotificationManager manager = (NotificationManager) this.context.getSystemService("notification");
        manager.notify(this.notificationId, this.notification);
    }

    public void onResourceReady(Bitmap resource, GlideAnimation<? super Bitmap> glideAnimation) {
        this.remoteViews.setImageViewBitmap(this.viewId, resource);
        update();
    }
}
