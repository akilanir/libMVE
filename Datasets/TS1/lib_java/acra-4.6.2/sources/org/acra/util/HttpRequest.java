package org.acra.util;

import android.content.Context;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.SocketTimeoutException;
import java.net.URL;
import java.net.URLEncoder;
import java.security.KeyManagementException;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.UnrecoverableKeyException;
import java.util.Map;
import org.acra.ACRA;
import org.acra.ACRAConstants;
import org.acra.sender.HttpSender;
import org.apache.http.HttpResponse;
import org.apache.http.StatusLine;
import org.apache.http.auth.UsernamePasswordCredentials;
import org.apache.http.client.HttpClient;
import org.apache.http.client.HttpRequestRetryHandler;
import org.apache.http.client.methods.HttpEntityEnclosingRequestBase;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpPut;
import org.apache.http.conn.ClientConnectionManager;
import org.apache.http.conn.scheme.PlainSocketFactory;
import org.apache.http.conn.scheme.Scheme;
import org.apache.http.conn.scheme.SchemeRegistry;
import org.apache.http.conn.scheme.SocketFactory;
import org.apache.http.conn.ssl.SSLSocketFactory;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.auth.BasicScheme;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.conn.SingleClientConnManager;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpConnectionParams;
import org.apache.http.params.HttpParams;
import org.apache.http.protocol.BasicHttpContext;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.EntityUtils;

/* loaded from: acra-4.6.2.jar:org/acra/util/HttpRequest.class */
public final class HttpRequest {
    private String login;
    private String password;
    private int connectionTimeOut = ACRAConstants.DEFAULT_CONNECTION_TIMEOUT;
    private int socketTimeOut = ACRAConstants.DEFAULT_CONNECTION_TIMEOUT;
    private int maxNrRetries = 3;
    private Map<String, String> headers;

    /* loaded from: acra-4.6.2.jar:org/acra/util/HttpRequest$SocketTimeOutRetryHandler.class */
    private static class SocketTimeOutRetryHandler implements HttpRequestRetryHandler {
        private final HttpParams httpParams;
        private final int maxNrRetries;

        private SocketTimeOutRetryHandler(HttpParams httpParams, int maxNrRetries) {
            this.httpParams = httpParams;
            this.maxNrRetries = maxNrRetries;
        }

        @Override // org.apache.http.client.HttpRequestRetryHandler
        public boolean retryRequest(IOException exception, int executionCount, HttpContext context) {
            if (exception instanceof SocketTimeoutException) {
                if (executionCount <= this.maxNrRetries) {
                    if (this.httpParams != null) {
                        int newSocketTimeOut = HttpConnectionParams.getSoTimeout(this.httpParams) * 2;
                        HttpConnectionParams.setSoTimeout(this.httpParams, newSocketTimeOut);
                        ACRA.log.d(ACRA.LOG_TAG, "SocketTimeOut - increasing time out to " + newSocketTimeOut + " millis and trying again");
                        return true;
                    }
                    ACRA.log.d(ACRA.LOG_TAG, "SocketTimeOut - no HttpParams, cannot increase time out. Trying again with current settings");
                    return true;
                }
                ACRA.log.d(ACRA.LOG_TAG, "SocketTimeOut but exceeded max number of retries : " + this.maxNrRetries);
                return false;
            }
            return false;
        }
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setConnectionTimeOut(int connectionTimeOut) {
        this.connectionTimeOut = connectionTimeOut;
    }

    public void setSocketTimeOut(int socketTimeOut) {
        this.socketTimeOut = socketTimeOut;
    }

    public void setHeaders(Map<String, String> headers) {
        this.headers = headers;
    }

    public void setMaxNrRetries(int maxNrRetries) {
        this.maxNrRetries = maxNrRetries;
    }

    public void send(Context context, URL url, HttpSender.Method method, String content, HttpSender.Type type) throws IOException {
        HttpClient httpClient = getHttpClient(context);
        HttpEntityEnclosingRequestBase httpRequest = getHttpRequest(url, method, content, type);
        ACRA.log.d(ACRA.LOG_TAG, "Sending request to " + url);
        HttpResponse response = null;
        try {
            response = httpClient.execute(httpRequest, new BasicHttpContext());
            if (response != null) {
                StatusLine statusLine = response.getStatusLine();
                if (statusLine != null) {
                    String statusCode = Integer.toString(response.getStatusLine().getStatusCode());
                    if (!statusCode.equals("409") && !statusCode.equals("403") && (statusCode.startsWith("4") || statusCode.startsWith("5"))) {
                        throw new IOException("Host returned error code " + statusCode);
                    }
                }
                EntityUtils.toString(response.getEntity());
            }
        } finally {
            if (response != null) {
                response.getEntity().consumeContent();
            }
        }
    }

    private HttpClient getHttpClient(Context context) {
        HttpParams httpParams = new BasicHttpParams();
        httpParams.setParameter("http.protocol.cookie-policy", "rfc2109");
        HttpConnectionParams.setConnectionTimeout(httpParams, this.connectionTimeOut);
        HttpConnectionParams.setSoTimeout(httpParams, this.socketTimeOut);
        HttpConnectionParams.setSocketBufferSize(httpParams, ACRAConstants.DEFAULT_BUFFER_SIZE_IN_BYTES);
        SchemeRegistry registry = new SchemeRegistry();
        registry.register(new Scheme("http", new PlainSocketFactory(), 80));
        if (ACRA.getConfig().disableSSLCertValidation()) {
            registry.register(new Scheme("https", new FakeSocketFactory(), 443));
        } else if (ACRA.getConfig().keyStore() != null) {
            try {
                SSLSocketFactory sf = new SSLSocketFactory(ACRA.getConfig().keyStore());
                sf.setHostnameVerifier(SSLSocketFactory.STRICT_HOSTNAME_VERIFIER);
                registry.register(new Scheme("https", sf, 443));
            } catch (KeyManagementException e) {
                registry.register(new Scheme("https", SSLSocketFactory.getSocketFactory(), 443));
            } catch (KeyStoreException e2) {
                registry.register(new Scheme("https", SSLSocketFactory.getSocketFactory(), 443));
            } catch (NoSuchAlgorithmException e3) {
                registry.register(new Scheme("https", SSLSocketFactory.getSocketFactory(), 443));
            } catch (UnrecoverableKeyException e4) {
                registry.register(new Scheme("https", SSLSocketFactory.getSocketFactory(), 443));
            }
        } else {
            HttpsSocketFactoryFactory factory = ACRA.getConfig().getHttpSocketFactoryFactory();
            SocketFactory socketFactory = factory.create(context);
            registry.register(new Scheme("https", socketFactory, 443));
        }
        ClientConnectionManager clientConnectionManager = new SingleClientConnManager(httpParams, registry);
        DefaultHttpClient httpClient = new DefaultHttpClient(clientConnectionManager, httpParams);
        HttpRequestRetryHandler retryHandler = new SocketTimeOutRetryHandler(httpParams, this.maxNrRetries);
        httpClient.setHttpRequestRetryHandler(retryHandler);
        return httpClient;
    }

    private UsernamePasswordCredentials getCredentials() {
        if (this.login != null || this.password != null) {
            return new UsernamePasswordCredentials(this.login, this.password);
        }
        return null;
    }

    private HttpEntityEnclosingRequestBase getHttpRequest(URL url, HttpSender.Method method, String content, HttpSender.Type type) throws UnsupportedEncodingException, UnsupportedOperationException {
        HttpEntityEnclosingRequestBase httpRequest;
        switch (method) {
            case POST:
                httpRequest = new HttpPost(url.toString());
                break;
            case PUT:
                httpRequest = new HttpPut(url.toString());
                break;
            default:
                throw new UnsupportedOperationException("Unknown method: " + method.name());
        }
        UsernamePasswordCredentials creds = getCredentials();
        if (creds != null) {
            httpRequest.addHeader(BasicScheme.authenticate(creds, "UTF-8", false));
        }
        httpRequest.setHeader("User-Agent", "Android");
        httpRequest.setHeader("Accept", "text/html,application/xml,application/json,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5");
        httpRequest.setHeader("Content-Type", type.getContentType());
        if (this.headers != null) {
            for (String header : this.headers.keySet()) {
                String value = this.headers.get(header);
                httpRequest.setHeader(header, value);
            }
        }
        httpRequest.setEntity(new StringEntity(content, "UTF-8"));
        return httpRequest;
    }

    public static String getParamsAsFormString(Map<?, ?> parameters) throws UnsupportedEncodingException {
        StringBuilder dataBfr = new StringBuilder();
        for (Object key : parameters.keySet()) {
            if (dataBfr.length() != 0) {
                dataBfr.append('&');
            }
            Object preliminaryValue = parameters.get(key);
            Object value = preliminaryValue == null ? "" : preliminaryValue;
            dataBfr.append(URLEncoder.encode(key.toString(), "UTF-8"));
            dataBfr.append('=');
            dataBfr.append(URLEncoder.encode(value.toString(), "UTF-8"));
        }
        return dataBfr.toString();
    }
}
