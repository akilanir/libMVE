package com.octo.android.robospice.notification;

import android.app.Notification;
import android.app.NotificationManager;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.os.IBinder;
import com.octo.android.robospice.SpiceManager;
import com.octo.android.robospice.SpiceService;
import com.octo.android.robospice.persistence.exception.SpiceException;
import com.octo.android.robospice.request.listener.RequestListener;
import com.octo.android.robospice.request.listener.RequestProgress;
import com.octo.android.robospice.request.listener.RequestProgressListener;
import com.octo.android.robospice.request.listener.RequestStatus;

/* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/notification/SpiceNotificationService.class */
public abstract class SpiceNotificationService extends Service {
    private static final int DEFAULT_ROBOSPICE_NOTIFICATION_ID = 70;
    public static final String BUNDLE_KEY_NOTIFICATION_ID = "BUNDLE_KEY_NOTIFICATION_ID";
    public static final String BUNDLE_KEY_REQUEST_CACHE_KEY = "BUNDLE_KEY_REQUEST_CACHE_KEY";
    public static final String BUNDLE_KEY_REQUEST_CLASS = "BUNDLE_KEY_REQUEST_CLASS";
    public static final String BUNDLE_KEY_SERVICE_CLASS = "BUNDLE_KEY_SERVICE_CLASS";
    public static final String BUNDLE_KEY_FOREGROUND = "BUNDLE_KEY_FOREGROUND";
    private int notificationId = DEFAULT_ROBOSPICE_NOTIFICATION_ID;
    private Class<?> requestClass;
    private String requestCacheKey;
    private boolean foreground;
    private Class<? extends SpiceService> spiceServiceClass;
    private NotificationManager notificationManager;
    private SpiceManager spiceManager;

    public abstract Notification onCreateNotificationForRequestFailure(SpiceException spiceException);

    public abstract Notification onCreateNotificationForRequestSuccess();

    public abstract Notification onCreateNotificationForRequestProgress(RequestProgress requestProgress);

    public static Intent createIntent(Context context, Class<? extends SpiceNotificationService> clazz, Class<? extends SpiceService> spiceServiceClass, int notificationId, Class<?> requestResultType, String cacheKey, boolean foreground) {
        Intent intent = new Intent(context, clazz);
        intent.putExtra("BUNDLE_KEY_NOTIFICATION_ID", notificationId);
        intent.putExtra("BUNDLE_KEY_SERVICE_CLASS", spiceServiceClass);
        intent.putExtra("BUNDLE_KEY_REQUEST_CLASS", requestResultType);
        intent.putExtra("BUNDLE_KEY_REQUEST_CACHE_KEY", cacheKey);
        intent.putExtra("BUNDLE_KEY_FOREGROUND", foreground);
        return intent;
    }

    @Override // android.app.Service
    public IBinder onBind(Intent intent) {
        return null;
    }

    @Override // android.app.Service
    public final void onStart(Intent intent, int startId) {
        super.onStart(intent, startId);
        this.notificationId = intent.getIntExtra("BUNDLE_KEY_NOTIFICATION_ID", DEFAULT_ROBOSPICE_NOTIFICATION_ID);
        this.requestClass = (Class) intent.getSerializableExtra("BUNDLE_KEY_REQUEST_CLASS");
        this.requestCacheKey = intent.getStringExtra("BUNDLE_KEY_REQUEST_CACHE_KEY");
        this.spiceServiceClass = (Class) intent.getSerializableExtra("BUNDLE_KEY_SERVICE_CLASS");
        if (this.spiceServiceClass == null) {
            throw new RuntimeException("Please specify a service class to monitor. Use #createIntent as helper.");
        }
        this.foreground = intent.getBooleanExtra("BUNDLE_KEY_FOREGROUND", true);
        this.spiceManager = new SpiceManager(this.spiceServiceClass);
        this.notificationManager = (NotificationManager) getSystemService("notification");
        this.spiceManager.start(this);
        this.spiceManager.addListenerIfPending(this.requestClass, this.requestCacheKey, new NotificationRequestListener());
        if (this.foreground) {
            startForeground(this.notificationId, onCreateForegroundNotification());
        }
    }

    @Override // android.app.Service
    public final void onDestroy() {
        this.spiceManager.shouldStop();
        super.onDestroy();
    }

    public Notification onCreateForegroundNotification() {
        throw new RuntimeException("If you use foreground = true, then you must override onCreateForegroundNotification().");
    }

    /* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/notification/SpiceNotificationService$NotificationRequestListener.class */
    private class NotificationRequestListener<T> implements RequestListener<T>, RequestProgressListener {
        private NotificationRequestListener() {
        }

        @Override // com.octo.android.robospice.request.listener.RequestListener
        public void onRequestFailure(SpiceException arg0) {
            Notification notification = SpiceNotificationService.this.onCreateNotificationForRequestFailure(arg0);
            SpiceNotificationService.this.notificationManager.notify(SpiceNotificationService.this.notificationId, notification);
            SpiceNotificationService.this.stopSelf();
        }

        @Override // com.octo.android.robospice.request.listener.RequestListener
        public void onRequestSuccess(T result) {
            Notification notification = SpiceNotificationService.this.onCreateNotificationForRequestSuccess();
            SpiceNotificationService.this.notificationManager.notify(SpiceNotificationService.this.notificationId, notification);
            SpiceNotificationService.this.stopSelf();
        }

        @Override // com.octo.android.robospice.request.listener.RequestProgressListener
        public void onRequestProgressUpdate(RequestProgress progress) {
            Notification notification = SpiceNotificationService.this.onCreateNotificationForRequestProgress(progress);
            SpiceNotificationService.this.notificationManager.notify(SpiceNotificationService.this.notificationId, notification);
            if (progress.getStatus() == RequestStatus.COMPLETE) {
                SpiceNotificationService.this.stopSelf();
            }
        }
    }
}
