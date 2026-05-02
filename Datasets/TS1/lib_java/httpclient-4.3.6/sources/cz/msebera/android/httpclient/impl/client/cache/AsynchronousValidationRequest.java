package cz.msebera.android.httpclient.impl.client.cache;

import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.HttpResponse;
import cz.msebera.android.httpclient.client.cache.HttpCacheEntry;
import cz.msebera.android.httpclient.client.methods.HttpExecutionAware;
import cz.msebera.android.httpclient.client.methods.HttpRequestWrapper;
import cz.msebera.android.httpclient.client.protocol.HttpClientContext;
import cz.msebera.android.httpclient.conn.routing.HttpRoute;
import cz.msebera.android.httpclient.extras.HttpClientAndroidLog;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/client/cache/AsynchronousValidationRequest.class */
class AsynchronousValidationRequest implements Runnable {
    private final AsynchronousValidator parent;
    private final CachingExec cachingExec;
    private final HttpRoute route;
    private final HttpRequestWrapper request;
    private final HttpClientContext context;
    private final HttpExecutionAware execAware;
    private final HttpCacheEntry cacheEntry;
    private final String identifier;
    private final int consecutiveFailedAttempts;
    public HttpClientAndroidLog log = new HttpClientAndroidLog(getClass());

    AsynchronousValidationRequest(AsynchronousValidator parent, CachingExec cachingExec, HttpRoute route, HttpRequestWrapper request, HttpClientContext context, HttpExecutionAware execAware, HttpCacheEntry cacheEntry, String identifier, int consecutiveFailedAttempts) {
        this.parent = parent;
        this.cachingExec = cachingExec;
        this.route = route;
        this.request = request;
        this.context = context;
        this.execAware = execAware;
        this.cacheEntry = cacheEntry;
        this.identifier = identifier;
        this.consecutiveFailedAttempts = consecutiveFailedAttempts;
    }

    @Override // java.lang.Runnable
    public void run() {
        try {
            if (revalidateCacheEntry()) {
                this.parent.jobSuccessful(this.identifier);
            } else {
                this.parent.jobFailed(this.identifier);
            }
        } finally {
            this.parent.markComplete(this.identifier);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x003c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    protected boolean revalidateCacheEntry() {
        /*
            r7 = this;
            r0 = r7
            cz.msebera.android.httpclient.impl.client.cache.CachingExec r0 = r0.cachingExec     // Catch: java.io.IOException -> L51 cz.msebera.android.httpclient.HttpException -> L5e java.lang.RuntimeException -> L6b
            r1 = r7
            cz.msebera.android.httpclient.conn.routing.HttpRoute r1 = r1.route     // Catch: java.io.IOException -> L51 cz.msebera.android.httpclient.HttpException -> L5e java.lang.RuntimeException -> L6b
            r2 = r7
            cz.msebera.android.httpclient.client.methods.HttpRequestWrapper r2 = r2.request     // Catch: java.io.IOException -> L51 cz.msebera.android.httpclient.HttpException -> L5e java.lang.RuntimeException -> L6b
            r3 = r7
            cz.msebera.android.httpclient.client.protocol.HttpClientContext r3 = r3.context     // Catch: java.io.IOException -> L51 cz.msebera.android.httpclient.HttpException -> L5e java.lang.RuntimeException -> L6b
            r4 = r7
            cz.msebera.android.httpclient.client.methods.HttpExecutionAware r4 = r4.execAware     // Catch: java.io.IOException -> L51 cz.msebera.android.httpclient.HttpException -> L5e java.lang.RuntimeException -> L6b
            r5 = r7
            cz.msebera.android.httpclient.client.cache.HttpCacheEntry r5 = r5.cacheEntry     // Catch: java.io.IOException -> L51 cz.msebera.android.httpclient.HttpException -> L5e java.lang.RuntimeException -> L6b
            cz.msebera.android.httpclient.client.methods.CloseableHttpResponse r0 = r0.revalidateCacheEntry(r1, r2, r3, r4, r5)     // Catch: java.io.IOException -> L51 cz.msebera.android.httpclient.HttpException -> L5e java.lang.RuntimeException -> L6b
            r8 = r0
            r0 = r8
            cz.msebera.android.httpclient.StatusLine r0 = r0.getStatusLine()     // Catch: java.lang.Throwable -> L46 java.io.IOException -> L51 cz.msebera.android.httpclient.HttpException -> L5e java.lang.RuntimeException -> L6b
            int r0 = r0.getStatusCode()     // Catch: java.lang.Throwable -> L46 java.io.IOException -> L51 cz.msebera.android.httpclient.HttpException -> L5e java.lang.RuntimeException -> L6b
            r9 = r0
            r0 = r7
            r1 = r9
            boolean r0 = r0.isNotServerError(r1)     // Catch: java.lang.Throwable -> L46 java.io.IOException -> L51 cz.msebera.android.httpclient.HttpException -> L5e java.lang.RuntimeException -> L6b
            if (r0 == 0) goto L3c
            r0 = r7
            r1 = r8
            boolean r0 = r0.isNotStale(r1)     // Catch: java.lang.Throwable -> L46 java.io.IOException -> L51 cz.msebera.android.httpclient.HttpException -> L5e java.lang.RuntimeException -> L6b
            if (r0 == 0) goto L3c
            r0 = 1
            goto L3d
        L3c:
            r0 = 0
        L3d:
            r10 = r0
            r0 = r8
            r0.close()     // Catch: java.io.IOException -> L51 cz.msebera.android.httpclient.HttpException -> L5e java.lang.RuntimeException -> L6b
            r0 = r10
            return r0
        L46:
            r11 = move-exception
            r0 = r8
            r0.close()     // Catch: java.io.IOException -> L51 cz.msebera.android.httpclient.HttpException -> L5e java.lang.RuntimeException -> L6b
            r0 = r11
            throw r0     // Catch: java.io.IOException -> L51 cz.msebera.android.httpclient.HttpException -> L5e java.lang.RuntimeException -> L6b
        L51:
            r8 = move-exception
            r0 = r7
            cz.msebera.android.httpclient.extras.HttpClientAndroidLog r0 = r0.log
            java.lang.String r1 = "Asynchronous revalidation failed due to I/O error"
            r2 = r8
            r0.debug(r1, r2)
            r0 = 0
            return r0
        L5e:
            r8 = move-exception
            r0 = r7
            cz.msebera.android.httpclient.extras.HttpClientAndroidLog r0 = r0.log
            java.lang.String r1 = "HTTP protocol exception during asynchronous revalidation"
            r2 = r8
            r0.error(r1, r2)
            r0 = 0
            return r0
        L6b:
            r8 = move-exception
            r0 = r7
            cz.msebera.android.httpclient.extras.HttpClientAndroidLog r0 = r0.log
            java.lang.StringBuilder r1 = new java.lang.StringBuilder
            r2 = r1
            r2.<init>()
            java.lang.String r2 = "RuntimeException thrown during asynchronous revalidation: "
            java.lang.StringBuilder r1 = r1.append(r2)
            r2 = r8
            java.lang.StringBuilder r1 = r1.append(r2)
            java.lang.String r1 = r1.toString()
            r0.error(r1)
            r0 = 0
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: cz.msebera.android.httpclient.impl.client.cache.AsynchronousValidationRequest.revalidateCacheEntry():boolean");
    }

    private boolean isNotServerError(int statusCode) {
        return statusCode < 500;
    }

    private boolean isNotStale(HttpResponse httpResponse) {
        Header[] warnings = httpResponse.getHeaders("Warning");
        if (warnings != null) {
            for (Header warning : warnings) {
                String warningValue = warning.getValue();
                if (warningValue.startsWith("110") || warningValue.startsWith("111")) {
                    return false;
                }
            }
            return true;
        }
        return true;
    }

    String getIdentifier() {
        return this.identifier;
    }

    public int getConsecutiveFailedAttempts() {
        return this.consecutiveFailedAttempts;
    }
}
