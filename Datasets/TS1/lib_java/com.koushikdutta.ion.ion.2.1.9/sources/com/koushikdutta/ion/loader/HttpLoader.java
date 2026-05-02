package com.koushikdutta.ion.loader;

import android.text.TextUtils;
import com.koushikdutta.async.DataEmitter;
import com.koushikdutta.async.future.Future;
import com.koushikdutta.async.future.FutureCallback;
import com.koushikdutta.async.http.AsyncHttpRequest;
import com.koushikdutta.async.http.AsyncHttpResponse;
import com.koushikdutta.async.http.HttpUtil;
import com.koushikdutta.async.http.callback.HttpConnectCallback;
import com.koushikdutta.ion.HeadersResponse;
import com.koushikdutta.ion.Ion;
import com.koushikdutta.ion.Loader;
import com.koushikdutta.ion.ResponseServedFrom;

/* loaded from: com.koushikdutta.ion.ion.2.1.9.jar:com/koushikdutta/ion/loader/HttpLoader.class */
public class HttpLoader extends SimpleLoader {
    @Override // com.koushikdutta.ion.loader.SimpleLoader, com.koushikdutta.ion.Loader
    public Future<DataEmitter> load(Ion ion, AsyncHttpRequest request, final FutureCallback<Loader.LoaderEmitter> callback) {
        if (!request.getUri().getScheme().startsWith("http")) {
            return null;
        }
        return ion.getHttpClient().execute(request, new HttpConnectCallback() { // from class: com.koushikdutta.ion.loader.HttpLoader.1
            public void onConnectCompleted(Exception ex, AsyncHttpResponse response) {
                long length = -1;
                ResponseServedFrom loadedFrom = ResponseServedFrom.LOADED_FROM_NETWORK;
                HeadersResponse headers = null;
                AsyncHttpRequest request2 = null;
                if (response != null) {
                    request2 = response.getRequest();
                    headers = new HeadersResponse(response.code(), response.message(), response.headers());
                    length = HttpUtil.contentLength(headers.getHeaders());
                    String servedFrom = response.headers().get("X-Served-From");
                    if (TextUtils.equals(servedFrom, "cache")) {
                        loadedFrom = ResponseServedFrom.LOADED_FROM_CACHE;
                    } else if (TextUtils.equals(servedFrom, "conditional-cache")) {
                        loadedFrom = ResponseServedFrom.LOADED_FROM_CONDITIONAL_CACHE;
                    }
                }
                callback.onCompleted(ex, new Loader.LoaderEmitter(response, length, loadedFrom, headers, request2));
            }
        });
    }
}
