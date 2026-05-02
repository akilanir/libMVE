package cz.msebera.android.httpclient.impl.execchain;

import cz.msebera.android.httpclient.HttpException;
import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.client.BackoffManager;
import cz.msebera.android.httpclient.client.ConnectionBackoffStrategy;
import cz.msebera.android.httpclient.client.methods.CloseableHttpResponse;
import cz.msebera.android.httpclient.client.methods.HttpExecutionAware;
import cz.msebera.android.httpclient.client.methods.HttpRequestWrapper;
import cz.msebera.android.httpclient.client.protocol.HttpClientContext;
import cz.msebera.android.httpclient.conn.routing.HttpRoute;
import cz.msebera.android.httpclient.util.Args;
import java.io.IOException;
import java.lang.reflect.UndeclaredThrowableException;

@Immutable
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/execchain/BackoffStrategyExec.class */
public class BackoffStrategyExec implements ClientExecChain {
    private final ClientExecChain requestExecutor;
    private final ConnectionBackoffStrategy connectionBackoffStrategy;
    private final BackoffManager backoffManager;

    public BackoffStrategyExec(ClientExecChain requestExecutor, ConnectionBackoffStrategy connectionBackoffStrategy, BackoffManager backoffManager) {
        Args.notNull(requestExecutor, "HTTP client request executor");
        Args.notNull(connectionBackoffStrategy, "Connection backoff strategy");
        Args.notNull(backoffManager, "Backoff manager");
        this.requestExecutor = requestExecutor;
        this.connectionBackoffStrategy = connectionBackoffStrategy;
        this.backoffManager = backoffManager;
    }

    @Override // cz.msebera.android.httpclient.impl.execchain.ClientExecChain
    public CloseableHttpResponse execute(HttpRoute route, HttpRequestWrapper request, HttpClientContext context, HttpExecutionAware execAware) throws IOException, HttpException {
        Args.notNull(route, "HTTP route");
        Args.notNull(request, "HTTP request");
        Args.notNull(context, "HTTP context");
        CloseableHttpResponse out = null;
        try {
            out = this.requestExecutor.execute(route, request, context, execAware);
            if (this.connectionBackoffStrategy.shouldBackoff(out)) {
                this.backoffManager.backOff(route);
            } else {
                this.backoffManager.probe(route);
            }
            return out;
        } catch (Exception ex) {
            if (out != null) {
                out.close();
            }
            if (this.connectionBackoffStrategy.shouldBackoff(ex)) {
                this.backoffManager.backOff(route);
            }
            if (ex instanceof RuntimeException) {
                throw ((RuntimeException) ex);
            }
            if (ex instanceof HttpException) {
                throw ((HttpException) ex);
            }
            if (ex instanceof IOException) {
                throw ((IOException) ex);
            }
            throw new UndeclaredThrowableException(ex);
        }
    }
}
