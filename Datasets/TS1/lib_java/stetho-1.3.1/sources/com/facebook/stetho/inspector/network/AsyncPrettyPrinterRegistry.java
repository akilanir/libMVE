package com.facebook.stetho.inspector.network;

import java.util.HashMap;
import java.util.Map;
import javax.annotation.Nullable;
import javax.annotation.concurrent.ThreadSafe;

@ThreadSafe
/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/network/AsyncPrettyPrinterRegistry.class */
public class AsyncPrettyPrinterRegistry {
    private final Map<String, AsyncPrettyPrinterFactory> mRegistry = new HashMap();

    public synchronized void register(String headerName, AsyncPrettyPrinterFactory factory) {
        this.mRegistry.put(headerName, factory);
    }

    @Nullable
    public synchronized AsyncPrettyPrinterFactory lookup(String headerName) {
        return this.mRegistry.get(headerName);
    }

    public synchronized boolean unregister(String headerName) {
        return this.mRegistry.remove(headerName) != null;
    }
}
