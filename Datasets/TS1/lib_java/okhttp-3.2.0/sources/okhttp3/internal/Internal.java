package okhttp3.internal;

import java.net.MalformedURLException;
import java.net.UnknownHostException;
import java.util.logging.Logger;
import javax.net.ssl.SSLSocket;
import okhttp3.Address;
import okhttp3.Call;
import okhttp3.Callback;
import okhttp3.ConnectionPool;
import okhttp3.ConnectionSpec;
import okhttp3.Headers;
import okhttp3.HttpUrl;
import okhttp3.OkHttpClient;
import okhttp3.internal.http.StreamAllocation;
import okhttp3.internal.io.RealConnection;

/* loaded from: okhttp-3.2.0.jar:okhttp3/internal/Internal.class */
public abstract class Internal {
    public static final Logger logger = Logger.getLogger(OkHttpClient.class.getName());
    public static Internal instance;

    public abstract void addLenient(Headers.Builder builder, String str);

    public abstract void addLenient(Headers.Builder builder, String str, String str2);

    public abstract void setCache(OkHttpClient.Builder builder, InternalCache internalCache);

    public abstract InternalCache internalCache(OkHttpClient okHttpClient);

    public abstract RealConnection get(ConnectionPool connectionPool, Address address, StreamAllocation streamAllocation);

    public abstract void put(ConnectionPool connectionPool, RealConnection realConnection);

    public abstract boolean connectionBecameIdle(ConnectionPool connectionPool, RealConnection realConnection);

    public abstract RouteDatabase routeDatabase(ConnectionPool connectionPool);

    public abstract void apply(ConnectionSpec connectionSpec, SSLSocket sSLSocket, boolean z);

    public abstract HttpUrl getHttpUrlChecked(String str) throws MalformedURLException, UnknownHostException;

    public abstract void callEnqueue(Call call, Callback callback, boolean z);

    public abstract StreamAllocation callEngineGetStreamAllocation(Call call);

    public static void initializeInstanceForTests() {
        new OkHttpClient();
    }
}
