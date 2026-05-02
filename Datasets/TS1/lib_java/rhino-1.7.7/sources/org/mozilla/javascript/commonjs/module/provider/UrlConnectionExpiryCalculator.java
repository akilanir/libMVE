package org.mozilla.javascript.commonjs.module.provider;

import java.net.URLConnection;

/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/commonjs/module/provider/UrlConnectionExpiryCalculator.class */
public interface UrlConnectionExpiryCalculator {
    long calculateExpiry(URLConnection uRLConnection);
}
