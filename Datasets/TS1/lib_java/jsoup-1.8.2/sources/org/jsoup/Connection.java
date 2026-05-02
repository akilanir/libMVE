package org.jsoup;

import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.Collection;
import java.util.Map;
import org.jsoup.nodes.Document;
import org.jsoup.parser.Parser;

/* loaded from: jsoup-1.8.2.jar:org/jsoup/Connection.class */
public interface Connection {

    /* loaded from: jsoup-1.8.2.jar:org/jsoup/Connection$Base.class */
    public interface Base<T extends Base> {
        URL url();

        T url(URL url);

        Method method();

        T method(Method method);

        String header(String str);

        T header(String str, String str2);

        boolean hasHeader(String str);

        boolean hasHeaderWithValue(String str, String str2);

        T removeHeader(String str);

        Map<String, String> headers();

        String cookie(String str);

        T cookie(String str, String str2);

        boolean hasCookie(String str);

        T removeCookie(String str);

        Map<String, String> cookies();
    }

    /* loaded from: jsoup-1.8.2.jar:org/jsoup/Connection$KeyVal.class */
    public interface KeyVal {
        KeyVal key(String str);

        String key();

        KeyVal value(String str);

        String value();

        KeyVal inputStream(InputStream inputStream);

        InputStream inputStream();

        boolean hasInputStream();
    }

    /* loaded from: jsoup-1.8.2.jar:org/jsoup/Connection$Request.class */
    public interface Request extends Base<Request> {
        int timeout();

        Request timeout(int i);

        int maxBodySize();

        Request maxBodySize(int i);

        boolean followRedirects();

        Request followRedirects(boolean z);

        boolean ignoreHttpErrors();

        Request ignoreHttpErrors(boolean z);

        boolean ignoreContentType();

        Request ignoreContentType(boolean z);

        boolean validateTLSCertificates();

        void validateTLSCertificates(boolean z);

        Request data(KeyVal keyVal);

        Collection<KeyVal> data();

        Request parser(Parser parser);

        Parser parser();

        Request postDataCharset(String str);

        String postDataCharset();
    }

    /* loaded from: jsoup-1.8.2.jar:org/jsoup/Connection$Response.class */
    public interface Response extends Base<Response> {
        int statusCode();

        String statusMessage();

        String charset();

        String contentType();

        Document parse() throws IOException;

        String body();

        byte[] bodyAsBytes();
    }

    Connection url(URL url);

    Connection url(String str);

    Connection userAgent(String str);

    Connection timeout(int i);

    Connection maxBodySize(int i);

    Connection referrer(String str);

    Connection followRedirects(boolean z);

    Connection method(Method method);

    Connection ignoreHttpErrors(boolean z);

    Connection ignoreContentType(boolean z);

    Connection validateTLSCertificates(boolean z);

    Connection data(String str, String str2);

    Connection data(String str, String str2, InputStream inputStream);

    Connection data(Collection<KeyVal> collection);

    Connection data(Map<String, String> map);

    Connection data(String... strArr);

    Connection header(String str, String str2);

    Connection cookie(String str, String str2);

    Connection cookies(Map<String, String> map);

    Connection parser(Parser parser);

    Connection postDataCharset(String str);

    Document get() throws IOException;

    Document post() throws IOException;

    Response execute() throws IOException;

    Request request();

    Connection request(Request request);

    Response response();

    Connection response(Response response);

    /* loaded from: jsoup-1.8.2.jar:org/jsoup/Connection$Method.class */
    public enum Method {
        GET(false),
        POST(true),
        PUT(true),
        DELETE(false),
        PATCH(true);

        private final boolean hasBody;

        Method(boolean hasBody) {
            this.hasBody = hasBody;
        }

        public final boolean hasBody() {
            return this.hasBody;
        }
    }
}
