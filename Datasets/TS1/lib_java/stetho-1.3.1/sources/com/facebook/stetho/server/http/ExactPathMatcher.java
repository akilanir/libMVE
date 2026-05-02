package com.facebook.stetho.server.http;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/server/http/ExactPathMatcher.class */
public class ExactPathMatcher implements PathMatcher {
    private final String mPath;

    public ExactPathMatcher(String path) {
        this.mPath = path;
    }

    @Override // com.facebook.stetho.server.http.PathMatcher
    public boolean match(String path) {
        return this.mPath.equals(path);
    }
}
