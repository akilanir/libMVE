package com.squareup.okhttp;

import com.squareup.okhttp.Interceptor;
import com.squareup.okhttp.Request;
import com.squareup.okhttp.internal.Internal;
import com.squareup.okhttp.internal.NamedRunnable;
import com.squareup.okhttp.internal.http.HttpEngine;
import com.squareup.okhttp.internal.http.RequestException;
import com.squareup.okhttp.internal.http.RouteException;
import java.io.IOException;
import java.net.ProtocolException;
import java.util.logging.Level;

/* loaded from: okhttp-2.6.0.jar:com/squareup/okhttp/Call.class */
public class Call {
    private final OkHttpClient client;
    private boolean executed;
    volatile boolean canceled;
    Request originalRequest;
    HttpEngine engine;

    protected Call(OkHttpClient client, Request originalRequest) {
        this.client = client.copyWithDefaults();
        this.originalRequest = originalRequest;
    }

    public Response execute() throws IOException {
        synchronized (this) {
            if (this.executed) {
                throw new IllegalStateException("Already Executed");
            }
            this.executed = true;
        }
        try {
            this.client.getDispatcher().executed(this);
            Response result = getResponseWithInterceptorChain(false);
            if (result == null) {
                throw new IOException("Canceled");
            }
            return result;
        } finally {
            this.client.getDispatcher().finished(this);
        }
    }

    Object tag() {
        return this.originalRequest.tag();
    }

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
        this.client.getDispatcher().enqueue(new AsyncCall(responseCallback, forWebSocket));
    }

    public void cancel() {
        this.canceled = true;
        if (this.engine != null) {
            this.engine.disconnect();
        }
    }

    public boolean isCanceled() {
        return this.canceled;
    }

    /* loaded from: okhttp-2.6.0.jar:com/squareup/okhttp/Call$AsyncCall.class */
    final class AsyncCall extends NamedRunnable {
        private final Callback responseCallback;
        private final boolean forWebSocket;

        private AsyncCall(Callback responseCallback, boolean forWebSocket) {
            super("OkHttp %s", Call.this.originalRequest.urlString());
            this.responseCallback = responseCallback;
            this.forWebSocket = forWebSocket;
        }

        String host() {
            return Call.this.originalRequest.httpUrl().host();
        }

        Request request() {
            return Call.this.originalRequest;
        }

        Object tag() {
            return Call.this.originalRequest.tag();
        }

        void cancel() {
            Call.this.cancel();
        }

        Call get() {
            return Call.this;
        }

        @Override // com.squareup.okhttp.internal.NamedRunnable
        protected void execute() {
            try {
                try {
                    Response response = Call.this.getResponseWithInterceptorChain(this.forWebSocket);
                    if (Call.this.canceled) {
                        this.responseCallback.onFailure(Call.this.originalRequest, new IOException("Canceled"));
                    } else {
                        this.responseCallback.onResponse(response);
                    }
                    Call.this.client.getDispatcher().finished(this);
                } catch (IOException e) {
                    if (0 != 0) {
                        Internal.logger.log(Level.INFO, "Callback failure for " + Call.this.toLoggableString(), (Throwable) e);
                    } else {
                        Request request = Call.this.engine == null ? Call.this.originalRequest : Call.this.engine.getRequest();
                        this.responseCallback.onFailure(request, e);
                    }
                    Call.this.client.getDispatcher().finished(this);
                }
            } catch (Throwable th) {
                Call.this.client.getDispatcher().finished(this);
                throw th;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String toLoggableString() {
        String string = this.canceled ? "canceled call" : "call";
        HttpUrl redactedUrl = this.originalRequest.httpUrl().resolve("/...");
        return string + " to " + redactedUrl;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public Response getResponseWithInterceptorChain(boolean forWebSocket) throws IOException {
        Interceptor.Chain chain = new ApplicationInterceptorChain(0, this.originalRequest, forWebSocket);
        return chain.proceed(this.originalRequest);
    }

    /* loaded from: okhttp-2.6.0.jar:com/squareup/okhttp/Call$ApplicationInterceptorChain.class */
    class ApplicationInterceptorChain implements Interceptor.Chain {
        private final int index;
        private final Request request;
        private final boolean forWebSocket;

        ApplicationInterceptorChain(int index, Request request, boolean forWebSocket) {
            this.index = index;
            this.request = request;
            this.forWebSocket = forWebSocket;
        }

        @Override // com.squareup.okhttp.Interceptor.Chain
        public Connection connection() {
            return null;
        }

        @Override // com.squareup.okhttp.Interceptor.Chain
        public Request request() {
            return this.request;
        }

        @Override // com.squareup.okhttp.Interceptor.Chain
        public Response proceed(Request request) throws IOException {
            if (this.index < Call.this.client.interceptors().size()) {
                Interceptor.Chain chain = Call.this.new ApplicationInterceptorChain(this.index + 1, request, this.forWebSocket);
                Interceptor interceptor = Call.this.client.interceptors().get(this.index);
                Response interceptedResponse = interceptor.intercept(chain);
                if (interceptedResponse == null) {
                    throw new NullPointerException("application interceptor " + interceptor + " returned null");
                }
                return interceptedResponse;
            }
            return Call.this.getResponse(request, this.forWebSocket);
        }
    }

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
        this.engine = new HttpEngine(this.client, request, false, false, forWebSocket, null, null, null, null);
        int followUpCount = 0;
        while (!this.canceled) {
            try {
                this.engine.sendRequest();
                this.engine.readResponse();
                response = this.engine.getResponse();
                followUp = this.engine.followUpRequest();
            } catch (RequestException e) {
                throw e.getCause();
            } catch (RouteException e2) {
                HttpEngine retryEngine = this.engine.recover(e2);
                if (retryEngine != null) {
                    this.engine = retryEngine;
                } else {
                    throw e2.getLastConnectException();
                }
            } catch (IOException e3) {
                HttpEngine retryEngine2 = this.engine.recover(e3, null);
                if (retryEngine2 != null) {
                    this.engine = retryEngine2;
                } else {
                    throw e3;
                }
            }
            if (followUp == null) {
                if (!forWebSocket) {
                    this.engine.releaseConnection();
                }
                return response;
            }
            followUpCount++;
            if (followUpCount > 20) {
                throw new ProtocolException("Too many follow-up requests: " + followUpCount);
            }
            if (!this.engine.sameConnection(followUp.httpUrl())) {
                this.engine.releaseConnection();
            }
            Connection connection = this.engine.close();
            this.engine = new HttpEngine(this.client, followUp, false, false, forWebSocket, connection, null, null, response);
        }
        this.engine.releaseConnection();
        throw new IOException("Canceled");
    }
}
