package cz.msebera.android.httpclient;

import java.io.IOException;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/HttpServerConnection.class */
public interface HttpServerConnection extends HttpConnection {
    HttpRequest receiveRequestHeader() throws HttpException, IOException;

    void receiveRequestEntity(HttpEntityEnclosingRequest httpEntityEnclosingRequest) throws HttpException, IOException;

    void sendResponseHeader(HttpResponse httpResponse) throws HttpException, IOException;

    void sendResponseEntity(HttpResponse httpResponse) throws HttpException, IOException;

    void flush() throws IOException;
}
