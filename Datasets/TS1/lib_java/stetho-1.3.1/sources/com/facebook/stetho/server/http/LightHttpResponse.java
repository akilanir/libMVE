package com.facebook.stetho.server.http;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/server/http/LightHttpResponse.class */
public class LightHttpResponse extends LightHttpMessage {
    public int code;
    public String reasonPhrase;
    public LightHttpBody body;

    public void prepare() {
        if (this.body != null) {
            addHeader(HttpHeaders.CONTENT_TYPE, this.body.contentType());
            addHeader(HttpHeaders.CONTENT_LENGTH, String.valueOf(this.body.contentLength()));
        }
    }

    @Override // com.facebook.stetho.server.http.LightHttpMessage
    public void reset() {
        super.reset();
        this.code = -1;
        this.reasonPhrase = null;
        this.body = null;
    }
}
