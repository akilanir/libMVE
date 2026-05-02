package cz.msebera.android.httpclient.impl.client;

import cz.msebera.android.httpclient.ConnectionReuseStrategy;
import cz.msebera.android.httpclient.HttpEntity;
import cz.msebera.android.httpclient.HttpEntityEnclosingRequest;
import cz.msebera.android.httpclient.HttpException;
import cz.msebera.android.httpclient.HttpHost;
import cz.msebera.android.httpclient.HttpRequest;
import cz.msebera.android.httpclient.HttpResponse;
import cz.msebera.android.httpclient.ProtocolException;
import cz.msebera.android.httpclient.ProtocolVersion;
import cz.msebera.android.httpclient.annotation.NotThreadSafe;
import cz.msebera.android.httpclient.auth.AuthProtocolState;
import cz.msebera.android.httpclient.auth.AuthScheme;
import cz.msebera.android.httpclient.auth.AuthState;
import cz.msebera.android.httpclient.auth.UsernamePasswordCredentials;
import cz.msebera.android.httpclient.client.AuthenticationHandler;
import cz.msebera.android.httpclient.client.AuthenticationStrategy;
import cz.msebera.android.httpclient.client.HttpRequestRetryHandler;
import cz.msebera.android.httpclient.client.RedirectException;
import cz.msebera.android.httpclient.client.RedirectHandler;
import cz.msebera.android.httpclient.client.RedirectStrategy;
import cz.msebera.android.httpclient.client.RequestDirector;
import cz.msebera.android.httpclient.client.UserTokenHandler;
import cz.msebera.android.httpclient.client.methods.AbortableHttpRequest;
import cz.msebera.android.httpclient.client.methods.HttpUriRequest;
import cz.msebera.android.httpclient.client.params.ClientPNames;
import cz.msebera.android.httpclient.client.params.HttpClientParams;
import cz.msebera.android.httpclient.client.utils.URIUtils;
import cz.msebera.android.httpclient.conn.BasicManagedEntity;
import cz.msebera.android.httpclient.conn.ClientConnectionManager;
import cz.msebera.android.httpclient.conn.ClientConnectionRequest;
import cz.msebera.android.httpclient.conn.ConnectionKeepAliveStrategy;
import cz.msebera.android.httpclient.conn.ManagedClientConnection;
import cz.msebera.android.httpclient.conn.routing.BasicRouteDirector;
import cz.msebera.android.httpclient.conn.routing.HttpRoute;
import cz.msebera.android.httpclient.conn.routing.HttpRouteDirector;
import cz.msebera.android.httpclient.conn.routing.HttpRoutePlanner;
import cz.msebera.android.httpclient.conn.scheme.Scheme;
import cz.msebera.android.httpclient.entity.BufferedHttpEntity;
import cz.msebera.android.httpclient.extras.HttpClientAndroidLog;
import cz.msebera.android.httpclient.impl.auth.BasicScheme;
import cz.msebera.android.httpclient.impl.conn.ConnectionShutdownException;
import cz.msebera.android.httpclient.message.BasicHttpRequest;
import cz.msebera.android.httpclient.params.HttpConnectionParams;
import cz.msebera.android.httpclient.params.HttpParams;
import cz.msebera.android.httpclient.params.HttpProtocolParams;
import cz.msebera.android.httpclient.protocol.ExecutionContext;
import cz.msebera.android.httpclient.protocol.HttpContext;
import cz.msebera.android.httpclient.protocol.HttpProcessor;
import cz.msebera.android.httpclient.protocol.HttpRequestExecutor;
import cz.msebera.android.httpclient.util.Args;
import cz.msebera.android.httpclient.util.EntityUtils;
import java.io.IOException;
import java.io.InterruptedIOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.concurrent.TimeUnit;

@NotThreadSafe
@Deprecated
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/client/DefaultRequestDirector.class */
public class DefaultRequestDirector implements RequestDirector {
    public HttpClientAndroidLog log;
    protected final ClientConnectionManager connManager;
    protected final HttpRoutePlanner routePlanner;
    protected final ConnectionReuseStrategy reuseStrategy;
    protected final ConnectionKeepAliveStrategy keepAliveStrategy;
    protected final HttpRequestExecutor requestExec;
    protected final HttpProcessor httpProcessor;
    protected final HttpRequestRetryHandler retryHandler;

    @Deprecated
    protected final RedirectHandler redirectHandler;
    protected final RedirectStrategy redirectStrategy;

    @Deprecated
    protected final AuthenticationHandler targetAuthHandler;
    protected final AuthenticationStrategy targetAuthStrategy;

    @Deprecated
    protected final AuthenticationHandler proxyAuthHandler;
    protected final AuthenticationStrategy proxyAuthStrategy;
    protected final UserTokenHandler userTokenHandler;
    protected final HttpParams params;
    protected ManagedClientConnection managedConn;
    protected final AuthState targetAuthState;
    protected final AuthState proxyAuthState;
    private final HttpAuthenticator authenticator;
    private int execCount;
    private int redirectCount;
    private final int maxRedirects;
    private HttpHost virtualHost;

    @Deprecated
    public DefaultRequestDirector(HttpRequestExecutor requestExec, ClientConnectionManager conman, ConnectionReuseStrategy reustrat, ConnectionKeepAliveStrategy kastrat, HttpRoutePlanner rouplan, HttpProcessor httpProcessor, HttpRequestRetryHandler retryHandler, RedirectHandler redirectHandler, AuthenticationHandler targetAuthHandler, AuthenticationHandler proxyAuthHandler, UserTokenHandler userTokenHandler, HttpParams params) {
        this(new HttpClientAndroidLog(DefaultRequestDirector.class), requestExec, conman, reustrat, kastrat, rouplan, httpProcessor, retryHandler, new DefaultRedirectStrategyAdaptor(redirectHandler), new AuthenticationStrategyAdaptor(targetAuthHandler), new AuthenticationStrategyAdaptor(proxyAuthHandler), userTokenHandler, params);
    }

    @Deprecated
    public DefaultRequestDirector(HttpClientAndroidLog log, HttpRequestExecutor requestExec, ClientConnectionManager conman, ConnectionReuseStrategy reustrat, ConnectionKeepAliveStrategy kastrat, HttpRoutePlanner rouplan, HttpProcessor httpProcessor, HttpRequestRetryHandler retryHandler, RedirectStrategy redirectStrategy, AuthenticationHandler targetAuthHandler, AuthenticationHandler proxyAuthHandler, UserTokenHandler userTokenHandler, HttpParams params) {
        this(new HttpClientAndroidLog(DefaultRequestDirector.class), requestExec, conman, reustrat, kastrat, rouplan, httpProcessor, retryHandler, redirectStrategy, new AuthenticationStrategyAdaptor(targetAuthHandler), new AuthenticationStrategyAdaptor(proxyAuthHandler), userTokenHandler, params);
    }

    public DefaultRequestDirector(HttpClientAndroidLog log, HttpRequestExecutor requestExec, ClientConnectionManager conman, ConnectionReuseStrategy reustrat, ConnectionKeepAliveStrategy kastrat, HttpRoutePlanner rouplan, HttpProcessor httpProcessor, HttpRequestRetryHandler retryHandler, RedirectStrategy redirectStrategy, AuthenticationStrategy targetAuthStrategy, AuthenticationStrategy proxyAuthStrategy, UserTokenHandler userTokenHandler, HttpParams params) {
        Args.notNull(log, "Log");
        Args.notNull(requestExec, "Request executor");
        Args.notNull(conman, "Client connection manager");
        Args.notNull(reustrat, "Connection reuse strategy");
        Args.notNull(kastrat, "Connection keep alive strategy");
        Args.notNull(rouplan, "Route planner");
        Args.notNull(httpProcessor, "HTTP protocol processor");
        Args.notNull(retryHandler, "HTTP request retry handler");
        Args.notNull(redirectStrategy, "Redirect strategy");
        Args.notNull(targetAuthStrategy, "Target authentication strategy");
        Args.notNull(proxyAuthStrategy, "Proxy authentication strategy");
        Args.notNull(userTokenHandler, "User token handler");
        Args.notNull(params, "HTTP parameters");
        this.log = log;
        this.authenticator = new HttpAuthenticator(log);
        this.requestExec = requestExec;
        this.connManager = conman;
        this.reuseStrategy = reustrat;
        this.keepAliveStrategy = kastrat;
        this.routePlanner = rouplan;
        this.httpProcessor = httpProcessor;
        this.retryHandler = retryHandler;
        this.redirectStrategy = redirectStrategy;
        this.targetAuthStrategy = targetAuthStrategy;
        this.proxyAuthStrategy = proxyAuthStrategy;
        this.userTokenHandler = userTokenHandler;
        this.params = params;
        if (redirectStrategy instanceof DefaultRedirectStrategyAdaptor) {
            this.redirectHandler = ((DefaultRedirectStrategyAdaptor) redirectStrategy).getHandler();
        } else {
            this.redirectHandler = null;
        }
        if (targetAuthStrategy instanceof AuthenticationStrategyAdaptor) {
            this.targetAuthHandler = ((AuthenticationStrategyAdaptor) targetAuthStrategy).getHandler();
        } else {
            this.targetAuthHandler = null;
        }
        if (proxyAuthStrategy instanceof AuthenticationStrategyAdaptor) {
            this.proxyAuthHandler = ((AuthenticationStrategyAdaptor) proxyAuthStrategy).getHandler();
        } else {
            this.proxyAuthHandler = null;
        }
        this.managedConn = null;
        this.execCount = 0;
        this.redirectCount = 0;
        this.targetAuthState = new AuthState();
        this.proxyAuthState = new AuthState();
        this.maxRedirects = this.params.getIntParameter(ClientPNames.MAX_REDIRECTS, 100);
    }

    private RequestWrapper wrapRequest(HttpRequest request) throws ProtocolException {
        if (request instanceof HttpEntityEnclosingRequest) {
            return new EntityEnclosingRequestWrapper((HttpEntityEnclosingRequest) request);
        }
        return new RequestWrapper(request);
    }

    protected void rewriteRequestURI(RequestWrapper request, HttpRoute route) throws ProtocolException {
        URI uri;
        try {
            URI uri2 = request.getURI();
            if (route.getProxyHost() != null && !route.isTunnelled()) {
                if (!uri2.isAbsolute()) {
                    HttpHost target = route.getTargetHost();
                    uri = URIUtils.rewriteURI(uri2, target, true);
                } else {
                    uri = URIUtils.rewriteURI(uri2);
                }
            } else if (uri2.isAbsolute()) {
                uri = URIUtils.rewriteURI(uri2, null, true);
            } else {
                uri = URIUtils.rewriteURI(uri2);
            }
            request.setURI(uri);
        } catch (URISyntaxException ex) {
            throw new ProtocolException("Invalid URI: " + request.getRequestLine().getUri(), ex);
        }
    }

    @Override // cz.msebera.android.httpclient.client.RequestDirector
    public HttpResponse execute(HttpHost targetHost, HttpRequest request, HttpContext context) throws HttpException, IOException {
        String s;
        context.setAttribute("http.auth.target-scope", this.targetAuthState);
        context.setAttribute("http.auth.proxy-scope", this.proxyAuthState);
        HttpHost target = targetHost;
        RequestWrapper origWrapper = wrapRequest(request);
        origWrapper.setParams(this.params);
        HttpRoute origRoute = determineRoute(target, origWrapper, context);
        this.virtualHost = (HttpHost) origWrapper.getParams().getParameter(ClientPNames.VIRTUAL_HOST);
        if (this.virtualHost != null && this.virtualHost.getPort() == -1) {
            HttpHost host = target != null ? target : origRoute.getTargetHost();
            int port = host.getPort();
            if (port != -1) {
                this.virtualHost = new HttpHost(this.virtualHost.getHostName(), port, this.virtualHost.getSchemeName());
            }
        }
        RoutedRequest roureq = new RoutedRequest(origWrapper, origRoute);
        boolean reuse = false;
        boolean done = false;
        HttpResponse response = null;
        while (!done) {
            try {
                RequestWrapper wrapper = roureq.getRequest();
                HttpRoute route = roureq.getRoute();
                Object userToken = context.getAttribute("http.user-token");
                if (this.managedConn == null) {
                    ClientConnectionRequest connRequest = this.connManager.requestConnection(route, userToken);
                    if (request instanceof AbortableHttpRequest) {
                        ((AbortableHttpRequest) request).setConnectionRequest(connRequest);
                    }
                    long timeout = HttpClientParams.getConnectionManagerTimeout(this.params);
                    try {
                        this.managedConn = connRequest.getConnection(timeout, TimeUnit.MILLISECONDS);
                        if (HttpConnectionParams.isStaleCheckingEnabled(this.params) && this.managedConn.isOpen()) {
                            this.log.debug("Stale connection check");
                            if (this.managedConn.isStale()) {
                                this.log.debug("Stale connection detected");
                                this.managedConn.close();
                            }
                        }
                    } catch (InterruptedException e) {
                        Thread.currentThread().interrupt();
                        throw new InterruptedIOException();
                    }
                }
                if (request instanceof AbortableHttpRequest) {
                    ((AbortableHttpRequest) request).setReleaseTrigger(this.managedConn);
                }
                try {
                    tryConnect(roureq, context);
                    String userinfo = wrapper.getURI().getUserInfo();
                    if (userinfo != null) {
                        this.targetAuthState.update(new BasicScheme(), new UsernamePasswordCredentials(userinfo));
                    }
                    if (this.virtualHost != null) {
                        target = this.virtualHost;
                    } else {
                        URI requestURI = wrapper.getURI();
                        if (requestURI.isAbsolute()) {
                            target = URIUtils.extractHost(requestURI);
                        }
                    }
                    if (target == null) {
                        target = route.getTargetHost();
                    }
                    wrapper.resetHeaders();
                    rewriteRequestURI(wrapper, route);
                    context.setAttribute("http.target_host", target);
                    context.setAttribute("http.route", route);
                    context.setAttribute("http.connection", this.managedConn);
                    this.requestExec.preProcess(wrapper, this.httpProcessor, context);
                    response = tryExecute(roureq, context);
                    if (response != null) {
                        response.setParams(this.params);
                        this.requestExec.postProcess(response, this.httpProcessor, context);
                        reuse = this.reuseStrategy.keepAlive(response, context);
                        if (reuse) {
                            long duration = this.keepAliveStrategy.getKeepAliveDuration(response, context);
                            if (this.log.isDebugEnabled()) {
                                if (duration > 0) {
                                    s = "for " + duration + " " + TimeUnit.MILLISECONDS;
                                } else {
                                    s = "indefinitely";
                                }
                                this.log.debug("Connection can be kept alive " + s);
                            }
                            this.managedConn.setIdleDuration(duration, TimeUnit.MILLISECONDS);
                        }
                        RoutedRequest followup = handleResponse(roureq, response, context);
                        if (followup == null) {
                            done = true;
                        } else {
                            if (reuse) {
                                HttpEntity entity = response.getEntity();
                                EntityUtils.consume(entity);
                                this.managedConn.markReusable();
                            } else {
                                this.managedConn.close();
                                if (this.proxyAuthState.getState().compareTo(AuthProtocolState.CHALLENGED) > 0 && this.proxyAuthState.getAuthScheme() != null && this.proxyAuthState.getAuthScheme().isConnectionBased()) {
                                    this.log.debug("Resetting proxy auth state");
                                    this.proxyAuthState.reset();
                                }
                                if (this.targetAuthState.getState().compareTo(AuthProtocolState.CHALLENGED) > 0 && this.targetAuthState.getAuthScheme() != null && this.targetAuthState.getAuthScheme().isConnectionBased()) {
                                    this.log.debug("Resetting target auth state");
                                    this.targetAuthState.reset();
                                }
                            }
                            if (!followup.getRoute().equals(roureq.getRoute())) {
                                releaseConnection();
                            }
                            roureq = followup;
                        }
                        if (this.managedConn != null) {
                            if (userToken == null) {
                                userToken = this.userTokenHandler.getUserToken(context);
                                context.setAttribute("http.user-token", userToken);
                            }
                            if (userToken != null) {
                                this.managedConn.setState(userToken);
                            }
                        }
                    }
                } catch (TunnelRefusedException ex) {
                    if (this.log.isDebugEnabled()) {
                        this.log.debug(ex.getMessage());
                    }
                    response = ex.getResponse();
                }
            } catch (HttpException ex2) {
                abortConnection();
                throw ex2;
            } catch (ConnectionShutdownException ex3) {
                InterruptedIOException ioex = new InterruptedIOException("Connection has been shut down");
                ioex.initCause(ex3);
                throw ioex;
            } catch (IOException ex4) {
                abortConnection();
                throw ex4;
            } catch (RuntimeException ex5) {
                abortConnection();
                throw ex5;
            }
        }
        if (response == null || response.getEntity() == null || !response.getEntity().isStreaming()) {
            if (reuse) {
                this.managedConn.markReusable();
            }
            releaseConnection();
        } else {
            HttpEntity entity2 = response.getEntity();
            response.setEntity(new BasicManagedEntity(entity2, this.managedConn, reuse));
        }
        return response;
    }

    private void tryConnect(RoutedRequest req, HttpContext context) throws HttpException, IOException {
        HttpRoute route = req.getRoute();
        HttpRequest wrapper = req.getRequest();
        int connectCount = 0;
        while (true) {
            context.setAttribute("http.request", wrapper);
            connectCount++;
            try {
                if (!this.managedConn.isOpen()) {
                    this.managedConn.open(route, context, this.params);
                } else {
                    this.managedConn.setSocketTimeout(HttpConnectionParams.getSoTimeout(this.params));
                }
                establishRoute(route, context);
                return;
            } catch (IOException ex) {
                try {
                    this.managedConn.close();
                } catch (IOException e) {
                }
                if (this.retryHandler.retryRequest(ex, connectCount, context)) {
                    if (this.log.isInfoEnabled()) {
                        this.log.info("I/O exception (" + ex.getClass().getName() + ") caught when connecting to " + route + ": " + ex.getMessage());
                        if (this.log.isDebugEnabled()) {
                            this.log.debug(ex.getMessage(), ex);
                        }
                        this.log.info("Retrying connect to " + route);
                    }
                } else {
                    throw ex;
                }
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:19:0x0090 A[Catch: IOException -> 0x00c4, TryCatch #0 {IOException -> 0x00c4, blocks: (B:11:0x004a, B:13:0x0056, B:15:0x005e, B:16:0x007a, B:17:0x0086, B:19:0x0090, B:20:0x00b2), top: B:46:0x004a }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private cz.msebera.android.httpclient.HttpResponse tryExecute(cz.msebera.android.httpclient.impl.client.RoutedRequest r6, cz.msebera.android.httpclient.protocol.HttpContext r7) throws cz.msebera.android.httpclient.HttpException, java.io.IOException {
        /*
            Method dump skipped, instructions count: 439
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: cz.msebera.android.httpclient.impl.client.DefaultRequestDirector.tryExecute(cz.msebera.android.httpclient.impl.client.RoutedRequest, cz.msebera.android.httpclient.protocol.HttpContext):cz.msebera.android.httpclient.HttpResponse");
    }

    protected void releaseConnection() {
        try {
            this.managedConn.releaseConnection();
        } catch (IOException ignored) {
            this.log.debug("IOException releasing connection", ignored);
        }
        this.managedConn = null;
    }

    protected HttpRoute determineRoute(HttpHost targetHost, HttpRequest request, HttpContext context) throws HttpException {
        return this.routePlanner.determineRoute(targetHost != null ? targetHost : (HttpHost) request.getParams().getParameter(ClientPNames.DEFAULT_HOST), request, context);
    }

    protected void establishRoute(HttpRoute route, HttpContext context) throws HttpException, IOException {
        int step;
        HttpRouteDirector rowdy = new BasicRouteDirector();
        do {
            HttpRoute fact = this.managedConn.getRoute();
            step = rowdy.nextStep(route, fact);
            switch (step) {
                case -1:
                    throw new HttpException("Unable to establish route: planned = " + route + "; current = " + fact);
                case 0:
                    break;
                case 1:
                case 2:
                    this.managedConn.open(route, context, this.params);
                    break;
                case HttpRouteDirector.TUNNEL_TARGET /* 3 */:
                    boolean secure = createTunnelToTarget(route, context);
                    this.log.debug("Tunnel to target created.");
                    this.managedConn.tunnelTarget(secure, this.params);
                    break;
                case 4:
                    int hop = fact.getHopCount() - 1;
                    boolean secure2 = createTunnelToProxy(route, hop, context);
                    this.log.debug("Tunnel to proxy created.");
                    this.managedConn.tunnelProxy(route.getHopTarget(hop), secure2, this.params);
                    break;
                case HttpRouteDirector.LAYER_PROTOCOL /* 5 */:
                    this.managedConn.layerProtocol(context, this.params);
                    break;
                default:
                    throw new IllegalStateException("Unknown step indicator " + step + " from RouteDirector.");
            }
        } while (step > 0);
    }

    protected boolean createTunnelToTarget(HttpRoute route, HttpContext context) throws HttpException, IOException {
        HttpResponse response;
        HttpHost proxy = route.getProxyHost();
        HttpHost target = route.getTargetHost();
        while (true) {
            if (!this.managedConn.isOpen()) {
                this.managedConn.open(route, context, this.params);
            }
            HttpRequest connect = createConnectRequest(route, context);
            connect.setParams(this.params);
            context.setAttribute("http.target_host", target);
            context.setAttribute("http.route", route);
            context.setAttribute(ExecutionContext.HTTP_PROXY_HOST, proxy);
            context.setAttribute("http.connection", this.managedConn);
            context.setAttribute("http.request", connect);
            this.requestExec.preProcess(connect, this.httpProcessor, context);
            response = this.requestExec.execute(connect, this.managedConn, context);
            response.setParams(this.params);
            this.requestExec.postProcess(response, this.httpProcessor, context);
            int status = response.getStatusLine().getStatusCode();
            if (status < 200) {
                throw new HttpException("Unexpected response to CONNECT request: " + response.getStatusLine());
            }
            if (HttpClientParams.isAuthenticating(this.params)) {
                if (!this.authenticator.isAuthenticationRequested(proxy, response, this.proxyAuthStrategy, this.proxyAuthState, context) || !this.authenticator.authenticate(proxy, response, this.proxyAuthStrategy, this.proxyAuthState, context)) {
                    break;
                }
                if (this.reuseStrategy.keepAlive(response, context)) {
                    this.log.debug("Connection kept alive");
                    EntityUtils.consume(response.getEntity());
                } else {
                    this.managedConn.close();
                }
            }
        }
        int status2 = response.getStatusLine().getStatusCode();
        if (status2 > 299) {
            HttpEntity entity = response.getEntity();
            if (entity != null) {
                response.setEntity(new BufferedHttpEntity(entity));
            }
            this.managedConn.close();
            throw new TunnelRefusedException("CONNECT refused by proxy: " + response.getStatusLine(), response);
        }
        this.managedConn.markReusable();
        return false;
    }

    protected boolean createTunnelToProxy(HttpRoute route, int hop, HttpContext context) throws HttpException, IOException {
        throw new HttpException("Proxy chains are not supported.");
    }

    protected HttpRequest createConnectRequest(HttpRoute route, HttpContext context) {
        HttpHost target = route.getTargetHost();
        String host = target.getHostName();
        int port = target.getPort();
        if (port < 0) {
            Scheme scheme = this.connManager.getSchemeRegistry().getScheme(target.getSchemeName());
            port = scheme.getDefaultPort();
        }
        StringBuilder buffer = new StringBuilder(host.length() + 6);
        buffer.append(host);
        buffer.append(':');
        buffer.append(Integer.toString(port));
        String authority = buffer.toString();
        ProtocolVersion ver = HttpProtocolParams.getVersion(this.params);
        HttpRequest req = new BasicHttpRequest("CONNECT", authority, ver);
        return req;
    }

    protected RoutedRequest handleResponse(RoutedRequest roureq, HttpResponse response, HttpContext context) throws HttpException, IOException {
        HttpRoute route = roureq.getRoute();
        RequestWrapper request = roureq.getRequest();
        HttpParams params = request.getParams();
        if (HttpClientParams.isAuthenticating(params)) {
            HttpHost target = (HttpHost) context.getAttribute("http.target_host");
            if (target == null) {
                target = route.getTargetHost();
            }
            if (target.getPort() < 0) {
                Scheme scheme = this.connManager.getSchemeRegistry().getScheme(target);
                target = new HttpHost(target.getHostName(), scheme.getDefaultPort(), target.getSchemeName());
            }
            boolean targetAuthRequested = this.authenticator.isAuthenticationRequested(target, response, this.targetAuthStrategy, this.targetAuthState, context);
            HttpHost proxy = route.getProxyHost();
            if (proxy == null) {
                proxy = route.getTargetHost();
            }
            boolean proxyAuthRequested = this.authenticator.isAuthenticationRequested(proxy, response, this.proxyAuthStrategy, this.proxyAuthState, context);
            if (targetAuthRequested && this.authenticator.authenticate(target, response, this.targetAuthStrategy, this.targetAuthState, context)) {
                return roureq;
            }
            if (proxyAuthRequested && this.authenticator.authenticate(proxy, response, this.proxyAuthStrategy, this.proxyAuthState, context)) {
                return roureq;
            }
        }
        if (HttpClientParams.isRedirecting(params) && this.redirectStrategy.isRedirected(request, response, context)) {
            if (this.redirectCount >= this.maxRedirects) {
                throw new RedirectException("Maximum redirects (" + this.maxRedirects + ") exceeded");
            }
            this.redirectCount++;
            this.virtualHost = null;
            HttpUriRequest redirect = this.redirectStrategy.getRedirect(request, response, context);
            HttpRequest orig = request.getOriginal();
            redirect.setHeaders(orig.getAllHeaders());
            URI uri = redirect.getURI();
            HttpHost newTarget = URIUtils.extractHost(uri);
            if (newTarget == null) {
                throw new ProtocolException("Redirect URI does not specify a valid host name: " + uri);
            }
            if (!route.getTargetHost().equals(newTarget)) {
                this.log.debug("Resetting target auth state");
                this.targetAuthState.reset();
                AuthScheme authScheme = this.proxyAuthState.getAuthScheme();
                if (authScheme != null && authScheme.isConnectionBased()) {
                    this.log.debug("Resetting proxy auth state");
                    this.proxyAuthState.reset();
                }
            }
            RequestWrapper wrapper = wrapRequest(redirect);
            wrapper.setParams(params);
            HttpRoute newRoute = determineRoute(newTarget, wrapper, context);
            RoutedRequest newRequest = new RoutedRequest(wrapper, newRoute);
            if (this.log.isDebugEnabled()) {
                this.log.debug("Redirecting to '" + uri + "' via " + newRoute);
            }
            return newRequest;
        }
        return null;
    }

    private void abortConnection() {
        ManagedClientConnection mcc = this.managedConn;
        if (mcc != null) {
            this.managedConn = null;
            try {
                mcc.abortConnection();
            } catch (IOException ex) {
                if (this.log.isDebugEnabled()) {
                    this.log.debug(ex.getMessage(), ex);
                }
            }
            try {
                mcc.releaseConnection();
            } catch (IOException ignored) {
                this.log.debug("Error releasing connection", ignored);
            }
        }
    }
}
