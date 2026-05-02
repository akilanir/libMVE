package com.squareup.okhttp.internal.spdy;

import java.io.IOException;

/* loaded from: okhttp-2.3.0.jar:com/squareup/okhttp/internal/spdy/IncomingStreamHandler.class */
public interface IncomingStreamHandler {
    public static final IncomingStreamHandler REFUSE_INCOMING_STREAMS = new IncomingStreamHandler() { // from class: com.squareup.okhttp.internal.spdy.IncomingStreamHandler.1
        @Override // com.squareup.okhttp.internal.spdy.IncomingStreamHandler
        public void receive(SpdyStream stream) throws IOException {
            stream.close(ErrorCode.REFUSED_STREAM);
        }
    };

    void receive(SpdyStream spdyStream) throws IOException;
}
