package cz.msebera.android.httpclient.message;

import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.ProtocolVersion;
import cz.msebera.android.httpclient.RequestLine;
import cz.msebera.android.httpclient.StatusLine;
import cz.msebera.android.httpclient.util.CharArrayBuffer;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/message/LineFormatter.class */
public interface LineFormatter {
    CharArrayBuffer appendProtocolVersion(CharArrayBuffer charArrayBuffer, ProtocolVersion protocolVersion);

    CharArrayBuffer formatRequestLine(CharArrayBuffer charArrayBuffer, RequestLine requestLine);

    CharArrayBuffer formatStatusLine(CharArrayBuffer charArrayBuffer, StatusLine statusLine);

    CharArrayBuffer formatHeader(CharArrayBuffer charArrayBuffer, Header header);
}
