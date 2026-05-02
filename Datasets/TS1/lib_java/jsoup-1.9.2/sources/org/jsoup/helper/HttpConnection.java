package org.jsoup.helper;

import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.InetSocketAddress;
import java.net.MalformedURLException;
import java.net.Proxy;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.nio.ByteBuffer;
import java.nio.charset.Charset;
import java.nio.charset.IllegalCharsetNameException;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;
import java.util.zip.GZIPInputStream;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import org.jsoup.Connection;
import org.jsoup.HttpStatusException;
import org.jsoup.UnsupportedMimeTypeException;
import org.jsoup.nodes.Document;
import org.jsoup.parser.Parser;
import org.jsoup.parser.TokenQueue;

/* loaded from: jsoup-1.9.2.jar:org/jsoup/helper/HttpConnection.class */
public class HttpConnection implements Connection {
    public static final String CONTENT_ENCODING = "Content-Encoding";
    private static final String CONTENT_TYPE = "Content-Type";
    private static final String MULTIPART_FORM_DATA = "multipart/form-data";
    private static final String FORM_URL_ENCODED = "application/x-www-form-urlencoded";
    private static final int HTTP_TEMP_REDIR = 307;
    private Connection.Request req = new Request();
    private Connection.Response res = new Response();

    public static Connection connect(String url) {
        Connection con = new HttpConnection();
        con.url(url);
        return con;
    }

    public static Connection connect(URL url) {
        Connection con = new HttpConnection();
        con.url(url);
        return con;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static String encodeUrl(String url) {
        if (url == null) {
            return null;
        }
        return url.replaceAll(" ", "%20");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static String encodeMimeName(String val) {
        if (val == null) {
            return null;
        }
        return val.replaceAll("\"", "%22");
    }

    private HttpConnection() {
    }

    @Override // org.jsoup.Connection
    public Connection url(URL url) {
        this.req.url(url);
        return this;
    }

    @Override // org.jsoup.Connection
    public Connection url(String url) {
        Validate.notEmpty(url, "Must supply a valid URL");
        try {
            this.req.url(new URL(encodeUrl(url)));
            return this;
        } catch (MalformedURLException e) {
            throw new IllegalArgumentException("Malformed URL: " + url, e);
        }
    }

    @Override // org.jsoup.Connection
    public Connection proxy(Proxy proxy) {
        this.req.proxy(proxy);
        return this;
    }

    @Override // org.jsoup.Connection
    public Connection proxy(String host, int port) {
        this.req.proxy(host, port);
        return this;
    }

    @Override // org.jsoup.Connection
    public Connection userAgent(String userAgent) {
        Validate.notNull(userAgent, "User agent must not be null");
        this.req.header("User-Agent", userAgent);
        return this;
    }

    @Override // org.jsoup.Connection
    public Connection timeout(int millis) {
        this.req.timeout(millis);
        return this;
    }

    @Override // org.jsoup.Connection
    public Connection maxBodySize(int bytes) {
        this.req.maxBodySize(bytes);
        return this;
    }

    @Override // org.jsoup.Connection
    public Connection followRedirects(boolean followRedirects) {
        this.req.followRedirects(followRedirects);
        return this;
    }

    @Override // org.jsoup.Connection
    public Connection referrer(String referrer) {
        Validate.notNull(referrer, "Referrer must not be null");
        this.req.header("Referer", referrer);
        return this;
    }

    @Override // org.jsoup.Connection
    public Connection method(Connection.Method method) {
        this.req.method(method);
        return this;
    }

    @Override // org.jsoup.Connection
    public Connection ignoreHttpErrors(boolean ignoreHttpErrors) {
        this.req.ignoreHttpErrors(ignoreHttpErrors);
        return this;
    }

    @Override // org.jsoup.Connection
    public Connection ignoreContentType(boolean ignoreContentType) {
        this.req.ignoreContentType(ignoreContentType);
        return this;
    }

    @Override // org.jsoup.Connection
    public Connection validateTLSCertificates(boolean value) {
        this.req.validateTLSCertificates(value);
        return this;
    }

    @Override // org.jsoup.Connection
    public Connection data(String key, String value) {
        this.req.data(KeyVal.create(key, value));
        return this;
    }

    @Override // org.jsoup.Connection
    public Connection data(String key, String filename, InputStream inputStream) {
        this.req.data(KeyVal.create(key, filename, inputStream));
        return this;
    }

    @Override // org.jsoup.Connection
    public Connection data(Map<String, String> data) {
        Validate.notNull(data, "Data map must not be null");
        for (Map.Entry<String, String> entry : data.entrySet()) {
            this.req.data(KeyVal.create(entry.getKey(), entry.getValue()));
        }
        return this;
    }

    @Override // org.jsoup.Connection
    public Connection data(String... keyvals) {
        Validate.notNull(keyvals, "Data key value pairs must not be null");
        Validate.isTrue(keyvals.length % 2 == 0, "Must supply an even number of key value pairs");
        for (int i = 0; i < keyvals.length; i += 2) {
            String key = keyvals[i];
            String value = keyvals[i + 1];
            Validate.notEmpty(key, "Data key must not be empty");
            Validate.notNull(value, "Data value must not be null");
            this.req.data(KeyVal.create(key, value));
        }
        return this;
    }

    @Override // org.jsoup.Connection
    public Connection data(Collection<Connection.KeyVal> data) {
        Validate.notNull(data, "Data collection must not be null");
        for (Connection.KeyVal entry : data) {
            this.req.data(entry);
        }
        return this;
    }

    @Override // org.jsoup.Connection
    public Connection.KeyVal data(String key) {
        Validate.notEmpty(key, "Data key must not be empty");
        for (Connection.KeyVal keyVal : request().data()) {
            if (keyVal.key().equals(key)) {
                return keyVal;
            }
        }
        return null;
    }

    @Override // org.jsoup.Connection
    public Connection requestBody(String body) {
        this.req.requestBody(body);
        return this;
    }

    @Override // org.jsoup.Connection
    public Connection header(String name, String value) {
        this.req.header(name, value);
        return this;
    }

    @Override // org.jsoup.Connection
    public Connection cookie(String name, String value) {
        this.req.cookie(name, value);
        return this;
    }

    @Override // org.jsoup.Connection
    public Connection cookies(Map<String, String> cookies) {
        Validate.notNull(cookies, "Cookie map must not be null");
        for (Map.Entry<String, String> entry : cookies.entrySet()) {
            this.req.cookie(entry.getKey(), entry.getValue());
        }
        return this;
    }

    @Override // org.jsoup.Connection
    public Connection parser(Parser parser) {
        this.req.parser(parser);
        return this;
    }

    @Override // org.jsoup.Connection
    public Document get() throws IOException {
        this.req.method(Connection.Method.GET);
        execute();
        return this.res.parse();
    }

    @Override // org.jsoup.Connection
    public Document post() throws IOException {
        this.req.method(Connection.Method.POST);
        execute();
        return this.res.parse();
    }

    @Override // org.jsoup.Connection
    public Connection.Response execute() throws IOException {
        this.res = Response.execute(this.req);
        return this.res;
    }

    @Override // org.jsoup.Connection
    public Connection.Request request() {
        return this.req;
    }

    @Override // org.jsoup.Connection
    public Connection request(Connection.Request request) {
        this.req = request;
        return this;
    }

    @Override // org.jsoup.Connection
    public Connection.Response response() {
        return this.res;
    }

    @Override // org.jsoup.Connection
    public Connection response(Connection.Response response) {
        this.res = response;
        return this;
    }

    @Override // org.jsoup.Connection
    public Connection postDataCharset(String charset) {
        this.req.postDataCharset(charset);
        return this;
    }

    /* loaded from: jsoup-1.9.2.jar:org/jsoup/helper/HttpConnection$Base.class */
    private static abstract class Base<T extends Connection.Base> implements Connection.Base<T> {
        URL url;
        Connection.Method method;
        Map<String, String> headers;
        Map<String, String> cookies;

        private Base() {
            this.headers = new LinkedHashMap();
            this.cookies = new LinkedHashMap();
        }

        @Override // org.jsoup.Connection.Base
        public URL url() {
            return this.url;
        }

        @Override // org.jsoup.Connection.Base
        public T url(URL url) {
            Validate.notNull(url, "URL must not be null");
            this.url = url;
            return this;
        }

        @Override // org.jsoup.Connection.Base
        public Connection.Method method() {
            return this.method;
        }

        @Override // org.jsoup.Connection.Base
        public T method(Connection.Method method) {
            Validate.notNull(method, "Method must not be null");
            this.method = method;
            return this;
        }

        @Override // org.jsoup.Connection.Base
        public String header(String name) {
            Validate.notNull(name, "Header name must not be null");
            return getHeaderCaseInsensitive(name);
        }

        @Override // org.jsoup.Connection.Base
        public T header(String name, String value) {
            Validate.notEmpty(name, "Header name must not be empty");
            Validate.notNull(value, "Header value must not be null");
            removeHeader(name);
            this.headers.put(name, value);
            return this;
        }

        @Override // org.jsoup.Connection.Base
        public boolean hasHeader(String name) {
            Validate.notEmpty(name, "Header name must not be empty");
            return getHeaderCaseInsensitive(name) != null;
        }

        @Override // org.jsoup.Connection.Base
        public boolean hasHeaderWithValue(String name, String value) {
            return hasHeader(name) && header(name).equalsIgnoreCase(value);
        }

        @Override // org.jsoup.Connection.Base
        public T removeHeader(String name) {
            Validate.notEmpty(name, "Header name must not be empty");
            Map.Entry<String, String> entry = scanHeaders(name);
            if (entry != null) {
                this.headers.remove(entry.getKey());
            }
            return this;
        }

        @Override // org.jsoup.Connection.Base
        public Map<String, String> headers() {
            return this.headers;
        }

        private String getHeaderCaseInsensitive(String name) {
            Map.Entry<String, String> entry;
            Validate.notNull(name, "Header name must not be null");
            String value = this.headers.get(name);
            if (value == null) {
                value = this.headers.get(name.toLowerCase());
            }
            if (value == null && (entry = scanHeaders(name)) != null) {
                value = entry.getValue();
            }
            return value;
        }

        private Map.Entry<String, String> scanHeaders(String name) {
            String lc = name.toLowerCase();
            for (Map.Entry<String, String> entry : this.headers.entrySet()) {
                if (entry.getKey().toLowerCase().equals(lc)) {
                    return entry;
                }
            }
            return null;
        }

        @Override // org.jsoup.Connection.Base
        public String cookie(String name) {
            Validate.notEmpty(name, "Cookie name must not be empty");
            return this.cookies.get(name);
        }

        @Override // org.jsoup.Connection.Base
        public T cookie(String name, String value) {
            Validate.notEmpty(name, "Cookie name must not be empty");
            Validate.notNull(value, "Cookie value must not be null");
            this.cookies.put(name, value);
            return this;
        }

        @Override // org.jsoup.Connection.Base
        public boolean hasCookie(String name) {
            Validate.notEmpty(name, "Cookie name must not be empty");
            return this.cookies.containsKey(name);
        }

        @Override // org.jsoup.Connection.Base
        public T removeCookie(String name) {
            Validate.notEmpty(name, "Cookie name must not be empty");
            this.cookies.remove(name);
            return this;
        }

        @Override // org.jsoup.Connection.Base
        public Map<String, String> cookies() {
            return this.cookies;
        }
    }

    /* loaded from: jsoup-1.9.2.jar:org/jsoup/helper/HttpConnection$Request.class */
    public static class Request extends Base<Connection.Request> implements Connection.Request {
        private Proxy proxy;
        private int timeoutMilliseconds;
        private int maxBodySizeBytes;
        private boolean followRedirects;
        private Collection<Connection.KeyVal> data;
        private String body;
        private boolean ignoreHttpErrors;
        private boolean ignoreContentType;
        private Parser parser;
        private boolean parserDefined;
        private boolean validateTSLCertificates;
        private String postDataCharset;

        @Override // org.jsoup.helper.HttpConnection.Base, org.jsoup.Connection.Base
        public /* bridge */ /* synthetic */ Map cookies() {
            return super.cookies();
        }

        @Override // org.jsoup.helper.HttpConnection.Base, org.jsoup.Connection.Base
        public /* bridge */ /* synthetic */ boolean hasCookie(String str) {
            return super.hasCookie(str);
        }

        @Override // org.jsoup.helper.HttpConnection.Base, org.jsoup.Connection.Base
        public /* bridge */ /* synthetic */ String cookie(String str) {
            return super.cookie(str);
        }

        @Override // org.jsoup.helper.HttpConnection.Base, org.jsoup.Connection.Base
        public /* bridge */ /* synthetic */ Map headers() {
            return super.headers();
        }

        @Override // org.jsoup.helper.HttpConnection.Base, org.jsoup.Connection.Base
        public /* bridge */ /* synthetic */ boolean hasHeaderWithValue(String str, String str2) {
            return super.hasHeaderWithValue(str, str2);
        }

        @Override // org.jsoup.helper.HttpConnection.Base, org.jsoup.Connection.Base
        public /* bridge */ /* synthetic */ boolean hasHeader(String str) {
            return super.hasHeader(str);
        }

        @Override // org.jsoup.helper.HttpConnection.Base, org.jsoup.Connection.Base
        public /* bridge */ /* synthetic */ String header(String str) {
            return super.header(str);
        }

        @Override // org.jsoup.helper.HttpConnection.Base, org.jsoup.Connection.Base
        public /* bridge */ /* synthetic */ Connection.Method method() {
            return super.method();
        }

        @Override // org.jsoup.helper.HttpConnection.Base, org.jsoup.Connection.Base
        public /* bridge */ /* synthetic */ URL url() {
            return super.url();
        }

        private Request() {
            super();
            this.body = null;
            this.ignoreHttpErrors = false;
            this.ignoreContentType = false;
            this.parserDefined = false;
            this.validateTSLCertificates = true;
            this.postDataCharset = "UTF-8";
            this.timeoutMilliseconds = 3000;
            this.maxBodySizeBytes = 1048576;
            this.followRedirects = true;
            this.data = new ArrayList();
            this.method = Connection.Method.GET;
            this.headers.put("Accept-Encoding", "gzip");
            this.parser = Parser.htmlParser();
        }

        @Override // org.jsoup.Connection.Request
        public Proxy proxy() {
            return this.proxy;
        }

        @Override // org.jsoup.Connection.Request
        public Request proxy(Proxy proxy) {
            this.proxy = proxy;
            return this;
        }

        @Override // org.jsoup.Connection.Request
        public Request proxy(String host, int port) {
            this.proxy = new Proxy(Proxy.Type.HTTP, InetSocketAddress.createUnresolved(host, port));
            return this;
        }

        @Override // org.jsoup.Connection.Request
        public int timeout() {
            return this.timeoutMilliseconds;
        }

        @Override // org.jsoup.Connection.Request
        public Request timeout(int millis) {
            Validate.isTrue(millis >= 0, "Timeout milliseconds must be 0 (infinite) or greater");
            this.timeoutMilliseconds = millis;
            return this;
        }

        @Override // org.jsoup.Connection.Request
        public int maxBodySize() {
            return this.maxBodySizeBytes;
        }

        @Override // org.jsoup.Connection.Request
        public Connection.Request maxBodySize(int bytes) {
            Validate.isTrue(bytes >= 0, "maxSize must be 0 (unlimited) or larger");
            this.maxBodySizeBytes = bytes;
            return this;
        }

        @Override // org.jsoup.Connection.Request
        public boolean followRedirects() {
            return this.followRedirects;
        }

        @Override // org.jsoup.Connection.Request
        public Connection.Request followRedirects(boolean followRedirects) {
            this.followRedirects = followRedirects;
            return this;
        }

        @Override // org.jsoup.Connection.Request
        public boolean ignoreHttpErrors() {
            return this.ignoreHttpErrors;
        }

        @Override // org.jsoup.Connection.Request
        public boolean validateTLSCertificates() {
            return this.validateTSLCertificates;
        }

        @Override // org.jsoup.Connection.Request
        public void validateTLSCertificates(boolean value) {
            this.validateTSLCertificates = value;
        }

        @Override // org.jsoup.Connection.Request
        public Connection.Request ignoreHttpErrors(boolean ignoreHttpErrors) {
            this.ignoreHttpErrors = ignoreHttpErrors;
            return this;
        }

        @Override // org.jsoup.Connection.Request
        public boolean ignoreContentType() {
            return this.ignoreContentType;
        }

        @Override // org.jsoup.Connection.Request
        public Connection.Request ignoreContentType(boolean ignoreContentType) {
            this.ignoreContentType = ignoreContentType;
            return this;
        }

        @Override // org.jsoup.Connection.Request
        public Request data(Connection.KeyVal keyval) {
            Validate.notNull(keyval, "Key val must not be null");
            this.data.add(keyval);
            return this;
        }

        @Override // org.jsoup.Connection.Request
        public Collection<Connection.KeyVal> data() {
            return this.data;
        }

        @Override // org.jsoup.Connection.Request
        public Connection.Request requestBody(String body) {
            this.body = body;
            return this;
        }

        @Override // org.jsoup.Connection.Request
        public String requestBody() {
            return this.body;
        }

        @Override // org.jsoup.Connection.Request
        public Request parser(Parser parser) {
            this.parser = parser;
            this.parserDefined = true;
            return this;
        }

        @Override // org.jsoup.Connection.Request
        public Parser parser() {
            return this.parser;
        }

        @Override // org.jsoup.Connection.Request
        public Connection.Request postDataCharset(String charset) {
            Validate.notNull(charset, "Charset must not be null");
            if (!Charset.isSupported(charset)) {
                throw new IllegalCharsetNameException(charset);
            }
            this.postDataCharset = charset;
            return this;
        }

        @Override // org.jsoup.Connection.Request
        public String postDataCharset() {
            return this.postDataCharset;
        }
    }

    /* loaded from: jsoup-1.9.2.jar:org/jsoup/helper/HttpConnection$Response.class */
    public static class Response extends Base<Connection.Response> implements Connection.Response {
        private static final int MAX_REDIRECTS = 20;
        private static SSLSocketFactory sslSocketFactory;
        private static final String LOCATION = "Location";
        private int statusCode;
        private String statusMessage;
        private ByteBuffer byteData;
        private String charset;
        private String contentType;
        private boolean executed;
        private int numRedirects;
        private Connection.Request req;
        private static final Pattern xmlContentTypeRxp = Pattern.compile("(application|text)/\\w*\\+?xml.*");

        @Override // org.jsoup.helper.HttpConnection.Base, org.jsoup.Connection.Base
        public /* bridge */ /* synthetic */ Map cookies() {
            return super.cookies();
        }

        @Override // org.jsoup.helper.HttpConnection.Base, org.jsoup.Connection.Base
        public /* bridge */ /* synthetic */ boolean hasCookie(String str) {
            return super.hasCookie(str);
        }

        @Override // org.jsoup.helper.HttpConnection.Base, org.jsoup.Connection.Base
        public /* bridge */ /* synthetic */ String cookie(String str) {
            return super.cookie(str);
        }

        @Override // org.jsoup.helper.HttpConnection.Base, org.jsoup.Connection.Base
        public /* bridge */ /* synthetic */ Map headers() {
            return super.headers();
        }

        @Override // org.jsoup.helper.HttpConnection.Base, org.jsoup.Connection.Base
        public /* bridge */ /* synthetic */ boolean hasHeaderWithValue(String str, String str2) {
            return super.hasHeaderWithValue(str, str2);
        }

        @Override // org.jsoup.helper.HttpConnection.Base, org.jsoup.Connection.Base
        public /* bridge */ /* synthetic */ boolean hasHeader(String str) {
            return super.hasHeader(str);
        }

        @Override // org.jsoup.helper.HttpConnection.Base, org.jsoup.Connection.Base
        public /* bridge */ /* synthetic */ String header(String str) {
            return super.header(str);
        }

        @Override // org.jsoup.helper.HttpConnection.Base, org.jsoup.Connection.Base
        public /* bridge */ /* synthetic */ Connection.Method method() {
            return super.method();
        }

        @Override // org.jsoup.helper.HttpConnection.Base, org.jsoup.Connection.Base
        public /* bridge */ /* synthetic */ URL url() {
            return super.url();
        }

        Response() {
            super();
            this.executed = false;
            this.numRedirects = 0;
        }

        private Response(Response previousResponse) throws IOException {
            super();
            this.executed = false;
            this.numRedirects = 0;
            if (previousResponse != null) {
                this.numRedirects = previousResponse.numRedirects + 1;
                if (this.numRedirects >= MAX_REDIRECTS) {
                    throw new IOException(String.format("Too many redirects occurred trying to load URL %s", previousResponse.url()));
                }
            }
        }

        static Response execute(Connection.Request req) throws IOException {
            return execute(req, null);
        }

        static Response execute(Connection.Request req, Response previousResponse) throws IOException {
            Validate.notNull(req, "Request must not be null");
            String protocol = req.url().getProtocol();
            if (!protocol.equals("http") && !protocol.equals("https")) {
                throw new MalformedURLException("Only http & https protocols supported");
            }
            boolean methodHasBody = req.method().hasBody();
            boolean hasRequestBody = req.requestBody() != null;
            if (!methodHasBody) {
                Validate.isFalse(hasRequestBody, "Cannot set a request body for HTTP method " + req.method());
            }
            String mimeBoundary = null;
            if (req.data().size() > 0 && (!methodHasBody || hasRequestBody)) {
                serialiseRequestUrl(req);
            } else if (methodHasBody) {
                mimeBoundary = setOutputContentType(req);
            }
            HttpURLConnection conn = createConnection(req);
            try {
                conn.connect();
                if (conn.getDoOutput()) {
                    writePost(req, conn.getOutputStream(), mimeBoundary);
                }
                int status = conn.getResponseCode();
                Response res = new Response(previousResponse);
                res.setupFromConnection(conn, previousResponse);
                res.req = req;
                if (res.hasHeader(LOCATION) && req.followRedirects()) {
                    if (status != HttpConnection.HTTP_TEMP_REDIR) {
                        req.method(Connection.Method.GET);
                        req.data().clear();
                    }
                    String location = res.header(LOCATION);
                    if (location != null && location.startsWith("http:/") && location.charAt(6) != '/') {
                        location = location.substring(6);
                    }
                    req.url(StringUtil.resolve(req.url(), HttpConnection.encodeUrl(location)));
                    for (Map.Entry<String, String> cookie : res.cookies.entrySet()) {
                        req.cookie(cookie.getKey(), cookie.getValue());
                    }
                    Response execute = execute(req, res);
                    conn.disconnect();
                    return execute;
                }
                if ((status < 200 || status >= 400) && !req.ignoreHttpErrors()) {
                    throw new HttpStatusException("HTTP error fetching URL", status, req.url().toString());
                }
                String contentType = res.contentType();
                if (contentType != null && !req.ignoreContentType() && !contentType.startsWith("text/") && !xmlContentTypeRxp.matcher(contentType).matches()) {
                    throw new UnsupportedMimeTypeException("Unhandled content type. Must be text/*, application/xml, or application/xhtml+xml", contentType, req.url().toString());
                }
                if (contentType != null && xmlContentTypeRxp.matcher(contentType).matches() && (req instanceof Request) && !((Request) req).parserDefined) {
                    req.parser(Parser.xmlParser());
                }
                res.charset = DataUtil.getCharsetFromContentType(res.contentType);
                if (conn.getContentLength() != 0 && req.method() != Connection.Method.HEAD) {
                    InputStream bodyStream = null;
                    try {
                        bodyStream = conn.getErrorStream() != null ? conn.getErrorStream() : conn.getInputStream();
                        if (res.hasHeaderWithValue(HttpConnection.CONTENT_ENCODING, "gzip")) {
                            bodyStream = new GZIPInputStream(bodyStream);
                        }
                        res.byteData = DataUtil.readToByteBuffer(bodyStream, req.maxBodySize());
                        if (bodyStream != null) {
                            bodyStream.close();
                        }
                    } catch (Throwable th) {
                        if (bodyStream != null) {
                            bodyStream.close();
                        }
                        throw th;
                    }
                } else {
                    res.byteData = DataUtil.emptyByteBuffer();
                }
                res.executed = true;
                return res;
            } finally {
                conn.disconnect();
            }
        }

        @Override // org.jsoup.Connection.Response
        public int statusCode() {
            return this.statusCode;
        }

        @Override // org.jsoup.Connection.Response
        public String statusMessage() {
            return this.statusMessage;
        }

        @Override // org.jsoup.Connection.Response
        public String charset() {
            return this.charset;
        }

        @Override // org.jsoup.Connection.Response
        public String contentType() {
            return this.contentType;
        }

        @Override // org.jsoup.Connection.Response
        public Document parse() throws IOException {
            Validate.isTrue(this.executed, "Request must be executed (with .execute(), .get(), or .post() before parsing response");
            Document doc = DataUtil.parseByteData(this.byteData, this.charset, this.url.toExternalForm(), this.req.parser());
            this.byteData.rewind();
            this.charset = doc.outputSettings().charset().name();
            return doc;
        }

        @Override // org.jsoup.Connection.Response
        public String body() {
            String body;
            Validate.isTrue(this.executed, "Request must be executed (with .execute(), .get(), or .post() before getting response body");
            if (this.charset == null) {
                body = Charset.forName("UTF-8").decode(this.byteData).toString();
            } else {
                body = Charset.forName(this.charset).decode(this.byteData).toString();
            }
            this.byteData.rewind();
            return body;
        }

        @Override // org.jsoup.Connection.Response
        public byte[] bodyAsBytes() {
            Validate.isTrue(this.executed, "Request must be executed (with .execute(), .get(), or .post() before getting response body");
            return this.byteData.array();
        }

        private static HttpURLConnection createConnection(Connection.Request req) throws IOException {
            URLConnection openConnection;
            if (req.proxy() == null) {
                openConnection = req.url().openConnection();
            } else {
                openConnection = req.url().openConnection(req.proxy());
            }
            HttpURLConnection conn = (HttpURLConnection) openConnection;
            conn.setRequestMethod(req.method().name());
            conn.setInstanceFollowRedirects(false);
            conn.setConnectTimeout(req.timeout());
            conn.setReadTimeout(req.timeout());
            if ((conn instanceof HttpsURLConnection) && !req.validateTLSCertificates()) {
                initUnSecureTSL();
                ((HttpsURLConnection) conn).setSSLSocketFactory(sslSocketFactory);
                ((HttpsURLConnection) conn).setHostnameVerifier(getInsecureVerifier());
            }
            if (req.method().hasBody()) {
                conn.setDoOutput(true);
            }
            if (req.cookies().size() > 0) {
                conn.addRequestProperty("Cookie", getRequestCookieString(req));
            }
            for (Map.Entry<String, String> header : req.headers().entrySet()) {
                conn.addRequestProperty(header.getKey(), header.getValue());
            }
            return conn;
        }

        private static HostnameVerifier getInsecureVerifier() {
            return new HostnameVerifier() { // from class: org.jsoup.helper.HttpConnection.Response.1
                @Override // javax.net.ssl.HostnameVerifier
                public boolean verify(String urlHostName, SSLSession session) {
                    return true;
                }
            };
        }

        private static synchronized void initUnSecureTSL() throws IOException {
            if (sslSocketFactory == null) {
                TrustManager[] trustAllCerts = {new X509TrustManager() { // from class: org.jsoup.helper.HttpConnection.Response.2
                    @Override // javax.net.ssl.X509TrustManager
                    public void checkClientTrusted(X509Certificate[] chain, String authType) {
                    }

                    @Override // javax.net.ssl.X509TrustManager
                    public void checkServerTrusted(X509Certificate[] chain, String authType) {
                    }

                    @Override // javax.net.ssl.X509TrustManager
                    public X509Certificate[] getAcceptedIssuers() {
                        return null;
                    }
                }};
                try {
                    SSLContext sslContext = SSLContext.getInstance("SSL");
                    sslContext.init(null, trustAllCerts, new SecureRandom());
                    sslSocketFactory = sslContext.getSocketFactory();
                } catch (KeyManagementException e) {
                    throw new IOException("Can't create unsecure trust manager");
                } catch (NoSuchAlgorithmException e2) {
                    throw new IOException("Can't create unsecure trust manager");
                }
            }
        }

        private void setupFromConnection(HttpURLConnection conn, Connection.Response previousResponse) throws IOException {
            this.method = Connection.Method.valueOf(conn.getRequestMethod());
            this.url = conn.getURL();
            this.statusCode = conn.getResponseCode();
            this.statusMessage = conn.getResponseMessage();
            this.contentType = conn.getContentType();
            Map<String, List<String>> resHeaders = createHeaderMap(conn);
            processResponseHeaders(resHeaders);
            if (previousResponse != null) {
                for (Map.Entry<String, String> prevCookie : previousResponse.cookies().entrySet()) {
                    if (!hasCookie(prevCookie.getKey())) {
                        cookie(prevCookie.getKey(), prevCookie.getValue());
                    }
                }
            }
        }

        private static LinkedHashMap<String, List<String>> createHeaderMap(HttpURLConnection conn) {
            LinkedHashMap<String, List<String>> headers = new LinkedHashMap<>();
            int i = 0;
            while (true) {
                String key = conn.getHeaderFieldKey(i);
                String val = conn.getHeaderField(i);
                if (key != null || val != null) {
                    i++;
                    if (key != null && val != null) {
                        if (headers.containsKey(key)) {
                            headers.get(key).add(val);
                        } else {
                            ArrayList<String> vals = new ArrayList<>();
                            vals.add(val);
                            headers.put(key, vals);
                        }
                    }
                } else {
                    return headers;
                }
            }
        }

        void processResponseHeaders(Map<String, List<String>> resHeaders) {
            for (Map.Entry<String, List<String>> entry : resHeaders.entrySet()) {
                String name = entry.getKey();
                if (name != null) {
                    List<String> values = entry.getValue();
                    if (name.equalsIgnoreCase("Set-Cookie")) {
                        for (String value : values) {
                            if (value != null) {
                                TokenQueue cd = new TokenQueue(value);
                                String cookieName = cd.chompTo("=").trim();
                                String cookieVal = cd.consumeTo(";").trim();
                                if (cookieName.length() > 0) {
                                    cookie(cookieName, cookieVal);
                                }
                            }
                        }
                    } else if (values.size() == 1) {
                        header(name, values.get(0));
                    } else if (values.size() > 1) {
                        StringBuilder accum = new StringBuilder();
                        for (int i = 0; i < values.size(); i++) {
                            String val = values.get(i);
                            if (i != 0) {
                                accum.append(", ");
                            }
                            accum.append(val);
                        }
                        header(name, accum.toString());
                    }
                }
            }
        }

        private static String setOutputContentType(Connection.Request req) {
            String bound = null;
            if (HttpConnection.needsMultipart(req)) {
                bound = DataUtil.mimeBoundary();
                req.header(HttpConnection.CONTENT_TYPE, "multipart/form-data; boundary=" + bound);
            } else {
                req.header(HttpConnection.CONTENT_TYPE, "application/x-www-form-urlencoded; charset=" + req.postDataCharset());
            }
            return bound;
        }

        private static void writePost(Connection.Request req, OutputStream outputStream, String bound) throws IOException {
            Collection<Connection.KeyVal> data = req.data();
            BufferedWriter w = new BufferedWriter(new OutputStreamWriter(outputStream, req.postDataCharset()));
            if (bound != null) {
                for (Connection.KeyVal keyVal : data) {
                    w.write("--");
                    w.write(bound);
                    w.write("\r\n");
                    w.write("Content-Disposition: form-data; name=\"");
                    w.write(HttpConnection.encodeMimeName(keyVal.key()));
                    w.write("\"");
                    if (keyVal.hasInputStream()) {
                        w.write("; filename=\"");
                        w.write(HttpConnection.encodeMimeName(keyVal.value()));
                        w.write("\"\r\nContent-Type: application/octet-stream\r\n\r\n");
                        w.flush();
                        DataUtil.crossStreams(keyVal.inputStream(), outputStream);
                        outputStream.flush();
                    } else {
                        w.write("\r\n\r\n");
                        w.write(keyVal.value());
                    }
                    w.write("\r\n");
                }
                w.write("--");
                w.write(bound);
                w.write("--");
            } else if (req.requestBody() != null) {
                w.write(req.requestBody());
            } else {
                boolean first = true;
                for (Connection.KeyVal keyVal2 : data) {
                    if (!first) {
                        w.append('&');
                    } else {
                        first = false;
                    }
                    w.write(URLEncoder.encode(keyVal2.key(), req.postDataCharset()));
                    w.write(61);
                    w.write(URLEncoder.encode(keyVal2.value(), req.postDataCharset()));
                }
            }
            w.close();
        }

        private static String getRequestCookieString(Connection.Request req) {
            StringBuilder sb = new StringBuilder();
            boolean first = true;
            for (Map.Entry<String, String> cookie : req.cookies().entrySet()) {
                if (!first) {
                    sb.append("; ");
                } else {
                    first = false;
                }
                sb.append(cookie.getKey()).append('=').append(cookie.getValue());
            }
            return sb.toString();
        }

        private static void serialiseRequestUrl(Connection.Request req) throws IOException {
            URL in = req.url();
            StringBuilder url = new StringBuilder();
            boolean first = true;
            url.append(in.getProtocol()).append("://").append(in.getAuthority()).append(in.getPath()).append("?");
            if (in.getQuery() != null) {
                url.append(in.getQuery());
                first = false;
            }
            for (Connection.KeyVal keyVal : req.data()) {
                Validate.isFalse(keyVal.hasInputStream(), "InputStream data not supported in URL query string.");
                if (!first) {
                    url.append('&');
                } else {
                    first = false;
                }
                url.append(URLEncoder.encode(keyVal.key(), "UTF-8")).append('=').append(URLEncoder.encode(keyVal.value(), "UTF-8"));
            }
            req.url(new URL(url.toString()));
            req.data().clear();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static boolean needsMultipart(Connection.Request req) {
        boolean needsMulti = false;
        Iterator<Connection.KeyVal> it = req.data().iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            Connection.KeyVal keyVal = it.next();
            if (keyVal.hasInputStream()) {
                needsMulti = true;
                break;
            }
        }
        return needsMulti;
    }

    /* loaded from: jsoup-1.9.2.jar:org/jsoup/helper/HttpConnection$KeyVal.class */
    public static class KeyVal implements Connection.KeyVal {
        private String key;
        private String value;
        private InputStream stream;

        public static KeyVal create(String key, String value) {
            return new KeyVal().key(key).value(value);
        }

        public static KeyVal create(String key, String filename, InputStream stream) {
            return new KeyVal().key(key).value(filename).inputStream(stream);
        }

        private KeyVal() {
        }

        @Override // org.jsoup.Connection.KeyVal
        public KeyVal key(String key) {
            Validate.notEmpty(key, "Data key must not be empty");
            this.key = key;
            return this;
        }

        @Override // org.jsoup.Connection.KeyVal
        public String key() {
            return this.key;
        }

        @Override // org.jsoup.Connection.KeyVal
        public KeyVal value(String value) {
            Validate.notNull(value, "Data value must not be null");
            this.value = value;
            return this;
        }

        @Override // org.jsoup.Connection.KeyVal
        public String value() {
            return this.value;
        }

        @Override // org.jsoup.Connection.KeyVal
        public KeyVal inputStream(InputStream inputStream) {
            Validate.notNull(this.value, "Data input stream must not be null");
            this.stream = inputStream;
            return this;
        }

        @Override // org.jsoup.Connection.KeyVal
        public InputStream inputStream() {
            return this.stream;
        }

        @Override // org.jsoup.Connection.KeyVal
        public boolean hasInputStream() {
            return this.stream != null;
        }

        public String toString() {
            return this.key + "=" + this.value;
        }
    }
}
