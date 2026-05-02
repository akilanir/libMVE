package cz.msebera.android.httpclient.client.methods;

import cz.msebera.android.httpclient.conn.ClientConnectionRequest;
import cz.msebera.android.httpclient.conn.ConnectionReleaseTrigger;
import java.io.IOException;

@Deprecated
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/client/methods/AbortableHttpRequest.class */
public interface AbortableHttpRequest {
    void setConnectionRequest(ClientConnectionRequest clientConnectionRequest) throws IOException;

    void setReleaseTrigger(ConnectionReleaseTrigger connectionReleaseTrigger) throws IOException;

    void abort();
}
