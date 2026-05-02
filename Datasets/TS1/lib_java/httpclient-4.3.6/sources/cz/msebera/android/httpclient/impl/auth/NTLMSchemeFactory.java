package cz.msebera.android.httpclient.impl.auth;

import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.auth.AuthScheme;
import cz.msebera.android.httpclient.auth.AuthSchemeFactory;
import cz.msebera.android.httpclient.auth.AuthSchemeProvider;
import cz.msebera.android.httpclient.params.HttpParams;
import cz.msebera.android.httpclient.protocol.HttpContext;

@Immutable
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/auth/NTLMSchemeFactory.class */
public class NTLMSchemeFactory implements AuthSchemeFactory, AuthSchemeProvider {
    @Override // cz.msebera.android.httpclient.auth.AuthSchemeFactory
    public AuthScheme newInstance(HttpParams params) {
        return new NTLMScheme();
    }

    @Override // cz.msebera.android.httpclient.auth.AuthSchemeProvider
    public AuthScheme create(HttpContext context) {
        return new NTLMScheme();
    }
}
