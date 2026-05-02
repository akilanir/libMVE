package cz.msebera.android.httpclient.impl.cookie;

import cz.msebera.android.httpclient.client.utils.Punycode;
import cz.msebera.android.httpclient.cookie.Cookie;
import cz.msebera.android.httpclient.cookie.CookieAttributeHandler;
import cz.msebera.android.httpclient.cookie.CookieOrigin;
import cz.msebera.android.httpclient.cookie.MalformedCookieException;
import cz.msebera.android.httpclient.cookie.SetCookie;
import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/cookie/PublicSuffixFilter.class */
public class PublicSuffixFilter implements CookieAttributeHandler {
    private final CookieAttributeHandler wrapped;
    private Set<String> exceptions;
    private Set<String> suffixes;

    public PublicSuffixFilter(CookieAttributeHandler wrapped) {
        this.wrapped = wrapped;
    }

    public void setPublicSuffixes(Collection<String> suffixes) {
        this.suffixes = new HashSet(suffixes);
    }

    public void setExceptions(Collection<String> exceptions) {
        this.exceptions = new HashSet(exceptions);
    }

    @Override // cz.msebera.android.httpclient.cookie.CookieAttributeHandler
    public boolean match(Cookie cookie, CookieOrigin origin) {
        if (isForPublicSuffix(cookie)) {
            return false;
        }
        return this.wrapped.match(cookie, origin);
    }

    @Override // cz.msebera.android.httpclient.cookie.CookieAttributeHandler
    public void parse(SetCookie cookie, String value) throws MalformedCookieException {
        this.wrapped.parse(cookie, value);
    }

    @Override // cz.msebera.android.httpclient.cookie.CookieAttributeHandler
    public void validate(Cookie cookie, CookieOrigin origin) throws MalformedCookieException {
        this.wrapped.validate(cookie, origin);
    }

    private boolean isForPublicSuffix(Cookie cookie) {
        String domain = cookie.getDomain();
        if (domain.startsWith(".")) {
            domain = domain.substring(1);
        }
        String domain2 = Punycode.toUnicode(domain);
        if ((this.exceptions != null && this.exceptions.contains(domain2)) || this.suffixes == null) {
            return false;
        }
        while (!this.suffixes.contains(domain2)) {
            if (domain2.startsWith("*.")) {
                domain2 = domain2.substring(2);
            }
            int nextdot = domain2.indexOf(46);
            if (nextdot != -1) {
                domain2 = "*" + domain2.substring(nextdot);
                if (domain2.length() <= 0) {
                    return false;
                }
            } else {
                return false;
            }
        }
        return true;
    }
}
