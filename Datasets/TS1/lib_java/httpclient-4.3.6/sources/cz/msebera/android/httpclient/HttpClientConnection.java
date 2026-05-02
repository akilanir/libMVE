package cz.msebera.android.httpclient;

import java.io.IOException;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/HttpClientConnection.class */
public interface HttpClientConnection extends HttpConnection {
    boolean isResponseAvailable(int i) throws IOException;

    void sendRequestHeader(HttpRequest httpRequest) throws HttpException, IOException;

    void sendRequestEntity(HttpEntityEnclosingRequest httpEntityEnclosingRequest) throws HttpException, IOException;

    HttpResponse receiveResponseHeader() throws HttpException, IOException;

    void receiveResponseEntity(HttpResponse httpResponse) throws HttpException, IOException;

    void flush() throws IOException;
}
