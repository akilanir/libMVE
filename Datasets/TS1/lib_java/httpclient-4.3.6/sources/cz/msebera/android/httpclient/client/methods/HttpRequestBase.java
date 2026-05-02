package cz.msebera.android.httpclient.client.methods;

import cz.msebera.android.httpclient.ProtocolVersion;
import cz.msebera.android.httpclient.RequestLine;
import cz.msebera.android.httpclient.annotation.NotThreadSafe;
import cz.msebera.android.httpclient.client.config.RequestConfig;
import cz.msebera.android.httpclient.message.BasicRequestLine;
import cz.msebera.android.httpclient.params.HttpProtocolParams;
import java.net.URI;

@NotThreadSafe
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/client/methods/HttpRequestBase.class */
public abstract class HttpRequestBase extends AbstractExecutionAwareRequest implements HttpUriRequest, Configurable {
    private ProtocolVersion version;
    private URI uri;
    private RequestConfig config;

    public abstract String getMethod();

    public void setProtocolVersion(ProtocolVersion version) {
        this.version = version;
    }

    @Override // cz.msebera.android.httpclient.HttpMessage
    public ProtocolVersion getProtocolVersion() {
        return this.version != null ? this.version : HttpProtocolParams.getVersion(getParams());
    }

    @Override // cz.msebera.android.httpclient.client.methods.HttpUriRequest
    public URI getURI() {
        return this.uri;
    }

    @Override // cz.msebera.android.httpclient.HttpRequest
    public RequestLine getRequestLine() {
        String method = getMethod();
        ProtocolVersion ver = getProtocolVersion();
        URI uri = getURI();
        String uritext = null;
        if (uri != null) {
            uritext = uri.toASCIIString();
        }
        if (uritext == null || uritext.length() == 0) {
            uritext = "/";
        }
        return new BasicRequestLine(method, uritext, ver);
    }

    @Override // cz.msebera.android.httpclient.client.methods.Configurable
    public RequestConfig getConfig() {
        return this.config;
    }

    public void setConfig(RequestConfig config) {
        this.config = config;
    }

    public void setURI(URI uri) {
        this.uri = uri;
    }

    public void started() {
    }

    public void releaseConnection() {
        reset();
    }

    public String toString() {
        return getMethod() + " " + getURI() + " " + getProtocolVersion();
    }
}
