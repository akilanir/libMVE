package cz.msebera.android.httpclient.message;

import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.ParseException;
import cz.msebera.android.httpclient.ProtocolVersion;
import cz.msebera.android.httpclient.RequestLine;
import cz.msebera.android.httpclient.StatusLine;
import cz.msebera.android.httpclient.util.CharArrayBuffer;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/message/LineParser.class */
public interface LineParser {
    ProtocolVersion parseProtocolVersion(CharArrayBuffer charArrayBuffer, ParserCursor parserCursor) throws ParseException;

    boolean hasProtocolVersion(CharArrayBuffer charArrayBuffer, ParserCursor parserCursor);

    RequestLine parseRequestLine(CharArrayBuffer charArrayBuffer, ParserCursor parserCursor) throws ParseException;

    StatusLine parseStatusLine(CharArrayBuffer charArrayBuffer, ParserCursor parserCursor) throws ParseException;

    Header parseHeader(CharArrayBuffer charArrayBuffer) throws ParseException;
}
