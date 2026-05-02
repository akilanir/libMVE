package cz.msebera.android.httpclient.impl.client;

import cz.msebera.android.httpclient.client.methods.HttpUriRequest;
import java.util.concurrent.FutureTask;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/client/HttpRequestFutureTask.class */
public class HttpRequestFutureTask<V> extends FutureTask<V> {
    private final HttpUriRequest request;
    private final HttpRequestTaskCallable<V> callable;

    public HttpRequestFutureTask(HttpUriRequest request, HttpRequestTaskCallable<V> httpCallable) {
        super(httpCallable);
        this.request = request;
        this.callable = httpCallable;
    }

    @Override // java.util.concurrent.FutureTask, java.util.concurrent.Future
    public boolean cancel(boolean mayInterruptIfRunning) {
        this.callable.cancel();
        if (mayInterruptIfRunning) {
            this.request.abort();
        }
        return super.cancel(mayInterruptIfRunning);
    }

    public long scheduledTime() {
        return this.callable.getScheduled();
    }

    public long startedTime() {
        return this.callable.getStarted();
    }

    public long endedTime() {
        if (isDone()) {
            return this.callable.getEnded();
        }
        throw new IllegalStateException("Task is not done yet");
    }

    public long requestDuration() {
        if (isDone()) {
            return endedTime() - startedTime();
        }
        throw new IllegalStateException("Task is not done yet");
    }

    public long taskDuration() {
        if (isDone()) {
            return endedTime() - scheduledTime();
        }
        throw new IllegalStateException("Task is not done yet");
    }

    @Override // java.util.concurrent.FutureTask
    public String toString() {
        return this.request.getRequestLine().getUri();
    }
}
