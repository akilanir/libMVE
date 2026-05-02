package cz.msebera.android.httpclient.io;

import cz.msebera.android.httpclient.HttpException;
import cz.msebera.android.httpclient.HttpMessage;
import java.io.IOException;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/io/HttpMessageWriter.class */
public interface HttpMessageWriter<T extends HttpMessage> {
    void write(T t) throws IOException, HttpException;
}
