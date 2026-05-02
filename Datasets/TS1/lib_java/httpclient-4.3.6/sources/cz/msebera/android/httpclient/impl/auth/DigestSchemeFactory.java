package cz.msebera.android.httpclient.impl.auth;

import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.auth.AuthScheme;
import cz.msebera.android.httpclient.auth.AuthSchemeFactory;
import cz.msebera.android.httpclient.auth.AuthSchemeProvider;
import cz.msebera.android.httpclient.params.HttpParams;
import cz.msebera.android.httpclient.protocol.HttpContext;
import java.nio.charset.Charset;

@Immutable
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/auth/DigestSchemeFactory.class */
public class DigestSchemeFactory implements AuthSchemeFactory, AuthSchemeProvider {
    private final Charset charset;

    public DigestSchemeFactory(Charset charset) {
        this.charset = charset;
    }

    public DigestSchemeFactory() {
        this(null);
    }

    @Override // cz.msebera.android.httpclient.auth.AuthSchemeFactory
    public AuthScheme newInstance(HttpParams params) {
        return new DigestScheme();
    }

    @Override // cz.msebera.android.httpclient.auth.AuthSchemeProvider
    public AuthScheme create(HttpContext context) {
        return new DigestScheme(this.charset);
    }
}
