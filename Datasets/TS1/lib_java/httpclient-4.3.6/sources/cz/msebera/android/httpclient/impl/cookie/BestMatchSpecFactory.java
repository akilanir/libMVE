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
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/cookie/BestMatchSpecFactory.class */
public class BestMatchSpecFactory implements CookieSpecFactory, CookieSpecProvider {
    private final String[] datepatterns;
    private final boolean oneHeader;

    public BestMatchSpecFactory(String[] datepatterns, boolean oneHeader) {
        this.datepatterns = datepatterns;
        this.oneHeader = oneHeader;
    }

    public BestMatchSpecFactory() {
        this(null, false);
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
            boolean singleHeader = params.getBooleanParameter(CookieSpecPNames.SINGLE_COOKIE_HEADER, false);
            return new BestMatchSpec(patterns, singleHeader);
        }
        return new BestMatchSpec();
    }

    @Override // cz.msebera.android.httpclient.cookie.CookieSpecProvider
    public CookieSpec create(HttpContext context) {
        return new BestMatchSpec(this.datepatterns, this.oneHeader);
    }
}
