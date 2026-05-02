package cz.msebera.android.httpclient.io;

import cz.msebera.android.httpclient.HttpException;
import cz.msebera.android.httpclient.HttpMessage;
import java.io.IOException;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/io/HttpMessageParser.class */
public interface HttpMessageParser<T extends HttpMessage> {
    T parse() throws IOException, HttpException;
}
