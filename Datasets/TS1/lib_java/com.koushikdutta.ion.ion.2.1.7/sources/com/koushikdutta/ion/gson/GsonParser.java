package com.koushikdutta.ion.gson;

import com.google.gson.JsonElement;
import com.google.gson.JsonParseException;
import com.google.gson.JsonParser;
import com.google.gson.stream.JsonReader;
import com.koushikdutta.async.ByteBufferList;
import com.koushikdutta.async.DataEmitter;
import com.koushikdutta.async.DataSink;
import com.koushikdutta.async.callback.CompletedCallback;
import com.koushikdutta.async.future.Future;
import com.koushikdutta.async.future.TransformFuture;
import com.koushikdutta.async.parser.AsyncParser;
import com.koushikdutta.async.parser.ByteBufferListParser;
import com.koushikdutta.async.parser.StringParser;
import com.koushikdutta.async.stream.ByteBufferListInputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.lang.reflect.Type;
import java.nio.charset.Charset;

/* loaded from: com.koushikdutta.ion.ion.2.1.7.jar:com/koushikdutta/ion/gson/GsonParser.class */
public abstract class GsonParser<T extends JsonElement> implements AsyncParser<T> {
    Charset forcedCharset;
    Class<? extends JsonElement> clazz;

    public GsonParser(Class<? extends T> clazz) {
        this.clazz = clazz;
    }

    public GsonParser(Class<? extends T> clazz, Charset charset) {
        this(clazz);
        this.forcedCharset = charset;
    }

    public Future<T> parse(DataEmitter emitter) {
        final String charset = emitter.charset();
        return new ByteBufferListParser().parse(emitter).then(new TransformFuture<T, ByteBufferList>() { // from class: com.koushikdutta.ion.gson.GsonParser.1
            /* JADX INFO: Access modifiers changed from: protected */
            public void transform(ByteBufferList result) throws Exception {
                InputStreamReader isr;
                JsonParser parser = new JsonParser();
                ByteBufferListInputStream bis = new ByteBufferListInputStream(result);
                if (GsonParser.this.forcedCharset != null) {
                    isr = new InputStreamReader((InputStream) bis, GsonParser.this.forcedCharset);
                } else if (charset != null) {
                    isr = new InputStreamReader((InputStream) bis, charset);
                } else {
                    isr = new InputStreamReader(bis);
                }
                JsonElement parsed = parser.parse(new JsonReader(isr));
                if (parsed.isJsonNull() || parsed.isJsonPrimitive()) {
                    throw new JsonParseException("unable to parse json");
                }
                if (!GsonParser.this.clazz.isInstance(parsed)) {
                    throw new ClassCastException(parsed.getClass().getCanonicalName() + " can not be casted to " + GsonParser.this.clazz.getCanonicalName());
                }
                setComplete(null, parsed);
            }
        });
    }

    public void write(DataSink sink, T value, CompletedCallback completed) {
        new StringParser().write(sink, value.toString(), completed);
    }

    public Type getType() {
        return this.clazz;
    }
}
