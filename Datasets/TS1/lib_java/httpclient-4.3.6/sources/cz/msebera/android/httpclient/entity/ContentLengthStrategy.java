package cz.msebera.android.httpclient.entity;

import cz.msebera.android.httpclient.HttpException;
import cz.msebera.android.httpclient.HttpMessage;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/entity/ContentLengthStrategy.class */
public interface ContentLengthStrategy {
    public static final int IDENTITY = -1;
    public static final int CHUNKED = -2;

    long determineLength(HttpMessage httpMessage) throws HttpException;
}
