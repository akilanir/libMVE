package cz.msebera.android.httpclient.impl.io;

import cz.msebera.android.httpclient.HttpRequest;
import cz.msebera.android.httpclient.HttpRequestFactory;
import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.config.MessageConstraints;
import cz.msebera.android.httpclient.impl.DefaultHttpRequestFactory;
import cz.msebera.android.httpclient.io.HttpMessageParser;
import cz.msebera.android.httpclient.io.HttpMessageParserFactory;
import cz.msebera.android.httpclient.io.SessionInputBuffer;
import cz.msebera.android.httpclient.message.BasicLineParser;
import cz.msebera.android.httpclient.message.LineParser;

@Immutable
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/io/DefaultHttpRequestParserFactory.class */
public class DefaultHttpRequestParserFactory implements HttpMessageParserFactory<HttpRequest> {
    public static final DefaultHttpRequestParserFactory INSTANCE = new DefaultHttpRequestParserFactory();
    private final LineParser lineParser;
    private final HttpRequestFactory requestFactory;

    public DefaultHttpRequestParserFactory(LineParser lineParser, HttpRequestFactory requestFactory) {
        this.lineParser = lineParser != null ? lineParser : BasicLineParser.INSTANCE;
        this.requestFactory = requestFactory != null ? requestFactory : DefaultHttpRequestFactory.INSTANCE;
    }

    public DefaultHttpRequestParserFactory() {
        this(null, null);
    }

    @Override // cz.msebera.android.httpclient.io.HttpMessageParserFactory
    public HttpMessageParser<HttpRequest> create(SessionInputBuffer buffer, MessageConstraints constraints) {
        return new DefaultHttpRequestParser(buffer, this.lineParser, this.requestFactory, constraints);
    }
}
