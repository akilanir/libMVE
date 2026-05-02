package com.squareup.okhttp.internal.framed;

import com.squareup.okhttp.Protocol;
import okio.BufferedSink;
import okio.BufferedSource;

/* loaded from: okhttp-2.7.5.jar:com/squareup/okhttp/internal/framed/Variant.class */
public interface Variant {
    Protocol getProtocol();

    FrameReader newReader(BufferedSource bufferedSource, boolean z);

    FrameWriter newWriter(BufferedSink bufferedSink, boolean z);
}
