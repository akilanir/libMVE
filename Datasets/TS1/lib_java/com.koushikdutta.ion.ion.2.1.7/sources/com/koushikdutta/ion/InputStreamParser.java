package com.koushikdutta.ion;

import com.koushikdutta.async.ByteBufferList;
import com.koushikdutta.async.DataEmitter;
import com.koushikdutta.async.DataSink;
import com.koushikdutta.async.callback.CompletedCallback;
import com.koushikdutta.async.future.Future;
import com.koushikdutta.async.future.TransformFuture;
import com.koushikdutta.async.parser.AsyncParser;
import com.koushikdutta.async.parser.ByteBufferListParser;
import com.koushikdutta.async.stream.ByteBufferListInputStream;
import java.io.InputStream;
import java.lang.reflect.Type;

/* loaded from: com.koushikdutta.ion.ion.2.1.7.jar:com/koushikdutta/ion/InputStreamParser.class */
class InputStreamParser implements AsyncParser<InputStream> {
    InputStreamParser() {
    }

    public Future<InputStream> parse(DataEmitter emitter) {
        return new ByteBufferListParser().parse(emitter).then(new TransformFuture<InputStream, ByteBufferList>() { // from class: com.koushikdutta.ion.InputStreamParser.1
            /* JADX INFO: Access modifiers changed from: protected */
            public void transform(ByteBufferList result) throws Exception {
                setComplete(new ByteBufferListInputStream(result));
            }
        });
    }

    public void write(DataSink sink, InputStream value, CompletedCallback completed) {
        throw new AssertionError("not implemented");
    }

    public Type getType() {
        return InputStream.class;
    }
}
