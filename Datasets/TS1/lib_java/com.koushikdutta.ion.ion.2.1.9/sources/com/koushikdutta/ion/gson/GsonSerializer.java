package com.koushikdutta.ion.gson;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.google.gson.stream.JsonReader;
import com.koushikdutta.async.ByteBufferList;
import com.koushikdutta.async.DataEmitter;
import com.koushikdutta.async.DataSink;
import com.koushikdutta.async.Util;
import com.koushikdutta.async.callback.CompletedCallback;
import com.koushikdutta.async.future.Future;
import com.koushikdutta.async.future.TransformFuture;
import com.koushikdutta.async.parser.AsyncParser;
import com.koushikdutta.async.parser.ByteBufferListParser;
import com.koushikdutta.async.stream.ByteBufferListInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.lang.reflect.Type;

/* loaded from: com.koushikdutta.ion.ion.2.1.9.jar:com/koushikdutta/ion/gson/GsonSerializer.class */
public class GsonSerializer<T> implements AsyncParser<T> {
    Gson gson;
    Type type;

    public GsonSerializer(Gson gson, Class<T> clazz) {
        this.gson = gson;
        this.type = clazz;
    }

    public GsonSerializer(Gson gson, TypeToken<T> token) {
        this.gson = gson;
        this.type = token.getType();
    }

    public Future<T> parse(DataEmitter emitter) {
        return new ByteBufferListParser().parse(emitter).then(new TransformFuture<T, ByteBufferList>() { // from class: com.koushikdutta.ion.gson.GsonSerializer.1
            /* JADX INFO: Access modifiers changed from: protected */
            public void transform(ByteBufferList result) throws Exception {
                ByteBufferListInputStream bin = new ByteBufferListInputStream(result);
                setComplete(GsonSerializer.this.gson.fromJson(new JsonReader(new InputStreamReader(bin)), GsonSerializer.this.type));
            }
        });
    }

    public void write(DataSink sink, T pojo, CompletedCallback completed) {
        ByteArrayOutputStream bout = new ByteArrayOutputStream();
        OutputStreamWriter out = new OutputStreamWriter(bout);
        this.gson.toJson(pojo, this.type, out);
        try {
            out.flush();
            Util.writeAll(sink, bout.toByteArray(), completed);
        } catch (Exception e) {
            throw new AssertionError(e);
        }
    }

    public Type getType() {
        return this.type;
    }
}
