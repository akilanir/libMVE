package cz.msebera.android.httpclient.io;

import cz.msebera.android.httpclient.HttpMessage;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/io/HttpMessageWriterFactory.class */
public interface HttpMessageWriterFactory<T extends HttpMessage> {
    HttpMessageWriter<T> create(SessionOutputBuffer sessionOutputBuffer);
}
