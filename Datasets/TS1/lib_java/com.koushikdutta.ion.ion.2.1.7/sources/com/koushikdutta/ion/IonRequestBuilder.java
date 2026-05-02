package com.koushikdutta.ion;

import android.app.ProgressDialog;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import android.util.Base64;
import android.util.Log;
import android.widget.ImageView;
import android.widget.ProgressBar;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;
import com.koushikdutta.async.AsyncServer;
import com.koushikdutta.async.ByteBufferList;
import com.koushikdutta.async.DataEmitter;
import com.koushikdutta.async.DataSink;
import com.koushikdutta.async.DataTrackingEmitter;
import com.koushikdutta.async.FilteredDataEmitter;
import com.koushikdutta.async.Util;
import com.koushikdutta.async.callback.CompletedCallback;
import com.koushikdutta.async.future.Future;
import com.koushikdutta.async.future.FutureCallback;
import com.koushikdutta.async.future.SimpleFuture;
import com.koushikdutta.async.future.TransformFuture;
import com.koushikdutta.async.http.AsyncHttpRequest;
import com.koushikdutta.async.http.Headers;
import com.koushikdutta.async.http.Multimap;
import com.koushikdutta.async.http.NameValuePair;
import com.koushikdutta.async.http.body.AsyncHttpRequestBody;
import com.koushikdutta.async.http.body.DocumentBody;
import com.koushikdutta.async.http.body.FileBody;
import com.koushikdutta.async.http.body.FilePart;
import com.koushikdutta.async.http.body.MultipartFormDataBody;
import com.koushikdutta.async.http.body.Part;
import com.koushikdutta.async.http.body.StreamBody;
import com.koushikdutta.async.http.body.StringBody;
import com.koushikdutta.async.http.body.UrlEncodedFormBody;
import com.koushikdutta.async.http.server.AsyncHttpServer;
import com.koushikdutta.async.parser.AsyncParser;
import com.koushikdutta.async.parser.ByteBufferListParser;
import com.koushikdutta.async.parser.DocumentParser;
import com.koushikdutta.async.parser.StringParser;
import com.koushikdutta.async.stream.FileDataSink;
import com.koushikdutta.async.stream.OutputStreamDataSink;
import com.koushikdutta.ion.Loader;
import com.koushikdutta.ion.bitmap.BitmapInfo;
import com.koushikdutta.ion.bitmap.LocallyCachedStatus;
import com.koushikdutta.ion.builder.Builders;
import com.koushikdutta.ion.builder.FutureBuilder;
import com.koushikdutta.ion.builder.LoadBuilder;
import com.koushikdutta.ion.builder.MultipartBodyBuilder;
import com.koushikdutta.ion.builder.RequestBuilder;
import com.koushikdutta.ion.builder.UrlEncodedBuilder;
import com.koushikdutta.ion.future.ImageViewFuture;
import com.koushikdutta.ion.future.ResponseFuture;
import com.koushikdutta.ion.gson.GsonArrayParser;
import com.koushikdutta.ion.gson.GsonBody;
import com.koushikdutta.ion.gson.GsonObjectParser;
import com.koushikdutta.ion.gson.GsonSerializer;
import com.koushikdutta.ion.gson.PojoBody;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.ref.WeakReference;
import java.lang.reflect.Type;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.w3c.dom.Document;

/* loaded from: com.koushikdutta.ion.ion.2.1.7.jar:com/koushikdutta/ion/IonRequestBuilder.class */
class IonRequestBuilder implements Builders.Any.B, Builders.Any.F, Builders.Any.M, Builders.Any.U, LoadBuilder<Builders.Any.B> {
    Ion ion;
    ContextReference contextReference;
    String uri;
    boolean methodWasSet;
    Headers headers;
    boolean noCache;
    Multimap query;
    AsyncHttpRequestBody body;
    LoadRequestCallback loadRequestCallback;
    WeakReference<ProgressBar> progressBar;
    WeakReference<ProgressDialog> progressDialog;
    ProgressCallback progress;
    ProgressCallback progressHandler;
    Multimap bodyParameters;
    MultipartFormDataBody multipartBody;
    String logTag;
    int logLevel;
    ArrayList<WeakReference<Object>> groups;
    String proxyHost;
    int proxyPort;
    ProgressCallback uploadProgress;
    ProgressBar uploadProgressBar;
    ProgressDialog uploadProgressDialog;
    ProgressCallback uploadProgressHandler;
    HeadersCallback headersCallback;
    static final /* synthetic */ boolean $assertionsDisabled;
    Handler handler = Ion.mainHandler;
    String method = "GET";
    int timeoutMilliseconds = 30000;
    boolean followRedirect = true;

    /* loaded from: com.koushikdutta.ion.ion.2.1.7.jar:com/koushikdutta/ion/IonRequestBuilder$LoadRequestCallback.class */
    interface LoadRequestCallback {
        boolean loadRequest(AsyncHttpRequest asyncHttpRequest);
    }

    @Override // com.koushikdutta.ion.builder.RequestBuilder
    public /* bridge */ /* synthetic */ RequestBuilder addQueries(Map x0) {
        return addQueries((Map<String, List<String>>) x0);
    }

    @Override // com.koushikdutta.ion.builder.RequestBuilder
    public /* bridge */ /* synthetic */ RequestBuilder addHeaders(Map x0) {
        return addHeaders((Map<String, List<String>>) x0);
    }

    @Override // com.koushikdutta.ion.builder.MultipartBodyBuilder
    public /* bridge */ /* synthetic */ MultipartBodyBuilder addMultipartParts(Iterable x0) {
        return addMultipartParts((Iterable<Part>) x0);
    }

    @Override // com.koushikdutta.ion.builder.MultipartBodyBuilder
    public /* bridge */ /* synthetic */ MultipartBodyBuilder setMultipartParameters(Map x0) {
        return setMultipartParameters((Map<String, List<String>>) x0);
    }

    @Override // com.koushikdutta.ion.builder.UrlEncodedBuilder
    public /* bridge */ /* synthetic */ UrlEncodedBuilder setBodyParameters(Map x0) {
        return setBodyParameters((Map<String, List<String>>) x0);
    }

    static {
        $assertionsDisabled = !IonRequestBuilder.class.desiredAssertionStatus();
    }

    public IonRequestBuilder(ContextReference contextReference, Ion ion) {
        String alive = contextReference.isAlive();
        if (null != alive) {
            Log.w("Ion", "Building request with dead context: " + alive);
        }
        this.ion = ion;
        this.contextReference = contextReference;
    }

    @Override // com.koushikdutta.ion.builder.LoadBuilder
    /* renamed from: load, reason: merged with bridge method [inline-methods] */
    public Builders.Any.B load2(String url) {
        return loadInternal("GET", url);
    }

    private IonRequestBuilder loadInternal(String method, String url) {
        this.method = method;
        if (!TextUtils.isEmpty(url) && url.startsWith("/")) {
            url = new File(url).toURI().toString();
        }
        this.uri = url;
        return this;
    }

    @Override // com.koushikdutta.ion.builder.LoadBuilder
    /* renamed from: load, reason: merged with bridge method [inline-methods] */
    public Builders.Any.B load2(String method, String url) {
        this.methodWasSet = true;
        return loadInternal(method, url);
    }

    private Headers getHeaders() {
        if (this.headers == null) {
            this.headers = new Headers();
            AsyncHttpRequest.setDefaultHeaders(this.headers, this.uri == null ? null : Uri.parse(this.uri));
        }
        return this.headers;
    }

    @Override // com.koushikdutta.ion.builder.RequestBuilder
    public IonRequestBuilder userAgent(String userAgent) {
        if (TextUtils.isEmpty(userAgent)) {
            return this;
        }
        return setHeader("User-Agent", userAgent);
    }

    @Override // com.koushikdutta.ion.builder.RequestBuilder
    public IonRequestBuilder setHeader(String name, String value) {
        if (value == null) {
            getHeaders().removeAll(name);
        } else {
            getHeaders().set(name, value);
        }
        return this;
    }

    @Override // com.koushikdutta.ion.builder.RequestBuilder
    public IonRequestBuilder addHeader(String name, String value) {
        if (value != null) {
            getHeaders().add(name, value);
        }
        return this;
    }

    @Override // com.koushikdutta.ion.builder.RequestBuilder
    public IonRequestBuilder addHeaders(Map<String, List<String>> params) {
        if (params == null) {
            return this;
        }
        Headers headers = getHeaders();
        for (Map.Entry<String, List<String>> entry : params.entrySet()) {
            headers.addAll(entry.getKey(), entry.getValue());
        }
        return this;
    }

    @Override // com.koushikdutta.ion.builder.RequestBuilder
    public Builders.Any.B noCache() {
        this.noCache = true;
        return setHeader("Cache-Control", "no-cache");
    }

    @Override // com.koushikdutta.ion.builder.RequestBuilder
    public IonRequestBuilder addQuery(String name, String value) {
        if (value == null) {
            return this;
        }
        if (this.query == null) {
            this.query = new Multimap();
        }
        this.query.add(name, value);
        return this;
    }

    @Override // com.koushikdutta.ion.builder.RequestBuilder
    public IonRequestBuilder addQueries(Map<String, List<String>> params) {
        if (this.query == null) {
            this.query = new Multimap();
        }
        this.query.putAll(params);
        return this;
    }

    @Override // com.koushikdutta.ion.builder.RequestBuilder
    public IonRequestBuilder setTimeout(int timeoutMilliseconds) {
        this.timeoutMilliseconds = timeoutMilliseconds;
        return this;
    }

    @Override // com.koushikdutta.ion.builder.RequestBuilder
    public IonRequestBuilder setHandler(Handler handler) {
        this.handler = handler;
        return this;
    }

    private <T> IonRequestBuilder setBody(AsyncHttpRequestBody<T> body) {
        if (!this.methodWasSet) {
            this.method = "POST";
        }
        this.body = body;
        return this;
    }

    @Override // com.koushikdutta.ion.builder.RequestBuilder
    /* renamed from: setJsonObjectBody, reason: merged with bridge method [inline-methods] */
    public Builders.Any.F setJsonObjectBody2(JsonObject jsonObject) {
        return setBody(new GsonBody(this.ion.configure().getGson(), jsonObject));
    }

    @Override // com.koushikdutta.ion.builder.RequestBuilder
    /* renamed from: setJsonArrayBody, reason: merged with bridge method [inline-methods] */
    public Builders.Any.F setJsonArrayBody2(JsonArray jsonArray) {
        return setBody(new GsonBody(this.ion.configure().getGson(), jsonArray));
    }

    @Override // com.koushikdutta.ion.builder.RequestBuilder
    /* renamed from: setStringBody, reason: merged with bridge method [inline-methods] */
    public Builders.Any.F setStringBody2(String string) {
        return setBody(new StringBody(string));
    }

    @Override // com.koushikdutta.ion.builder.RequestBuilder
    public IonRequestBuilder followRedirect(boolean follow) {
        this.followRedirect = follow;
        return this;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public <T> void postExecute(final EmitterTransform<T> future, final Exception ex, final T value) {
        Runnable runner = new Runnable() { // from class: com.koushikdutta.ion.IonRequestBuilder.1
            @Override // java.lang.Runnable
            public void run() {
                String deadReason = IonRequestBuilder.this.contextReference.isAlive();
                if (deadReason != null) {
                    future.initialRequest.logd("context has died: " + deadReason);
                    future.cancelSilently();
                } else if (ex != null) {
                    future.setComplete(ex);
                } else {
                    future.setComplete(value);
                }
            }
        };
        if (this.handler == null) {
            this.ion.httpClient.getServer().post(runner);
        } else {
            AsyncServer.post(this.handler, runner);
        }
    }

    private Uri prepareURI() {
        Uri uri;
        try {
            if (this.query != null) {
                Uri.Builder builder = Uri.parse(this.uri).buildUpon();
                for (String key : this.query.keySet()) {
                    for (String value : (List) this.query.get(key)) {
                        builder = builder.appendQueryParameter(key, value);
                    }
                }
                uri = builder.build();
            } else {
                uri = Uri.parse(this.uri);
            }
        } catch (Exception e) {
            uri = null;
        }
        if (uri == null || uri.getScheme() == null) {
            return null;
        }
        return uri;
    }

    private AsyncHttpRequest prepareRequest(Uri uri) {
        AsyncHttpRequest request = this.ion.configure().getAsyncHttpRequestFactory().createAsyncHttpRequest(uri, this.method, this.headers);
        request.setFollowRedirect(this.followRedirect);
        request.setBody(this.body);
        request.setLogging(this.ion.logtag, this.ion.logLevel);
        if (this.logTag != null) {
            request.setLogging(this.logTag, this.logLevel);
        }
        request.enableProxy(this.proxyHost, this.proxyPort);
        request.setTimeout(this.timeoutMilliseconds);
        request.logd("preparing request");
        return request;
    }

    private <T> void getLoaderEmitter(EmitterTransform<T> ret) {
        Uri uri = prepareURI();
        if (uri == null) {
            ret.setComplete(new Exception("Invalid URI"));
            return;
        }
        AsyncHttpRequest request = prepareRequest(uri);
        ret.initialRequest = request;
        getLoaderEmitter(ret, request);
    }

    private <T> void getLoaderEmitter(final EmitterTransform<T> ret, AsyncHttpRequest request) {
        if (this.body != null && (this.uploadProgressHandler != null || this.uploadProgressBar != null || this.uploadProgress != null || this.uploadProgressDialog != null)) {
            AsyncHttpRequestBody wrappedBody = new RequestBodyUploadObserver(this.body, new ProgressCallback() { // from class: com.koushikdutta.ion.IonRequestBuilder.2
                static final /* synthetic */ boolean $assertionsDisabled;

                static {
                    $assertionsDisabled = !IonRequestBuilder.class.desiredAssertionStatus();
                }

                @Override // com.koushikdutta.ion.ProgressCallback
                public void onProgress(final long downloaded, final long total) {
                    if (!$assertionsDisabled && Thread.currentThread() == Looper.getMainLooper().getThread()) {
                        throw new AssertionError();
                    }
                    int percent = (int) ((downloaded / total) * 100.0f);
                    if (IonRequestBuilder.this.uploadProgressBar != null) {
                        IonRequestBuilder.this.uploadProgressBar.setProgress(percent);
                    }
                    if (IonRequestBuilder.this.uploadProgressDialog != null) {
                        IonRequestBuilder.this.uploadProgressDialog.setProgress(percent);
                    }
                    if (IonRequestBuilder.this.uploadProgress != null) {
                        IonRequestBuilder.this.uploadProgress.onProgress(downloaded, total);
                    }
                    if (IonRequestBuilder.this.uploadProgressHandler != null) {
                        AsyncServer.post(Ion.mainHandler, new Runnable() { // from class: com.koushikdutta.ion.IonRequestBuilder.2.1
                            @Override // java.lang.Runnable
                            public void run() {
                                if (ret.isCancelled() || ret.isDone()) {
                                    return;
                                }
                                IonRequestBuilder.this.uploadProgressHandler.onProgress(downloaded, total);
                            }
                        });
                    }
                }
            });
            request.setBody(wrappedBody);
        }
        resolveAndLoadRequest(request, ret);
    }

    <T> void resolveAndLoadRequest(final AsyncHttpRequest request, final EmitterTransform<T> ret) {
        Future<AsyncHttpRequest> resolved = resolveRequest(request, ret);
        if (resolved != null) {
            resolved.setCallback(new FutureCallback<AsyncHttpRequest>() { // from class: com.koushikdutta.ion.IonRequestBuilder.3
                public void onCompleted(Exception e, AsyncHttpRequest result) {
                    if (e != null) {
                        ret.setComplete(e);
                    } else {
                        ret.finalRequest = result;
                        IonRequestBuilder.this.resolveAndLoadRequest(result, ret);
                    }
                }
            });
        } else if (Looper.getMainLooper().getThread() != Thread.currentThread()) {
            AsyncServer.post(Ion.mainHandler, new Runnable() { // from class: com.koushikdutta.ion.IonRequestBuilder.4
                @Override // java.lang.Runnable
                public void run() {
                    IonRequestBuilder.this.invokeLoadRequest(request, ret);
                }
            });
        } else {
            invokeLoadRequest(request, ret);
        }
    }

    <T> void invokeLoadRequest(AsyncHttpRequest request, EmitterTransform<T> ret) {
        if (this.loadRequestCallback == null || this.loadRequestCallback.loadRequest(request)) {
            loadRequest(request, ret);
        }
    }

    <T> void loadRequest(AsyncHttpRequest request, EmitterTransform<T> ret) {
        Iterator i$ = this.ion.loaders.iterator();
        while (i$.hasNext()) {
            Loader loader = i$.next();
            Future<DataEmitter> emitter = loader.load(this.ion, request, (FutureCallback<Loader.LoaderEmitter>) ret);
            if (emitter != null) {
                request.logi("Using loader: " + loader);
                ret.setParent(emitter);
                return;
            }
        }
        ret.setComplete(new Exception("Unknown uri scheme"));
    }

    <T> Future<AsyncHttpRequest> resolveRequest(AsyncHttpRequest request, EmitterTransform<T> ret) {
        Iterator i$ = this.ion.loaders.iterator();
        while (i$.hasNext()) {
            Loader loader = i$.next();
            Future<AsyncHttpRequest> resolved = loader.resolve(this.contextReference.getContext(), this.ion, request);
            if (resolved != null) {
                return resolved;
            }
        }
        return null;
    }

    /* loaded from: com.koushikdutta.ion.ion.2.1.7.jar:com/koushikdutta/ion/IonRequestBuilder$EmitterTransform.class */
    class EmitterTransform<T> extends TransformFuture<T, Loader.LoaderEmitter> implements ResponseFuture<T> {
        AsyncHttpRequest initialRequest;
        AsyncHttpRequest finalRequest;
        ResponseServedFrom servedFrom;
        Runnable cancelCallback;
        HeadersResponse headers;
        DataEmitter emitter;

        public Response<T> getResponse(Exception e, T result) {
            return new Response<>(this.finalRequest, this.servedFrom, this.headers, e, result);
        }

        @Override // com.koushikdutta.ion.future.ResponseFuture
        public Future<Response<T>> withResponse() {
            final SimpleFuture<Response<T>> ret = new SimpleFuture<>();
            setCallback(new FutureCallback<T>() { // from class: com.koushikdutta.ion.IonRequestBuilder.EmitterTransform.1
                public void onCompleted(Exception e, T result) {
                    if (EmitterTransform.this.emitter != null) {
                        ret.setComplete(EmitterTransform.this.getResponse(e, result));
                    } else {
                        ret.setComplete(e, (Object) null);
                    }
                }
            });
            ret.setParent(this);
            return ret;
        }

        public EmitterTransform(Runnable cancelCallback) {
            this.cancelCallback = cancelCallback;
            IonRequestBuilder.this.ion.addFutureInFlight(this, IonRequestBuilder.this.contextReference.getContext());
            if (IonRequestBuilder.this.groups == null) {
                return;
            }
            Iterator i$ = IonRequestBuilder.this.groups.iterator();
            while (i$.hasNext()) {
                WeakReference<Object> ref = i$.next();
                Object group = ref.get();
                if (group != null) {
                    IonRequestBuilder.this.ion.addFutureInFlight(this, group);
                }
            }
        }

        protected void cancelCleanup() {
            super.cancelCleanup();
            if (this.emitter != null) {
                this.emitter.close();
            }
            if (this.cancelCallback != null) {
                this.cancelCallback.run();
            }
        }

        protected void error(Exception e) {
            IonRequestBuilder.this.postExecute(this, e, null);
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // 
        public void transform(Loader.LoaderEmitter emitter) throws Exception {
            DataTrackingEmitter tracker;
            this.emitter = emitter.getDataEmitter();
            this.servedFrom = emitter.getServedFrom();
            this.headers = emitter.getHeaders();
            this.finalRequest = emitter.getRequest();
            if (IonRequestBuilder.this.headersCallback != null) {
                final HeadersResponse headers = emitter.getHeaders();
                AsyncServer.post(IonRequestBuilder.this.handler, new Runnable() { // from class: com.koushikdutta.ion.IonRequestBuilder.EmitterTransform.2
                    @Override // java.lang.Runnable
                    public void run() {
                        IonRequestBuilder.this.headersCallback.onHeaders(headers);
                    }
                });
            }
            final long total = emitter.length();
            if (!(this.emitter instanceof DataTrackingEmitter)) {
                tracker = new FilteredDataEmitter();
                tracker.setDataEmitter(this.emitter);
            } else {
                tracker = this.emitter;
            }
            this.emitter = tracker;
            tracker.setDataTracker(new DataTrackingEmitter.DataTracker() { // from class: com.koushikdutta.ion.IonRequestBuilder.EmitterTransform.3
                int lastPercent;
                static final /* synthetic */ boolean $assertionsDisabled;

                static {
                    $assertionsDisabled = !IonRequestBuilder.class.desiredAssertionStatus();
                }

                public void onData(final int totalBytesRead) {
                    if (!$assertionsDisabled && Thread.currentThread() == Looper.getMainLooper().getThread()) {
                        throw new AssertionError();
                    }
                    String deadReason = IonRequestBuilder.this.contextReference.isAlive();
                    if (deadReason != null) {
                        EmitterTransform.this.initialRequest.logd("context has died, cancelling");
                        EmitterTransform.this.cancelSilently();
                        return;
                    }
                    final int percent = (int) ((totalBytesRead / total) * 100.0f);
                    if ((IonRequestBuilder.this.progressBar != null || IonRequestBuilder.this.progressDialog != null) && percent != this.lastPercent) {
                        AsyncServer.post(Ion.mainHandler, new Runnable() { // from class: com.koushikdutta.ion.IonRequestBuilder.EmitterTransform.3.1
                            @Override // java.lang.Runnable
                            public void run() {
                                ProgressDialog dlg;
                                ProgressBar bar;
                                if (IonRequestBuilder.this.progressBar != null && (bar = IonRequestBuilder.this.progressBar.get()) != null) {
                                    bar.setProgress(percent);
                                }
                                if (IonRequestBuilder.this.progressDialog != null && (dlg = IonRequestBuilder.this.progressDialog.get()) != null) {
                                    dlg.setProgress(percent);
                                }
                            }
                        });
                    }
                    this.lastPercent = percent;
                    if (IonRequestBuilder.this.progress != null) {
                        IonRequestBuilder.this.progress.onProgress(totalBytesRead, total);
                    }
                    if (IonRequestBuilder.this.progressHandler != null) {
                        AsyncServer.post(Ion.mainHandler, new Runnable() { // from class: com.koushikdutta.ion.IonRequestBuilder.EmitterTransform.3.2
                            @Override // java.lang.Runnable
                            public void run() {
                                if (EmitterTransform.this.isCancelled() || EmitterTransform.this.isDone()) {
                                    return;
                                }
                                IonRequestBuilder.this.progressHandler.onProgress(totalBytesRead, total);
                            }
                        });
                    }
                }
            });
        }
    }

    @Override // com.koushikdutta.ion.builder.RequestBuilder
    public IonRequestBuilder progressBar(ProgressBar progressBar) {
        this.progressBar = new WeakReference<>(progressBar);
        return this;
    }

    @Override // com.koushikdutta.ion.builder.RequestBuilder
    public IonRequestBuilder progressDialog(ProgressDialog progressDialog) {
        this.progressDialog = new WeakReference<>(progressDialog);
        return this;
    }

    @Override // com.koushikdutta.ion.builder.RequestBuilder
    public IonRequestBuilder progress(ProgressCallback callback) {
        this.progress = callback;
        return this;
    }

    @Override // com.koushikdutta.ion.builder.RequestBuilder
    public IonRequestBuilder progressHandler(ProgressCallback callback) {
        this.progressHandler = callback;
        return this;
    }

    <T> EmitterTransform<T> execute(DataSink sink, boolean close, T result) {
        return execute(sink, close, result, null);
    }

    /* JADX INFO: Add missing generic type declarations: [T] */
    /* renamed from: com.koushikdutta.ion.IonRequestBuilder$5, reason: invalid class name */
    /* loaded from: com.koushikdutta.ion.ion.2.1.7.jar:com/koushikdutta/ion/IonRequestBuilder$5.class */
    class AnonymousClass5<T> extends EmitterTransform<T> {
        EmitterTransform<T> self;
        final /* synthetic */ boolean val$close;
        final /* synthetic */ DataSink val$sink;
        final /* synthetic */ Object val$result;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        AnonymousClass5(Runnable x0, boolean z, DataSink dataSink, Object obj) {
            super(x0);
            this.val$close = z;
            this.val$sink = dataSink;
            this.val$result = obj;
            this.self = this;
        }

        protected void cleanup() {
            super.cleanup();
            if (this.val$close) {
                this.val$sink.end();
            }
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.koushikdutta.ion.IonRequestBuilder.EmitterTransform
        public void transform(Loader.LoaderEmitter emitter) throws Exception {
            super.transform(emitter);
            Util.pump(this.emitter, this.val$sink, new CompletedCallback() { // from class: com.koushikdutta.ion.IonRequestBuilder.5.1
                public void onCompleted(Exception ex) {
                    IonRequestBuilder.this.postExecute(AnonymousClass5.this.self, ex, AnonymousClass5.this.val$result);
                }
            });
        }
    }

    <T> EmitterTransform<T> execute(DataSink sink, boolean close, T result, Runnable cancel) {
        AnonymousClass5 anonymousClass5 = new AnonymousClass5(cancel, close, sink, result);
        getLoaderEmitter(anonymousClass5);
        return anonymousClass5;
    }

    <T> ResponseFuture<T> execute(AsyncParser<T> parser) {
        return execute(parser, null);
    }

    <T> ResponseFuture<T> execute(AsyncParser<T> parser, Runnable cancel) {
        if (!$assertionsDisabled && parser == null) {
            throw new AssertionError();
        }
        Uri uri = prepareURI();
        AsyncHttpRequest request = null;
        if (uri != null) {
            request = prepareRequest(uri);
            Type type = parser.getType();
            Iterator i$ = this.ion.loaders.iterator();
            while (i$.hasNext()) {
                Loader loader = i$.next();
                ResponseFuture<T> quickLoad = loader.load(this.ion, request, type);
                if (quickLoad != null) {
                    return quickLoad;
                }
            }
        }
        AnonymousClass6 anonymousClass6 = new AnonymousClass6(cancel, parser);
        if (uri == null) {
            anonymousClass6.setComplete(new Exception("Invalid URI"));
            return anonymousClass6;
        }
        anonymousClass6.initialRequest = request;
        getLoaderEmitter(anonymousClass6);
        return anonymousClass6;
    }

    /* JADX INFO: Add missing generic type declarations: [T] */
    /* renamed from: com.koushikdutta.ion.IonRequestBuilder$6, reason: invalid class name */
    /* loaded from: com.koushikdutta.ion.ion.2.1.7.jar:com/koushikdutta/ion/IonRequestBuilder$6.class */
    class AnonymousClass6<T> extends EmitterTransform<T> {
        EmitterTransform<T> self;
        final /* synthetic */ AsyncParser val$parser;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        AnonymousClass6(Runnable x0, AsyncParser asyncParser) {
            super(x0);
            this.val$parser = asyncParser;
            this.self = this;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.koushikdutta.ion.IonRequestBuilder.EmitterTransform
        public void transform(Loader.LoaderEmitter emitter) throws Exception {
            super.transform(emitter);
            this.val$parser.parse(this.emitter).setCallback(new FutureCallback<T>() { // from class: com.koushikdutta.ion.IonRequestBuilder.6.1
                public void onCompleted(Exception e, T result) {
                    IonRequestBuilder.this.postExecute(AnonymousClass6.this.self, e, result);
                }
            });
        }
    }

    @Override // com.koushikdutta.ion.builder.GsonFutureBuilder
    public ResponseFuture<JsonObject> asJsonObject() {
        return execute(new GsonObjectParser());
    }

    @Override // com.koushikdutta.ion.builder.GsonFutureBuilder
    public ResponseFuture<JsonArray> asJsonArray() {
        return execute(new GsonArrayParser());
    }

    @Override // com.koushikdutta.ion.builder.GsonFutureBuilder
    public ResponseFuture<JsonObject> asJsonObject(Charset charset) {
        return execute(new GsonObjectParser(charset));
    }

    @Override // com.koushikdutta.ion.builder.GsonFutureBuilder
    public ResponseFuture<JsonArray> asJsonArray(Charset charset) {
        return execute(new GsonArrayParser(charset));
    }

    @Override // com.koushikdutta.ion.builder.FutureBuilder
    public ResponseFuture<String> asString() {
        return execute(new StringParser());
    }

    @Override // com.koushikdutta.ion.builder.FutureBuilder
    public ResponseFuture<String> asString(Charset charset) {
        return execute(new StringParser(charset));
    }

    @Override // com.koushikdutta.ion.builder.FutureBuilder
    public ResponseFuture<byte[]> asByteArray() {
        return execute(new AsyncParser<byte[]>() { // from class: com.koushikdutta.ion.IonRequestBuilder.7
            public Future<byte[]> parse(DataEmitter emitter) {
                return new ByteBufferListParser().parse(emitter).then(new TransformFuture<byte[], ByteBufferList>() { // from class: com.koushikdutta.ion.IonRequestBuilder.7.1
                    /* JADX INFO: Access modifiers changed from: protected */
                    public void transform(ByteBufferList result) throws Exception {
                        setComplete(result.getAllByteArray());
                    }
                });
            }

            public void write(DataSink sink, byte[] value, CompletedCallback completed) {
                new ByteBufferListParser().write(sink, new ByteBufferList(value), completed);
            }

            public Type getType() {
                return byte[].class;
            }
        });
    }

    @Override // com.koushikdutta.ion.builder.FutureBuilder
    public ResponseFuture<InputStream> asInputStream() {
        return execute(new InputStreamParser());
    }

    @Override // com.koushikdutta.ion.builder.FutureBuilder
    public ResponseFuture<DataEmitter> asDataEmitter() {
        return execute(new DataEmitterParser());
    }

    @Override // com.koushikdutta.ion.builder.FutureBuilder
    public <T> ResponseFuture<T> as(AsyncParser<T> parser) {
        return execute(parser);
    }

    @Override // com.koushikdutta.ion.builder.FutureBuilder
    public <F extends OutputStream> ResponseFuture<F> write(F outputStream, boolean close) {
        return execute(new OutputStreamDataSink(this.ion.getServer(), outputStream), close, outputStream);
    }

    @Override // com.koushikdutta.ion.builder.FutureBuilder
    public <F extends OutputStream> ResponseFuture<F> write(F outputStream) {
        return execute(new OutputStreamDataSink(this.ion.getServer(), outputStream), true, outputStream);
    }

    @Override // com.koushikdutta.ion.builder.FutureBuilder
    public EmitterTransform<File> write(final File file) {
        return execute(new FileDataSink(this.ion.getServer(), file), true, file, new Runnable() { // from class: com.koushikdutta.ion.IonRequestBuilder.8
            @Override // java.lang.Runnable
            public void run() {
                file.delete();
            }
        });
    }

    @Override // com.koushikdutta.ion.builder.UrlEncodedBuilder
    public IonRequestBuilder setBodyParameter(String name, String value) {
        if (this.bodyParameters == null) {
            this.bodyParameters = new Multimap();
            setBody(new UrlEncodedFormBody(this.bodyParameters));
        }
        if (value != null) {
            this.bodyParameters.add(name, value);
        }
        return this;
    }

    @Override // com.koushikdutta.ion.builder.UrlEncodedBuilder
    public IonRequestBuilder setBodyParameters(Map<String, List<String>> params) {
        if (this.bodyParameters == null) {
            this.bodyParameters = new Multimap();
            setBody(new UrlEncodedFormBody(this.bodyParameters));
        }
        this.bodyParameters.putAll(params);
        return this;
    }

    @Override // com.koushikdutta.ion.builder.MultipartBodyBuilder
    public IonRequestBuilder setMultipartFile(String name, File file) {
        return setMultipartFile(name, (String) null, file);
    }

    @Override // com.koushikdutta.ion.builder.MultipartBodyBuilder
    public IonRequestBuilder setMultipartFile(String name, String contentType, File file) {
        if (this.multipartBody == null) {
            this.multipartBody = new MultipartFormDataBody();
            setBody(this.multipartBody);
        }
        FilePart part = new FilePart(name, file);
        if (contentType == null) {
            contentType = AsyncHttpServer.tryGetContentType(file.getAbsolutePath());
        }
        if (contentType != null) {
            part.setContentType(contentType);
        }
        this.multipartBody.addPart(part);
        return this;
    }

    @Override // com.koushikdutta.ion.builder.MultipartBodyBuilder
    public IonRequestBuilder setMultipartParameter(String name, String value) {
        if (this.multipartBody == null) {
            this.multipartBody = new MultipartFormDataBody();
            setBody(this.multipartBody);
        }
        if (value != null) {
            this.multipartBody.addStringPart(name, value);
        }
        return this;
    }

    @Override // com.koushikdutta.ion.builder.MultipartBodyBuilder
    public IonRequestBuilder setMultipartParameters(Map<String, List<String>> params) {
        for (String key : params.keySet()) {
            for (String value : params.get(key)) {
                if (value != null) {
                    setMultipartParameter(key, value);
                }
            }
        }
        return this;
    }

    @Override // com.koushikdutta.ion.builder.MultipartBodyBuilder
    public IonRequestBuilder addMultipartParts(Iterable<Part> parameters) {
        if (this.multipartBody == null) {
            this.multipartBody = new MultipartFormDataBody();
            setBody(this.multipartBody);
        }
        for (Part part : parameters) {
            this.multipartBody.addPart(part);
        }
        return this;
    }

    @Override // com.koushikdutta.ion.builder.MultipartBodyBuilder
    public Builders.Any.M addMultipartParts(Part... parameters) {
        if (this.multipartBody == null) {
            this.multipartBody = new MultipartFormDataBody();
            setBody(this.multipartBody);
        }
        for (Part part : parameters) {
            this.multipartBody.addPart(part);
        }
        return this;
    }

    @Override // com.koushikdutta.ion.builder.MultipartBodyBuilder
    public IonRequestBuilder setMultipartContentType(String contentType) {
        if (this.multipartBody == null) {
            this.multipartBody = new MultipartFormDataBody();
            setBody(this.multipartBody);
        }
        this.multipartBody.setContentType(contentType);
        return this;
    }

    @Override // com.koushikdutta.ion.builder.FutureBuilder
    public IonImageViewRequestBuilder withBitmap() {
        return new IonImageViewRequestBuilder(this);
    }

    @Override // com.koushikdutta.ion.builder.ImageViewFutureBuilder
    public ImageViewFuture intoImageView(ImageView imageView) {
        return new IonImageViewRequestBuilder(this).withImageView(imageView).intoImageView(imageView);
    }

    @Override // com.koushikdutta.ion.builder.LoadBuilder
    /* renamed from: load, reason: merged with bridge method [inline-methods] */
    public Builders.Any.B load2(File file) {
        loadInternal(null, file.toURI().toString());
        return this;
    }

    @Override // com.koushikdutta.ion.builder.BitmapFutureBuilder
    public BitmapInfo asCachedBitmap() {
        return new IonImageViewRequestBuilder(this).asCachedBitmap();
    }

    @Override // com.koushikdutta.ion.builder.BitmapFutureBuilder
    public LocallyCachedStatus isLocallyCached() {
        return new IonImageViewRequestBuilder(this).isLocallyCached();
    }

    @Override // com.koushikdutta.ion.builder.BitmapFutureBuilder
    public Future<Bitmap> asBitmap() {
        return new IonImageViewRequestBuilder(this).asBitmap();
    }

    @Override // com.koushikdutta.ion.builder.RequestBuilder
    public IonRequestBuilder setLogging(String tag, int level) {
        this.logTag = tag;
        this.logLevel = level;
        return this;
    }

    @Override // com.koushikdutta.ion.builder.GsonFutureBuilder
    public <T> ResponseFuture<T> as(Class<T> clazz) {
        return execute(new GsonSerializer(this.ion.configure().getGson(), clazz));
    }

    @Override // com.koushikdutta.ion.builder.GsonFutureBuilder
    public <T> ResponseFuture<T> as(TypeToken<T> token) {
        return execute(new GsonSerializer(this.ion.configure().getGson(), token));
    }

    @Override // com.koushikdutta.ion.builder.FutureBuilder
    public FutureBuilder group(Object groupKey) {
        if (this.groups == null) {
            this.groups = new ArrayList<>();
        }
        this.groups.add(new WeakReference<>(groupKey));
        return this;
    }

    @Override // com.koushikdutta.ion.builder.RequestBuilder
    public IonRequestBuilder proxy(String host, int port) {
        this.proxyHost = host;
        this.proxyPort = port;
        return this;
    }

    @Override // com.koushikdutta.ion.builder.RequestBuilder
    /* renamed from: setJsonPojoBody, reason: merged with bridge method [inline-methods] */
    public Builders.Any.F setJsonPojoBody2(Object object, TypeToken token) {
        setBody(new PojoBody(this.ion.configure().getGson(), object, token));
        return this;
    }

    @Override // com.koushikdutta.ion.builder.RequestBuilder
    /* renamed from: setJsonPojoBody, reason: merged with bridge method [inline-methods] */
    public Builders.Any.F setJsonPojoBody2(Object object) {
        setBody(new PojoBody(this.ion.configure().getGson(), object, null));
        return this;
    }

    @Override // com.koushikdutta.ion.builder.RequestBuilder
    public IonRequestBuilder basicAuthentication(String username, String password) {
        return setHeader("Authorization", "Basic " + Base64.encodeToString(String.format("%s:%s", username, password).getBytes(), 2));
    }

    @Override // com.koushikdutta.ion.builder.RequestBuilder
    public Builders.Any.B uploadProgress(ProgressCallback callback) {
        this.uploadProgress = callback;
        return this;
    }

    @Override // com.koushikdutta.ion.builder.RequestBuilder
    public Builders.Any.B uploadProgressBar(ProgressBar progressBar) {
        this.uploadProgressBar = progressBar;
        return this;
    }

    @Override // com.koushikdutta.ion.builder.RequestBuilder
    public Builders.Any.B uploadProgressDialog(ProgressDialog progressDialog) {
        this.uploadProgressDialog = progressDialog;
        return this;
    }

    @Override // com.koushikdutta.ion.builder.RequestBuilder
    public Builders.Any.B uploadProgressHandler(ProgressCallback callback) {
        this.uploadProgressHandler = callback;
        return this;
    }

    @Override // com.koushikdutta.ion.builder.RequestBuilder
    public Builders.Any.B onHeaders(HeadersCallback callback) {
        this.headersCallback = callback;
        return this;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.koushikdutta.ion.builder.RequestBuilder
    public Builders.Any.F setDocumentBody(Document document) {
        setBody(new DocumentBody(document));
        return this;
    }

    @Override // com.koushikdutta.ion.builder.FutureBuilder
    public ResponseFuture<Document> asDocument() {
        return execute(new DocumentParser());
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.koushikdutta.ion.builder.RequestBuilder
    public Builders.Any.F setFileBody(File file) {
        setBody(new FileBody(file));
        return this;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.koushikdutta.ion.builder.RequestBuilder
    public Builders.Any.F setByteArrayBody(byte[] bytes) {
        if (bytes != null) {
            setBody(new StreamBody(new ByteArrayInputStream(bytes), bytes.length));
        }
        return this;
    }

    @Override // com.koushikdutta.ion.builder.RequestBuilder
    public Builders.Any.F setStreamBody(InputStream inputStream) {
        setBody(new StreamBody(inputStream, -1));
        return this;
    }

    @Override // com.koushikdutta.ion.builder.RequestBuilder
    public Builders.Any.F setStreamBody(InputStream inputStream, int length) {
        setBody(new StreamBody(inputStream, length));
        return this;
    }

    @Override // com.koushikdutta.ion.builder.RequestBuilder
    public Builders.Any.B setHeader(NameValuePair... header) {
        Headers headers = getHeaders();
        for (NameValuePair h : header) {
            headers.set(h.getName(), h.getValue());
        }
        return this;
    }
}
