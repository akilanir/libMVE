package com.koushikdutta.async.http;

import com.koushikdutta.async.AsyncSocket;
import com.koushikdutta.async.DataEmitter;
import com.koushikdutta.async.DataSink;
import com.koushikdutta.async.callback.CompletedCallback;
import com.koushikdutta.async.callback.ConnectCallback;
import com.koushikdutta.async.future.Cancellable;
import com.koushikdutta.async.util.UntypedHashtable;

/* loaded from: com.koushikdutta.async.androidasync.2.1.9.jar:com/koushikdutta/async/http/AsyncHttpClientMiddleware.class */
public interface AsyncHttpClientMiddleware {

    /* loaded from: com.koushikdutta.async.androidasync.2.1.9.jar:com/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData.class */
    public static class GetSocketData extends OnRequestData {
        public ConnectCallback connectCallback;
        public Cancellable socketCancellable;
        public String protocol;
    }

    /* loaded from: com.koushikdutta.async.androidasync.2.1.9.jar:com/koushikdutta/async/http/AsyncHttpClientMiddleware$OnBodyDataOnRequestSentData.class */
    public static class OnBodyDataOnRequestSentData extends OnHeadersReceivedDataOnRequestSentData {
        public DataEmitter bodyEmitter;
    }

    /* loaded from: com.koushikdutta.async.androidasync.2.1.9.jar:com/koushikdutta/async/http/AsyncHttpClientMiddleware$OnExchangeHeaderData.class */
    public static class OnExchangeHeaderData extends GetSocketData {
        public AsyncSocket socket;
        public ResponseHead response;
        public CompletedCallback sendHeadersCallback;
        public CompletedCallback receiveHeadersCallback;
    }

    /* loaded from: com.koushikdutta.async.androidasync.2.1.9.jar:com/koushikdutta/async/http/AsyncHttpClientMiddleware$OnHeadersReceivedDataOnRequestSentData.class */
    public static class OnHeadersReceivedDataOnRequestSentData extends OnRequestSentData {
    }

    /* loaded from: com.koushikdutta.async.androidasync.2.1.9.jar:com/koushikdutta/async/http/AsyncHttpClientMiddleware$OnRequestData.class */
    public static class OnRequestData {
        public UntypedHashtable state = new UntypedHashtable();
        public AsyncHttpRequest request;
    }

    /* loaded from: com.koushikdutta.async.androidasync.2.1.9.jar:com/koushikdutta/async/http/AsyncHttpClientMiddleware$OnRequestSentData.class */
    public static class OnRequestSentData extends OnExchangeHeaderData {
    }

    /* loaded from: com.koushikdutta.async.androidasync.2.1.9.jar:com/koushikdutta/async/http/AsyncHttpClientMiddleware$OnResponseCompleteDataOnRequestSentData.class */
    public static class OnResponseCompleteDataOnRequestSentData extends OnBodyDataOnRequestSentData {
        public Exception exception;
    }

    /* loaded from: com.koushikdutta.async.androidasync.2.1.9.jar:com/koushikdutta/async/http/AsyncHttpClientMiddleware$ResponseHead.class */
    public interface ResponseHead {
        AsyncSocket socket();

        String protocol();

        String message();

        int code();

        ResponseHead protocol(String str);

        ResponseHead message(String str);

        ResponseHead code(int i);

        Headers headers();

        ResponseHead headers(Headers headers);

        DataSink sink();

        ResponseHead sink(DataSink dataSink);

        DataEmitter emitter();

        ResponseHead emitter(DataEmitter dataEmitter);
    }

    void onRequest(OnRequestData onRequestData);

    Cancellable getSocket(GetSocketData getSocketData);

    boolean exchangeHeaders(OnExchangeHeaderData onExchangeHeaderData);

    void onRequestSent(OnRequestSentData onRequestSentData);

    void onHeadersReceived(OnHeadersReceivedDataOnRequestSentData onHeadersReceivedDataOnRequestSentData);

    void onBodyDecoder(OnBodyDataOnRequestSentData onBodyDataOnRequestSentData);

    void onResponseComplete(OnResponseCompleteDataOnRequestSentData onResponseCompleteDataOnRequestSentData);
}
