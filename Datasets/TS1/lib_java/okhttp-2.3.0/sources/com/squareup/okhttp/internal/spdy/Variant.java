package com.squareup.okhttp.internal.spdy;

import com.squareup.okhttp.Protocol;
import okio.BufferedSink;
import okio.BufferedSource;

/* loaded from: okhttp-2.3.0.jar:com/squareup/okhttp/internal/spdy/Variant.class */
public interface Variant {
    Protocol getProtocol();

    FrameReader newReader(BufferedSource bufferedSource, boolean z);

    FrameWriter newWriter(BufferedSink bufferedSink, boolean z);
}
