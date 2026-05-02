package cz.msebera.android.httpclient.impl.execchain;

import cz.msebera.android.httpclient.ConnectionReuseStrategy;
import cz.msebera.android.httpclient.HttpClientConnection;
import cz.msebera.android.httpclient.HttpEntity;
import cz.msebera.android.httpclient.HttpException;
import cz.msebera.android.httpclient.HttpHost;
import cz.msebera.android.httpclient.HttpRequest;
import cz.msebera.android.httpclient.HttpResponse;
import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.auth.AuthState;
import cz.msebera.android.httpclient.client.AuthenticationStrategy;
import cz.msebera.android.httpclient.client.UserTokenHandler;
import cz.msebera.android.httpclient.client.config.RequestConfig;
import cz.msebera.android.httpclient.client.protocol.HttpClientContext;
import cz.msebera.android.httpclient.client.protocol.RequestClientConnControl;
import cz.msebera.android.httpclient.conn.ConnectionKeepAliveStrategy;
import cz.msebera.android.httpclient.conn.HttpClientConnectionManager;
import cz.msebera.android.httpclient.conn.routing.BasicRouteDirector;
import cz.msebera.android.httpclient.conn.routing.HttpRoute;
import cz.msebera.android.httpclient.conn.routing.HttpRouteDirector;
import cz.msebera.android.httpclient.conn.routing.RouteTracker;
import cz.msebera.android.httpclient.entity.BufferedHttpEntity;
import cz.msebera.android.httpclient.extras.HttpClientAndroidLog;
import cz.msebera.android.httpclient.impl.auth.HttpAuthenticator;
import cz.msebera.android.httpclient.message.BasicHttpRequest;
import cz.msebera.android.httpclient.protocol.HttpProcessor;
import cz.msebera.android.httpclient.protocol.HttpRequestExecutor;
import cz.msebera.android.httpclient.protocol.ImmutableHttpProcessor;
import cz.msebera.android.httpclient.protocol.RequestTargetHost;
import cz.msebera.android.httpclient.util.Args;
import cz.msebera.android.httpclient.util.EntityUtils;
import java.io.IOException;

@Immutable
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/execchain/MainClientExec.class */
public class MainClientExec implements ClientExecChain {
    public HttpClientAndroidLog log = new HttpClientAndroidLog(getClass());
    private final HttpRequestExecutor requestExecutor;
    private final HttpClientConnectionManager connManager;
    private final ConnectionReuseStrategy reuseStrategy;
    private final ConnectionKeepAliveStrategy keepAliveStrategy;
    private final HttpProcessor proxyHttpProcessor;
    private final AuthenticationStrategy targetAuthStrategy;
    private final AuthenticationStrategy proxyAuthStrategy;
    private final HttpAuthenticator authenticator;
    private final UserTokenHandler userTokenHandler;
    private final HttpRouteDirector routeDirector;

    public MainClientExec(HttpRequestExecutor requestExecutor, HttpClientConnectionManager connManager, ConnectionReuseStrategy reuseStrategy, ConnectionKeepAliveStrategy keepAliveStrategy, AuthenticationStrategy targetAuthStrategy, AuthenticationStrategy proxyAuthStrategy, UserTokenHandler userTokenHandler) {
        Args.notNull(requestExecutor, "HTTP request executor");
        Args.notNull(connManager, "Client connection manager");
        Args.notNull(reuseStrategy, "Connection reuse strategy");
        Args.notNull(keepAliveStrategy, "Connection keep alive strategy");
        Args.notNull(targetAuthStrategy, "Target authentication strategy");
        Args.notNull(proxyAuthStrategy, "Proxy authentication strategy");
        Args.notNull(userTokenHandler, "User token handler");
        this.authenticator = new HttpAuthenticator();
        this.proxyHttpProcessor = new ImmutableHttpProcessor(new RequestTargetHost(), new RequestClientConnControl());
        this.routeDirector = new BasicRouteDirector();
        this.requestExecutor = requestExecutor;
        this.connManager = connManager;
        this.reuseStrategy = reuseStrategy;
        this.keepAliveStrategy = keepAliveStrategy;
        this.targetAuthStrategy = targetAuthStrategy;
        this.proxyAuthStrategy = proxyAuthStrategy;
        this.userTokenHandler = userTokenHandler;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:102:0x033c A[Catch: ConnectionShutdownException -> 0x0455, HttpException -> 0x046d, IOException -> 0x0477, RuntimeException -> 0x0481, TryCatch #4 {HttpException -> 0x046d, ConnectionShutdownException -> 0x0455, IOException -> 0x0477, RuntimeException -> 0x0481, blocks: (B:43:0x0148, B:47:0x015a, B:49:0x0161, B:50:0x016a, B:53:0x0170, B:55:0x017a, B:56:0x0183, B:57:0x0184, B:59:0x018e, B:60:0x01a8, B:62:0x01b8, B:64:0x01c2, B:65:0x01ce, B:131:0x0401, B:134:0x041a, B:135:0x0421, B:137:0x042f, B:141:0x0449, B:139:0x0439, B:66:0x01d8, B:68:0x01e4, B:71:0x01f2, B:73:0x01fc, B:74:0x0205, B:75:0x0206, B:77:0x0210, B:78:0x022d, B:80:0x0236, B:82:0x0240, B:83:0x025e, B:84:0x0269, B:86:0x0272, B:88:0x0279, B:90:0x0283, B:91:0x02a1, B:92:0x02ac, B:94:0x02c8, B:98:0x02e7, B:100:0x030f, B:101:0x032a, B:103:0x0341, B:105:0x0350, B:107:0x0361, B:122:0x03cc, B:124:0x03de, B:125:0x03e4, B:127:0x03f0, B:128:0x03f6, B:108:0x0369, B:110:0x037b, B:112:0x0383, B:114:0x0390, B:115:0x039e, B:117:0x03a9, B:119:0x03b1, B:121:0x03be, B:102:0x033c), top: B:159:0x0148 }] */
    /* JADX WARN: Removed duplicated region for block: B:105:0x0350 A[Catch: ConnectionShutdownException -> 0x0455, HttpException -> 0x046d, IOException -> 0x0477, RuntimeException -> 0x0481, TryCatch #4 {HttpException -> 0x046d, ConnectionShutdownException -> 0x0455, IOException -> 0x0477, RuntimeException -> 0x0481, blocks: (B:43:0x0148, B:47:0x015a, B:49:0x0161, B:50:0x016a, B:53:0x0170, B:55:0x017a, B:56:0x0183, B:57:0x0184, B:59:0x018e, B:60:0x01a8, B:62:0x01b8, B:64:0x01c2, B:65:0x01ce, B:131:0x0401, B:134:0x041a, B:135:0x0421, B:137:0x042f, B:141:0x0449, B:139:0x0439, B:66:0x01d8, B:68:0x01e4, B:71:0x01f2, B:73:0x01fc, B:74:0x0205, B:75:0x0206, B:77:0x0210, B:78:0x022d, B:80:0x0236, B:82:0x0240, B:83:0x025e, B:84:0x0269, B:86:0x0272, B:88:0x0279, B:90:0x0283, B:91:0x02a1, B:92:0x02ac, B:94:0x02c8, B:98:0x02e7, B:100:0x030f, B:101:0x032a, B:103:0x0341, B:105:0x0350, B:107:0x0361, B:122:0x03cc, B:124:0x03de, B:125:0x03e4, B:127:0x03f0, B:128:0x03f6, B:108:0x0369, B:110:0x037b, B:112:0x0383, B:114:0x0390, B:115:0x039e, B:117:0x03a9, B:119:0x03b1, B:121:0x03be, B:102:0x033c), top: B:159:0x0148 }] */
    /* JADX WARN: Removed duplicated region for block: B:163:0x03fc A[EDGE_INSN: B:163:0x03fc->B:129:0x03fc BREAK  A[LOOP:0: B:45:0x0154->B:128:0x03f6], SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:68:0x01e4 A[Catch: ConnectionShutdownException -> 0x0455, HttpException -> 0x046d, IOException -> 0x0477, RuntimeException -> 0x0481, TryCatch #4 {HttpException -> 0x046d, ConnectionShutdownException -> 0x0455, IOException -> 0x0477, RuntimeException -> 0x0481, blocks: (B:43:0x0148, B:47:0x015a, B:49:0x0161, B:50:0x016a, B:53:0x0170, B:55:0x017a, B:56:0x0183, B:57:0x0184, B:59:0x018e, B:60:0x01a8, B:62:0x01b8, B:64:0x01c2, B:65:0x01ce, B:131:0x0401, B:134:0x041a, B:135:0x0421, B:137:0x042f, B:141:0x0449, B:139:0x0439, B:66:0x01d8, B:68:0x01e4, B:71:0x01f2, B:73:0x01fc, B:74:0x0205, B:75:0x0206, B:77:0x0210, B:78:0x022d, B:80:0x0236, B:82:0x0240, B:83:0x025e, B:84:0x0269, B:86:0x0272, B:88:0x0279, B:90:0x0283, B:91:0x02a1, B:92:0x02ac, B:94:0x02c8, B:98:0x02e7, B:100:0x030f, B:101:0x032a, B:103:0x0341, B:105:0x0350, B:107:0x0361, B:122:0x03cc, B:124:0x03de, B:125:0x03e4, B:127:0x03f0, B:128:0x03f6, B:108:0x0369, B:110:0x037b, B:112:0x0383, B:114:0x0390, B:115:0x039e, B:117:0x03a9, B:119:0x03b1, B:121:0x03be, B:102:0x033c), top: B:159:0x0148 }] */
    /* JADX WARN: Removed duplicated region for block: B:77:0x0210 A[Catch: ConnectionShutdownException -> 0x0455, HttpException -> 0x046d, IOException -> 0x0477, RuntimeException -> 0x0481, TryCatch #4 {HttpException -> 0x046d, ConnectionShutdownException -> 0x0455, IOException -> 0x0477, RuntimeException -> 0x0481, blocks: (B:43:0x0148, B:47:0x015a, B:49:0x0161, B:50:0x016a, B:53:0x0170, B:55:0x017a, B:56:0x0183, B:57:0x0184, B:59:0x018e, B:60:0x01a8, B:62:0x01b8, B:64:0x01c2, B:65:0x01ce, B:131:0x0401, B:134:0x041a, B:135:0x0421, B:137:0x042f, B:141:0x0449, B:139:0x0439, B:66:0x01d8, B:68:0x01e4, B:71:0x01f2, B:73:0x01fc, B:74:0x0205, B:75:0x0206, B:77:0x0210, B:78:0x022d, B:80:0x0236, B:82:0x0240, B:83:0x025e, B:84:0x0269, B:86:0x0272, B:88:0x0279, B:90:0x0283, B:91:0x02a1, B:92:0x02ac, B:94:0x02c8, B:98:0x02e7, B:100:0x030f, B:101:0x032a, B:103:0x0341, B:105:0x0350, B:107:0x0361, B:122:0x03cc, B:124:0x03de, B:125:0x03e4, B:127:0x03f0, B:128:0x03f6, B:108:0x0369, B:110:0x037b, B:112:0x0383, B:114:0x0390, B:115:0x039e, B:117:0x03a9, B:119:0x03b1, B:121:0x03be, B:102:0x033c), top: B:159:0x0148 }] */
    /* JADX WARN: Removed duplicated region for block: B:80:0x0236 A[Catch: ConnectionShutdownException -> 0x0455, HttpException -> 0x046d, IOException -> 0x0477, RuntimeException -> 0x0481, TryCatch #4 {HttpException -> 0x046d, ConnectionShutdownException -> 0x0455, IOException -> 0x0477, RuntimeException -> 0x0481, blocks: (B:43:0x0148, B:47:0x015a, B:49:0x0161, B:50:0x016a, B:53:0x0170, B:55:0x017a, B:56:0x0183, B:57:0x0184, B:59:0x018e, B:60:0x01a8, B:62:0x01b8, B:64:0x01c2, B:65:0x01ce, B:131:0x0401, B:134:0x041a, B:135:0x0421, B:137:0x042f, B:141:0x0449, B:139:0x0439, B:66:0x01d8, B:68:0x01e4, B:71:0x01f2, B:73:0x01fc, B:74:0x0205, B:75:0x0206, B:77:0x0210, B:78:0x022d, B:80:0x0236, B:82:0x0240, B:83:0x025e, B:84:0x0269, B:86:0x0272, B:88:0x0279, B:90:0x0283, B:91:0x02a1, B:92:0x02ac, B:94:0x02c8, B:98:0x02e7, B:100:0x030f, B:101:0x032a, B:103:0x0341, B:105:0x0350, B:107:0x0361, B:122:0x03cc, B:124:0x03de, B:125:0x03e4, B:127:0x03f0, B:128:0x03f6, B:108:0x0369, B:110:0x037b, B:112:0x0383, B:114:0x0390, B:115:0x039e, B:117:0x03a9, B:119:0x03b1, B:121:0x03be, B:102:0x033c), top: B:159:0x0148 }] */
    /* JADX WARN: Removed duplicated region for block: B:90:0x0283 A[Catch: ConnectionShutdownException -> 0x0455, HttpException -> 0x046d, IOException -> 0x0477, RuntimeException -> 0x0481, TryCatch #4 {HttpException -> 0x046d, ConnectionShutdownException -> 0x0455, IOException -> 0x0477, RuntimeException -> 0x0481, blocks: (B:43:0x0148, B:47:0x015a, B:49:0x0161, B:50:0x016a, B:53:0x0170, B:55:0x017a, B:56:0x0183, B:57:0x0184, B:59:0x018e, B:60:0x01a8, B:62:0x01b8, B:64:0x01c2, B:65:0x01ce, B:131:0x0401, B:134:0x041a, B:135:0x0421, B:137:0x042f, B:141:0x0449, B:139:0x0439, B:66:0x01d8, B:68:0x01e4, B:71:0x01f2, B:73:0x01fc, B:74:0x0205, B:75:0x0206, B:77:0x0210, B:78:0x022d, B:80:0x0236, B:82:0x0240, B:83:0x025e, B:84:0x0269, B:86:0x0272, B:88:0x0279, B:90:0x0283, B:91:0x02a1, B:92:0x02ac, B:94:0x02c8, B:98:0x02e7, B:100:0x030f, B:101:0x032a, B:103:0x0341, B:105:0x0350, B:107:0x0361, B:122:0x03cc, B:124:0x03de, B:125:0x03e4, B:127:0x03f0, B:128:0x03f6, B:108:0x0369, B:110:0x037b, B:112:0x0383, B:114:0x0390, B:115:0x039e, B:117:0x03a9, B:119:0x03b1, B:121:0x03be, B:102:0x033c), top: B:159:0x0148 }] */
    /* JADX WARN: Removed duplicated region for block: B:94:0x02c8 A[Catch: ConnectionShutdownException -> 0x0455, HttpException -> 0x046d, IOException -> 0x0477, RuntimeException -> 0x0481, TryCatch #4 {HttpException -> 0x046d, ConnectionShutdownException -> 0x0455, IOException -> 0x0477, RuntimeException -> 0x0481, blocks: (B:43:0x0148, B:47:0x015a, B:49:0x0161, B:50:0x016a, B:53:0x0170, B:55:0x017a, B:56:0x0183, B:57:0x0184, B:59:0x018e, B:60:0x01a8, B:62:0x01b8, B:64:0x01c2, B:65:0x01ce, B:131:0x0401, B:134:0x041a, B:135:0x0421, B:137:0x042f, B:141:0x0449, B:139:0x0439, B:66:0x01d8, B:68:0x01e4, B:71:0x01f2, B:73:0x01fc, B:74:0x0205, B:75:0x0206, B:77:0x0210, B:78:0x022d, B:80:0x0236, B:82:0x0240, B:83:0x025e, B:84:0x0269, B:86:0x0272, B:88:0x0279, B:90:0x0283, B:91:0x02a1, B:92:0x02ac, B:94:0x02c8, B:98:0x02e7, B:100:0x030f, B:101:0x032a, B:103:0x0341, B:105:0x0350, B:107:0x0361, B:122:0x03cc, B:124:0x03de, B:125:0x03e4, B:127:0x03f0, B:128:0x03f6, B:108:0x0369, B:110:0x037b, B:112:0x0383, B:114:0x0390, B:115:0x039e, B:117:0x03a9, B:119:0x03b1, B:121:0x03be, B:102:0x033c), top: B:159:0x0148 }] */
    @Override // cz.msebera.android.httpclient.impl.execchain.ClientExecChain
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public cz.msebera.android.httpclient.client.methods.CloseableHttpResponse execute(cz.msebera.android.httpclient.conn.routing.HttpRoute r8, cz.msebera.android.httpclient.client.methods.HttpRequestWrapper r9, cz.msebera.android.httpclient.client.protocol.HttpClientContext r10, cz.msebera.android.httpclient.client.methods.HttpExecutionAware r11) throws java.io.IOException, cz.msebera.android.httpclient.HttpException {
        /*
            Method dump skipped, instructions count: 1163
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: cz.msebera.android.httpclient.impl.execchain.MainClientExec.execute(cz.msebera.android.httpclient.conn.routing.HttpRoute, cz.msebera.android.httpclient.client.methods.HttpRequestWrapper, cz.msebera.android.httpclient.client.protocol.HttpClientContext, cz.msebera.android.httpclient.client.methods.HttpExecutionAware):cz.msebera.android.httpclient.client.methods.CloseableHttpResponse");
    }

    void establishRoute(AuthState proxyAuthState, HttpClientConnection managedConn, HttpRoute route, HttpRequest request, HttpClientContext context) throws HttpException, IOException {
        int step;
        RequestConfig config = context.getRequestConfig();
        int timeout = config.getConnectTimeout();
        RouteTracker tracker = new RouteTracker(route);
        do {
            HttpRoute fact = tracker.toRoute();
            step = this.routeDirector.nextStep(route, fact);
            switch (step) {
                case -1:
                    throw new HttpException("Unable to establish route: planned = " + route + "; current = " + fact);
                case 0:
                    this.connManager.routeComplete(managedConn, route, context);
                    break;
                case 1:
                    this.connManager.connect(managedConn, route, timeout > 0 ? timeout : 0, context);
                    tracker.connectTarget(route.isSecure());
                    break;
                case 2:
                    this.connManager.connect(managedConn, route, timeout > 0 ? timeout : 0, context);
                    HttpHost proxy = route.getProxyHost();
                    tracker.connectProxy(proxy, false);
                    break;
                case HttpRouteDirector.TUNNEL_TARGET /* 3 */:
                    boolean secure = createTunnelToTarget(proxyAuthState, managedConn, route, request, context);
                    this.log.debug("Tunnel to target created.");
                    tracker.tunnelTarget(secure);
                    break;
                case 4:
                    int hop = fact.getHopCount() - 1;
                    boolean secure2 = createTunnelToProxy(route, hop, context);
                    this.log.debug("Tunnel to proxy created.");
                    tracker.tunnelProxy(route.getHopTarget(hop), secure2);
                    break;
                case HttpRouteDirector.LAYER_PROTOCOL /* 5 */:
                    this.connManager.upgrade(managedConn, route, context);
                    tracker.layerProtocol(route.isSecure());
                    break;
                default:
                    throw new IllegalStateException("Unknown step indicator " + step + " from RouteDirector.");
            }
        } while (step > 0);
    }

    private boolean createTunnelToTarget(AuthState proxyAuthState, HttpClientConnection managedConn, HttpRoute route, HttpRequest request, HttpClientContext context) throws HttpException, IOException {
        RequestConfig config = context.getRequestConfig();
        int timeout = config.getConnectTimeout();
        HttpHost target = route.getTargetHost();
        HttpHost proxy = route.getProxyHost();
        HttpResponse response = null;
        String authority = target.toHostString();
        HttpRequest connect = new BasicHttpRequest("CONNECT", authority, request.getProtocolVersion());
        this.requestExecutor.preProcess(connect, this.proxyHttpProcessor, context);
        while (response == null) {
            if (!managedConn.isOpen()) {
                this.connManager.connect(managedConn, route, timeout > 0 ? timeout : 0, context);
            }
            connect.removeHeaders("Proxy-Authorization");
            this.authenticator.generateAuthResponse(connect, proxyAuthState, context);
            response = this.requestExecutor.execute(connect, managedConn, context);
            int status = response.getStatusLine().getStatusCode();
            if (status < 200) {
                throw new HttpException("Unexpected response to CONNECT request: " + response.getStatusLine());
            }
            if (config.isAuthenticationEnabled() && this.authenticator.isAuthenticationRequested(proxy, response, this.proxyAuthStrategy, proxyAuthState, context) && this.authenticator.handleAuthChallenge(proxy, response, this.proxyAuthStrategy, proxyAuthState, context)) {
                if (this.reuseStrategy.keepAlive(response, context)) {
                    this.log.debug("Connection kept alive");
                    EntityUtils.consume(response.getEntity());
                } else {
                    managedConn.close();
                }
                response = null;
            }
        }
        int status2 = response.getStatusLine().getStatusCode();
        if (status2 > 299) {
            HttpEntity entity = response.getEntity();
            if (entity != null) {
                response.setEntity(new BufferedHttpEntity(entity));
            }
            managedConn.close();
            throw new TunnelRefusedException("CONNECT refused by proxy: " + response.getStatusLine(), response);
        }
        return false;
    }

    private boolean createTunnelToProxy(HttpRoute route, int hop, HttpClientContext context) throws HttpException {
        throw new HttpException("Proxy chains are not supported.");
    }

    private boolean needAuthentication(AuthState targetAuthState, AuthState proxyAuthState, HttpRoute route, HttpResponse response, HttpClientContext context) {
        RequestConfig config = context.getRequestConfig();
        if (config.isAuthenticationEnabled()) {
            HttpHost target = context.getTargetHost();
            if (target == null) {
                target = route.getTargetHost();
            }
            if (target.getPort() < 0) {
                target = new HttpHost(target.getHostName(), route.getTargetHost().getPort(), target.getSchemeName());
            }
            boolean targetAuthRequested = this.authenticator.isAuthenticationRequested(target, response, this.targetAuthStrategy, targetAuthState, context);
            HttpHost proxy = route.getProxyHost();
            if (proxy == null) {
                proxy = route.getTargetHost();
            }
            boolean proxyAuthRequested = this.authenticator.isAuthenticationRequested(proxy, response, this.proxyAuthStrategy, proxyAuthState, context);
            if (targetAuthRequested) {
                return this.authenticator.handleAuthChallenge(target, response, this.targetAuthStrategy, targetAuthState, context);
            }
            if (proxyAuthRequested) {
                return this.authenticator.handleAuthChallenge(proxy, response, this.proxyAuthStrategy, proxyAuthState, context);
            }
            return false;
        }
        return false;
    }
}
