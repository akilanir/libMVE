package com.koushikdutta.ion.future;

import com.koushikdutta.async.future.Future;
import com.koushikdutta.ion.Response;

/* loaded from: com.koushikdutta.ion.ion.2.1.7.jar:com/koushikdutta/ion/future/ResponseFuture.class */
public interface ResponseFuture<T> extends Future<T> {
    Future<Response<T>> withResponse();
}
