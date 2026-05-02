package cz.msebera.android.httpclient.protocol;

import cz.msebera.android.httpclient.HttpRequest;
import cz.msebera.android.httpclient.annotation.ThreadSafe;
import cz.msebera.android.httpclient.util.Args;

@ThreadSafe
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/protocol/UriHttpRequestHandlerMapper.class */
public class UriHttpRequestHandlerMapper implements HttpRequestHandlerMapper {
    private final UriPatternMatcher<HttpRequestHandler> matcher;

    protected UriHttpRequestHandlerMapper(UriPatternMatcher<HttpRequestHandler> matcher) {
        this.matcher = (UriPatternMatcher) Args.notNull(matcher, "Pattern matcher");
    }

    public UriHttpRequestHandlerMapper() {
        this(new UriPatternMatcher());
    }

    public void register(String pattern, HttpRequestHandler handler) {
        Args.notNull(pattern, "Pattern");
        Args.notNull(handler, "Handler");
        this.matcher.register(pattern, handler);
    }

    public void unregister(String pattern) {
        this.matcher.unregister(pattern);
    }

    protected String getRequestPath(HttpRequest request) {
        String uriPath = request.getRequestLine().getUri();
        int index = uriPath.indexOf("?");
        if (index != -1) {
            uriPath = uriPath.substring(0, index);
        } else {
            int index2 = uriPath.indexOf("#");
            if (index2 != -1) {
                uriPath = uriPath.substring(0, index2);
            }
        }
        return uriPath;
    }

    @Override // cz.msebera.android.httpclient.protocol.HttpRequestHandlerMapper
    public HttpRequestHandler lookup(HttpRequest request) {
        Args.notNull(request, "HTTP request");
        return this.matcher.lookup(getRequestPath(request));
    }
}
