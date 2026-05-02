package org.acra.util;

import android.content.Context;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.util.Base64;
import ch.acra.acra.BuildConfig;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.security.GeneralSecurityException;
import java.security.KeyStore;
import java.util.Map;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManagerFactory;
import org.acra.ACRA;
import org.acra.config.ACRAConfiguration;
import org.acra.security.KeyStoreHelper;
import org.acra.sender.HttpSender;

/* loaded from: ch.acra.acra.4.9.0.jar:org/acra/util/HttpRequest.class */
public final class HttpRequest {
    private static final String UTF8 = "UTF-8";
    private static final int HTTP_SUCCESS = 200;
    private static final int HTTP_REDIRECT = 300;
    private static final int HTTP_CLIENT_ERROR = 400;
    private static final int HTTP_UNAUTHORIZED = 401;
    private static final int HTTP_FORBIDDEN = 403;
    private static final int HTTP_METHOD_NOT_ALLOWED = 405;
    private static final int HTTP_CONFLICT = 409;
    private static final int MAX_HTTP_CODE = 600;
    private final ACRAConfiguration config;
    private String login;
    private String password;
    private int connectionTimeOut = 3000;
    private int socketTimeOut = 3000;
    private Map<String, String> headers;

    public HttpRequest(@NonNull ACRAConfiguration config) {
        this.config = config;
    }

    public void setLogin(@Nullable String login) {
        this.login = login;
    }

    public void setPassword(@Nullable String password) {
        this.password = password;
    }

    public void setConnectionTimeOut(int connectionTimeOut) {
        this.connectionTimeOut = connectionTimeOut;
    }

    public void setSocketTimeOut(int socketTimeOut) {
        this.socketTimeOut = socketTimeOut;
    }

    public void setHeaders(@Nullable Map<String, String> headers) {
        this.headers = headers;
    }

    public void send(@NonNull Context context, @NonNull URL url, @NonNull HttpSender.Method method, @NonNull String content, @NonNull HttpSender.Type type) throws IOException {
        HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
        if (urlConnection instanceof HttpsURLConnection) {
            try {
                HttpsURLConnection httpsUrlConnection = (HttpsURLConnection) urlConnection;
                String algorithm = TrustManagerFactory.getDefaultAlgorithm();
                TrustManagerFactory tmf = TrustManagerFactory.getInstance(algorithm);
                KeyStore keyStore = KeyStoreHelper.getKeyStore(context, this.config);
                tmf.init(keyStore);
                SSLContext sslContext = SSLContext.getInstance("TLS");
                sslContext.init(null, tmf.getTrustManagers(), null);
                httpsUrlConnection.setSSLSocketFactory(sslContext.getSocketFactory());
            } catch (GeneralSecurityException e) {
                ACRA.log.e(ACRA.LOG_TAG, "Could not configure SSL for ACRA request to " + url, e);
            }
        }
        if (this.login != null && this.password != null) {
            String credentials = this.login + ':' + this.password;
            String encoded = new String(Base64.encode(credentials.getBytes(UTF8), 2), UTF8);
            urlConnection.setRequestProperty("Authorization", "Basic " + encoded);
        }
        urlConnection.setConnectTimeout(this.connectionTimeOut);
        urlConnection.setReadTimeout(this.socketTimeOut);
        urlConnection.setRequestProperty("User-Agent", String.format("Android ACRA %1$s", BuildConfig.VERSION_NAME));
        urlConnection.setRequestProperty("Accept", "text/html,application/xml,application/json,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5");
        urlConnection.setRequestProperty("Content-Type", type.getContentType());
        if (this.headers != null) {
            for (Map.Entry<String, String> header : this.headers.entrySet()) {
                urlConnection.setRequestProperty(header.getKey(), header.getValue());
            }
        }
        byte[] contentAsBytes = content.getBytes(UTF8);
        urlConnection.setRequestMethod(method.name());
        urlConnection.setDoOutput(true);
        urlConnection.setFixedLengthStreamingMode(contentAsBytes.length);
        System.setProperty("http.keepAlive", "false");
        urlConnection.connect();
        OutputStream outputStream = new BufferedOutputStream(urlConnection.getOutputStream());
        try {
            outputStream.write(contentAsBytes);
            outputStream.flush();
            IOUtils.safeClose(outputStream);
            if (ACRA.DEV_LOGGING) {
                ACRA.log.d(ACRA.LOG_TAG, "Sending request to " + url);
            }
            if (ACRA.DEV_LOGGING) {
                ACRA.log.d(ACRA.LOG_TAG, "Http " + method.name() + " content : ");
            }
            if (ACRA.DEV_LOGGING) {
                ACRA.log.d(ACRA.LOG_TAG, content);
            }
            int responseCode = urlConnection.getResponseCode();
            if (ACRA.DEV_LOGGING) {
                ACRA.log.d(ACRA.LOG_TAG, "Request response : " + responseCode + " : " + urlConnection.getResponseMessage());
            }
            if (responseCode >= HTTP_SUCCESS && responseCode < HTTP_REDIRECT) {
                ACRA.log.i(ACRA.LOG_TAG, "Request received by server");
            } else if (responseCode == HTTP_UNAUTHORIZED) {
                ACRA.log.w(ACRA.LOG_TAG, "401: Login validation error on server - request will be discarded");
            } else if (responseCode == HTTP_FORBIDDEN) {
                ACRA.log.w(ACRA.LOG_TAG, "403: Data validation error on server - request will be discarded");
            } else if (responseCode == HTTP_METHOD_NOT_ALLOWED) {
                ACRA.log.w(ACRA.LOG_TAG, "405: Server rejected Http " + method + " - request will be discarded");
            } else if (responseCode == HTTP_CONFLICT) {
                ACRA.log.w(ACRA.LOG_TAG, "409: Server has already received this post - request will be discarded");
            } else {
                if (responseCode >= HTTP_CLIENT_ERROR && responseCode < MAX_HTTP_CODE) {
                    ACRA.log.w(ACRA.LOG_TAG, "Could not send ACRA Post responseCode=" + responseCode + " message=" + urlConnection.getResponseMessage());
                    throw new IOException("Host returned error code " + responseCode);
                }
                ACRA.log.w(ACRA.LOG_TAG, "Could not send ACRA Post - request will be discarded. responseCode=" + responseCode + " message=" + urlConnection.getResponseMessage());
            }
            urlConnection.disconnect();
        } catch (Throwable th) {
            IOUtils.safeClose(outputStream);
            throw th;
        }
    }

    @NonNull
    public static String getParamsAsFormString(@NonNull Map<?, ?> parameters) throws UnsupportedEncodingException {
        StringBuilder dataBfr = new StringBuilder();
        for (Map.Entry<?, ?> entry : parameters.entrySet()) {
            if (dataBfr.length() != 0) {
                dataBfr.append('&');
            }
            Object preliminaryValue = entry.getValue();
            Object value = preliminaryValue == null ? "" : preliminaryValue;
            dataBfr.append(URLEncoder.encode(entry.getKey().toString(), UTF8));
            dataBfr.append('=');
            dataBfr.append(URLEncoder.encode(value.toString(), UTF8));
        }
        return dataBfr.toString();
    }
}
