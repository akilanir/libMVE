package cz.msebera.android.httpclient.impl.auth;

import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.HttpException;
import cz.msebera.android.httpclient.HttpHost;
import cz.msebera.android.httpclient.HttpRequest;
import cz.msebera.android.httpclient.HttpResponse;
import cz.msebera.android.httpclient.auth.AuthOption;
import cz.msebera.android.httpclient.auth.AuthProtocolState;
import cz.msebera.android.httpclient.auth.AuthScheme;
import cz.msebera.android.httpclient.auth.AuthState;
import cz.msebera.android.httpclient.auth.AuthenticationException;
import cz.msebera.android.httpclient.auth.ContextAwareAuthScheme;
import cz.msebera.android.httpclient.auth.Credentials;
import cz.msebera.android.httpclient.client.AuthenticationStrategy;
import cz.msebera.android.httpclient.conn.routing.HttpRouteDirector;
import cz.msebera.android.httpclient.extras.HttpClientAndroidLog;
import cz.msebera.android.httpclient.protocol.HttpContext;
import cz.msebera.android.httpclient.util.Asserts;
import java.io.IOException;
import java.util.Queue;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/auth/HttpAuthenticator.class */
public class HttpAuthenticator {
    public HttpClientAndroidLog log;

    public HttpAuthenticator(HttpClientAndroidLog log) {
        this.log = log != null ? log : new HttpClientAndroidLog(getClass());
    }

    public HttpAuthenticator() {
        this(null);
    }

    public boolean isAuthenticationRequested(HttpHost host, HttpResponse response, AuthenticationStrategy authStrategy, AuthState authState, HttpContext context) {
        if (authStrategy.isAuthenticationRequested(host, response, context)) {
            this.log.debug("Authentication required");
            if (authState.getState() == AuthProtocolState.SUCCESS) {
                authStrategy.authFailed(host, authState.getAuthScheme(), context);
                return true;
            }
            return true;
        }
        switch (AnonymousClass1.$SwitchMap$cz$msebera$android$httpclient$auth$AuthProtocolState[authState.getState().ordinal()]) {
            case 1:
            case 2:
                this.log.debug("Authentication succeeded");
                authState.setState(AuthProtocolState.SUCCESS);
                authStrategy.authSucceeded(host, authState.getAuthScheme(), context);
                return false;
            case HttpRouteDirector.TUNNEL_TARGET /* 3 */:
                return false;
            default:
                authState.setState(AuthProtocolState.UNCHALLENGED);
                return false;
        }
    }

    /* renamed from: cz.msebera.android.httpclient.impl.auth.HttpAuthenticator$1, reason: invalid class name */
    /* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/auth/HttpAuthenticator$1.class */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$cz$msebera$android$httpclient$auth$AuthProtocolState = new int[AuthProtocolState.values().length];

        static {
            try {
                $SwitchMap$cz$msebera$android$httpclient$auth$AuthProtocolState[AuthProtocolState.CHALLENGED.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$cz$msebera$android$httpclient$auth$AuthProtocolState[AuthProtocolState.HANDSHAKE.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$cz$msebera$android$httpclient$auth$AuthProtocolState[AuthProtocolState.SUCCESS.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$cz$msebera$android$httpclient$auth$AuthProtocolState[AuthProtocolState.FAILURE.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                $SwitchMap$cz$msebera$android$httpclient$auth$AuthProtocolState[AuthProtocolState.UNCHALLENGED.ordinal()] = 5;
            } catch (NoSuchFieldError e5) {
            }
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:20:0x00b2 A[Catch: MalformedChallengeException -> 0x017a, TryCatch #0 {MalformedChallengeException -> 0x017a, blocks: (B:2:0x0000, B:4:0x000a, B:5:0x0027, B:7:0x003d, B:9:0x0048, B:10:0x005b, B:13:0x007e, B:16:0x008b, B:20:0x00b2, B:22:0x00d4, B:24:0x00f0, B:26:0x0116, B:28:0x0120, B:29:0x0125, B:31:0x0138, B:33:0x0142, B:35:0x014c, B:36:0x0167), top: B:46:0x0000 }] */
    /* JADX WARN: Removed duplicated region for block: B:31:0x0138 A[Catch: MalformedChallengeException -> 0x017a, TryCatch #0 {MalformedChallengeException -> 0x017a, blocks: (B:2:0x0000, B:4:0x000a, B:5:0x0027, B:7:0x003d, B:9:0x0048, B:10:0x005b, B:13:0x007e, B:16:0x008b, B:20:0x00b2, B:22:0x00d4, B:24:0x00f0, B:26:0x0116, B:28:0x0120, B:29:0x0125, B:31:0x0138, B:33:0x0142, B:35:0x014c, B:36:0x0167), top: B:46:0x0000 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public boolean handleAuthChallenge(cz.msebera.android.httpclient.HttpHost r7, cz.msebera.android.httpclient.HttpResponse r8, cz.msebera.android.httpclient.client.AuthenticationStrategy r9, cz.msebera.android.httpclient.auth.AuthState r10, cz.msebera.android.httpclient.protocol.HttpContext r11) {
        /*
            Method dump skipped, instructions count: 427
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: cz.msebera.android.httpclient.impl.auth.HttpAuthenticator.handleAuthChallenge(cz.msebera.android.httpclient.HttpHost, cz.msebera.android.httpclient.HttpResponse, cz.msebera.android.httpclient.client.AuthenticationStrategy, cz.msebera.android.httpclient.auth.AuthState, cz.msebera.android.httpclient.protocol.HttpContext):boolean");
    }

    public void generateAuthResponse(HttpRequest request, AuthState authState, HttpContext context) throws HttpException, IOException {
        AuthScheme authScheme = authState.getAuthScheme();
        Credentials creds = authState.getCredentials();
        switch (AnonymousClass1.$SwitchMap$cz$msebera$android$httpclient$auth$AuthProtocolState[authState.getState().ordinal()]) {
            case 1:
                Queue<AuthOption> authOptions = authState.getAuthOptions();
                if (authOptions != null) {
                    while (!authOptions.isEmpty()) {
                        AuthOption authOption = authOptions.remove();
                        AuthScheme authScheme2 = authOption.getAuthScheme();
                        Credentials creds2 = authOption.getCredentials();
                        authState.update(authScheme2, creds2);
                        if (this.log.isDebugEnabled()) {
                            this.log.debug("Generating response to an authentication challenge using " + authScheme2.getSchemeName() + " scheme");
                        }
                        try {
                            Header header = doAuth(authScheme2, creds2, request, context);
                            request.addHeader(header);
                            return;
                        } catch (AuthenticationException ex) {
                            if (this.log.isWarnEnabled()) {
                                this.log.warn(authScheme2 + " authentication error: " + ex.getMessage());
                            }
                        }
                    }
                    return;
                }
                ensureAuthScheme(authScheme);
                break;
            case HttpRouteDirector.TUNNEL_TARGET /* 3 */:
                ensureAuthScheme(authScheme);
                if (authScheme.isConnectionBased()) {
                    return;
                }
                break;
            case 4:
                return;
        }
        if (authScheme != null) {
            try {
                Header header2 = doAuth(authScheme, creds, request, context);
                request.addHeader(header2);
            } catch (AuthenticationException ex2) {
                if (this.log.isErrorEnabled()) {
                    this.log.error(authScheme + " authentication error: " + ex2.getMessage());
                }
            }
        }
    }

    private void ensureAuthScheme(AuthScheme authScheme) {
        Asserts.notNull(authScheme, "Auth scheme");
    }

    private Header doAuth(AuthScheme authScheme, Credentials creds, HttpRequest request, HttpContext context) throws AuthenticationException {
        if (authScheme instanceof ContextAwareAuthScheme) {
            return ((ContextAwareAuthScheme) authScheme).authenticate(creds, request, context);
        }
        return authScheme.authenticate(creds, request);
    }
}
