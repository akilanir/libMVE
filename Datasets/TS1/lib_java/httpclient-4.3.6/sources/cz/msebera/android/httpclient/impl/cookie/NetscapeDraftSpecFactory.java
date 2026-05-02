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
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/cookie/NetscapeDraftSpecFactory.class */
public class NetscapeDraftSpecFactory implements CookieSpecFactory, CookieSpecProvider {
    private final String[] datepatterns;

    public NetscapeDraftSpecFactory(String[] datepatterns) {
        this.datepatterns = datepatterns;
    }

    public NetscapeDraftSpecFactory() {
        this(null);
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
            return new NetscapeDraftSpec(patterns);
        }
        return new NetscapeDraftSpec();
    }

    @Override // cz.msebera.android.httpclient.cookie.CookieSpecProvider
    public CookieSpec create(HttpContext context) {
        return new NetscapeDraftSpec(this.datepatterns);
    }
}
