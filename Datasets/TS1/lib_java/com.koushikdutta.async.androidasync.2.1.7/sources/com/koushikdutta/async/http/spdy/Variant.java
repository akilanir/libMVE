package com.koushikdutta.async.http.spdy;

import com.koushikdutta.async.BufferedDataSink;
import com.koushikdutta.async.DataEmitter;
import com.koushikdutta.async.http.Protocol;
import com.koushikdutta.async.http.spdy.FrameReader;

/* loaded from: com.koushikdutta.async.androidasync.2.1.7.jar:com/koushikdutta/async/http/spdy/Variant.class */
interface Variant {
    Protocol getProtocol();

    FrameReader newReader(DataEmitter dataEmitter, FrameReader.Handler handler, boolean z);

    FrameWriter newWriter(BufferedDataSink bufferedDataSink, boolean z);

    int maxFrameSize();
}
