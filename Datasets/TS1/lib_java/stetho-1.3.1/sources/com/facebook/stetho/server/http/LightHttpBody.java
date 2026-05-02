package com.facebook.stetho.server.http;

import com.facebook.stetho.common.Utf8Charset;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/server/http/LightHttpBody.class */
public abstract class LightHttpBody {
    public abstract String contentType();

    public abstract int contentLength();

    public abstract void writeTo(OutputStream outputStream) throws IOException;

    public static LightHttpBody create(String body, String contentType) {
        try {
            return create(body.getBytes(Utf8Charset.NAME), contentType);
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        }
    }

    public static LightHttpBody create(final byte[] body, final String contentType) {
        return new LightHttpBody() { // from class: com.facebook.stetho.server.http.LightHttpBody.1
            @Override // com.facebook.stetho.server.http.LightHttpBody
            public String contentType() {
                return contentType;
            }

            @Override // com.facebook.stetho.server.http.LightHttpBody
            public int contentLength() {
                return body.length;
            }

            @Override // com.facebook.stetho.server.http.LightHttpBody
            public void writeTo(OutputStream output) throws IOException {
                output.write(body);
            }
        };
    }
}
