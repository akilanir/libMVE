package com.koushikdutta.async.http;

import com.koushikdutta.async.http.AsyncHttpClientMiddleware;
import java.lang.reflect.Field;
import java.util.Hashtable;
import javax.net.ssl.SSLEngine;

/* loaded from: com.koushikdutta.async.androidasync.2.1.7.jar:com/koushikdutta/async/http/SSLEngineSNIConfigurator.class */
public class SSLEngineSNIConfigurator implements AsyncSSLEngineConfigurator {
    Hashtable<String, EngineHolder> holders = new Hashtable<>();

    /* loaded from: com.koushikdutta.async.androidasync.2.1.7.jar:com/koushikdutta/async/http/SSLEngineSNIConfigurator$EngineHolder.class */
    private static class EngineHolder implements AsyncSSLEngineConfigurator {
        Field peerHost;
        Field peerPort;
        Field sslParameters;
        Field useSni;

        public EngineHolder(Class engineClass) {
            try {
                this.peerHost = engineClass.getSuperclass().getDeclaredField("peerHost");
                this.peerHost.setAccessible(true);
                this.peerPort = engineClass.getSuperclass().getDeclaredField("peerPort");
                this.peerPort.setAccessible(true);
                this.sslParameters = engineClass.getDeclaredField("sslParameters");
                this.sslParameters.setAccessible(true);
                this.useSni = this.sslParameters.getType().getDeclaredField("useSni");
                this.useSni.setAccessible(true);
            } catch (NoSuchFieldException e) {
            }
        }

        @Override // com.koushikdutta.async.http.AsyncSSLEngineConfigurator
        public void configureEngine(SSLEngine engine, AsyncHttpClientMiddleware.GetSocketData data, String host, int port) {
            if (this.useSni == null) {
                return;
            }
            try {
                this.peerHost.set(engine, host);
                this.peerPort.set(engine, Integer.valueOf(port));
                Object sslp = this.sslParameters.get(engine);
                this.useSni.set(sslp, true);
            } catch (IllegalAccessException e) {
            }
        }
    }

    @Override // com.koushikdutta.async.http.AsyncSSLEngineConfigurator
    public void configureEngine(SSLEngine engine, AsyncHttpClientMiddleware.GetSocketData data, String host, int port) {
        String name = engine.getClass().getCanonicalName();
        EngineHolder holder = this.holders.get(name);
        if (holder == null) {
            holder = new EngineHolder(engine.getClass());
            this.holders.put(name, holder);
        }
        holder.configureEngine(engine, data, host, port);
    }
}
