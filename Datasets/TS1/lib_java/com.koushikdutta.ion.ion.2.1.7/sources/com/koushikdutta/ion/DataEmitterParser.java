package com.koushikdutta.ion;

import com.koushikdutta.async.DataEmitter;
import com.koushikdutta.async.DataSink;
import com.koushikdutta.async.Util;
import com.koushikdutta.async.callback.CompletedCallback;
import com.koushikdutta.async.future.Future;
import com.koushikdutta.async.future.SimpleFuture;
import com.koushikdutta.async.parser.AsyncParser;
import java.lang.reflect.Type;

/* loaded from: com.koushikdutta.ion.ion.2.1.7.jar:com/koushikdutta/ion/DataEmitterParser.class */
class DataEmitterParser implements AsyncParser<DataEmitter> {
    DataEmitterParser() {
    }

    public Future<DataEmitter> parse(DataEmitter emitter) {
        SimpleFuture<DataEmitter> ret = new SimpleFuture<>();
        ret.setComplete(emitter);
        return ret;
    }

    public void write(DataSink sink, DataEmitter value, CompletedCallback completed) {
        Util.pump(value, sink, completed);
    }

    public Type getType() {
        return DataEmitter.class;
    }
}
