package com.squareup.okhttp.internal.spdy;

import java.io.IOException;
import java.util.List;
import okio.BufferedSource;

/* loaded from: okhttp-2.2.0.jar:com/squareup/okhttp/internal/spdy/PushObserver.class */
public interface PushObserver {
    public static final PushObserver CANCEL = new PushObserver() { // from class: com.squareup.okhttp.internal.spdy.PushObserver.1
        @Override // com.squareup.okhttp.internal.spdy.PushObserver
        public boolean onRequest(int streamId, List<Header> requestHeaders) {
            return true;
        }

        @Override // com.squareup.okhttp.internal.spdy.PushObserver
        public boolean onHeaders(int streamId, List<Header> responseHeaders, boolean last) {
            return true;
        }

        @Override // com.squareup.okhttp.internal.spdy.PushObserver
        public boolean onData(int streamId, BufferedSource source, int byteCount, boolean last) throws IOException {
            source.skip(byteCount);
            return true;
        }

        @Override // com.squareup.okhttp.internal.spdy.PushObserver
        public void onReset(int streamId, ErrorCode errorCode) {
        }
    };

    boolean onRequest(int i, List<Header> list);

    boolean onHeaders(int i, List<Header> list, boolean z);

    boolean onData(int i, BufferedSource bufferedSource, int i2, boolean z) throws IOException;

    void onReset(int i, ErrorCode errorCode);
}
