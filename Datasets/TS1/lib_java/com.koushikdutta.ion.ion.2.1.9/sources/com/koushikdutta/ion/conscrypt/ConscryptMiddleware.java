package com.koushikdutta.ion.conscrypt;

import android.content.Context;
import android.util.Log;
import com.koushikdutta.async.AsyncSSLSocketWrapper;
import com.koushikdutta.async.future.Cancellable;
import com.koushikdutta.async.http.AsyncHttpClientMiddleware;
import com.koushikdutta.async.http.AsyncSSLSocketMiddleware;
import com.koushikdutta.async.http.SimpleMiddleware;
import java.lang.reflect.Method;
import java.security.Provider;
import java.security.Security;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocketFactory;

/* loaded from: com.koushikdutta.ion.ion.2.1.9.jar:com/koushikdutta/ion/conscrypt/ConscryptMiddleware.class */
public class ConscryptMiddleware extends SimpleMiddleware {
    static final Object lock = new Object();
    static boolean initialized;
    static boolean success;
    boolean instanceInitialized;
    boolean enabled = true;
    private static final String LOGTAG = "IonConscrypt";
    private static final String GMS_PROVIDER = "GmsCore_OpenSSL";
    AsyncSSLSocketMiddleware middleware;
    Context context;

    public void enable(boolean enabled) {
        this.enabled = enabled;
        if (!enabled) {
            this.instanceInitialized = false;
            this.middleware.setSSLContext((SSLContext) null);
        }
    }

    public static void initialize(Context context) {
        try {
            synchronized (lock) {
                if (initialized) {
                    return;
                }
                initialized = true;
                if (Security.getProvider(GMS_PROVIDER) != null) {
                    success = true;
                    return;
                }
                SSLContext originalDefaultContext = SSLContext.getDefault();
                SSLSocketFactory originalDefaultSSLSocketFactory = HttpsURLConnection.getDefaultSSLSocketFactory();
                try {
                    Class<?> providerInstaller = Class.forName("com.google.android.gms.security.ProviderInstaller");
                    Method mInsertProvider = providerInstaller.getDeclaredMethod("installIfNeeded", Context.class);
                    mInsertProvider.invoke(null, context);
                } catch (Throwable th) {
                    Context gms = context.createPackageContext("com.google.android.gms", 3);
                    gms.getClassLoader().loadClass("com.google.android.gms.common.security.ProviderInstallerImpl").getMethod("insertProvider", Context.class).invoke(null, context);
                }
                Provider[] providers = Security.getProviders();
                Provider provider = Security.getProvider(GMS_PROVIDER);
                Security.removeProvider(GMS_PROVIDER);
                Security.insertProviderAt(provider, providers.length);
                SSLContext.setDefault(originalDefaultContext);
                HttpsURLConnection.setDefaultSSLSocketFactory(originalDefaultSSLSocketFactory);
                success = true;
            }
        } catch (Exception e) {
            Log.w(LOGTAG, "Conscrypt initialization failed.");
        }
    }

    public void initialize() {
        initialize(this.context);
        if (success && !this.instanceInitialized && this.enabled) {
            this.instanceInitialized = true;
            SSLContext sslContext = null;
            try {
                try {
                    sslContext = SSLContext.getInstance("TLS", GMS_PROVIDER);
                } catch (Exception e) {
                }
                if (sslContext == null) {
                    sslContext = SSLContext.getInstance("TLS");
                }
                sslContext.init(null, null, null);
                if (this.middleware.getSSLContext() == AsyncSSLSocketWrapper.getDefaultSSLContext()) {
                    this.middleware.setSSLContext(sslContext);
                }
            } catch (Exception e2) {
            }
        }
    }

    public ConscryptMiddleware(Context context, AsyncSSLSocketMiddleware middleware) {
        this.middleware = middleware;
        this.context = context.getApplicationContext();
    }

    public Cancellable getSocket(AsyncHttpClientMiddleware.GetSocketData data) {
        if (!this.enabled) {
            return null;
        }
        initialize();
        return super.getSocket(data);
    }
}
