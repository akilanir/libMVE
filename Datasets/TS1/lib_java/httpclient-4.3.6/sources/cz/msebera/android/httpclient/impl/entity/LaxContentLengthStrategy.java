package cz.msebera.android.httpclient.impl.entity;

import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.HeaderElement;
import cz.msebera.android.httpclient.HttpException;
import cz.msebera.android.httpclient.HttpMessage;
import cz.msebera.android.httpclient.ParseException;
import cz.msebera.android.httpclient.ProtocolException;
import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.entity.ContentLengthStrategy;
import cz.msebera.android.httpclient.protocol.HTTP;
import cz.msebera.android.httpclient.util.Args;

@Immutable
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/entity/LaxContentLengthStrategy.class */
public class LaxContentLengthStrategy implements ContentLengthStrategy {
    public static final LaxContentLengthStrategy INSTANCE = new LaxContentLengthStrategy();
    private final int implicitLen;

    public LaxContentLengthStrategy(int implicitLen) {
        this.implicitLen = implicitLen;
    }

    public LaxContentLengthStrategy() {
        this(-1);
    }

    @Override // cz.msebera.android.httpclient.entity.ContentLengthStrategy
    public long determineLength(HttpMessage message) throws HttpException {
        Args.notNull(message, "HTTP message");
        Header transferEncodingHeader = message.getFirstHeader("Transfer-Encoding");
        if (transferEncodingHeader != null) {
            try {
                HeaderElement[] encodings = transferEncodingHeader.getElements();
                int len = encodings.length;
                if (!HTTP.IDENTITY_CODING.equalsIgnoreCase(transferEncodingHeader.getValue()) && len > 0 && HTTP.CHUNK_CODING.equalsIgnoreCase(encodings[len - 1].getName())) {
                    return -2L;
                }
                return -1L;
            } catch (ParseException px) {
                throw new ProtocolException("Invalid Transfer-Encoding header value: " + transferEncodingHeader, px);
            }
        }
        Header contentLengthHeader = message.getFirstHeader("Content-Length");
        if (contentLengthHeader != null) {
            long contentlen = -1;
            Header[] headers = message.getHeaders("Content-Length");
            for (int i = headers.length - 1; i >= 0; i--) {
                Header header = headers[i];
                try {
                    contentlen = Long.parseLong(header.getValue());
                    break;
                } catch (NumberFormatException e) {
                }
            }
            if (contentlen >= 0) {
                return contentlen;
            }
            return -1L;
        }
        return this.implicitLen;
    }
}
