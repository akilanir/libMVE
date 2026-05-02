package cz.msebera.android.httpclient.impl.client;

import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.HttpHost;
import cz.msebera.android.httpclient.HttpRequest;
import cz.msebera.android.httpclient.HttpResponse;
import cz.msebera.android.httpclient.HttpStatus;
import cz.msebera.android.httpclient.ProtocolException;
import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.client.CircularRedirectException;
import cz.msebera.android.httpclient.client.RedirectHandler;
import cz.msebera.android.httpclient.client.params.ClientPNames;
import cz.msebera.android.httpclient.client.utils.URIUtils;
import cz.msebera.android.httpclient.extras.HttpClientAndroidLog;
import cz.msebera.android.httpclient.params.HttpParams;
import cz.msebera.android.httpclient.protocol.HttpContext;
import cz.msebera.android.httpclient.util.Args;
import cz.msebera.android.httpclient.util.Asserts;
import java.net.URI;
import java.net.URISyntaxException;

@Immutable
@Deprecated
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/client/DefaultRedirectHandler.class */
public class DefaultRedirectHandler implements RedirectHandler {
    public HttpClientAndroidLog log = new HttpClientAndroidLog(getClass());
    private static final String REDIRECT_LOCATIONS = "http.protocol.redirect-locations";

    @Override // cz.msebera.android.httpclient.client.RedirectHandler
    public boolean isRedirectRequested(HttpResponse response, HttpContext context) {
        Args.notNull(response, "HTTP response");
        int statusCode = response.getStatusLine().getStatusCode();
        switch (statusCode) {
            case HttpStatus.SC_MOVED_PERMANENTLY /* 301 */:
            case HttpStatus.SC_MOVED_TEMPORARILY /* 302 */:
            case HttpStatus.SC_TEMPORARY_REDIRECT /* 307 */:
                HttpRequest request = (HttpRequest) context.getAttribute("http.request");
                String method = request.getRequestLine().getMethod();
                return method.equalsIgnoreCase("GET") || method.equalsIgnoreCase("HEAD");
            case HttpStatus.SC_SEE_OTHER /* 303 */:
                return true;
            case HttpStatus.SC_NOT_MODIFIED /* 304 */:
            case HttpStatus.SC_USE_PROXY /* 305 */:
            case 306:
            default:
                return false;
        }
    }

    @Override // cz.msebera.android.httpclient.client.RedirectHandler
    public URI getLocationURI(HttpResponse response, HttpContext context) throws ProtocolException {
        URI redirectURI;
        Args.notNull(response, "HTTP response");
        Header locationHeader = response.getFirstHeader("location");
        if (locationHeader == null) {
            throw new ProtocolException("Received redirect response " + response.getStatusLine() + " but no location header");
        }
        String location = locationHeader.getValue();
        if (this.log.isDebugEnabled()) {
            this.log.debug("Redirect requested to location '" + location + "'");
        }
        try {
            URI uri = new URI(location);
            HttpParams params = response.getParams();
            if (!uri.isAbsolute()) {
                if (params.isParameterTrue(ClientPNames.REJECT_RELATIVE_REDIRECT)) {
                    throw new ProtocolException("Relative redirect location '" + uri + "' not allowed");
                }
                HttpHost target = (HttpHost) context.getAttribute("http.target_host");
                Asserts.notNull(target, "Target host");
                HttpRequest request = (HttpRequest) context.getAttribute("http.request");
                try {
                    URI requestURI = new URI(request.getRequestLine().getUri());
                    URI absoluteRequestURI = URIUtils.rewriteURI(requestURI, target, true);
                    uri = URIUtils.resolve(absoluteRequestURI, uri);
                } catch (URISyntaxException ex) {
                    throw new ProtocolException(ex.getMessage(), ex);
                }
            }
            if (params.isParameterFalse(ClientPNames.ALLOW_CIRCULAR_REDIRECTS)) {
                RedirectLocations redirectLocations = (RedirectLocations) context.getAttribute("http.protocol.redirect-locations");
                if (redirectLocations == null) {
                    redirectLocations = new RedirectLocations();
                    context.setAttribute("http.protocol.redirect-locations", redirectLocations);
                }
                if (uri.getFragment() != null) {
                    try {
                        redirectURI = URIUtils.rewriteURI(uri, new HttpHost(uri.getHost(), uri.getPort(), uri.getScheme()), true);
                    } catch (URISyntaxException ex2) {
                        throw new ProtocolException(ex2.getMessage(), ex2);
                    }
                } else {
                    redirectURI = uri;
                }
                if (redirectLocations.contains(redirectURI)) {
                    throw new CircularRedirectException("Circular redirect to '" + redirectURI + "'");
                }
                redirectLocations.add(redirectURI);
            }
            return uri;
        } catch (URISyntaxException ex3) {
            throw new ProtocolException("Invalid redirect URI: " + location, ex3);
        }
    }
}
