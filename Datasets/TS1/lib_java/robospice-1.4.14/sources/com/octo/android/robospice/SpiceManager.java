package com.octo.android.robospice;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.IBinder;
import com.octo.android.robospice.SpiceService;
import com.octo.android.robospice.command.AddSpiceServiceListenerCommand;
import com.octo.android.robospice.command.GetAllCacheKeysCommand;
import com.octo.android.robospice.command.GetAllDataFromCacheCommand;
import com.octo.android.robospice.command.GetDataFromCacheCommand;
import com.octo.android.robospice.command.GetDateOfDataInCacheCommand;
import com.octo.android.robospice.command.IsDataInCacheCommand;
import com.octo.android.robospice.command.PutDataInCacheCommand;
import com.octo.android.robospice.command.RemoveAllDataFromCacheCommand;
import com.octo.android.robospice.command.RemoveDataClassFromCacheCommand;
import com.octo.android.robospice.command.RemoveDataFromCacheCommand;
import com.octo.android.robospice.command.RemoveSpiceServiceListenerCommand;
import com.octo.android.robospice.command.SetFailOnCacheErrorCommand;
import com.octo.android.robospice.persistence.exception.CacheCreationException;
import com.octo.android.robospice.persistence.exception.CacheLoadingException;
import com.octo.android.robospice.persistence.exception.CacheSavingException;
import com.octo.android.robospice.request.CachedSpiceRequest;
import com.octo.android.robospice.request.SpiceRequest;
import com.octo.android.robospice.request.listener.PendingRequestListener;
import com.octo.android.robospice.request.listener.RequestListener;
import com.octo.android.robospice.request.listener.SpiceServiceAdapter;
import com.octo.android.robospice.request.listener.SpiceServiceListener;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.IdentityHashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.PriorityBlockingQueue;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;
import roboguice.util.temp.Ln;

/* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/SpiceManager.class */
public class SpiceManager implements Runnable {
    protected static final String SPICE_MANAGER_THREAD_NAME_PREFIX = "SpiceManagerThread ";
    private static final int DEFAULT_THREAD_COUNT = 3;
    private static final int DELAY_WAIT_FOR_RUNNER_TO_STOP = 500;
    private final Class<? extends SpiceService> spiceServiceClass;
    private SpiceService spiceService;
    private WeakReference<Context> contextWeakReference;
    private ExecutorService executorService;
    protected Thread runner;
    private int spiceManagerThreadIndex;
    private SpiceServiceConnection spiceServiceConnection = new SpiceServiceConnection();
    private volatile boolean isStopped = true;
    protected final BlockingQueue<CachedSpiceRequest<?>> requestQueue = new PriorityBlockingQueue();
    private final Map<CachedSpiceRequest<?>, Set<RequestListener<?>>> mapRequestToLaunchToRequestListener = Collections.synchronizedMap(new IdentityHashMap());
    private final Map<CachedSpiceRequest<?>, Set<RequestListener<?>>> mapPendingRequestToRequestListener = Collections.synchronizedMap(new HashMap());
    private final ReentrantLock lockAcquireService = new ReentrantLock();
    private final Condition conditionServiceBound = this.lockAcquireService.newCondition();
    private final Condition conditionServiceUnbound = this.lockAcquireService.newCondition();
    private final ReentrantLock lockSendRequestsToService = new ReentrantLock();
    private final PendingRequestHandlerSpiceServiceListener removerSpiceServiceListener = new PendingRequestHandlerSpiceServiceListener();
    private volatile boolean isUnbinding = false;

    public SpiceManager(Class<? extends SpiceService> spiceServiceClass) {
        this.spiceServiceClass = spiceServiceClass;
    }

    protected int getThreadCount() {
        return 3;
    }

    public synchronized void start(Context context) {
        this.contextWeakReference = new WeakReference<>(context);
        if (isStarted()) {
            throw new IllegalStateException("Already started.");
        }
        this.executorService = Executors.newFixedThreadPool(getThreadCount(), new MinPriorityThreadFactory());
        StringBuilder append = new StringBuilder().append(SPICE_MANAGER_THREAD_NAME_PREFIX);
        int i = this.spiceManagerThreadIndex;
        this.spiceManagerThreadIndex = i + 1;
        this.runner = new Thread(this, append.append(i).toString());
        this.runner.setPriority(1);
        this.isStopped = false;
        this.runner.start();
        Ln.d("SpiceManager started.", new Object[0]);
    }

    public synchronized boolean isStarted() {
        return !this.isStopped;
    }

    public int getRequestToLaunchCount() {
        return this.mapRequestToLaunchToRequestListener.size();
    }

    public int getPendingRequestCount() {
        return this.mapPendingRequestToRequestListener.size();
    }

    private Context getContextReference() {
        return this.contextWeakReference.get();
    }

    @Override // java.lang.Runnable
    public void run() {
        if (!tryToStartService()) {
            Ln.d("Service was not started as Activity died prematurely", new Object[0]);
            this.isStopped = true;
            return;
        }
        bindToService();
        try {
            waitForServiceToBeBound();
            if (this.spiceService == null) {
                Ln.d("No spice service bound.", new Object[0]);
                return;
            }
            while (true) {
                if (this.requestQueue.isEmpty() && (this.isStopped || Thread.interrupted())) {
                    break;
                }
                try {
                    sendRequestToService(this.requestQueue.take());
                } catch (InterruptedException e) {
                    Ln.d("Interrupted while waiting for new request.", new Object[0]);
                }
            }
            Ln.d("SpiceManager request runner terminated. Requests count: %d, stopped %b, interrupted %b", new Object[]{Integer.valueOf(this.requestQueue.size()), Boolean.valueOf(this.isStopped), Boolean.valueOf(Thread.interrupted())});
        } catch (InterruptedException e2) {
            Ln.d(e2, "Interrupted while waiting for acquiring service.", new Object[0]);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:11:0x0081 A[Catch: all -> 0x0095, TryCatch #0 {all -> 0x0095, blocks: (B:5:0x000b, B:7:0x0012, B:9:0x0019, B:10:0x0046, B:11:0x0081), top: B:19:0x000b }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void sendRequestToService(com.octo.android.robospice.request.CachedSpiceRequest<?> r5) {
        /*
            r4 = this;
            r0 = r4
            java.util.concurrent.locks.ReentrantLock r0 = r0.lockSendRequestsToService
            r0.lock()
            r0 = r5
            if (r0 == 0) goto L81
            r0 = r4
            com.octo.android.robospice.SpiceService r0 = r0.spiceService     // Catch: java.lang.Throwable -> L95
            if (r0 == 0) goto L81
            r0 = r4
            boolean r0 = r0.isStopped     // Catch: java.lang.Throwable -> L95
            if (r0 == 0) goto L46
            java.lang.StringBuilder r0 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> L95
            r1 = r0
            r1.<init>()     // Catch: java.lang.Throwable -> L95
            java.lang.String r1 = "Sending request to service without listeners : "
            java.lang.StringBuilder r0 = r0.append(r1)     // Catch: java.lang.Throwable -> L95
            r1 = r5
            java.lang.Class r1 = r1.getClass()     // Catch: java.lang.Throwable -> L95
            java.lang.String r1 = r1.getSimpleName()     // Catch: java.lang.Throwable -> L95
            java.lang.StringBuilder r0 = r0.append(r1)     // Catch: java.lang.Throwable -> L95
            java.lang.String r0 = r0.toString()     // Catch: java.lang.Throwable -> L95
            r1 = 0
            java.lang.Object[] r1 = new java.lang.Object[r1]     // Catch: java.lang.Throwable -> L95
            int r0 = roboguice.util.temp.Ln.d(r0, r1)     // Catch: java.lang.Throwable -> L95
            r0 = r4
            com.octo.android.robospice.SpiceService r0 = r0.spiceService     // Catch: java.lang.Throwable -> L95
            r1 = r5
            r2 = 0
            r0.addRequest(r1, r2)     // Catch: java.lang.Throwable -> L95
            goto L8b
        L46:
            r0 = r4
            java.util.Map<com.octo.android.robospice.request.CachedSpiceRequest<?>, java.util.Set<com.octo.android.robospice.request.listener.RequestListener<?>>> r0 = r0.mapRequestToLaunchToRequestListener     // Catch: java.lang.Throwable -> L95
            r1 = r5
            java.lang.Object r0 = r0.get(r1)     // Catch: java.lang.Throwable -> L95
            java.util.Set r0 = (java.util.Set) r0     // Catch: java.lang.Throwable -> L95
            r6 = r0
            java.lang.StringBuilder r0 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> L95
            r1 = r0
            r1.<init>()     // Catch: java.lang.Throwable -> L95
            java.lang.String r1 = "Sending request to service : "
            java.lang.StringBuilder r0 = r0.append(r1)     // Catch: java.lang.Throwable -> L95
            r1 = r5
            java.lang.Class r1 = r1.getClass()     // Catch: java.lang.Throwable -> L95
            java.lang.String r1 = r1.getSimpleName()     // Catch: java.lang.Throwable -> L95
            java.lang.StringBuilder r0 = r0.append(r1)     // Catch: java.lang.Throwable -> L95
            java.lang.String r0 = r0.toString()     // Catch: java.lang.Throwable -> L95
            r1 = 0
            java.lang.Object[] r1 = new java.lang.Object[r1]     // Catch: java.lang.Throwable -> L95
            int r0 = roboguice.util.temp.Ln.d(r0, r1)     // Catch: java.lang.Throwable -> L95
            r0 = r4
            com.octo.android.robospice.SpiceService r0 = r0.spiceService     // Catch: java.lang.Throwable -> L95
            r1 = r5
            r2 = r6
            r0.addRequest(r1, r2)     // Catch: java.lang.Throwable -> L95
            goto L8b
        L81:
            java.lang.String r0 = "Service or request was null"
            r1 = 0
            java.lang.Object[] r1 = new java.lang.Object[r1]     // Catch: java.lang.Throwable -> L95
            int r0 = roboguice.util.temp.Ln.d(r0, r1)     // Catch: java.lang.Throwable -> L95
        L8b:
            r0 = r4
            java.util.concurrent.locks.ReentrantLock r0 = r0.lockSendRequestsToService
            r0.unlock()
            goto L9f
        L95:
            r7 = move-exception
            r0 = r4
            java.util.concurrent.locks.ReentrantLock r0 = r0.lockSendRequestsToService
            r0.unlock()
            r0 = r7
            throw r0
        L9f:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.octo.android.robospice.SpiceManager.sendRequestToService(com.octo.android.robospice.request.CachedSpiceRequest):void");
    }

    public synchronized void shouldStop() {
        try {
            shouldStopAndJoin(500L);
        } catch (InterruptedException e) {
            Ln.e(e, "Exception when joining the runner that was stopping.", new Object[0]);
        }
    }

    public synchronized void shouldStopAndJoin(long timeOut) throws InterruptedException {
        if (!isStarted()) {
            throw new IllegalStateException("Not started yet");
        }
        Ln.d("SpiceManager stopping. Joining", new Object[0]);
        this.isStopped = true;
        dontNotifyAnyRequestListenersInternal();
        if (this.requestQueue.isEmpty()) {
            this.runner.interrupt();
        }
        long start = System.currentTimeMillis();
        try {
            try {
                this.runner.join(timeOut);
                long end = System.currentTimeMillis();
                Ln.d("Runner join time (ms) when should stop %d", new Object[]{Long.valueOf(end - start)});
                unbindFromService();
                this.runner = null;
                this.executorService.shutdown();
                this.contextWeakReference.clear();
                Ln.d("SpiceManager stopped.", new Object[0]);
            } catch (InterruptedException e) {
                throw e;
            }
        } catch (Throwable th) {
            long end2 = System.currentTimeMillis();
            Ln.d("Runner join time (ms) when should stop %d", new Object[]{Long.valueOf(end2 - start)});
            throw th;
        }
    }

    public <T> void getFromCache(Class<T> clazz, Object requestCacheKey, long cacheExpiryDuration, RequestListener<T> requestListener) {
        SpiceRequest<T> request = new SpiceRequest<T>(clazz) { // from class: com.octo.android.robospice.SpiceManager.1
            @Override // com.octo.android.robospice.request.SpiceRequest
            public T loadDataFromNetwork() throws Exception {
                return null;
            }

            @Override // com.octo.android.robospice.request.SpiceRequest
            public boolean isAggregatable() {
                return false;
            }
        };
        CachedSpiceRequest<T> cachedSpiceRequest = new CachedSpiceRequest<>(request, requestCacheKey, cacheExpiryDuration);
        cachedSpiceRequest.setOffline(true);
        execute((CachedSpiceRequest) cachedSpiceRequest, (RequestListener) requestListener);
    }

    @Deprecated
    public <T> void addListenerIfPending(Class<T> clazz, Object requestCacheKey, RequestListener<T> requestListener) {
        SpiceRequest<T> request = new SpiceRequest<T>(clazz) { // from class: com.octo.android.robospice.SpiceManager.2
            @Override // com.octo.android.robospice.request.SpiceRequest
            public T loadDataFromNetwork() throws Exception {
                return null;
            }
        };
        CachedSpiceRequest<T> cachedSpiceRequest = new CachedSpiceRequest<>(request, requestCacheKey, -1L);
        cachedSpiceRequest.setProcessable(false);
        execute((CachedSpiceRequest) cachedSpiceRequest, (RequestListener) requestListener);
    }

    public <T> void addListenerIfPending(Class<T> clazz, Object requestCacheKey, PendingRequestListener<T> requestListener) {
        addListenerIfPending((Class) clazz, requestCacheKey, (RequestListener) requestListener);
    }

    public <T> void execute(SpiceRequest<T> request, RequestListener<T> requestListener) {
        CachedSpiceRequest<T> cachedSpiceRequest = new CachedSpiceRequest<>(request, null, 0L);
        execute((CachedSpiceRequest) cachedSpiceRequest, (RequestListener) requestListener);
    }

    public <T> void execute(SpiceRequest<T> request, Object requestCacheKey, long cacheExpiryDuration, RequestListener<T> requestListener) {
        CachedSpiceRequest<T> cachedSpiceRequest = new CachedSpiceRequest<>(request, requestCacheKey, cacheExpiryDuration);
        execute((CachedSpiceRequest) cachedSpiceRequest, (RequestListener) requestListener);
    }

    public <T> void execute(CachedSpiceRequest<T> cachedSpiceRequest, RequestListener<T> requestListener) {
        addRequestListenerToListOfRequestListeners(cachedSpiceRequest, requestListener);
        Ln.d("adding request to request queue", new Object[0]);
        this.requestQueue.add(cachedSpiceRequest);
    }

    public <T> void getFromCacheAndLoadFromNetworkIfExpired(SpiceRequest<T> request, Object requestCacheKey, long cacheExpiryDuration, RequestListener<T> requestListener) {
        CachedSpiceRequest<T> cachedSpiceRequest = new CachedSpiceRequest<>(request, requestCacheKey, cacheExpiryDuration);
        cachedSpiceRequest.setAcceptingDirtyCache(true);
        execute((CachedSpiceRequest) cachedSpiceRequest, (RequestListener) requestListener);
    }

    public <U, T extends U> void putInCache(Class<U> clazz, Object requestCacheKey, final T data, RequestListener<U> listener) {
        SpiceRequest<U> spiceRequest = new SpiceRequest(clazz) { // from class: com.octo.android.robospice.SpiceManager.3
            /* JADX WARN: Type inference failed for: r0v1, types: [U, java.lang.Object] */
            @Override // com.octo.android.robospice.request.SpiceRequest
            public U loadDataFromNetwork() throws Exception {
                return data;
            }
        };
        CachedSpiceRequest<U> cachedSpiceRequest = new CachedSpiceRequest<>(spiceRequest, requestCacheKey, -1L);
        cachedSpiceRequest.setOffline(true);
        execute((CachedSpiceRequest) cachedSpiceRequest, (RequestListener) listener);
    }

    public <T> void putInCache(Class<? super T> clazz, Object requestCacheKey, T data) {
        putInCache(clazz, requestCacheKey, data, null);
    }

    public <T> void putInCache(Object requestCacheKey, T data, RequestListener<T> listener) {
        putInCache(data.getClass(), requestCacheKey, data, listener);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public <T> void putInCache(Object requestCacheKey, T data) {
        putInCache((Class<? super Object>) data.getClass(), requestCacheKey, (Object) data);
    }

    public <T> void cancel(Class<T> clazz, Object requestCacheKey) {
        SpiceRequest<T> request = new SpiceRequest<T>(clazz) { // from class: com.octo.android.robospice.SpiceManager.4
            @Override // com.octo.android.robospice.request.SpiceRequest
            public T loadDataFromNetwork() throws Exception {
                return null;
            }
        };
        CachedSpiceRequest<T> cachedSpiceRequest = new CachedSpiceRequest<>(request, requestCacheKey, -1L);
        cachedSpiceRequest.setProcessable(false);
        cachedSpiceRequest.setOffline(true);
        cachedSpiceRequest.cancel();
        execute((CachedSpiceRequest) cachedSpiceRequest, (RequestListener) null);
    }

    public void dontNotifyRequestListenersForRequest(final SpiceRequest<?> request) {
        this.executorService.execute(new Runnable() { // from class: com.octo.android.robospice.SpiceManager.5
            @Override // java.lang.Runnable
            public void run() {
                SpiceManager.this.dontNotifyRequestListenersForRequestInternal(request);
            }
        });
    }

    protected void dontNotifyRequestListenersForRequestInternal(SpiceRequest<?> request) {
        this.lockSendRequestsToService.lock();
        try {
            try {
                boolean requestNotPassedToServiceYet = removeListenersOfCachedRequestToLaunch(request);
                Ln.v("Removed from requests to launch list : " + requestNotPassedToServiceYet, new Object[0]);
                if (!requestNotPassedToServiceYet) {
                    removeListenersOfPendingCachedRequest(request);
                    Ln.v("Removed from pending requests list", new Object[0]);
                }
            } catch (InterruptedException e) {
                Ln.e(e, "Interrupted while removing listeners.", new Object[0]);
                this.lockSendRequestsToService.unlock();
            }
        } finally {
            this.lockSendRequestsToService.unlock();
        }
    }

    private boolean removeListenersOfCachedRequestToLaunch(SpiceRequest<?> request) {
        synchronized (this.mapRequestToLaunchToRequestListener) {
            for (CachedSpiceRequest<?> cachedSpiceRequest : this.mapRequestToLaunchToRequestListener.keySet()) {
                if (match(cachedSpiceRequest, request)) {
                    Set<RequestListener<?>> setRequestListeners = this.mapRequestToLaunchToRequestListener.get(cachedSpiceRequest);
                    setRequestListeners.clear();
                    return true;
                }
            }
            return false;
        }
    }

    private void removeListenersOfPendingCachedRequest(SpiceRequest<?> request) throws InterruptedException {
        synchronized (this.mapPendingRequestToRequestListener) {
            Iterator i$ = this.mapPendingRequestToRequestListener.keySet().iterator();
            while (true) {
                if (!i$.hasNext()) {
                    break;
                }
                CachedSpiceRequest<?> cachedSpiceRequest = i$.next();
                if (match(cachedSpiceRequest, request)) {
                    waitForServiceToBeBound();
                    if (this.spiceService == null) {
                        return;
                    }
                    Set<RequestListener<?>> setRequestListeners = this.mapPendingRequestToRequestListener.get(cachedSpiceRequest);
                    this.spiceService.dontNotifyRequestListenersForRequest(cachedSpiceRequest, setRequestListeners);
                    this.mapPendingRequestToRequestListener.remove(cachedSpiceRequest);
                }
            }
        }
    }

    public void dontNotifyAnyRequestListeners() {
        this.executorService.execute(new Runnable() { // from class: com.octo.android.robospice.SpiceManager.6
            @Override // java.lang.Runnable
            public void run() {
                SpiceManager.this.dontNotifyAnyRequestListenersInternal();
            }
        });
    }

    protected void dontNotifyAnyRequestListenersInternal() {
        this.lockSendRequestsToService.lock();
        try {
            try {
                if (this.spiceService == null) {
                    this.lockSendRequestsToService.unlock();
                    return;
                }
                synchronized (this.mapRequestToLaunchToRequestListener) {
                    if (!this.mapRequestToLaunchToRequestListener.isEmpty()) {
                        for (CachedSpiceRequest<?> cachedSpiceRequest : this.mapRequestToLaunchToRequestListener.keySet()) {
                            Set<RequestListener<?>> setRequestListeners = this.mapRequestToLaunchToRequestListener.get(cachedSpiceRequest);
                            if (setRequestListeners != null) {
                                Ln.d("Removing listeners of request to launch : " + cachedSpiceRequest.toString() + " : " + setRequestListeners.size(), new Object[0]);
                                this.spiceService.dontNotifyRequestListenersForRequest(cachedSpiceRequest, setRequestListeners);
                            }
                        }
                    }
                    this.mapRequestToLaunchToRequestListener.clear();
                }
                Ln.v("Cleared listeners of all requests to launch", new Object[0]);
                removeListenersOfAllPendingCachedRequests();
                this.lockSendRequestsToService.unlock();
            } catch (InterruptedException e) {
                Ln.e(e, "Interrupted while removing listeners.", new Object[0]);
                this.lockSendRequestsToService.unlock();
            }
        } catch (Throwable th) {
            this.lockSendRequestsToService.unlock();
            throw th;
        }
    }

    private void removeListenersOfAllPendingCachedRequests() throws InterruptedException {
        synchronized (this.mapPendingRequestToRequestListener) {
            if (!this.mapPendingRequestToRequestListener.isEmpty()) {
                for (CachedSpiceRequest<?> cachedSpiceRequest : this.mapPendingRequestToRequestListener.keySet()) {
                    Set<RequestListener<?>> setRequestListeners = this.mapPendingRequestToRequestListener.get(cachedSpiceRequest);
                    if (setRequestListeners != null) {
                        Ln.d("Removing listeners of pending request : " + cachedSpiceRequest.toString() + " : " + setRequestListeners.size(), new Object[0]);
                        this.spiceService.dontNotifyRequestListenersForRequest(cachedSpiceRequest, setRequestListeners);
                    }
                }
                this.mapPendingRequestToRequestListener.clear();
            }
        }
        Ln.v("Cleared listeners of all pending requests", new Object[0]);
    }

    private boolean match(CachedSpiceRequest<?> cachedSpiceRequest, SpiceRequest<?> spiceRequest) {
        return spiceRequest instanceof CachedSpiceRequest ? spiceRequest == cachedSpiceRequest : cachedSpiceRequest.getSpiceRequest() == spiceRequest;
    }

    public void cancel(SpiceRequest<?> request) {
        request.cancel();
    }

    public void cancelAllRequests() {
        this.executorService.execute(new Runnable() { // from class: com.octo.android.robospice.SpiceManager.7
            @Override // java.lang.Runnable
            public void run() {
                SpiceManager.this.cancelAllRequestsInternal();
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void cancelAllRequestsInternal() {
        this.lockSendRequestsToService.lock();
        try {
            synchronized (this.mapRequestToLaunchToRequestListener) {
                for (CachedSpiceRequest<?> cachedSpiceRequest : this.mapRequestToLaunchToRequestListener.keySet()) {
                    cachedSpiceRequest.cancel();
                }
            }
            List<CachedSpiceRequest<?>> listDuplicate = new ArrayList<>(this.mapPendingRequestToRequestListener.keySet());
            for (CachedSpiceRequest<?> cachedSpiceRequest2 : listDuplicate) {
                cachedSpiceRequest2.cancel();
            }
        } finally {
            this.lockSendRequestsToService.unlock();
        }
    }

    public void addSpiceServiceListener(SpiceServiceListener spiceServiceListener) {
        executeCommand(new AddSpiceServiceListenerCommand(this, spiceServiceListener));
    }

    public void removeSpiceServiceListener(SpiceServiceListener spiceServiceListener) {
        executeCommand(new RemoveSpiceServiceListenerCommand(this, spiceServiceListener));
    }

    public Future<List<Object>> getAllCacheKeys(Class<?> clazz) {
        return executeCommand(new GetAllCacheKeysCommand(this, clazz));
    }

    public <T> Future<List<T>> getAllDataFromCache(Class<T> clazz) throws CacheLoadingException {
        return executeCommand(new GetAllDataFromCacheCommand(this, clazz));
    }

    public <T> Future<T> getDataFromCache(Class<T> clazz, Object cacheKey) throws CacheLoadingException {
        return executeCommand(new GetDataFromCacheCommand(this, clazz, cacheKey));
    }

    public <T> Future<T> putDataInCache(Object cacheKey, T data) throws CacheSavingException, CacheCreationException {
        return executeCommand(new PutDataInCacheCommand(this, data, cacheKey));
    }

    public Future<Boolean> isDataInCache(Class<?> clazz, Object cacheKey, long cacheExpiryDuration) throws CacheCreationException {
        return executeCommand(new IsDataInCacheCommand(this, clazz, cacheKey, cacheExpiryDuration));
    }

    public Future<Date> getDateOfDataInCache(Class<?> clazz, Object cacheKey) throws CacheCreationException {
        return executeCommand(new GetDateOfDataInCacheCommand(this, clazz, cacheKey));
    }

    public <T> Future<?> removeDataFromCache(Class<T> clazz, Object cacheKey) {
        if (clazz == null || cacheKey == null) {
            throw new IllegalArgumentException("Both parameters must be non null.");
        }
        return executeCommand(new RemoveDataFromCacheCommand(this, clazz, cacheKey));
    }

    public <T> Future<?> removeDataFromCache(Class<T> clazz) {
        if (clazz == null) {
            throw new IllegalArgumentException("Clazz must be non null.");
        }
        return executeCommand(new RemoveDataClassFromCacheCommand(this, clazz));
    }

    public Future<?> removeAllDataFromCache() {
        return executeCommand(new RemoveAllDataFromCacheCommand(this));
    }

    public void setFailOnCacheError(boolean failOnCacheError) {
        executeCommand(new SetFailOnCacheErrorCommand(this, failOnCacheError));
    }

    private <T> void addRequestListenerToListOfRequestListeners(CachedSpiceRequest<T> cachedSpiceRequest, RequestListener<T> requestListener) {
        synchronized (this.mapRequestToLaunchToRequestListener) {
            Set<RequestListener<?>> listeners = this.mapRequestToLaunchToRequestListener.get(cachedSpiceRequest);
            if (listeners == null) {
                listeners = Collections.synchronizedSet(new HashSet());
                this.mapRequestToLaunchToRequestListener.put(cachedSpiceRequest, listeners);
            }
            listeners.add(requestListener);
        }
    }

    public void dumpState() {
        this.executorService.execute(new Runnable() { // from class: com.octo.android.robospice.SpiceManager.8
            @Override // java.lang.Runnable
            public void run() {
                SpiceManager.this.lockSendRequestsToService.lock();
                try {
                    try {
                        StringBuilder stringBuilder = new StringBuilder();
                        stringBuilder.append("[SpiceManager : ");
                        stringBuilder.append("Requests to be launched : \n");
                        SpiceManager.this.dumpMap(stringBuilder, SpiceManager.this.mapRequestToLaunchToRequestListener);
                        stringBuilder.append("Pending requests : \n");
                        SpiceManager.this.dumpMap(stringBuilder, SpiceManager.this.mapPendingRequestToRequestListener);
                        stringBuilder.append(']');
                        SpiceManager.this.waitForServiceToBeBound();
                        if (SpiceManager.this.spiceService == null) {
                            return;
                        }
                        SpiceManager.this.spiceService.dumpState();
                        SpiceManager.this.lockSendRequestsToService.unlock();
                    } catch (InterruptedException e) {
                        Ln.e(e, "Interrupted while waiting for acquiring service.", new Object[0]);
                        SpiceManager.this.lockSendRequestsToService.unlock();
                    }
                } finally {
                    SpiceManager.this.lockSendRequestsToService.unlock();
                }
            }
        });
    }

    /* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/SpiceManager$MinPriorityThreadFactory.class */
    private static final class MinPriorityThreadFactory implements ThreadFactory {
        private MinPriorityThreadFactory() {
        }

        @Override // java.util.concurrent.ThreadFactory
        public Thread newThread(Runnable arg0) {
            Thread t = new Thread(arg0);
            t.setPriority(1);
            return t;
        }
    }

    /* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/SpiceManager$SpiceServiceConnection.class */
    public class SpiceServiceConnection implements ServiceConnection {
        public SpiceServiceConnection() {
        }

        @Override // android.content.ServiceConnection
        public void onServiceConnected(ComponentName name, IBinder service) {
            SpiceManager.this.lockAcquireService.lock();
            try {
                if (service instanceof SpiceService.SpiceServiceBinder) {
                    SpiceManager.this.spiceService = ((SpiceService.SpiceServiceBinder) service).getSpiceService();
                    SpiceManager.this.spiceService.addSpiceServiceListener(SpiceManager.this.removerSpiceServiceListener);
                    Ln.d("Bound to service : " + SpiceManager.this.spiceService.getClass().getSimpleName(), new Object[0]);
                    SpiceManager.this.conditionServiceBound.signalAll();
                } else {
                    Ln.e("Unexpected IBinder service at onServiceConnected :%s ", new Object[]{service.getClass().getName()});
                }
            } finally {
                SpiceManager.this.lockAcquireService.unlock();
            }
        }

        @Override // android.content.ServiceConnection
        public void onServiceDisconnected(ComponentName name) {
            SpiceManager.this.lockAcquireService.lock();
            try {
                if (SpiceManager.this.spiceService != null) {
                    Ln.d("Unbound from service start : " + SpiceManager.this.spiceService.getClass().getSimpleName(), new Object[0]);
                    SpiceManager.this.spiceService = null;
                    SpiceManager.this.isUnbinding = false;
                    SpiceManager.this.conditionServiceUnbound.signalAll();
                }
            } finally {
                SpiceManager.this.lockAcquireService.unlock();
            }
        }
    }

    /* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/SpiceManager$PendingRequestHandlerSpiceServiceListener.class */
    private class PendingRequestHandlerSpiceServiceListener extends SpiceServiceAdapter {
        private PendingRequestHandlerSpiceServiceListener() {
        }

        @Override // com.octo.android.robospice.request.listener.SpiceServiceAdapter, com.octo.android.robospice.request.listener.SpiceServiceListener
        public void onRequestAdded(CachedSpiceRequest<?> cachedSpiceRequest, SpiceServiceListener.RequestProcessingContext requestProcessingContext) {
            Set<RequestListener<?>> listeners = (Set) SpiceManager.this.mapRequestToLaunchToRequestListener.remove(cachedSpiceRequest);
            if (listeners != null) {
                SpiceManager.this.mapPendingRequestToRequestListener.put(cachedSpiceRequest, listeners);
            }
        }

        @Override // com.octo.android.robospice.request.listener.SpiceServiceAdapter, com.octo.android.robospice.request.listener.SpiceServiceListener
        public void onRequestAggregated(CachedSpiceRequest<?> cachedSpiceRequest, SpiceServiceListener.RequestProcessingContext requestProcessingContext) {
            Set<RequestListener<?>> listeners = (Set) SpiceManager.this.mapPendingRequestToRequestListener.get(cachedSpiceRequest);
            if (listeners == null) {
                listeners = Collections.synchronizedSet(new HashSet());
                SpiceManager.this.mapPendingRequestToRequestListener.put(cachedSpiceRequest, listeners);
            }
            Set<RequestListener<?>> listenersToLaunch = (Set) SpiceManager.this.mapRequestToLaunchToRequestListener.remove(cachedSpiceRequest);
            if (listenersToLaunch != null) {
                synchronized (SpiceManager.this.mapPendingRequestToRequestListener) {
                    listeners.addAll(listenersToLaunch);
                }
            }
        }

        @Override // com.octo.android.robospice.request.listener.SpiceServiceAdapter, com.octo.android.robospice.request.listener.SpiceServiceListener
        public void onRequestNotFound(CachedSpiceRequest<?> cachedSpiceRequest, SpiceServiceListener.RequestProcessingContext requestProcessingContext) {
            SpiceManager.this.mapRequestToLaunchToRequestListener.remove(cachedSpiceRequest);
        }

        @Override // com.octo.android.robospice.request.listener.SpiceServiceAdapter, com.octo.android.robospice.request.listener.SpiceServiceListener
        public void onRequestProcessed(CachedSpiceRequest<?> cachedSpiceRequest, SpiceServiceListener.RequestProcessingContext requestProcessingContext) {
            SpiceManager.this.mapPendingRequestToRequestListener.remove(cachedSpiceRequest);
        }
    }

    protected boolean isBound() {
        return this.spiceService != null;
    }

    private boolean tryToStartService() {
        boolean success = false;
        Context context = getContextReference();
        if (context != null) {
            checkServiceIsProperlyDeclaredInAndroidManifest(context);
            Intent intent = new Intent(context, this.spiceServiceClass);
            context.startService(intent);
            success = true;
        }
        return success;
    }

    private void bindToService() {
        Context context = getContextReference();
        if (context != null) {
            if (this.requestQueue.isEmpty() && this.isStopped) {
                return;
            }
            this.lockAcquireService.lock();
            this.lockSendRequestsToService.lock();
            try {
                try {
                    if (this.spiceService == null) {
                        Intent intentService = new Intent(context, this.spiceServiceClass);
                        Ln.v("Binding to service.", new Object[0]);
                        this.spiceServiceConnection = new SpiceServiceConnection();
                        boolean bound = context.getApplicationContext().bindService(intentService, this.spiceServiceConnection, 1);
                        if (!bound) {
                            Ln.v("Binding to service failed.", new Object[0]);
                        } else {
                            Ln.v("Binding to service succeeded.", new Object[0]);
                        }
                    }
                    this.lockSendRequestsToService.unlock();
                    this.lockAcquireService.unlock();
                } catch (Exception t) {
                    Ln.d(t, "Binding to service failed.", new Object[0]);
                    Ln.d("Context is" + context, new Object[0]);
                    Ln.d("ApplicationContext is " + context.getApplicationContext(), new Object[0]);
                    this.lockSendRequestsToService.unlock();
                    this.lockAcquireService.unlock();
                }
            } catch (Throwable th) {
                this.lockSendRequestsToService.unlock();
                this.lockAcquireService.unlock();
                throw th;
            }
        }
    }

    private void unbindFromService() {
        Context context = getContextReference();
        if (context == null) {
            return;
        }
        this.lockAcquireService.lock();
        this.lockSendRequestsToService.lock();
        try {
            try {
                Ln.v("Unbinding from service start.", new Object[0]);
                if (this.spiceService != null && !this.isUnbinding) {
                    this.isUnbinding = true;
                    this.spiceService.removeSpiceServiceListener(this.removerSpiceServiceListener);
                    Ln.v("Unbinding from service.", new Object[0]);
                    context.getApplicationContext().unbindService(this.spiceServiceConnection);
                    Ln.d("Unbound from service : " + this.spiceService.getClass().getSimpleName(), new Object[0]);
                    this.spiceService = null;
                    this.isUnbinding = false;
                }
                this.lockSendRequestsToService.unlock();
                this.lockAcquireService.unlock();
            } catch (Exception e) {
                Ln.e(e, "Could not unbind from service.", new Object[0]);
                this.lockSendRequestsToService.unlock();
                this.lockAcquireService.unlock();
            }
        } catch (Throwable th) {
            this.lockSendRequestsToService.unlock();
            this.lockAcquireService.unlock();
            throw th;
        }
    }

    protected void waitForServiceToBeBound() throws InterruptedException {
        Ln.d("Waiting for service to be bound.", new Object[0]);
        this.lockAcquireService.lock();
        while (this.spiceService == null && (!this.requestQueue.isEmpty() || !this.isStopped)) {
            try {
                this.conditionServiceBound.await();
            } catch (Throwable th) {
                this.lockAcquireService.unlock();
                throw th;
            }
        }
        Ln.d("Bound ok.", new Object[0]);
        this.lockAcquireService.unlock();
    }

    protected void waitForServiceToBeUnbound() throws InterruptedException {
        Ln.d("Waiting for service to be unbound.", new Object[0]);
        this.lockAcquireService.lock();
        while (this.spiceService != null) {
            try {
                this.conditionServiceUnbound.await();
            } finally {
                this.lockAcquireService.unlock();
            }
        }
    }

    protected <T> Future<T> executeCommand(SpiceManagerCommand<T> spiceManagerCommand) {
        if (this.executorService == null || this.executorService.isShutdown()) {
            return null;
        }
        return this.executorService.submit(spiceManagerCommand);
    }

    private void checkServiceIsProperlyDeclaredInAndroidManifest(Context context) {
        Intent intentCheck = new Intent(context, this.spiceServiceClass);
        if (context.getPackageManager().queryIntentServices(intentCheck, 0).isEmpty()) {
            shouldStop();
            throw new RuntimeException("Impossible to start SpiceManager as no service of class : " + this.spiceServiceClass.getName() + " is registered in AndroidManifest.xml file !");
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void dumpMap(StringBuilder stringBuilder, Map<CachedSpiceRequest<?>, Set<RequestListener<?>>> map) {
        synchronized (map) {
            stringBuilder.append(" request count= ");
            stringBuilder.append(this.mapRequestToLaunchToRequestListener.keySet().size());
            stringBuilder.append(", listeners per requests = [");
            for (Map.Entry<CachedSpiceRequest<?>, Set<RequestListener<?>>> entry : map.entrySet()) {
                stringBuilder.append(entry.getKey().getClass().getName());
                stringBuilder.append(":");
                stringBuilder.append(entry.getKey());
                stringBuilder.append(" --> ");
                if (entry.getValue() == null) {
                    stringBuilder.append(entry.getValue());
                } else {
                    stringBuilder.append(entry.getValue().size());
                }
                stringBuilder.append(" listeners");
                stringBuilder.append('\n');
            }
            stringBuilder.append(']');
            stringBuilder.append('\n');
        }
    }

    /* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/SpiceManager$SpiceManagerCommand.class */
    public static abstract class SpiceManagerCommand<T> implements Callable<T> {
        protected SpiceManager spiceManager;
        private boolean successFull;
        private Exception exception;

        protected abstract T executeWhenBound(SpiceService spiceService) throws Exception;

        public SpiceManagerCommand(SpiceManager spiceManager) {
            this.spiceManager = spiceManager;
        }

        @Override // java.util.concurrent.Callable
        public T call() {
            try {
                this.spiceManager.waitForServiceToBeBound();
                if (this.spiceManager.spiceService != null) {
                    this.spiceManager.lockSendRequestsToService.lock();
                    try {
                        try {
                            if (this.spiceManager.spiceService == null || this.spiceManager.isStopped) {
                                return null;
                            }
                            T result = executeWhenBound(this.spiceManager.spiceService);
                            this.successFull = true;
                            this.spiceManager.lockSendRequestsToService.unlock();
                            return result;
                        } catch (Exception e) {
                            Ln.e(e);
                            this.exception = e;
                            this.spiceManager.lockSendRequestsToService.unlock();
                            return null;
                        }
                    } finally {
                        this.spiceManager.lockSendRequestsToService.unlock();
                    }
                }
                return null;
            } catch (InterruptedException e2) {
                Ln.e(e2, "Spice command %s couldn't bind to service.", new Object[]{getClass().getName()});
                return null;
            }
        }

        public boolean isSuccessFull() {
            return this.successFull;
        }

        public Exception getException() {
            return this.exception;
        }
    }
}
