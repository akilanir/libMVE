package cz.msebera.android.httpclient.impl.client;

import cz.msebera.android.httpclient.HttpVersion;
import cz.msebera.android.httpclient.annotation.ThreadSafe;
import cz.msebera.android.httpclient.client.protocol.RequestAddCookies;
import cz.msebera.android.httpclient.client.protocol.RequestAuthCache;
import cz.msebera.android.httpclient.client.protocol.RequestClientConnControl;
import cz.msebera.android.httpclient.client.protocol.RequestDefaultHeaders;
import cz.msebera.android.httpclient.client.protocol.RequestProxyAuthentication;
import cz.msebera.android.httpclient.client.protocol.RequestTargetAuthentication;
import cz.msebera.android.httpclient.client.protocol.ResponseProcessCookies;
import cz.msebera.android.httpclient.conn.ClientConnectionManager;
import cz.msebera.android.httpclient.impl.client.cache.CacheConfig;
import cz.msebera.android.httpclient.params.HttpConnectionParams;
import cz.msebera.android.httpclient.params.HttpParams;
import cz.msebera.android.httpclient.params.HttpProtocolParams;
import cz.msebera.android.httpclient.params.SyncBasicHttpParams;
import cz.msebera.android.httpclient.protocol.BasicHttpProcessor;
import cz.msebera.android.httpclient.protocol.HTTP;
import cz.msebera.android.httpclient.protocol.RequestContent;
import cz.msebera.android.httpclient.protocol.RequestExpectContinue;
import cz.msebera.android.httpclient.protocol.RequestTargetHost;
import cz.msebera.android.httpclient.protocol.RequestUserAgent;

@Deprecated
@ThreadSafe
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/client/DefaultHttpClient.class */
public class DefaultHttpClient extends AbstractHttpClient {
    public DefaultHttpClient(ClientConnectionManager conman, HttpParams params) {
        super(conman, params);
    }

    public DefaultHttpClient(ClientConnectionManager conman) {
        super(conman, null);
    }

    public DefaultHttpClient(HttpParams params) {
        super(null, params);
    }

    public DefaultHttpClient() {
        super(null, null);
    }

    @Override // cz.msebera.android.httpclient.impl.client.AbstractHttpClient
    protected HttpParams createHttpParams() {
        HttpParams params = new SyncBasicHttpParams();
        setDefaultHttpParams(params);
        return params;
    }

    public static void setDefaultHttpParams(HttpParams params) {
        HttpProtocolParams.setVersion(params, HttpVersion.HTTP_1_1);
        HttpProtocolParams.setContentCharset(params, HTTP.DEF_CONTENT_CHARSET.name());
        HttpConnectionParams.setTcpNoDelay(params, true);
        HttpConnectionParams.setSocketBufferSize(params, CacheConfig.DEFAULT_MAX_OBJECT_SIZE_BYTES);
        HttpProtocolParams.setUserAgent(params, HttpClientBuilder.DEFAULT_USER_AGENT);
    }

    @Override // cz.msebera.android.httpclient.impl.client.AbstractHttpClient
    protected BasicHttpProcessor createHttpProcessor() {
        BasicHttpProcessor httpproc = new BasicHttpProcessor();
        httpproc.addInterceptor(new RequestDefaultHeaders());
        httpproc.addInterceptor(new RequestContent());
        httpproc.addInterceptor(new RequestTargetHost());
        httpproc.addInterceptor(new RequestClientConnControl());
        httpproc.addInterceptor(new RequestUserAgent());
        httpproc.addInterceptor(new RequestExpectContinue());
        httpproc.addInterceptor(new RequestAddCookies());
        httpproc.addInterceptor(new ResponseProcessCookies());
        httpproc.addInterceptor(new RequestAuthCache());
        httpproc.addInterceptor(new RequestTargetAuthentication());
        httpproc.addInterceptor(new RequestProxyAuthentication());
        return httpproc;
    }
}
