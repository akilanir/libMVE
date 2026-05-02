package com.facebook.stetho.server.http;

import android.net.Uri;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/server/http/LightHttpRequest.class */
public class LightHttpRequest extends LightHttpMessage {
    public String method;
    public Uri uri;
    public String protocol;

    @Override // com.facebook.stetho.server.http.LightHttpMessage
    public void reset() {
        super.reset();
        this.method = null;
        this.uri = null;
        this.protocol = null;
    }
}
