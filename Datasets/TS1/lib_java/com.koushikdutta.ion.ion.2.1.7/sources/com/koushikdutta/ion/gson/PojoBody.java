package com.koushikdutta.ion.gson;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.koushikdutta.async.DataEmitter;
import com.koushikdutta.async.DataSink;
import com.koushikdutta.async.Util;
import com.koushikdutta.async.callback.CompletedCallback;
import com.koushikdutta.async.http.AsyncHttpRequest;
import com.koushikdutta.async.http.body.AsyncHttpRequestBody;
import java.io.ByteArrayOutputStream;
import java.io.OutputStreamWriter;
import java.lang.reflect.Type;

/* loaded from: com.koushikdutta.ion.ion.2.1.7.jar:com/koushikdutta/ion/gson/PojoBody.class */
public class PojoBody<T> implements AsyncHttpRequestBody<T> {
    T pojo;
    byte[] bodyBytes;
    Type type;
    Gson gson;
    public static final String CONTENT_TYPE = "application/json";

    public PojoBody(Gson gson, T pojo, TypeToken<T> token) {
        this.pojo = pojo;
        if (token != null) {
            this.type = token.getType();
        }
        this.gson = gson;
        if (pojo.getClass().isPrimitive() || (pojo instanceof String)) {
            throw new AssertionError("must provide a non-primitive type");
        }
    }

    byte[] getBodyBytes() {
        if (this.bodyBytes != null) {
            return this.bodyBytes;
        }
        ByteArrayOutputStream bout = new ByteArrayOutputStream();
        OutputStreamWriter out = new OutputStreamWriter(bout);
        if (this.type == null) {
            this.gson.toJson(this.pojo, out);
        } else {
            this.gson.toJson(this.pojo, this.type, out);
        }
        try {
            out.flush();
            bout.flush();
        } catch (Exception e) {
        }
        this.bodyBytes = bout.toByteArray();
        return this.bodyBytes;
    }

    public void write(AsyncHttpRequest request, DataSink sink, CompletedCallback completed) {
        Util.writeAll(sink, getBodyBytes(), completed);
    }

    public void parse(DataEmitter emitter, CompletedCallback completed) {
    }

    public String getContentType() {
        return "application/json";
    }

    public boolean readFullyOnRequest() {
        return true;
    }

    public int length() {
        return getBodyBytes().length;
    }

    public T get() {
        return this.pojo;
    }
}
