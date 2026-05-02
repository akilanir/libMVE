package com.koushikdutta.ion.builder;

import com.koushikdutta.async.DataEmitter;
import com.koushikdutta.async.parser.AsyncParser;
import com.koushikdutta.ion.builder.Builders;
import com.koushikdutta.ion.future.ResponseFuture;
import java.io.File;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.Charset;
import org.w3c.dom.Document;

/* loaded from: com.koushikdutta.ion.ion.2.1.9.jar:com/koushikdutta/ion/builder/FutureBuilder.class */
public interface FutureBuilder extends BitmapFutureBuilder, ImageViewFutureBuilder, GsonFutureBuilder {
    ResponseFuture<String> asString();

    ResponseFuture<String> asString(Charset charset);

    ResponseFuture<InputStream> asInputStream();

    ResponseFuture<DataEmitter> asDataEmitter();

    ResponseFuture<Document> asDocument();

    Builders.Any.BF<? extends Builders.Any.BF<?>> withBitmap();

    <T extends OutputStream> ResponseFuture<T> write(T t);

    <T extends OutputStream> ResponseFuture<T> write(T t, boolean z);

    ResponseFuture<File> write(File file);

    <T> ResponseFuture<T> as(AsyncParser<T> asyncParser);

    ResponseFuture<byte[]> asByteArray();

    FutureBuilder group(Object obj);
}
