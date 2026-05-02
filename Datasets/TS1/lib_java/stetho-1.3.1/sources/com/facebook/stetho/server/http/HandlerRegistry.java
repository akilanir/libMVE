package com.facebook.stetho.server.http;

import android.support.annotation.Nullable;
import java.util.ArrayList;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/server/http/HandlerRegistry.class */
public class HandlerRegistry {
    private final ArrayList<PathMatcher> mPathMatchers = new ArrayList<>();
    private final ArrayList<HttpHandler> mHttpHandlers = new ArrayList<>();

    public synchronized void register(PathMatcher path, HttpHandler handler) {
        this.mPathMatchers.add(path);
        this.mHttpHandlers.add(handler);
    }

    public synchronized boolean unregister(PathMatcher path, HttpHandler handler) {
        int index = this.mPathMatchers.indexOf(path);
        if (index >= 0 && handler == this.mHttpHandlers.get(index)) {
            this.mPathMatchers.remove(index);
            this.mHttpHandlers.remove(index);
            return true;
        }
        return false;
    }

    @Nullable
    public synchronized HttpHandler lookup(String path) {
        int N = this.mPathMatchers.size();
        for (int i = 0; i < N; i++) {
            if (this.mPathMatchers.get(i).match(path)) {
                return this.mHttpHandlers.get(i);
            }
        }
        return null;
    }
}
