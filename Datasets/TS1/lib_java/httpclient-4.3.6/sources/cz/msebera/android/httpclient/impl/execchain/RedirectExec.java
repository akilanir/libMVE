package cz.msebera.android.httpclient.impl.execchain;

import cz.msebera.android.httpclient.annotation.ThreadSafe;
import cz.msebera.android.httpclient.client.RedirectStrategy;
import cz.msebera.android.httpclient.conn.routing.HttpRoutePlanner;
import cz.msebera.android.httpclient.extras.HttpClientAndroidLog;
import cz.msebera.android.httpclient.util.Args;

@ThreadSafe
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/execchain/RedirectExec.class */
public class RedirectExec implements ClientExecChain {
    public HttpClientAndroidLog log = new HttpClientAndroidLog(getClass());
    private final ClientExecChain requestExecutor;
    private final RedirectStrategy redirectStrategy;
    private final HttpRoutePlanner routePlanner;

    public RedirectExec(ClientExecChain requestExecutor, HttpRoutePlanner routePlanner, RedirectStrategy redirectStrategy) {
        Args.notNull(requestExecutor, "HTTP client request executor");
        Args.notNull(routePlanner, "HTTP route planner");
        Args.notNull(redirectStrategy, "HTTP redirect strategy");
        this.requestExecutor = requestExecutor;
        this.routePlanner = routePlanner;
        this.redirectStrategy = redirectStrategy;
    }

    /* JADX WARN: Code restructure failed: missing block: B:46:0x01c3, code lost:
    
        return r0;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v19, types: [cz.msebera.android.httpclient.impl.execchain.ClientExecChain] */
    /* JADX WARN: Type inference failed for: r2v0, types: [cz.msebera.android.httpclient.client.methods.HttpRequestWrapper] */
    @Override // cz.msebera.android.httpclient.impl.execchain.ClientExecChain
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public cz.msebera.android.httpclient.client.methods.CloseableHttpResponse execute(cz.msebera.android.httpclient.conn.routing.HttpRoute r7, cz.msebera.android.httpclient.client.methods.HttpRequestWrapper r8, cz.msebera.android.httpclient.client.protocol.HttpClientContext r9, cz.msebera.android.httpclient.client.methods.HttpExecutionAware r10) throws java.io.IOException, cz.msebera.android.httpclient.HttpException {
        /*
            Method dump skipped, instructions count: 542
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: cz.msebera.android.httpclient.impl.execchain.RedirectExec.execute(cz.msebera.android.httpclient.conn.routing.HttpRoute, cz.msebera.android.httpclient.client.methods.HttpRequestWrapper, cz.msebera.android.httpclient.client.protocol.HttpClientContext, cz.msebera.android.httpclient.client.methods.HttpExecutionAware):cz.msebera.android.httpclient.client.methods.CloseableHttpResponse");
    }
}
