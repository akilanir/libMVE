package okhttp3;

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Deque;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.SynchronousQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import okhttp3.RealCall;
import okhttp3.internal.Util;

/* loaded from: okhttp-3.2.0.jar:okhttp3/Dispatcher.class */
public final class Dispatcher {
    private ExecutorService executorService;
    private int maxRequests = 64;
    private int maxRequestsPerHost = 5;
    private final Deque<RealCall.AsyncCall> readyAsyncCalls = new ArrayDeque();
    private final Deque<RealCall.AsyncCall> runningAsyncCalls = new ArrayDeque();
    private final Deque<RealCall> runningSyncCalls = new ArrayDeque();

    public Dispatcher(ExecutorService executorService) {
        this.executorService = executorService;
    }

    public Dispatcher() {
    }

    public synchronized ExecutorService executorService() {
        if (this.executorService == null) {
            this.executorService = new ThreadPoolExecutor(0, Integer.MAX_VALUE, 60L, TimeUnit.SECONDS, new SynchronousQueue(), Util.threadFactory("OkHttp Dispatcher", false));
        }
        return this.executorService;
    }

    public synchronized void setMaxRequests(int maxRequests) {
        if (maxRequests < 1) {
            throw new IllegalArgumentException("max < 1: " + maxRequests);
        }
        this.maxRequests = maxRequests;
        promoteCalls();
    }

    public synchronized int getMaxRequests() {
        return this.maxRequests;
    }

    public synchronized void setMaxRequestsPerHost(int maxRequestsPerHost) {
        if (maxRequestsPerHost < 1) {
            throw new IllegalArgumentException("max < 1: " + maxRequestsPerHost);
        }
        this.maxRequestsPerHost = maxRequestsPerHost;
        promoteCalls();
    }

    public synchronized int getMaxRequestsPerHost() {
        return this.maxRequestsPerHost;
    }

    synchronized void enqueue(RealCall.AsyncCall call) {
        if (this.runningAsyncCalls.size() < this.maxRequests && runningCallsForHost(call) < this.maxRequestsPerHost) {
            this.runningAsyncCalls.add(call);
            executorService().execute(call);
        } else {
            this.readyAsyncCalls.add(call);
        }
    }

    public synchronized void cancelAll() {
        for (RealCall.AsyncCall call : this.readyAsyncCalls) {
            call.cancel();
        }
        for (RealCall.AsyncCall call2 : this.runningAsyncCalls) {
            call2.cancel();
        }
        for (RealCall call3 : this.runningSyncCalls) {
            call3.cancel();
        }
    }

    synchronized void finished(RealCall.AsyncCall call) {
        if (!this.runningAsyncCalls.remove(call)) {
            throw new AssertionError("AsyncCall wasn't running!");
        }
        promoteCalls();
    }

    private void promoteCalls() {
        if (this.runningAsyncCalls.size() < this.maxRequests && !this.readyAsyncCalls.isEmpty()) {
            Iterator<RealCall.AsyncCall> i = this.readyAsyncCalls.iterator();
            while (i.hasNext()) {
                RealCall.AsyncCall call = i.next();
                if (runningCallsForHost(call) < this.maxRequestsPerHost) {
                    i.remove();
                    this.runningAsyncCalls.add(call);
                    executorService().execute(call);
                }
                if (this.runningAsyncCalls.size() >= this.maxRequests) {
                    return;
                }
            }
        }
    }

    private int runningCallsForHost(RealCall.AsyncCall call) {
        int result = 0;
        for (RealCall.AsyncCall c : this.runningAsyncCalls) {
            if (c.host().equals(call.host())) {
                result++;
            }
        }
        return result;
    }

    synchronized void executed(RealCall call) {
        this.runningSyncCalls.add(call);
    }

    synchronized void finished(Call call) {
        if (!this.runningSyncCalls.remove(call)) {
            throw new AssertionError("Call wasn't in-flight!");
        }
    }

    public synchronized List<Call> queuedCalls() {
        List<Call> result = new ArrayList<>();
        for (RealCall.AsyncCall asyncCall : this.readyAsyncCalls) {
            result.add(asyncCall.get());
        }
        return Collections.unmodifiableList(result);
    }

    public synchronized List<Call> runningCalls() {
        List<Call> result = new ArrayList<>();
        result.addAll(this.runningSyncCalls);
        for (RealCall.AsyncCall asyncCall : this.runningAsyncCalls) {
            result.add(asyncCall.get());
        }
        return Collections.unmodifiableList(result);
    }

    public synchronized int queuedCallsCount() {
        return this.readyAsyncCalls.size();
    }

    public synchronized int runningCallsCount() {
        return this.runningAsyncCalls.size() + this.runningSyncCalls.size();
    }
}
