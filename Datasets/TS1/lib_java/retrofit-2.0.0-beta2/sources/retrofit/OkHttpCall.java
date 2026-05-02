package retrofit;

import com.squareup.okhttp.MediaType;
import com.squareup.okhttp.Request;
import com.squareup.okhttp.ResponseBody;
import java.io.IOException;
import okio.Buffer;
import okio.BufferedSource;
import okio.ForwardingSource;
import okio.Okio;

/* loaded from: retrofit-2.0.0-beta2.jar:retrofit/OkHttpCall.class */
final class OkHttpCall<T> implements Call<T> {

    /* renamed from: retrofit, reason: collision with root package name */
    private final Retrofit f1retrofit;
    private final RequestFactory requestFactory;
    private final Converter<ResponseBody, T> responseConverter;
    private final Object[] args;
    private volatile com.squareup.okhttp.Call rawCall;
    private boolean executed;
    private volatile boolean canceled;

    OkHttpCall(Retrofit retrofit2, RequestFactory requestFactory, Converter<ResponseBody, T> responseConverter, Object[] args) {
        this.f1retrofit = retrofit2;
        this.requestFactory = requestFactory;
        this.responseConverter = responseConverter;
        this.args = args;
    }

    @Override // retrofit.Call
    /* renamed from: clone, reason: merged with bridge method [inline-methods] */
    public OkHttpCall<T> m2clone() {
        return new OkHttpCall<>(this.f1retrofit, this.requestFactory, this.responseConverter, this.args);
    }

    @Override // retrofit.Call
    public void enqueue(final Callback<T> callback) {
        synchronized (this) {
            if (this.executed) {
                throw new IllegalStateException("Already executed");
            }
            this.executed = true;
        }
        try {
            com.squareup.okhttp.Call rawCall = createRawCall();
            if (this.canceled) {
                rawCall.cancel();
            }
            this.rawCall = rawCall;
            rawCall.enqueue(new com.squareup.okhttp.Callback() { // from class: retrofit.OkHttpCall.1
                private void callFailure(Throwable e) {
                    try {
                        callback.onFailure(e);
                    } catch (Throwable t) {
                        t.printStackTrace();
                    }
                }

                private void callSuccess(Response<T> response) {
                    try {
                        callback.onResponse(response, OkHttpCall.this.f1retrofit);
                    } catch (Throwable t) {
                        t.printStackTrace();
                    }
                }

                public void onFailure(Request request, IOException e) {
                    callFailure(e);
                }

                public void onResponse(com.squareup.okhttp.Response rawResponse) {
                    try {
                        Response<T> response = OkHttpCall.this.parseResponse(rawResponse);
                        callSuccess(response);
                    } catch (Throwable e) {
                        callFailure(e);
                    }
                }
            });
        } catch (Throwable t) {
            callback.onFailure(t);
        }
    }

    @Override // retrofit.Call
    public Response<T> execute() throws IOException {
        synchronized (this) {
            if (this.executed) {
                throw new IllegalStateException("Already executed");
            }
            this.executed = true;
        }
        com.squareup.okhttp.Call rawCall = createRawCall();
        if (this.canceled) {
            rawCall.cancel();
        }
        this.rawCall = rawCall;
        return parseResponse(rawCall.execute());
    }

    private com.squareup.okhttp.Call createRawCall() {
        return this.f1retrofit.client().newCall(this.requestFactory.create(this.args));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public Response<T> parseResponse(com.squareup.okhttp.Response rawResponse) throws IOException {
        ResponseBody rawBody = rawResponse.body();
        com.squareup.okhttp.Response rawResponse2 = rawResponse.newBuilder().body(new NoContentResponseBody(rawBody.contentType(), rawBody.contentLength())).build();
        int code = rawResponse2.code();
        if (code < 200 || code >= 300) {
            try {
                ResponseBody bufferedBody = Utils.readBodyToBytesIfNecessary(rawBody);
                Response<T> error = Response.error(bufferedBody, rawResponse2);
                Utils.closeQuietly(rawBody);
                return error;
            } catch (Throwable th) {
                Utils.closeQuietly(rawBody);
                throw th;
            }
        }
        if (code == 204 || code == 205) {
            return Response.success(null, rawResponse2);
        }
        ExceptionCatchingRequestBody catchingBody = new ExceptionCatchingRequestBody(rawBody);
        try {
            T body = this.responseConverter.convert(catchingBody);
            return Response.success(body, rawResponse2);
        } catch (RuntimeException e) {
            catchingBody.throwIfCaught();
            throw e;
        }
    }

    @Override // retrofit.Call
    public void cancel() {
        this.canceled = true;
        com.squareup.okhttp.Call rawCall = this.rawCall;
        if (rawCall != null) {
            rawCall.cancel();
        }
    }

    /* loaded from: retrofit-2.0.0-beta2.jar:retrofit/OkHttpCall$NoContentResponseBody.class */
    static final class NoContentResponseBody extends ResponseBody {
        private final MediaType contentType;
        private final long contentLength;

        NoContentResponseBody(MediaType contentType, long contentLength) {
            this.contentType = contentType;
            this.contentLength = contentLength;
        }

        public MediaType contentType() {
            return this.contentType;
        }

        public long contentLength() throws IOException {
            return this.contentLength;
        }

        public BufferedSource source() throws IOException {
            throw new IllegalStateException("Cannot read raw response body of a converted body.");
        }
    }

    /* loaded from: retrofit-2.0.0-beta2.jar:retrofit/OkHttpCall$ExceptionCatchingRequestBody.class */
    static final class ExceptionCatchingRequestBody extends ResponseBody {
        private final ResponseBody delegate;
        private IOException thrownException;

        ExceptionCatchingRequestBody(ResponseBody delegate) {
            this.delegate = delegate;
        }

        public MediaType contentType() {
            return this.delegate.contentType();
        }

        public long contentLength() throws IOException {
            try {
                return this.delegate.contentLength();
            } catch (IOException e) {
                this.thrownException = e;
                throw e;
            }
        }

        public BufferedSource source() throws IOException {
            try {
                BufferedSource delegateSource = this.delegate.source();
                return Okio.buffer(new ForwardingSource(delegateSource) { // from class: retrofit.OkHttpCall.ExceptionCatchingRequestBody.1
                    public long read(Buffer sink, long byteCount) throws IOException {
                        try {
                            return super.read(sink, byteCount);
                        } catch (IOException e) {
                            ExceptionCatchingRequestBody.this.thrownException = e;
                            throw e;
                        }
                    }
                });
            } catch (IOException e) {
                this.thrownException = e;
                throw e;
            }
        }

        public void close() throws IOException {
            this.delegate.close();
        }

        void throwIfCaught() throws IOException {
            if (this.thrownException != null) {
                throw this.thrownException;
            }
        }
    }
}
