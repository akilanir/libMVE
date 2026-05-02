package cz.msebera.android.httpclient.client.protocol;

import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.HeaderElement;
import cz.msebera.android.httpclient.HttpEntity;
import cz.msebera.android.httpclient.HttpException;
import cz.msebera.android.httpclient.HttpHeaders;
import cz.msebera.android.httpclient.HttpResponse;
import cz.msebera.android.httpclient.HttpResponseInterceptor;
import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.client.entity.DeflateDecompressingEntity;
import cz.msebera.android.httpclient.client.entity.GzipDecompressingEntity;
import cz.msebera.android.httpclient.protocol.HTTP;
import cz.msebera.android.httpclient.protocol.HttpContext;
import java.io.IOException;
import java.util.Locale;

@Immutable
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/client/protocol/ResponseContentEncoding.class */
public class ResponseContentEncoding implements HttpResponseInterceptor {
    public static final String UNCOMPRESSED = "http.client.response.uncompressed";

    @Override // cz.msebera.android.httpclient.HttpResponseInterceptor
    public void process(HttpResponse response, HttpContext context) throws HttpException, IOException {
        Header ceheader;
        HttpEntity entity = response.getEntity();
        if (entity != null && entity.getContentLength() != 0 && (ceheader = entity.getContentEncoding()) != null) {
            HeaderElement[] codecs = ceheader.getElements();
            boolean uncompressed = false;
            if (0 < codecs.length) {
                HeaderElement codec = codecs[0];
                String codecname = codec.getName().toLowerCase(Locale.ENGLISH);
                if ("gzip".equals(codecname) || "x-gzip".equals(codecname)) {
                    response.setEntity(new GzipDecompressingEntity(response.getEntity()));
                    uncompressed = true;
                } else if ("deflate".equals(codecname)) {
                    response.setEntity(new DeflateDecompressingEntity(response.getEntity()));
                    uncompressed = true;
                } else if (HTTP.IDENTITY_CODING.equals(codecname)) {
                    return;
                } else {
                    throw new HttpException("Unsupported Content-Coding: " + codec.getName());
                }
            }
            if (uncompressed) {
                response.removeHeaders("Content-Length");
                response.removeHeaders("Content-Encoding");
                response.removeHeaders(HttpHeaders.CONTENT_MD5);
            }
        }
    }
}
