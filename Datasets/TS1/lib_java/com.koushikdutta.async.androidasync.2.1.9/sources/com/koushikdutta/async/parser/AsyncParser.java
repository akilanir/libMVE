package com.koushikdutta.async.parser;

import com.koushikdutta.async.DataEmitter;
import com.koushikdutta.async.DataSink;
import com.koushikdutta.async.callback.CompletedCallback;
import com.koushikdutta.async.future.Future;
import java.lang.reflect.Type;

/* loaded from: com.koushikdutta.async.androidasync.2.1.9.jar:com/koushikdutta/async/parser/AsyncParser.class */
public interface AsyncParser<T> {
    Future<T> parse(DataEmitter dataEmitter);

    void write(DataSink dataSink, T t, CompletedCallback completedCallback);

    Type getType();
}
