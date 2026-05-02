package info.guardianproject.netcipher;

import android.net.Uri;
import android.text.TextUtils;
import info.guardianproject.netcipher.client.TlsOnlySocketFactory;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.InetSocketAddress;
import java.net.Proxy;
import java.net.URI;
import java.net.URL;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocketFactory;

/* loaded from: netcipher-1.2.jar:info/guardianproject/netcipher/NetCipher.class */
public class NetCipher {
    public static final Proxy ORBOT_HTTP_PROXY = new Proxy(Proxy.Type.HTTP, new InetSocketAddress("127.0.0.1", 8118));
    private static Proxy proxy;

    private NetCipher() {
    }

    public static void setProxy(String host, int port) {
        if (host != null && port > 0) {
            InetSocketAddress isa = new InetSocketAddress(host, port);
            proxy = new Proxy(Proxy.Type.HTTP, isa);
        } else {
            proxy = null;
        }
    }

    public static void setProxy(Proxy proxy2) {
        proxy = proxy2;
    }

    public static Proxy getProxy() {
        return proxy;
    }

    public static void useTor() {
        setProxy(ORBOT_HTTP_PROXY);
    }

    public static HttpsURLConnection getHttpsURLConnection(String urlString) throws IOException {
        urlString.replaceFirst("^[Hh][Tt][Tt][Pp]:", "https:");
        return getHttpsURLConnection(new URL(urlString), false);
    }

    public static HttpsURLConnection getHttpsURLConnection(Uri uri) throws IOException {
        return getHttpsURLConnection(uri.toString());
    }

    public static HttpsURLConnection getHttpsURLConnection(URI uri) throws IOException {
        if (TextUtils.equals(uri.getScheme(), "https")) {
            return getHttpsURLConnection(uri.toURL(), false);
        }
        return getHttpsURLConnection(uri.toString());
    }

    public static HttpsURLConnection getHttpsURLConnection(URL url) throws IOException {
        return getHttpsURLConnection(url, false);
    }

    public static HttpsURLConnection getCompatibleHttpsURLConnection(URL url) throws IOException {
        return getHttpsURLConnection(url, true);
    }

    public static HttpsURLConnection getHttpsURLConnection(URL url, boolean compatible) throws IOException {
        HttpURLConnection connection = getHttpURLConnection(url, compatible);
        if (connection instanceof HttpsURLConnection) {
            return (HttpsURLConnection) connection;
        }
        throw new IllegalArgumentException("not an HTTPS connection!");
    }

    public static HttpURLConnection getCompatibleHttpURLConnection(URL url) throws IOException {
        return getHttpURLConnection(url, true);
    }

    public static HttpURLConnection getHttpURLConnection(String urlString) throws IOException {
        return getHttpURLConnection(new URL(urlString));
    }

    public static HttpURLConnection getHttpURLConnection(Uri uri) throws IOException {
        return getHttpURLConnection(uri.toString());
    }

    public static HttpURLConnection getHttpURLConnection(URI uri) throws IOException {
        return getHttpURLConnection(uri.toURL());
    }

    public static HttpURLConnection getHttpURLConnection(URL url) throws IOException {
        return getHttpURLConnection(url, false);
    }

    public static HttpURLConnection getHttpURLConnection(URL url, boolean compatible) throws IOException {
        try {
            SSLContext sslcontext = SSLContext.getInstance("TLSv1");
            sslcontext.init(null, null, null);
            SSLSocketFactory tlsOnly = new TlsOnlySocketFactory(sslcontext.getSocketFactory(), compatible);
            HttpsURLConnection.setDefaultSSLSocketFactory(tlsOnly);
            if (proxy != null) {
                return (HttpURLConnection) url.openConnection(proxy);
            }
            return (HttpURLConnection) url.openConnection();
        } catch (KeyManagementException e) {
            throw new IllegalArgumentException(e);
        } catch (NoSuchAlgorithmException e2) {
            throw new IllegalArgumentException(e2);
        }
    }
}
