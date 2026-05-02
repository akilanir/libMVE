package cz.msebera.android.httpclient.impl.cookie;

import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.cookie.CookieSpec;
import cz.msebera.android.httpclient.cookie.CookieSpecFactory;
import cz.msebera.android.httpclient.cookie.CookieSpecProvider;
import cz.msebera.android.httpclient.cookie.params.CookieSpecPNames;
import cz.msebera.android.httpclient.params.HttpParams;
import cz.msebera.android.httpclient.protocol.HttpContext;
import java.util.Collection;

@Immutable
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/cookie/BrowserCompatSpecFactory.class */
public class BrowserCompatSpecFactory implements CookieSpecFactory, CookieSpecProvider {
    private final String[] datepatterns;
    private final SecurityLevel securityLevel;

    /* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/cookie/BrowserCompatSpecFactory$SecurityLevel.class */
    public enum SecurityLevel {
        SECURITYLEVEL_DEFAULT,
        SECURITYLEVEL_IE_MEDIUM
    }

    public BrowserCompatSpecFactory(String[] datepatterns, SecurityLevel securityLevel) {
        this.datepatterns = datepatterns;
        this.securityLevel = securityLevel;
    }

    public BrowserCompatSpecFactory(String[] datepatterns) {
        this(null, SecurityLevel.SECURITYLEVEL_DEFAULT);
    }

    public BrowserCompatSpecFactory() {
        this(null, SecurityLevel.SECURITYLEVEL_DEFAULT);
    }

    @Override // cz.msebera.android.httpclient.cookie.CookieSpecFactory
    public CookieSpec newInstance(HttpParams params) {
        if (params != null) {
            String[] patterns = null;
            Collection<?> param = (Collection) params.getParameter(CookieSpecPNames.DATE_PATTERNS);
            if (param != null) {
                String[] patterns2 = new String[param.size()];
                patterns = (String[]) param.toArray(patterns2);
            }
            return new BrowserCompatSpec(patterns, this.securityLevel);
        }
        return new BrowserCompatSpec(null, this.securityLevel);
    }

    @Override // cz.msebera.android.httpclient.cookie.CookieSpecProvider
    public CookieSpec create(HttpContext context) {
        return new BrowserCompatSpec(this.datepatterns);
    }
}
