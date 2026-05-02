package okhttp3;

import java.io.IOException;
import java.net.ProtocolException;
import java.util.logging.Level;
import okhttp3.Interceptor;
import okhttp3.Request;
import okhttp3.internal.Internal;
import okhttp3.internal.NamedRunnable;
import okhttp3.internal.http.HttpEngine;
import okhttp3.internal.http.RequestException;
import okhttp3.internal.http.RouteException;
import okhttp3.internal.http.StreamAllocation;

/* loaded from: okhttp-3.1.2.jar:okhttp3/RealCall.class */
final class RealCall implements Call {
    private final OkHttpClient client;
    private boolean executed;
    volatile boolean canceled;
    Request originalRequest;
    HttpEngine engine;

    protected RealCall(OkHttpClient client, Request originalRequest) {
        this.client = client;
        this.originalRequest = originalRequest;
    }

    @Override // okhttp3.Call
    public Request request() {
        return this.originalRequest;
    }

    @Override // okhttp3.Call
    public Response execute() throws IOException {
        synchronized (this) {
            if (this.executed) {
                throw new IllegalStateException("Already Executed");
            }
            this.executed = true;
        }
        try {
            this.client.dispatcher().executed(this);
            Response result = getResponseWithInterceptorChain(false);
            if (result == null) {
                throw new IOException("Canceled");
            }
            return result;
        } finally {
            this.client.dispatcher().finished(this);
        }
    }

    Object tag() {
        return this.originalRequest.tag();
    }

    @Override // okhttp3.Call
    public void enqueue(Callback responseCallback) {
        enqueue(responseCallback, false);
    }

    void enqueue(Callback responseCallback, boolean forWebSocket) {
        synchronized (this) {
            if (this.executed) {
                throw new IllegalStateException("Already Executed");
            }
            this.executed = true;
        }
        this.client.dispatcher().enqueue(new AsyncCall(responseCallback, forWebSocket));
    }

    @Override // okhttp3.Call
    public void cancel() {
        this.canceled = true;
        if (this.engine != null) {
            this.engine.cancel();
        }
    }

    @Override // okhttp3.Call
    public synchronized boolean isExecuted() {
        return this.executed;
    }

    @Override // okhttp3.Call
    public boolean isCanceled() {
        return this.canceled;
    }

    /* loaded from: okhttp-3.1.2.jar:okhttp3/RealCall$AsyncCall.class */
    final class AsyncCall extends NamedRunnable {
        private final Callback responseCallback;
        private final boolean forWebSocket;

        private AsyncCall(Callback responseCallback, boolean forWebSocket) {
            super("OkHttp %s", RealCall.this.originalRequest.url().toString());
            this.responseCallback = responseCallback;
            this.forWebSocket = forWebSocket;
        }

        String host() {
            return RealCall.this.originalRequest.url().host();
        }

        Request request() {
            return RealCall.this.originalRequest;
        }

        Object tag() {
            return RealCall.this.originalRequest.tag();
        }

        void cancel() {
            RealCall.this.cancel();
        }

        RealCall get() {
            return RealCall.this;
        }

        @Override // okhttp3.internal.NamedRunnable
        protected void execute() {
            try {
                Response response = RealCall.this.getResponseWithInterceptorChain(this.forWebSocket);
                if (RealCall.this.canceled) {
                    this.responseCallback.onFailure(RealCall.this, new IOException("Canceled"));
                } else {
                    this.responseCallback.onResponse(RealCall.this, response);
                }
            } catch (IOException e) {
                if (0 != 0) {
                    Internal.logger.log(Level.INFO, "Callback failure for " + RealCall.this.toLoggableString(), (Throwable) e);
                } else {
                    this.responseCallback.onFailure(RealCall.this, e);
                }
            } finally {
                RealCall.this.client.dispatcher().finished(this);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String toLoggableString() {
        String string = this.canceled ? "canceled call" : "call";
        HttpUrl redactedUrl = this.originalRequest.url().resolve("/...");
        return string + " to " + redactedUrl;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public Response getResponseWithInterceptorChain(boolean forWebSocket) throws IOException {
        Interceptor.Chain chain = new ApplicationInterceptorChain(0, this.originalRequest, forWebSocket);
        return chain.proceed(this.originalRequest);
    }

    /* loaded from: okhttp-3.1.2.jar:okhttp3/RealCall$ApplicationInterceptorChain.class */
    class ApplicationInterceptorChain implements Interceptor.Chain {
        private final int index;
        private final Request request;
        private final boolean forWebSocket;

        ApplicationInterceptorChain(int index, Request request, boolean forWebSocket) {
            this.index = index;
            this.request = request;
            this.forWebSocket = forWebSocket;
        }

        @Override // okhttp3.Interceptor.Chain
        public Connection connection() {
            return null;
        }

        @Override // okhttp3.Interceptor.Chain
        public Request request() {
            return this.request;
        }

        @Override // okhttp3.Interceptor.Chain
        public Response proceed(Request request) throws IOException {
            if (this.index < RealCall.this.client.interceptors().size()) {
                Interceptor.Chain chain = RealCall.this.new ApplicationInterceptorChain(this.index + 1, request, this.forWebSocket);
                Interceptor interceptor = RealCall.this.client.interceptors().get(this.index);
                Response interceptedResponse = interceptor.intercept(chain);
                if (interceptedResponse == null) {
                    throw new NullPointerException("application interceptor " + interceptor + " returned null");
                }
                return interceptedResponse;
            }
            return RealCall.this.getResponse(request, this.forWebSocket);
        }
    }

    /* JADX WARN: Finally extract failed */
    Response getResponse(Request request, boolean forWebSocket) throws IOException {
        Response response;
        Request followUp;
        RequestBody body = request.body();
        if (body != null) {
            Request.Builder requestBuilder = request.newBuilder();
            MediaType contentType = body.contentType();
            if (contentType != null) {
                requestBuilder.header("Content-Type", contentType.toString());
            }
            long contentLength = body.contentLength();
            if (contentLength != -1) {
                requestBuilder.header("Content-Length", Long.toString(contentLength));
                requestBuilder.removeHeader("Transfer-Encoding");
            } else {
                requestBuilder.header("Transfer-Encoding", "chunked");
                requestBuilder.removeHeader("Content-Length");
            }
            request = requestBuilder.build();
        }
        this.engine = new HttpEngine(this.client, request, false, false, forWebSocket, null, null, null);
        int followUpCount = 0;
        while (!this.canceled) {
            boolean releaseConnection = true;
            try {
                try {
                    this.engine.sendRequest();
                    this.engine.readResponse();
                    releaseConnection = false;
                    if (0 != 0) {
                        StreamAllocation streamAllocation = this.engine.close();
                        streamAllocation.release();
                    }
                    response = this.engine.getResponse();
                    followUp = this.engine.followUpRequest();
                } catch (IOException e) {
                    HttpEngine retryEngine = this.engine.recover(e, null);
                    if (retryEngine == null) {
                        throw e;
                    }
                    this.engine = retryEngine;
                    if (0 != 0) {
                        StreamAllocation streamAllocation2 = this.engine.close();
                        streamAllocation2.release();
                    }
                } catch (RequestException e2) {
                    throw e2.getCause();
                } catch (RouteException e3) {
                    HttpEngine retryEngine2 = this.engine.recover(e3.getLastConnectException(), null);
                    if (retryEngine2 == null) {
                        throw e3.getLastConnectException();
                    }
                    this.engine = retryEngine2;
                    if (0 != 0) {
                        StreamAllocation streamAllocation3 = this.engine.close();
                        streamAllocation3.release();
                    }
                }
                if (followUp == null) {
                    if (!forWebSocket) {
                        this.engine.releaseStreamAllocation();
                    }
                    return response;
                }
                StreamAllocation streamAllocation4 = this.engine.close();
                followUpCount++;
                if (followUpCount > 20) {
                    streamAllocation4.release();
                    throw new ProtocolException("Too many follow-up requests: " + followUpCount);
                }
                if (!this.engine.sameConnection(followUp.url())) {
                    streamAllocation4.release();
                    streamAllocation4 = null;
                }
                this.engine = new HttpEngine(this.client, followUp, false, false, forWebSocket, streamAllocation4, null, response);
            } catch (Throwable th) {
                if (releaseConnection) {
                    StreamAllocation streamAllocation5 = this.engine.close();
                    streamAllocation5.release();
                }
                throw th;
            }
        }
        this.engine.releaseStreamAllocation();
        throw new IOException("Canceled");
    }
}
