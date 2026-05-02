package com.koushikdutta.async.http.body;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;

/* loaded from: com.koushikdutta.async.androidasync.2.1.9.jar:com/koushikdutta/async/http/body/StringPart.class */
public class StringPart extends StreamPart {
    String value;

    public StringPart(String name, String value) {
        super(name, value.getBytes().length, null);
        this.value = value;
    }

    @Override // com.koushikdutta.async.http.body.StreamPart
    protected InputStream getInputStream() throws IOException {
        return new ByteArrayInputStream(this.value.getBytes());
    }
}
