package cz.msebera.android.httpclient.impl.cookie;

import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.cookie.ClientCookie;
import cz.msebera.android.httpclient.cookie.Cookie;
import cz.msebera.android.httpclient.cookie.CookieAttributeHandler;
import cz.msebera.android.httpclient.cookie.CookieOrigin;
import cz.msebera.android.httpclient.cookie.CookieRestrictionViolationException;
import cz.msebera.android.httpclient.cookie.MalformedCookieException;
import cz.msebera.android.httpclient.cookie.SM;
import cz.msebera.android.httpclient.cookie.SetCookie;
import cz.msebera.android.httpclient.cookie.SetCookie2;
import cz.msebera.android.httpclient.util.Args;
import java.util.StringTokenizer;

@Immutable
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/cookie/RFC2965PortAttributeHandler.class */
public class RFC2965PortAttributeHandler implements CookieAttributeHandler {
    private static int[] parsePortAttribute(String portValue) throws MalformedCookieException {
        StringTokenizer st = new StringTokenizer(portValue, ",");
        int[] ports = new int[st.countTokens()];
        int i = 0;
        while (st.hasMoreTokens()) {
            try {
                ports[i] = Integer.parseInt(st.nextToken().trim());
                if (ports[i] < 0) {
                    throw new MalformedCookieException("Invalid Port attribute.");
                }
                i++;
            } catch (NumberFormatException e) {
                throw new MalformedCookieException("Invalid Port attribute: " + e.getMessage());
            }
        }
        return ports;
    }

    private static boolean portMatch(int port, int[] ports) {
        boolean portInList = false;
        int length = ports.length;
        int i = 0;
        while (true) {
            if (i >= length) {
                break;
            }
            int port2 = ports[i];
            if (port != port2) {
                i++;
            } else {
                portInList = true;
                break;
            }
        }
        return portInList;
    }

    @Override // cz.msebera.android.httpclient.cookie.CookieAttributeHandler
    public void parse(SetCookie cookie, String portValue) throws MalformedCookieException {
        Args.notNull(cookie, SM.COOKIE);
        if (cookie instanceof SetCookie2) {
            SetCookie2 cookie2 = (SetCookie2) cookie;
            if (portValue != null && portValue.trim().length() > 0) {
                int[] ports = parsePortAttribute(portValue);
                cookie2.setPorts(ports);
            }
        }
    }

    @Override // cz.msebera.android.httpclient.cookie.CookieAttributeHandler
    public void validate(Cookie cookie, CookieOrigin origin) throws MalformedCookieException {
        Args.notNull(cookie, SM.COOKIE);
        Args.notNull(origin, "Cookie origin");
        int port = origin.getPort();
        if ((cookie instanceof ClientCookie) && ((ClientCookie) cookie).containsAttribute(ClientCookie.PORT_ATTR) && !portMatch(port, cookie.getPorts())) {
            throw new CookieRestrictionViolationException("Port attribute violates RFC 2965: Request port not found in cookie's port list.");
        }
    }

    @Override // cz.msebera.android.httpclient.cookie.CookieAttributeHandler
    public boolean match(Cookie cookie, CookieOrigin origin) {
        Args.notNull(cookie, SM.COOKIE);
        Args.notNull(origin, "Cookie origin");
        int port = origin.getPort();
        if ((cookie instanceof ClientCookie) && ((ClientCookie) cookie).containsAttribute(ClientCookie.PORT_ATTR)) {
            if (cookie.getPorts() == null || !portMatch(port, cookie.getPorts())) {
                return false;
            }
            return true;
        }
        return true;
    }
}
