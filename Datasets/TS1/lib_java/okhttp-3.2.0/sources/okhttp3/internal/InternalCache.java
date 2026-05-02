package okhttp3.internal;

import java.io.IOException;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.internal.http.CacheRequest;
import okhttp3.internal.http.CacheStrategy;

/* loaded from: okhttp-3.2.0.jar:okhttp3/internal/InternalCache.class */
public interface InternalCache {
    Response get(Request request) throws IOException;

    CacheRequest put(Response response) throws IOException;

    void remove(Request request) throws IOException;

    void update(Response response, Response response2) throws IOException;

    void trackConditionalCacheHit();

    void trackResponse(CacheStrategy cacheStrategy);
}
