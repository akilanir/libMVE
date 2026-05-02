package com.squareup.okhttp.internal.framed;

import java.io.IOException;

/* loaded from: okhttp-2.6.0.jar:com/squareup/okhttp/internal/framed/IncomingStreamHandler.class */
public interface IncomingStreamHandler {
    public static final IncomingStreamHandler REFUSE_INCOMING_STREAMS = new IncomingStreamHandler() { // from class: com.squareup.okhttp.internal.framed.IncomingStreamHandler.1
        @Override // com.squareup.okhttp.internal.framed.IncomingStreamHandler
        public void receive(FramedStream stream) throws IOException {
            stream.close(ErrorCode.REFUSED_STREAM);
        }
    };

    void receive(FramedStream framedStream) throws IOException;
}
