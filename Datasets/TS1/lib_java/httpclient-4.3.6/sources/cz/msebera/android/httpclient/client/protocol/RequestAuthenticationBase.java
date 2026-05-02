package cz.msebera.android.httpclient.client.protocol;

import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.HttpRequest;
import cz.msebera.android.httpclient.HttpRequestInterceptor;
import cz.msebera.android.httpclient.auth.AuthOption;
import cz.msebera.android.httpclient.auth.AuthProtocolState;
import cz.msebera.android.httpclient.auth.AuthScheme;
import cz.msebera.android.httpclient.auth.AuthState;
import cz.msebera.android.httpclient.auth.AuthenticationException;
import cz.msebera.android.httpclient.auth.ContextAwareAuthScheme;
import cz.msebera.android.httpclient.auth.Credentials;
import cz.msebera.android.httpclient.conn.routing.HttpRouteDirector;
import cz.msebera.android.httpclient.extras.HttpClientAndroidLog;
import cz.msebera.android.httpclient.protocol.HttpContext;
import cz.msebera.android.httpclient.util.Asserts;
import java.util.Queue;

@Deprecated
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/client/protocol/RequestAuthenticationBase.class */
abstract class RequestAuthenticationBase implements HttpRequestInterceptor {
    final HttpClientAndroidLog log = new HttpClientAndroidLog(getClass());

    void process(AuthState authState, HttpRequest request, HttpContext context) {
        AuthScheme authScheme = authState.getAuthScheme();
        Credentials creds = authState.getCredentials();
        switch (AnonymousClass1.$SwitchMap$cz$msebera$android$httpclient$auth$AuthProtocolState[authState.getState().ordinal()]) {
            case 1:
                return;
            case 2:
                ensureAuthScheme(authScheme);
                if (authScheme.isConnectionBased()) {
                    return;
                }
                break;
            case HttpRouteDirector.TUNNEL_TARGET /* 3 */:
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
                            Header header = authenticate(authScheme2, creds2, request, context);
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
        }
        if (authScheme != null) {
            try {
                Header header2 = authenticate(authScheme, creds, request, context);
                request.addHeader(header2);
            } catch (AuthenticationException ex2) {
                if (this.log.isErrorEnabled()) {
                    this.log.error(authScheme + " authentication error: " + ex2.getMessage());
                }
            }
        }
    }

    /* renamed from: cz.msebera.android.httpclient.client.protocol.RequestAuthenticationBase$1, reason: invalid class name */
    /* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/client/protocol/RequestAuthenticationBase$1.class */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$cz$msebera$android$httpclient$auth$AuthProtocolState = new int[AuthProtocolState.values().length];

        static {
            try {
                $SwitchMap$cz$msebera$android$httpclient$auth$AuthProtocolState[AuthProtocolState.FAILURE.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$cz$msebera$android$httpclient$auth$AuthProtocolState[AuthProtocolState.SUCCESS.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$cz$msebera$android$httpclient$auth$AuthProtocolState[AuthProtocolState.CHALLENGED.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
        }
    }

    private void ensureAuthScheme(AuthScheme authScheme) {
        Asserts.notNull(authScheme, "Auth scheme");
    }

    private Header authenticate(AuthScheme authScheme, Credentials creds, HttpRequest request, HttpContext context) throws AuthenticationException {
        Asserts.notNull(authScheme, "Auth scheme");
        if (authScheme instanceof ContextAwareAuthScheme) {
            return ((ContextAwareAuthScheme) authScheme).authenticate(creds, request, context);
        }
        return authScheme.authenticate(creds, request);
    }
}
