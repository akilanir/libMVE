package okhttp3.internal.http;

import java.io.IOException;
import okio.Sink;

/* loaded from: okhttp-3.1.2.jar:okhttp3/internal/http/CacheRequest.class */
public interface CacheRequest {
    Sink body() throws IOException;

    void abort();
}
