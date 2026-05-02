package cz.msebera.android.httpclient.io;

import cz.msebera.android.httpclient.HttpMessage;
import cz.msebera.android.httpclient.config.MessageConstraints;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/io/HttpMessageParserFactory.class */
public interface HttpMessageParserFactory<T extends HttpMessage> {
    HttpMessageParser<T> create(SessionInputBuffer sessionInputBuffer, MessageConstraints messageConstraints);
}
