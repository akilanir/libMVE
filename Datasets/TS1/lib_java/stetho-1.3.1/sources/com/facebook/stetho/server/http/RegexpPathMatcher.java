package com.facebook.stetho.server.http;

import java.util.regex.Pattern;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/server/http/RegexpPathMatcher.class */
public class RegexpPathMatcher implements PathMatcher {
    private final Pattern mPattern;

    public RegexpPathMatcher(Pattern pattern) {
        this.mPattern = pattern;
    }

    @Override // com.facebook.stetho.server.http.PathMatcher
    public boolean match(String path) {
        return this.mPattern.matcher(path).matches();
    }
}
