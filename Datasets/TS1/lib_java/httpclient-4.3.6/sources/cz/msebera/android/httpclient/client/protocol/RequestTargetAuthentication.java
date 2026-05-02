package cz.msebera.android.httpclient.client.protocol;

import cz.msebera.android.httpclient.HttpException;
import cz.msebera.android.httpclient.HttpRequest;
import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.auth.AuthState;
import cz.msebera.android.httpclient.protocol.HttpContext;
import cz.msebera.android.httpclient.util.Args;
import java.io.IOException;

@Immutable
@Deprecated
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/client/protocol/RequestTargetAuthentication.class */
public class RequestTargetAuthentication extends RequestAuthenticationBase {
    @Override // cz.msebera.android.httpclient.HttpRequestInterceptor
    public void process(HttpRequest request, HttpContext context) throws HttpException, IOException {
        Args.notNull(request, "HTTP request");
        Args.notNull(context, "HTTP context");
        String method = request.getRequestLine().getMethod();
        if (method.equalsIgnoreCase("CONNECT") || request.containsHeader("Authorization")) {
            return;
        }
        AuthState authState = (AuthState) context.getAttribute("http.auth.target-scope");
        if (authState == null) {
            this.log.debug("Target auth state not set in the context");
            return;
        }
        if (this.log.isDebugEnabled()) {
            this.log.debug("Target auth state: " + authState.getState());
        }
        process(authState, request, context);
    }
}
