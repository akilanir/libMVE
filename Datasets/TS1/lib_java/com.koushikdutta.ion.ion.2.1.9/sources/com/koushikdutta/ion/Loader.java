package com.koushikdutta.ion;

import android.content.Context;
import com.koushikdutta.async.DataEmitter;
import com.koushikdutta.async.future.Future;
import com.koushikdutta.async.future.FutureCallback;
import com.koushikdutta.async.http.AsyncHttpRequest;
import com.koushikdutta.ion.bitmap.BitmapInfo;
import com.koushikdutta.ion.future.ResponseFuture;
import java.lang.reflect.Type;

/* loaded from: com.koushikdutta.ion.ion.2.1.9.jar:com/koushikdutta/ion/Loader.class */
public interface Loader {
    Future<DataEmitter> load(Ion ion, AsyncHttpRequest asyncHttpRequest, FutureCallback<LoaderEmitter> futureCallback);

    Future<BitmapInfo> loadBitmap(Context context, Ion ion, String str, String str2, int i, int i2, boolean z);

    Future<AsyncHttpRequest> resolve(Context context, Ion ion, AsyncHttpRequest asyncHttpRequest);

    <T> ResponseFuture<T> load(Ion ion, AsyncHttpRequest asyncHttpRequest, Type type);

    /* loaded from: com.koushikdutta.ion.ion.2.1.9.jar:com/koushikdutta/ion/Loader$LoaderEmitter.class */
    public static class LoaderEmitter {
        DataEmitter emitter;
        long length;
        ResponseServedFrom servedFrom;
        HeadersResponse headers;
        AsyncHttpRequest request;

        public LoaderEmitter(DataEmitter emitter, long length, ResponseServedFrom servedFrom, HeadersResponse headers, AsyncHttpRequest request) {
            this.length = length;
            this.emitter = emitter;
            this.servedFrom = servedFrom;
            this.headers = headers;
            this.request = request;
        }

        public DataEmitter getDataEmitter() {
            return this.emitter;
        }

        public long length() {
            return this.length;
        }

        public ResponseServedFrom getServedFrom() {
            return this.servedFrom;
        }

        public HeadersResponse getHeaders() {
            return this.headers;
        }

        public AsyncHttpRequest getRequest() {
            return this.request;
        }
    }
}
