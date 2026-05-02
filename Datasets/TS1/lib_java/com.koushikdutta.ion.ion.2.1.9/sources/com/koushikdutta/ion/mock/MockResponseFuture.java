package com.koushikdutta.ion.mock;

import com.koushikdutta.async.future.Future;
import com.koushikdutta.async.future.FutureCallback;
import com.koushikdutta.async.future.SimpleFuture;
import com.koushikdutta.async.http.AsyncHttpRequest;
import com.koushikdutta.async.http.Headers;
import com.koushikdutta.ion.HeadersResponse;
import com.koushikdutta.ion.Response;
import com.koushikdutta.ion.ResponseServedFrom;
import com.koushikdutta.ion.future.ResponseFuture;
import com.koushikdutta.ion.loader.MediaFile;

/* loaded from: com.koushikdutta.ion.ion.2.1.9.jar:com/koushikdutta/ion/mock/MockResponseFuture.class */
public class MockResponseFuture<T> extends SimpleFuture<T> implements ResponseFuture<T> {
    private AsyncHttpRequest request;

    public MockResponseFuture(AsyncHttpRequest request) {
        this.request = request;
    }

    protected Headers getHeaders() {
        return new Headers();
    }

    protected HeadersResponse getHeadersResponse() {
        return new HeadersResponse(MediaFile.FILE_TYPE_MP2PS, "OK", getHeaders());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public Response<T> getResponse(Exception e, T result) {
        return new Response<>(this.request, ResponseServedFrom.LOADED_FROM_NETWORK, getHeadersResponse(), e, result);
    }

    @Override // com.koushikdutta.ion.future.ResponseFuture
    public Future<Response<T>> withResponse() {
        final SimpleFuture<Response<T>> ret = new SimpleFuture<>();
        setCallback(new FutureCallback<T>() { // from class: com.koushikdutta.ion.mock.MockResponseFuture.1
            public void onCompleted(Exception e, T result) {
                ret.setComplete(MockResponseFuture.this.getResponse(e, result));
            }
        });
        ret.setParent(this);
        return ret;
    }
}
