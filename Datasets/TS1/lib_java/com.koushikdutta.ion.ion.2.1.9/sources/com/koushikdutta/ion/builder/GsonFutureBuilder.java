package com.koushikdutta.ion.builder;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;
import com.koushikdutta.ion.future.ResponseFuture;
import java.nio.charset.Charset;

/* loaded from: com.koushikdutta.ion.ion.2.1.9.jar:com/koushikdutta/ion/builder/GsonFutureBuilder.class */
public interface GsonFutureBuilder {
    ResponseFuture<JsonArray> asJsonArray();

    ResponseFuture<JsonObject> asJsonObject();

    ResponseFuture<JsonArray> asJsonArray(Charset charset);

    ResponseFuture<JsonObject> asJsonObject(Charset charset);

    <T> ResponseFuture<T> as(Class<T> cls);

    <T> ResponseFuture<T> as(TypeToken<T> typeToken);
}
