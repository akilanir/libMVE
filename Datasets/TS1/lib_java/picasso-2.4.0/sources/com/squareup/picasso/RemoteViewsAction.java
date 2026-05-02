package com.squareup.picasso;

import android.app.Notification;
import android.app.NotificationManager;
import android.appwidget.AppWidgetManager;
import android.graphics.Bitmap;
import android.widget.RemoteViews;
import com.squareup.picasso.Picasso;

/* loaded from: picasso-2.4.0.jar:com/squareup/picasso/RemoteViewsAction.class */
abstract class RemoteViewsAction extends Action<RemoteViewsTarget> {
    final RemoteViews remoteViews;
    final int viewId;
    private RemoteViewsTarget target;

    abstract void update();

    RemoteViewsAction(Picasso picasso, Request data, RemoteViews remoteViews, int viewId, int errorResId, boolean skipCache, String key, Object tag) {
        super(picasso, null, data, skipCache, false, errorResId, null, key, tag);
        this.remoteViews = remoteViews;
        this.viewId = viewId;
    }

    @Override // com.squareup.picasso.Action
    void complete(Bitmap result, Picasso.LoadedFrom from) {
        this.remoteViews.setImageViewBitmap(this.viewId, result);
        update();
    }

    @Override // com.squareup.picasso.Action
    public void error() {
        if (this.errorResId != 0) {
            setImageResource(this.errorResId);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.squareup.picasso.Action
    public RemoteViewsTarget getTarget() {
        if (this.target == null) {
            this.target = new RemoteViewsTarget(this.remoteViews, this.viewId);
        }
        return this.target;
    }

    void setImageResource(int resId) {
        this.remoteViews.setImageViewResource(this.viewId, resId);
        update();
    }

    /* loaded from: picasso-2.4.0.jar:com/squareup/picasso/RemoteViewsAction$RemoteViewsTarget.class */
    static class RemoteViewsTarget {
        final RemoteViews remoteViews;
        final int viewId;

        RemoteViewsTarget(RemoteViews remoteViews, int viewId) {
            this.remoteViews = remoteViews;
            this.viewId = viewId;
        }

        public boolean equals(Object o) {
            if (this == o) {
                return true;
            }
            if (o == null || getClass() != o.getClass()) {
                return false;
            }
            RemoteViewsTarget remoteViewsTarget = (RemoteViewsTarget) o;
            return this.viewId == remoteViewsTarget.viewId && this.remoteViews.equals(remoteViewsTarget.remoteViews);
        }

        public int hashCode() {
            return (31 * this.remoteViews.hashCode()) + this.viewId;
        }
    }

    /* loaded from: picasso-2.4.0.jar:com/squareup/picasso/RemoteViewsAction$AppWidgetAction.class */
    static class AppWidgetAction extends RemoteViewsAction {
        private final int[] appWidgetIds;

        @Override // com.squareup.picasso.RemoteViewsAction, com.squareup.picasso.Action
        /* bridge */ /* synthetic */ RemoteViewsTarget getTarget() {
            return super.getTarget();
        }

        AppWidgetAction(Picasso picasso, Request data, RemoteViews remoteViews, int viewId, int[] appWidgetIds, boolean skipCache, int errorResId, String key, Object tag) {
            super(picasso, data, remoteViews, viewId, errorResId, skipCache, key, tag);
            this.appWidgetIds = appWidgetIds;
        }

        @Override // com.squareup.picasso.RemoteViewsAction
        void update() {
            AppWidgetManager manager = AppWidgetManager.getInstance(this.picasso.context);
            manager.updateAppWidget(this.appWidgetIds, this.remoteViews);
        }
    }

    /* loaded from: picasso-2.4.0.jar:com/squareup/picasso/RemoteViewsAction$NotificationAction.class */
    static class NotificationAction extends RemoteViewsAction {
        private final int notificationId;
        private final Notification notification;

        @Override // com.squareup.picasso.RemoteViewsAction, com.squareup.picasso.Action
        /* bridge */ /* synthetic */ RemoteViewsTarget getTarget() {
            return super.getTarget();
        }

        NotificationAction(Picasso picasso, Request data, RemoteViews remoteViews, int viewId, int notificationId, Notification notification, boolean skipCache, int errorResId, String key, Object tag) {
            super(picasso, data, remoteViews, viewId, errorResId, skipCache, key, tag);
            this.notificationId = notificationId;
            this.notification = notification;
        }

        @Override // com.squareup.picasso.RemoteViewsAction
        void update() {
            NotificationManager manager = (NotificationManager) Utils.getService(this.picasso.context, "notification");
            manager.notify(this.notificationId, this.notification);
        }
    }
}
