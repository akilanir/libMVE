package cz.msebera.android.httpclient;

import cz.msebera.android.httpclient.util.CharArrayBuffer;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/FormattedHeader.class */
public interface FormattedHeader extends Header {
    CharArrayBuffer getBuffer();

    int getValuePos();
}
