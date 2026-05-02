package cz.msebera.android.httpclient.impl.client;

import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.HttpResponse;
import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.auth.MalformedChallengeException;
import cz.msebera.android.httpclient.auth.params.AuthPNames;
import cz.msebera.android.httpclient.protocol.HttpContext;
import cz.msebera.android.httpclient.util.Args;
import java.util.List;
import java.util.Map;

@Immutable
@Deprecated
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/client/DefaultTargetAuthenticationHandler.class */
public class DefaultTargetAuthenticationHandler extends AbstractAuthenticationHandler {
    @Override // cz.msebera.android.httpclient.client.AuthenticationHandler
    public boolean isAuthenticationRequested(HttpResponse response, HttpContext context) {
        Args.notNull(response, "HTTP response");
        int status = response.getStatusLine().getStatusCode();
        return status == 401;
    }

    @Override // cz.msebera.android.httpclient.client.AuthenticationHandler
    public Map<String, Header> getChallenges(HttpResponse response, HttpContext context) throws MalformedChallengeException {
        Args.notNull(response, "HTTP response");
        Header[] headers = response.getHeaders("WWW-Authenticate");
        return parseChallenges(headers);
    }

    @Override // cz.msebera.android.httpclient.impl.client.AbstractAuthenticationHandler
    protected List<String> getAuthPreferences(HttpResponse response, HttpContext context) {
        List<String> authpref = (List) response.getParams().getParameter(AuthPNames.TARGET_AUTH_PREF);
        if (authpref != null) {
            return authpref;
        }
        return super.getAuthPreferences(response, context);
    }
}
