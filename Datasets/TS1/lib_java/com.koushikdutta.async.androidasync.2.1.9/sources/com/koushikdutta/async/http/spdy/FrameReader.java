package com.koushikdutta.async.http.spdy;

import com.koushikdutta.async.ByteBufferList;
import java.util.List;

/* loaded from: com.koushikdutta.async.androidasync.2.1.9.jar:com/koushikdutta/async/http/spdy/FrameReader.class */
interface FrameReader {

    /* loaded from: com.koushikdutta.async.androidasync.2.1.9.jar:com/koushikdutta/async/http/spdy/FrameReader$Handler.class */
    public interface Handler {
        void error(Exception exc);

        void data(boolean z, int i, ByteBufferList byteBufferList);

        void headers(boolean z, boolean z2, int i, int i2, List<Header> list, HeadersMode headersMode);

        void rstStream(int i, ErrorCode errorCode);

        void settings(boolean z, Settings settings);

        void ackSettings();

        void ping(boolean z, int i, int i2);

        void goAway(int i, ErrorCode errorCode, ByteString byteString);

        void windowUpdate(int i, long j);

        void priority(int i, int i2, int i3, boolean z);

        void pushPromise(int i, int i2, List<Header> list);

        void alternateService(int i, String str, ByteString byteString, String str2, int i2, long j);
    }
}
