package com.koushikdutta.async.http.spdy;

import com.koushikdutta.async.http.Protocol;
import java.util.List;

/* loaded from: com.koushikdutta.async.androidasync.2.1.7.jar:com/koushikdutta/async/http/spdy/SpdyTransport.class */
final class SpdyTransport {
    private static final List<String> SPDY_3_PROHIBITED_HEADERS = Util.immutableList("connection", "host", "keep-alive", "proxy-connection", "transfer-encoding");
    private static final List<String> HTTP_2_PROHIBITED_HEADERS = Util.immutableList("connection", "host", "keep-alive", "proxy-connection", "te", "transfer-encoding", "encoding", "upgrade");

    SpdyTransport() {
    }

    static boolean isProhibitedHeader(Protocol protocol, String name) {
        if (protocol == Protocol.SPDY_3) {
            return SPDY_3_PROHIBITED_HEADERS.contains(name.toLowerCase());
        }
        if (protocol == Protocol.HTTP_2) {
            return HTTP_2_PROHIBITED_HEADERS.contains(name.toLowerCase());
        }
        throw new AssertionError(protocol);
    }
}
