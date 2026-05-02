package com.octo.android.robospice;

import android.app.Application;
import android.app.Notification;
import android.app.PendingIntent;
import android.app.Service;
import android.content.Intent;
import android.os.Binder;
import android.os.Build;
import android.os.IBinder;
import com.octo.android.robospice.networkstate.DefaultNetworkStateChecker;
import com.octo.android.robospice.networkstate.NetworkStateChecker;
import com.octo.android.robospice.persistence.CacheManager;
import com.octo.android.robospice.persistence.exception.CacheCreationException;
import com.octo.android.robospice.persistence.exception.CacheLoadingException;
import com.octo.android.robospice.persistence.exception.CacheSavingException;
import com.octo.android.robospice.priority.PriorityThreadPoolExecutor;
import com.octo.android.robospice.request.CachedSpiceRequest;
import com.octo.android.robospice.request.DefaultRequestRunner;
import com.octo.android.robospice.request.RequestProcessor;
import com.octo.android.robospice.request.RequestProcessorListener;
import com.octo.android.robospice.request.RequestProgressManager;
import com.octo.android.robospice.request.RequestRunner;
import com.octo.android.robospice.request.listener.RequestListener;
import com.octo.android.robospice.request.listener.SpiceServiceListener;
import com.octo.android.robospice.request.notifier.DefaultRequestListenerNotifier;
import com.octo.android.robospice.request.notifier.RequestListenerNotifier;
import com.octo.android.robospice.request.notifier.SpiceServiceListenerNotifier;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.TimeUnit;
import roboguice.util.temp.Ln;

/* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/SpiceService.class */
public abstract class SpiceService extends Service {
    private static boolean isJUnit = false;
    protected static final int DEFAULT_NOTIFICATION_ID = 42;
    protected static final int DEFAULT_THREAD_COUNT = 1;
    protected static final int DEFAULT_THREAD_PRIORITY = 1;
    protected static final int DEFAULT_THREAD_KEEP_ALIVE_TIME = 0;
    private static final boolean DEFAULT_FAIL_ON_CACHE_ERROR = false;
    private RequestProcessor requestProcessor;
    private boolean isBound;
    private Notification notification;
    private CacheManager cacheManager;
    private boolean isCreated;
    private int currentPendingRequestCount = 0;
    private SpiceServiceBinder mSpiceServiceBinder = new SpiceServiceBinder(this);

    public abstract CacheManager createCacheManager(Application application) throws CacheCreationException;

    @Override // android.app.Service
    public void onCreate() {
        super.onCreate();
        try {
            this.cacheManager = createCacheManager(getApplication());
            if (this.cacheManager == null) {
                Ln.e(new CacheCreationException("createCacheManager() can't create a null cacheManager"));
                stopSelf();
                return;
            }
            RequestListenerNotifier progressReporter = createRequestRequestListenerNotifier();
            SpiceServiceListenerNotifier spiceServiceListenerNotifier = createSpiceServiceListenerNotifier();
            RequestProcessorListener requestProcessorListener = createRequestProcessorListener();
            ExecutorService executorService = getExecutorService();
            NetworkStateChecker networkStateChecker = getNetworkStateChecker();
            RequestProgressManager requestProgressManager = createRequestProgressManager(requestProcessorListener, progressReporter, spiceServiceListenerNotifier);
            RequestRunner requestRunner = createRequestRunner(executorService, networkStateChecker, requestProgressManager);
            this.requestProcessor = createRequestProcessor(this.cacheManager, requestProgressManager, requestRunner);
            this.requestProcessor.setFailOnCacheError(false);
            this.notification = createDefaultNotification();
            this.isCreated = true;
            Ln.d("SpiceService instance created.", new Object[0]);
        } catch (CacheCreationException e) {
            Ln.e(e);
            stopSelf();
        }
    }

    public boolean isCreated() {
        return this.isCreated;
    }

    private RequestRunner createRequestRunner(ExecutorService executorService, NetworkStateChecker networkStateChecker, RequestProgressManager requestProgressManager) {
        return new DefaultRequestRunner(getApplicationContext(), this.cacheManager, executorService, requestProgressManager, networkStateChecker);
    }

    private RequestProgressManager createRequestProgressManager(RequestProcessorListener requestProcessorListener, RequestListenerNotifier progressReporter, SpiceServiceListenerNotifier spiceServiceListenerNotifier) {
        return new RequestProgressManager(requestProcessorListener, progressReporter, spiceServiceListenerNotifier);
    }

    @Override // android.app.Service
    public int onStartCommand(Intent intent, int flags, int startId) {
        super.onStartCommand(intent, flags, startId);
        return 2;
    }

    protected RequestProcessor createRequestProcessor(CacheManager cacheManager, RequestProgressManager requestProgressManager, RequestRunner requestRunner) {
        return new RequestProcessor(cacheManager, requestProgressManager, requestRunner);
    }

    protected RequestProcessorListener createRequestProcessorListener() {
        return new SelfStopperRequestProcessorListener();
    }

    protected RequestProcessor getRequestProcessor() {
        return this.requestProcessor;
    }

    protected RequestListenerNotifier createRequestRequestListenerNotifier() {
        return new DefaultRequestListenerNotifier();
    }

    protected NetworkStateChecker getNetworkStateChecker() {
        return new DefaultNetworkStateChecker();
    }

    protected ExecutorService getExecutorService() {
        int coreThreadCount = getCoreThreadCount();
        int maxThreadCount = getMaximumThreadCount();
        int threadPriority = getThreadPriority();
        if (coreThreadCount <= 0 || maxThreadCount <= 0) {
            throw new IllegalArgumentException("Thread count must be >= 1");
        }
        PriorityThreadPoolExecutor executor = PriorityThreadPoolExecutor.getPriorityExecutor(coreThreadCount, maxThreadCount, threadPriority);
        executor.setKeepAliveTime(getKeepAliveTime(), TimeUnit.NANOSECONDS);
        if (Build.VERSION.SDK_INT >= 9) {
            executor.allowCoreThreadTimeOut(getKeepAliveTime() != 0 && isCoreThreadDisposable());
        }
        return executor;
    }

    protected SpiceServiceListenerNotifier createSpiceServiceListenerNotifier() {
        return new SpiceServiceListenerNotifier();
    }

    public Notification createDefaultNotification() {
        Notification notification;
        if (Build.VERSION.SDK_INT >= 16) {
            notification = new Notification.Builder(this).setSmallIcon(getApplicationInfo().icon).build();
        } else if (Build.VERSION.SDK_INT >= 11) {
            notification = new Notification.Builder(this).setSmallIcon(getApplicationInfo().icon).getNotification();
        } else {
            notification = new Notification();
            notification.icon = getApplicationInfo().icon;
            PendingIntent pendingIntent = PendingIntent.getActivity(getApplicationContext(), 0, new Intent(), 0);
            notification.setLatestEventInfo(this, "", "", pendingIntent);
            notification.tickerText = null;
            notification.when = System.currentTimeMillis();
        }
        if (Build.VERSION.SDK_INT >= 16) {
            notification.priority = -2;
        }
        return notification;
    }

    protected int getNotificationId() {
        return DEFAULT_NOTIFICATION_ID;
    }

    @Override // android.app.Service
    public void onDestroy() {
        this.requestProcessor.shouldStop();
        Ln.d("SpiceService instance destroyed.", new Object[0]);
        super.onDestroy();
    }

    public int getThreadCount() {
        return 1;
    }

    public int getCoreThreadCount() {
        return getThreadCount();
    }

    public int getMaximumThreadCount() {
        return getThreadCount();
    }

    public int getKeepAliveTime() {
        return 0;
    }

    public boolean isCoreThreadDisposable() {
        return true;
    }

    public int getThreadPriority() {
        return 1;
    }

    public void addRequest(CachedSpiceRequest<?> request, Set<RequestListener<?>> listRequestListener) {
        this.currentPendingRequestCount++;
        this.requestProcessor.addRequest(request, listRequestListener);
        showNotificationIfNotBoundAndHasPendingRequestsOtherwiseHideNotification();
    }

    public boolean removeDataFromCache(Class<?> clazz, Object cacheKey) {
        return this.requestProcessor.removeDataFromCache(clazz, cacheKey);
    }

    public void removeAllDataFromCache(Class<?> clazz) {
        this.requestProcessor.removeAllDataFromCache(clazz);
    }

    public <T> List<Object> getAllCacheKeys(Class<T> clazz) {
        return this.cacheManager.getAllCacheKeys(clazz);
    }

    public <T> List<T> loadAllDataFromCache(Class<T> clazz) throws CacheLoadingException, CacheCreationException {
        return this.cacheManager.loadAllDataFromCache(clazz);
    }

    public <T> T getDataFromCache(Class<T> cls, Object obj) throws CacheLoadingException, CacheCreationException {
        return (T) this.cacheManager.loadDataFromCache(cls, obj, 0L);
    }

    public <T> T putDataInCache(Object obj, T t) throws CacheSavingException, CacheCreationException {
        return (T) this.cacheManager.saveDataToCacheAndReturnData(t, obj);
    }

    public boolean isDataInCache(Class<?> clazz, Object cacheKey, long cacheExpiryDuration) throws CacheCreationException {
        return this.cacheManager.isDataInCache(clazz, cacheKey, cacheExpiryDuration);
    }

    public Date getDateOfDataInCache(Class<?> clazz, Object cacheKey) throws CacheLoadingException, CacheCreationException {
        return this.cacheManager.getDateOfDataInCache(clazz, cacheKey);
    }

    public void removeAllDataFromCache() {
        this.requestProcessor.removeAllDataFromCache();
    }

    public boolean isFailOnCacheError() {
        return this.requestProcessor.isFailOnCacheError();
    }

    public void setFailOnCacheError(boolean failOnCacheError) {
        this.requestProcessor.setFailOnCacheError(failOnCacheError);
    }

    public void dontNotifyRequestListenersForRequest(CachedSpiceRequest<?> request, Collection<RequestListener<?>> listRequestListener) {
        this.requestProcessor.dontNotifyRequestListenersForRequest(request, listRequestListener);
    }

    @Override // android.app.Service
    public IBinder onBind(Intent intent) {
        this.isBound = true;
        showNotificationIfNotBoundAndHasPendingRequestsOtherwiseHideNotification();
        return this.mSpiceServiceBinder;
    }

    @Override // android.app.Service
    public void onRebind(Intent intent) {
        this.isBound = true;
        showNotificationIfNotBoundAndHasPendingRequestsOtherwiseHideNotification();
        super.onRebind(intent);
    }

    @Override // android.app.Service
    public boolean onUnbind(Intent intent) {
        this.isBound = false;
        showNotificationIfNotBoundAndHasPendingRequestsOtherwiseHideNotification();
        stopIfNotBoundAndHasNoPendingRequests();
        return true;
    }

    /* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/SpiceService$SelfStopperRequestProcessorListener.class */
    protected final class SelfStopperRequestProcessorListener implements RequestProcessorListener {
        protected SelfStopperRequestProcessorListener() {
        }

        @Override // com.octo.android.robospice.request.RequestProcessorListener
        public void requestsInProgress() {
        }

        @Override // com.octo.android.robospice.request.RequestProcessorListener
        public void allRequestComplete() {
            SpiceService.this.currentPendingRequestCount = 0;
            SpiceService.this.stopIfNotBoundAndHasNoPendingRequests();
        }
    }

    /* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/SpiceService$SpiceServiceBinder.class */
    public static class SpiceServiceBinder extends Binder {
        private final SpiceService spiceService;

        public SpiceServiceBinder(SpiceService spiceService) {
            this.spiceService = spiceService;
        }

        public SpiceService getSpiceService() {
            return this.spiceService;
        }
    }

    public void dumpState() {
        Ln.v(this.requestProcessor.toString(), new Object[0]);
    }

    public void addSpiceServiceListener(SpiceServiceListener spiceServiceListener) {
        this.requestProcessor.addSpiceServiceListener(spiceServiceListener);
    }

    public void removeSpiceServiceListener(SpiceServiceListener spiceServiceListener) {
        this.requestProcessor.removeSpiceServiceListener(spiceServiceListener);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void stopIfNotBoundAndHasNoPendingRequests() {
        Ln.v("Pending requests : " + this.currentPendingRequestCount, new Object[0]);
        if (this.currentPendingRequestCount == 0 && !this.isBound) {
            stopSelf();
        }
    }

    private void showNotificationIfNotBoundAndHasPendingRequestsOtherwiseHideNotification() {
        if (this.notification == null || isJUnit) {
            return;
        }
        Ln.v("Pending requests : " + this.currentPendingRequestCount, new Object[0]);
        if (this.isBound || this.currentPendingRequestCount == 0) {
            Ln.v("Stop foreground", new Object[0]);
            stopForeground(true);
        } else {
            Ln.v("Start foreground", new Object[0]);
            startForeground(this.notification);
        }
    }

    private void startForeground(Notification notification) {
        try {
            Method setForegroundMethod = Service.class.getMethod("startForeground", Integer.TYPE, Notification.class);
            setForegroundMethod.invoke(this, Integer.valueOf(getNotificationId()), notification);
        } catch (IllegalAccessException e) {
            Ln.e(e, "Unable to start a service in foreground", new Object[0]);
        } catch (IllegalArgumentException e2) {
            Ln.e(e2, "Unable to start a service in foreground", new Object[0]);
        } catch (NoSuchMethodException e3) {
            Ln.e(e3, "Unable to start a service in foreground", new Object[0]);
        } catch (SecurityException e4) {
            Ln.e(e4, "Unable to start a service in foreground", new Object[0]);
        } catch (InvocationTargetException e5) {
            Ln.e(e5, "Unable to start a service in foreground", new Object[0]);
        }
    }

    public static final void setIsJunit(boolean b) {
        isJUnit = b;
    }
}
