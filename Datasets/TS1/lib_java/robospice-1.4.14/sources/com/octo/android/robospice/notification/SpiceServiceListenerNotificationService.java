package com.octo.android.robospice.notification;

import android.app.Notification;
import android.app.NotificationManager;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.os.IBinder;
import com.octo.android.robospice.SpiceManager;
import com.octo.android.robospice.SpiceService;
import com.octo.android.robospice.request.CachedSpiceRequest;
import com.octo.android.robospice.request.listener.SpiceServiceListener;
import roboguice.util.temp.Ln;

/* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/notification/SpiceServiceListenerNotificationService.class */
public abstract class SpiceServiceListenerNotificationService extends Service {
    public static final int DEFAULT_ROBOSPICE_NOTIFICATION_ID = 700;
    public static final String BUNDLE_KEY_NOTIFICATION_ID = "BUNDLE_KEY_NOTIFICATION_ID";
    public static final String BUNDLE_KEY_REQUEST_CACHE_KEY = "BUNDLE_KEY_REQUEST_CACHE_KEY";
    public static final String BUNDLE_KEY_REQUEST_CLASS = "BUNDLE_KEY_REQUEST_CLASS";
    public static final String BUNDLE_KEY_SERVICE_CLASS = "BUNDLE_KEY_SERVICE_CLASS";
    public static final String BUNDLE_KEY_FOREGROUND = "BUNDLE_KEY_FOREGROUND";
    private int notificationId = DEFAULT_ROBOSPICE_NOTIFICATION_ID;
    private boolean foreground;
    private Class<? extends SpiceService> spiceServiceClass;
    private NotificationManager notificationManager;
    private SpiceManager spiceManager;

    public abstract SpiceNotification onCreateNotificationForServiceStopped();

    public abstract SpiceNotification onCreateNotificationForRequestSucceeded(CachedSpiceRequest<?> cachedSpiceRequest, SpiceServiceListener.RequestProcessingContext requestProcessingContext);

    public abstract SpiceNotification onCreateNotificationForRequestCancelled(CachedSpiceRequest<?> cachedSpiceRequest, SpiceServiceListener.RequestProcessingContext requestProcessingContext);

    public abstract SpiceNotification onCreateNotificationForRequestFailed(CachedSpiceRequest<?> cachedSpiceRequest, SpiceServiceListener.RequestProcessingContext requestProcessingContext);

    public abstract SpiceNotification onCreateNotificationForRequestProgressUpdate(CachedSpiceRequest<?> cachedSpiceRequest, SpiceServiceListener.RequestProcessingContext requestProcessingContext);

    public abstract SpiceNotification onCreateNotificationForRequestAdded(CachedSpiceRequest<?> cachedSpiceRequest, SpiceServiceListener.RequestProcessingContext requestProcessingContext);

    public abstract SpiceNotification onCreateNotificationForRequestAggregated(CachedSpiceRequest<?> cachedSpiceRequest, SpiceServiceListener.RequestProcessingContext requestProcessingContext);

    public abstract SpiceNotification onCreateNotificationForRequestNotFound(CachedSpiceRequest<?> cachedSpiceRequest, SpiceServiceListener.RequestProcessingContext requestProcessingContext);

    public abstract SpiceNotification onCreateNotificationForRequestProcessed(CachedSpiceRequest<?> cachedSpiceRequest, SpiceServiceListener.RequestProcessingContext requestProcessingContext);

    public static Intent createIntent(Context context, Class<? extends SpiceServiceListenerNotificationService> clazz, Class<? extends SpiceService> spiceServiceClass, int notificationId, boolean foreground) {
        Intent intent = new Intent(context, clazz);
        intent.putExtra("BUNDLE_KEY_NOTIFICATION_ID", notificationId);
        intent.putExtra("BUNDLE_KEY_SERVICE_CLASS", spiceServiceClass);
        intent.putExtra("BUNDLE_KEY_FOREGROUND", foreground);
        return intent;
    }

    @Override // android.app.Service
    public IBinder onBind(Intent intent) {
        return null;
    }

    public Class<? extends SpiceService> getSpiceServiceClass() {
        return this.spiceServiceClass;
    }

    @Override // android.app.Service
    public final void onStart(Intent intent, int startId) {
        super.onStart(intent, startId);
        if (intent == null) {
            return;
        }
        this.notificationId = intent.getIntExtra("BUNDLE_KEY_NOTIFICATION_ID", DEFAULT_ROBOSPICE_NOTIFICATION_ID);
        this.spiceServiceClass = (Class) intent.getSerializableExtra("BUNDLE_KEY_SERVICE_CLASS");
        if (this.spiceServiceClass == null) {
            throw new RuntimeException("Please specify a service class to monitor. Use #createIntent as helper.");
        }
        this.foreground = intent.getBooleanExtra("BUNDLE_KEY_FOREGROUND", true);
        this.spiceManager = new SpiceManager(this.spiceServiceClass);
        this.notificationManager = (NotificationManager) getSystemService("notification");
        this.spiceManager.start(this);
        this.spiceManager.addSpiceServiceListener(new NotificationSpiceServiceListener());
        if (this.foreground) {
            startForeground(this.notificationId, onCreateForegroundNotification());
        }
        Ln.d(getClass().getSimpleName() + " started.", new Object[0]);
    }

    @Override // android.app.Service
    public final void onDestroy() {
        this.spiceManager.shouldStop();
        super.onDestroy();
    }

    public Notification onCreateForegroundNotification() {
        throw new RuntimeException("If you use foreground = true, then you must override onCreateForegroundNotification().");
    }

    /* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/notification/SpiceServiceListenerNotificationService$SpiceNotification.class */
    public static class SpiceNotification {
        private int id;
        private Notification notification;

        public SpiceNotification(int id, Notification notification) {
            this.id = id;
            this.notification = notification;
        }

        public int getId() {
            return this.id;
        }

        public Notification getNotification() {
            return this.notification;
        }
    }

    /* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/notification/SpiceServiceListenerNotificationService$NotificationSpiceServiceListener.class */
    public class NotificationSpiceServiceListener implements SpiceServiceListener {
        public NotificationSpiceServiceListener() {
        }

        @Override // com.octo.android.robospice.request.listener.SpiceServiceListener
        public void onRequestSucceeded(CachedSpiceRequest<?> request, SpiceServiceListener.RequestProcessingContext requestProcessingContext) {
            SpiceNotification notification = SpiceServiceListenerNotificationService.this.onCreateNotificationForRequestSucceeded(request, requestProcessingContext);
            SpiceServiceListenerNotificationService.this.notificationManager.notify(notification.getId(), notification.getNotification());
        }

        @Override // com.octo.android.robospice.request.listener.SpiceServiceListener
        public void onRequestFailed(CachedSpiceRequest<?> request, SpiceServiceListener.RequestProcessingContext requestProcessingContext) {
            SpiceNotification notification = SpiceServiceListenerNotificationService.this.onCreateNotificationForRequestFailed(request, requestProcessingContext);
            SpiceServiceListenerNotificationService.this.notificationManager.notify(notification.getId(), notification.getNotification());
        }

        @Override // com.octo.android.robospice.request.listener.SpiceServiceListener
        public void onRequestCancelled(CachedSpiceRequest<?> request, SpiceServiceListener.RequestProcessingContext requestProcessingContext) {
            SpiceNotification notification = SpiceServiceListenerNotificationService.this.onCreateNotificationForRequestCancelled(request, requestProcessingContext);
            SpiceServiceListenerNotificationService.this.notificationManager.notify(notification.getId(), notification.getNotification());
        }

        @Override // com.octo.android.robospice.request.listener.SpiceServiceListener
        public void onRequestProgressUpdated(CachedSpiceRequest<?> request, SpiceServiceListener.RequestProcessingContext requestProcessingContext) {
            SpiceNotification notification = SpiceServiceListenerNotificationService.this.onCreateNotificationForRequestProgressUpdate(request, requestProcessingContext);
            SpiceServiceListenerNotificationService.this.notificationManager.notify(notification.getId(), notification.getNotification());
        }

        @Override // com.octo.android.robospice.request.listener.SpiceServiceListener
        public void onRequestAdded(CachedSpiceRequest<?> request, SpiceServiceListener.RequestProcessingContext requestProcessingContext) {
            SpiceNotification notification = SpiceServiceListenerNotificationService.this.onCreateNotificationForRequestAdded(request, requestProcessingContext);
            SpiceServiceListenerNotificationService.this.notificationManager.notify(notification.getId(), notification.getNotification());
        }

        @Override // com.octo.android.robospice.request.listener.SpiceServiceListener
        public void onRequestAggregated(CachedSpiceRequest<?> request, SpiceServiceListener.RequestProcessingContext requestProcessingContext) {
            SpiceNotification notification = SpiceServiceListenerNotificationService.this.onCreateNotificationForRequestAdded(request, requestProcessingContext);
            SpiceServiceListenerNotificationService.this.notificationManager.notify(notification.getId(), notification.getNotification());
        }

        @Override // com.octo.android.robospice.request.listener.SpiceServiceListener
        public void onRequestNotFound(CachedSpiceRequest<?> request, SpiceServiceListener.RequestProcessingContext requestProcessingContext) {
            SpiceNotification notification = SpiceServiceListenerNotificationService.this.onCreateNotificationForRequestNotFound(request, requestProcessingContext);
            SpiceServiceListenerNotificationService.this.notificationManager.notify(notification.getId(), notification.getNotification());
        }

        @Override // com.octo.android.robospice.request.listener.SpiceServiceListener
        public void onRequestProcessed(CachedSpiceRequest<?> cachedSpiceRequest, SpiceServiceListener.RequestProcessingContext requestProcessingContext) {
            SpiceNotification notification = SpiceServiceListenerNotificationService.this.onCreateNotificationForRequestProcessed(cachedSpiceRequest, requestProcessingContext);
            SpiceServiceListenerNotificationService.this.notificationManager.notify(notification.getId(), notification.getNotification());
        }

        @Override // com.octo.android.robospice.request.listener.SpiceServiceListener
        public void onServiceStopped() {
            SpiceNotification notification = SpiceServiceListenerNotificationService.this.onCreateNotificationForServiceStopped();
            SpiceServiceListenerNotificationService.this.notificationManager.notify(notification.getId(), notification.getNotification());
            SpiceServiceListenerNotificationService.this.stopSelf();
        }
    }
}
