package okhttp3.internal.framed;

import okhttp3.Protocol;
import okio.BufferedSink;
import okio.BufferedSource;

/* loaded from: okhttp-3.1.2.jar:okhttp3/internal/framed/Variant.class */
public interface Variant {
    Protocol getProtocol();

    FrameReader newReader(BufferedSource bufferedSource, boolean z);

    FrameWriter newWriter(BufferedSink bufferedSink, boolean z);
}
