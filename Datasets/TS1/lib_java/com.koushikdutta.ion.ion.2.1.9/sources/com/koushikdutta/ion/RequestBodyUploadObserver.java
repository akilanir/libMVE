package com.koushikdutta.ion;

import com.koushikdutta.async.AsyncServer;
import com.koushikdutta.async.ByteBufferList;
import com.koushikdutta.async.DataEmitter;
import com.koushikdutta.async.DataSink;
import com.koushikdutta.async.callback.CompletedCallback;
import com.koushikdutta.async.callback.WritableCallback;
import com.koushikdutta.async.http.AsyncHttpRequest;
import com.koushikdutta.async.http.body.AsyncHttpRequestBody;

/* loaded from: com.koushikdutta.ion.ion.2.1.9.jar:com/koushikdutta/ion/RequestBodyUploadObserver.class */
class RequestBodyUploadObserver implements AsyncHttpRequestBody {
    AsyncHttpRequestBody body;
    ProgressCallback callback;

    public RequestBodyUploadObserver(AsyncHttpRequestBody body, ProgressCallback callback) {
        this.body = body;
        this.callback = callback;
    }

    public void write(AsyncHttpRequest request, final DataSink sink, CompletedCallback completed) {
        final int length = this.body.length();
        this.body.write(request, new DataSink() { // from class: com.koushikdutta.ion.RequestBodyUploadObserver.1
            int totalWritten;

            public void write(ByteBufferList bb) {
                int start = bb.remaining();
                sink.write(bb);
                int wrote = start - bb.remaining();
                this.totalWritten += wrote;
                RequestBodyUploadObserver.this.callback.onProgress(this.totalWritten, length);
            }

            public void setWriteableCallback(WritableCallback handler) {
                sink.setWriteableCallback(handler);
            }

            public WritableCallback getWriteableCallback() {
                return sink.getWriteableCallback();
            }

            public boolean isOpen() {
                return sink.isOpen();
            }

            public void end() {
                sink.end();
            }

            public void setClosedCallback(CompletedCallback handler) {
                sink.setClosedCallback(handler);
            }

            public CompletedCallback getClosedCallback() {
                return sink.getClosedCallback();
            }

            public AsyncServer getServer() {
                return sink.getServer();
            }
        }, completed);
    }

    public void parse(DataEmitter emitter, CompletedCallback completed) {
        this.body.parse(emitter, completed);
    }

    public String getContentType() {
        return this.body.getContentType();
    }

    public boolean readFullyOnRequest() {
        return this.body.readFullyOnRequest();
    }

    public int length() {
        return this.body.length();
    }

    public Object get() {
        return this.body.get();
    }
}
