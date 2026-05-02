package com.octo.android.robospice.request;

import android.content.Context;
import com.octo.android.robospice.exception.NetworkException;
import com.octo.android.robospice.exception.NoNetworkException;
import com.octo.android.robospice.networkstate.NetworkStateChecker;
import com.octo.android.robospice.persistence.CacheManager;
import com.octo.android.robospice.persistence.exception.CacheCreationException;
import com.octo.android.robospice.persistence.exception.CacheLoadingException;
import com.octo.android.robospice.persistence.exception.CacheSavingException;
import com.octo.android.robospice.persistence.exception.SpiceException;
import com.octo.android.robospice.priority.PriorityRunnable;
import com.octo.android.robospice.request.listener.RequestProgressListener;
import com.octo.android.robospice.request.listener.RequestStatus;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Future;
import java.util.concurrent.locks.ReentrantLock;
import roboguice.util.temp.Ln;

/* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/request/DefaultRequestRunner.class */
public class DefaultRequestRunner implements RequestRunner {
    private ExecutorService executorService;
    private final CacheManager cacheManager;
    private final Context applicationContext;
    private boolean failOnCacheError;
    private final NetworkStateChecker networkStateChecker;
    private final RequestProgressManager requestProgressManager;
    private boolean isStopped;
    private ReentrantLock executorLock = new ReentrantLock();

    public DefaultRequestRunner(Context context, CacheManager cacheManager, ExecutorService executorService, RequestProgressManager requestProgressBroadcaster, NetworkStateChecker networkStateChecker) {
        this.executorService = null;
        this.applicationContext = context;
        this.cacheManager = cacheManager;
        this.networkStateChecker = networkStateChecker;
        this.executorService = executorService;
        this.requestProgressManager = requestProgressBroadcaster;
        this.networkStateChecker.checkPermissions(context);
    }

    @Override // com.octo.android.robospice.request.RequestRunner
    public void executeRequest(CachedSpiceRequest<?> request) {
        this.executorLock.lock();
        try {
            if (this.isStopped) {
                Ln.d("Dropping request : " + request + " as runner is stopped.", new Object[0]);
                this.executorLock.unlock();
            } else {
                planRequestExecution(request);
                this.executorLock.unlock();
            }
        } catch (Throwable th) {
            this.executorLock.unlock();
            throw th;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    protected <T> void processRequest(CachedSpiceRequest<T> request) {
        Object loadDataFromCache;
        long startTime = System.currentTimeMillis();
        Ln.d("Processing request : " + request, new Object[0]);
        RequestProgressListener requestProgressListener = this.requestProgressManager.createProgressListener(request);
        request.setRequestProgressListener(requestProgressListener);
        if (request.getRequestCacheKey() != null && request.getCacheDuration() != -1) {
            try {
                Ln.d("Loading request from cache : " + request, new Object[0]);
                request.setStatus(RequestStatus.READING_FROM_CACHE);
                Object loadDataFromCache2 = loadDataFromCache(request.getResultType(), request.getRequestCacheKey(), request.getCacheDuration());
                if (loadDataFromCache2 != null) {
                    Ln.d("Request loaded from cache : " + request + " result=" + loadDataFromCache2, new Object[0]);
                    this.requestProgressManager.notifyListenersOfRequestSuccess(request, loadDataFromCache2);
                    printRequestProcessingDuration(startTime, request);
                    return;
                } else if (request.isAcceptingDirtyCache() && (loadDataFromCache = loadDataFromCache(request.getResultType(), request.getRequestCacheKey(), 0L)) != null) {
                    this.requestProgressManager.notifyListenersOfRequestSuccessButDontCompleteRequest(request, loadDataFromCache);
                }
            } catch (SpiceException e) {
                Ln.d(e, "Cache file could not be read.", new Object[0]);
                if (this.failOnCacheError) {
                    handleRetry(request, e);
                    printRequestProcessingDuration(startTime, request);
                    return;
                } else {
                    this.cacheManager.removeDataFromCache(request.getResultType(), request.getRequestCacheKey());
                    Ln.d(e, "Cache file deleted.", new Object[0]);
                }
            }
        }
        Ln.d("Cache content not available or expired or disabled", new Object[0]);
        if (!this.networkStateChecker.isNetworkAvailable(this.applicationContext) && !request.isOffline()) {
            Ln.e("Network is down.", new Object[0]);
            if (!request.isCancelled()) {
                this.requestProgressManager.notifyListenersOfRequestFailure(request, new NoNetworkException());
            }
            printRequestProcessingDuration(startTime, request);
            return;
        }
        try {
            if (request.isCancelled()) {
                printRequestProcessingDuration(startTime, request);
                return;
            }
            Ln.d("Calling netwok request.", new Object[0]);
            request.setStatus(RequestStatus.LOADING_FROM_NETWORK);
            T result = request.loadDataFromNetwork();
            Ln.d("Network request call ended.", new Object[0]);
            if (result != null && request.getRequestCacheKey() != null) {
                try {
                    if (request.isCancelled()) {
                        printRequestProcessingDuration(startTime, request);
                        return;
                    }
                    Ln.d("Start caching content...", new Object[0]);
                    request.setStatus(RequestStatus.WRITING_TO_CACHE);
                    Object saveDataToCacheAndReturnData = saveDataToCacheAndReturnData(result, request.getRequestCacheKey());
                    if (request.isCancelled()) {
                        printRequestProcessingDuration(startTime, request);
                        return;
                    } else {
                        this.requestProgressManager.notifyListenersOfRequestSuccess(request, saveDataToCacheAndReturnData);
                        printRequestProcessingDuration(startTime, request);
                        return;
                    }
                } catch (SpiceException e2) {
                    Ln.d(e2, "An exception occurred during service execution :" + e2.getMessage(), new Object[0]);
                    if (this.failOnCacheError) {
                        handleRetry(request, e2);
                        printRequestProcessingDuration(startTime, request);
                        return;
                    } else {
                        if (request.isCancelled()) {
                            printRequestProcessingDuration(startTime, request);
                            return;
                        }
                        this.requestProgressManager.notifyListenersOfRequestSuccess(request, result);
                        this.cacheManager.removeDataFromCache(request.getResultType(), request.getRequestCacheKey());
                        Ln.d(e2, "Cache file deleted.", new Object[0]);
                        return;
                    }
                }
            }
            this.requestProgressManager.notifyListenersOfRequestSuccess(request, result);
            printRequestProcessingDuration(startTime, request);
        } catch (Exception e3) {
            if (!request.isCancelled()) {
                Ln.e(e3, "An exception occurred during request network execution :" + e3.getMessage(), new Object[0]);
                handleRetry(request, new NetworkException("Exception occurred during invocation of web service.", e3));
            } else {
                Ln.e("An exception occurred during request network execution but request was cancelled, so listeners are not called.", new Object[0]);
            }
            printRequestProcessingDuration(startTime, request);
        }
    }

    protected void planRequestExecution(final CachedSpiceRequest<?> request) {
        Future<?> future = this.executorService.submit(new PriorityRunnable() { // from class: com.octo.android.robospice.request.DefaultRequestRunner.1
            @Override // java.lang.Runnable
            public void run() {
                try {
                    try {
                        DefaultRequestRunner.this.processRequest(request);
                        request.setRequestCancellationListener(null);
                    } catch (Throwable t) {
                        Ln.d(t, "An unexpected error occurred when processsing request %s", new Object[]{request.toString()});
                        request.setRequestCancellationListener(null);
                    }
                } catch (Throwable th) {
                    request.setRequestCancellationListener(null);
                    throw th;
                }
            }

            @Override // com.octo.android.robospice.priority.PriorityRunnable
            public int getPriority() {
                return request.getPriority();
            }
        });
        request.setFuture(future);
    }

    @Override // com.octo.android.robospice.request.RequestRunner
    public boolean isFailOnCacheError() {
        return this.failOnCacheError;
    }

    @Override // com.octo.android.robospice.request.RequestRunner
    public void setFailOnCacheError(boolean failOnCacheError) {
        this.failOnCacheError = failOnCacheError;
    }

    @Override // com.octo.android.robospice.request.RequestRunner
    public void shouldStop() {
        this.executorLock.lock();
        try {
            this.isStopped = true;
            this.executorService.shutdown();
            this.executorLock.unlock();
        } catch (Throwable th) {
            this.executorLock.unlock();
            throw th;
        }
    }

    public boolean isStopped() {
        return this.isStopped;
    }

    private <T> T loadDataFromCache(Class<T> cls, Object obj, long j) throws CacheLoadingException, CacheCreationException {
        return (T) this.cacheManager.loadDataFromCache(cls, obj, j);
    }

    private <T> T saveDataToCacheAndReturnData(T t, Object obj) throws CacheSavingException, CacheCreationException {
        return (T) this.cacheManager.saveDataToCacheAndReturnData(t, obj);
    }

    private void handleRetry(final CachedSpiceRequest<?> request, SpiceException e) {
        if (request.getRetryPolicy() != null) {
            request.getRetryPolicy().retry(e);
            if (request.getRetryPolicy().getRetryCount() > 0) {
                new Thread(new Runnable() { // from class: com.octo.android.robospice.request.DefaultRequestRunner.2
                    @Override // java.lang.Runnable
                    public void run() {
                        try {
                            Thread.sleep(request.getRetryPolicy().getDelayBeforeRetry());
                            DefaultRequestRunner.this.executeRequest(request);
                        } catch (InterruptedException e2) {
                            Ln.e(e2, "Retry attempt failed for request " + request, new Object[0]);
                        }
                    }
                }).start();
                return;
            }
        }
        this.requestProgressManager.notifyListenersOfRequestFailure(request, e);
    }

    private static String getTimeString(long millis) {
        return String.format("%02d ms", Long.valueOf(millis));
    }

    private static void printRequestProcessingDuration(long startTime, CachedSpiceRequest<?> request) {
        Ln.d("It tooks %s to process request %s.", new Object[]{getTimeString(System.currentTimeMillis() - startTime), request.toString()});
    }
}
