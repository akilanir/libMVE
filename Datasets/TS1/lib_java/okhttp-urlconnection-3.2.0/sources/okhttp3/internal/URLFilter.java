package okhttp3.internal;

import java.io.IOException;
import java.net.URL;

/* loaded from: okhttp-urlconnection-3.2.0.jar:okhttp3/internal/URLFilter.class */
public interface URLFilter {
    void checkURLPermitted(URL url) throws IOException;
}
