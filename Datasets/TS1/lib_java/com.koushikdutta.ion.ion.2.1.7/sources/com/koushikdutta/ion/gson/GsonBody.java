package com.koushikdutta.ion.gson;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.koushikdutta.async.DataEmitter;
import com.koushikdutta.async.DataSink;
import com.koushikdutta.async.Util;
import com.koushikdutta.async.callback.CompletedCallback;
import com.koushikdutta.async.http.AsyncHttpRequest;
import com.koushikdutta.async.http.body.AsyncHttpRequestBody;
import java.io.ByteArrayOutputStream;
import java.io.OutputStreamWriter;

/* loaded from: com.koushikdutta.ion.ion.2.1.7.jar:com/koushikdutta/ion/gson/GsonBody.class */
public class GsonBody<T extends JsonElement> implements AsyncHttpRequestBody<T> {
    byte[] mBodyBytes;
    T json;
    Gson gson;
    public static final String CONTENT_TYPE = "application/json";

    public GsonBody(Gson gson, T json) {
        this.json = json;
        this.gson = gson;
    }

    public void parse(DataEmitter emitter, CompletedCallback completed) {
        throw new AssertionError("not implemented");
    }

    public void write(AsyncHttpRequest request, DataSink sink, CompletedCallback completed) {
        if (this.mBodyBytes == null) {
            ByteArrayOutputStream bout = new ByteArrayOutputStream();
            OutputStreamWriter out = new OutputStreamWriter(bout);
            this.gson.toJson(this.json, out);
            this.mBodyBytes = bout.toByteArray();
        }
        Util.writeAll(sink, this.mBodyBytes, completed);
    }

    public String getContentType() {
        return "application/json";
    }

    public boolean readFullyOnRequest() {
        return true;
    }

    public int length() {
        if (this.mBodyBytes == null) {
            this.mBodyBytes = this.json.toString().getBytes();
        }
        return this.mBodyBytes.length;
    }

    /* renamed from: get, reason: merged with bridge method [inline-methods] */
    public T m20get() {
        return this.json;
    }
}
