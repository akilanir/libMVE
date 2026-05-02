package cz.msebera.android.httpclient.impl.client.cache;

import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.HeaderElement;
import cz.msebera.android.httpclient.HttpEntityEnclosingRequest;
import cz.msebera.android.httpclient.HttpRequest;
import cz.msebera.android.httpclient.HttpResponse;
import cz.msebera.android.httpclient.HttpStatus;
import cz.msebera.android.httpclient.HttpVersion;
import cz.msebera.android.httpclient.ProtocolVersion;
import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.client.ClientProtocolException;
import cz.msebera.android.httpclient.client.cache.HeaderConstants;
import cz.msebera.android.httpclient.client.methods.HttpRequestWrapper;
import cz.msebera.android.httpclient.conn.routing.HttpRouteDirector;
import cz.msebera.android.httpclient.entity.AbstractHttpEntity;
import cz.msebera.android.httpclient.entity.ContentType;
import cz.msebera.android.httpclient.message.BasicHeader;
import cz.msebera.android.httpclient.message.BasicHttpResponse;
import cz.msebera.android.httpclient.message.BasicStatusLine;
import cz.msebera.android.httpclient.protocol.HTTP;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

@Immutable
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/client/cache/RequestProtocolCompliance.class */
class RequestProtocolCompliance {
    private final boolean weakETagOnPutDeleteAllowed;
    private static final List<String> disallowedWithNoCache = Arrays.asList(HeaderConstants.CACHE_CONTROL_MIN_FRESH, HeaderConstants.CACHE_CONTROL_MAX_STALE, "max-age");

    public RequestProtocolCompliance() {
        this.weakETagOnPutDeleteAllowed = false;
    }

    public RequestProtocolCompliance(boolean weakETagOnPutDeleteAllowed) {
        this.weakETagOnPutDeleteAllowed = weakETagOnPutDeleteAllowed;
    }

    public List<RequestProtocolError> requestIsFatallyNonCompliant(HttpRequest request) {
        RequestProtocolError anError;
        List<RequestProtocolError> theErrors = new ArrayList<>();
        RequestProtocolError anError2 = requestHasWeakETagAndRange(request);
        if (anError2 != null) {
            theErrors.add(anError2);
        }
        if (!this.weakETagOnPutDeleteAllowed && (anError = requestHasWeekETagForPUTOrDELETEIfMatch(request)) != null) {
            theErrors.add(anError);
        }
        RequestProtocolError anError3 = requestContainsNoCacheDirectiveWithFieldName(request);
        if (anError3 != null) {
            theErrors.add(anError3);
        }
        return theErrors;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public void makeRequestCompliant(HttpRequestWrapper httpRequestWrapper) throws ClientProtocolException {
        if (requestMustNotHaveEntity(httpRequestWrapper)) {
            ((HttpEntityEnclosingRequest) httpRequestWrapper).setEntity(null);
        }
        verifyRequestWithExpectContinueFlagHas100continueHeader(httpRequestWrapper);
        verifyOPTIONSRequestWithBodyHasContentType(httpRequestWrapper);
        decrementOPTIONSMaxForwardsIfGreaterThen0(httpRequestWrapper);
        stripOtherFreshnessDirectivesWithNoCache(httpRequestWrapper);
        if (requestVersionIsTooLow(httpRequestWrapper) || requestMinorVersionIsTooHighMajorVersionsMatch(httpRequestWrapper)) {
            httpRequestWrapper.setProtocolVersion(HttpVersion.HTTP_1_1);
        }
    }

    private void stripOtherFreshnessDirectivesWithNoCache(HttpRequest request) {
        List<HeaderElement> outElts = new ArrayList<>();
        boolean shouldStrip = false;
        for (Header h : request.getHeaders("Cache-Control")) {
            for (HeaderElement elt : h.getElements()) {
                if (!disallowedWithNoCache.contains(elt.getName())) {
                    outElts.add(elt);
                }
                if (HeaderConstants.CACHE_CONTROL_NO_CACHE.equals(elt.getName())) {
                    shouldStrip = true;
                }
            }
        }
        if (!shouldStrip) {
            return;
        }
        request.removeHeaders("Cache-Control");
        request.setHeader("Cache-Control", buildHeaderFromElements(outElts));
    }

    private String buildHeaderFromElements(List<HeaderElement> outElts) {
        StringBuilder newHdr = new StringBuilder("");
        boolean first = true;
        for (HeaderElement elt : outElts) {
            if (!first) {
                newHdr.append(",");
            } else {
                first = false;
            }
            newHdr.append(elt.toString());
        }
        return newHdr.toString();
    }

    private boolean requestMustNotHaveEntity(HttpRequest request) {
        return "TRACE".equals(request.getRequestLine().getMethod()) && (request instanceof HttpEntityEnclosingRequest);
    }

    private void decrementOPTIONSMaxForwardsIfGreaterThen0(HttpRequest request) {
        Header maxForwards;
        if (!"OPTIONS".equals(request.getRequestLine().getMethod()) || (maxForwards = request.getFirstHeader("Max-Forwards")) == null) {
            return;
        }
        request.removeHeaders("Max-Forwards");
        int currentMaxForwards = Integer.parseInt(maxForwards.getValue());
        request.setHeader("Max-Forwards", Integer.toString(currentMaxForwards - 1));
    }

    private void verifyOPTIONSRequestWithBodyHasContentType(HttpRequest request) {
        if (!"OPTIONS".equals(request.getRequestLine().getMethod()) || !(request instanceof HttpEntityEnclosingRequest)) {
            return;
        }
        addContentTypeHeaderIfMissing((HttpEntityEnclosingRequest) request);
    }

    private void addContentTypeHeaderIfMissing(HttpEntityEnclosingRequest request) {
        if (request.getEntity().getContentType() == null) {
            ((AbstractHttpEntity) request.getEntity()).setContentType(ContentType.APPLICATION_OCTET_STREAM.getMimeType());
        }
    }

    private void verifyRequestWithExpectContinueFlagHas100continueHeader(HttpRequest request) {
        if (request instanceof HttpEntityEnclosingRequest) {
            if (((HttpEntityEnclosingRequest) request).expectContinue() && ((HttpEntityEnclosingRequest) request).getEntity() != null) {
                add100ContinueHeaderIfMissing(request);
                return;
            } else {
                remove100ContinueHeaderIfExists(request);
                return;
            }
        }
        remove100ContinueHeaderIfExists(request);
    }

    private void remove100ContinueHeaderIfExists(HttpRequest request) {
        boolean hasHeader = false;
        Header[] expectHeaders = request.getHeaders("Expect");
        List<HeaderElement> expectElementsThatAreNot100Continue = new ArrayList<>();
        for (Header h : expectHeaders) {
            for (HeaderElement elt : h.getElements()) {
                if (!HTTP.EXPECT_CONTINUE.equalsIgnoreCase(elt.getName())) {
                    expectElementsThatAreNot100Continue.add(elt);
                } else {
                    hasHeader = true;
                }
            }
            if (hasHeader) {
                request.removeHeader(h);
                Iterator<HeaderElement> it = expectElementsThatAreNot100Continue.iterator();
                while (it.hasNext()) {
                    BasicHeader newHeader = new BasicHeader("Expect", it.next().getName());
                    request.addHeader(newHeader);
                }
                return;
            }
            expectElementsThatAreNot100Continue = new ArrayList<>();
        }
    }

    private void add100ContinueHeaderIfMissing(HttpRequest request) {
        boolean hasHeader = false;
        for (Header h : request.getHeaders("Expect")) {
            for (HeaderElement elt : h.getElements()) {
                if (HTTP.EXPECT_CONTINUE.equalsIgnoreCase(elt.getName())) {
                    hasHeader = true;
                }
            }
        }
        if (!hasHeader) {
            request.addHeader("Expect", HTTP.EXPECT_CONTINUE);
        }
    }

    protected boolean requestMinorVersionIsTooHighMajorVersionsMatch(HttpRequest request) {
        ProtocolVersion requestProtocol = request.getProtocolVersion();
        if (requestProtocol.getMajor() == HttpVersion.HTTP_1_1.getMajor() && requestProtocol.getMinor() > HttpVersion.HTTP_1_1.getMinor()) {
            return true;
        }
        return false;
    }

    protected boolean requestVersionIsTooLow(HttpRequest request) {
        return request.getProtocolVersion().compareToVersion(HttpVersion.HTTP_1_1) < 0;
    }

    /* renamed from: cz.msebera.android.httpclient.impl.client.cache.RequestProtocolCompliance$1, reason: invalid class name */
    /* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/client/cache/RequestProtocolCompliance$1.class */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$cz$msebera$android$httpclient$impl$client$cache$RequestProtocolError = new int[RequestProtocolError.values().length];

        static {
            try {
                $SwitchMap$cz$msebera$android$httpclient$impl$client$cache$RequestProtocolError[RequestProtocolError.BODY_BUT_NO_LENGTH_ERROR.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$cz$msebera$android$httpclient$impl$client$cache$RequestProtocolError[RequestProtocolError.WEAK_ETAG_AND_RANGE_ERROR.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$cz$msebera$android$httpclient$impl$client$cache$RequestProtocolError[RequestProtocolError.WEAK_ETAG_ON_PUTDELETE_METHOD_ERROR.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$cz$msebera$android$httpclient$impl$client$cache$RequestProtocolError[RequestProtocolError.NO_CACHE_DIRECTIVE_WITH_FIELD_NAME.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
        }
    }

    public HttpResponse getErrorForRequest(RequestProtocolError errorCheck) {
        switch (AnonymousClass1.$SwitchMap$cz$msebera$android$httpclient$impl$client$cache$RequestProtocolError[errorCheck.ordinal()]) {
            case 1:
                return new BasicHttpResponse(new BasicStatusLine(HttpVersion.HTTP_1_1, HttpStatus.SC_LENGTH_REQUIRED, ""));
            case 2:
                return new BasicHttpResponse(new BasicStatusLine(HttpVersion.HTTP_1_1, HttpStatus.SC_BAD_REQUEST, "Weak eTag not compatible with byte range"));
            case HttpRouteDirector.TUNNEL_TARGET /* 3 */:
                return new BasicHttpResponse(new BasicStatusLine(HttpVersion.HTTP_1_1, HttpStatus.SC_BAD_REQUEST, "Weak eTag not compatible with PUT or DELETE requests"));
            case 4:
                return new BasicHttpResponse(new BasicStatusLine(HttpVersion.HTTP_1_1, HttpStatus.SC_BAD_REQUEST, "No-Cache directive MUST NOT include a field name"));
            default:
                throw new IllegalStateException("The request was compliant, therefore no error can be generated for it.");
        }
    }

    private RequestProtocolError requestHasWeakETagAndRange(HttpRequest request) {
        Header ifRange;
        String method = request.getRequestLine().getMethod();
        if (!"GET".equals(method)) {
            return null;
        }
        Header range = request.getFirstHeader("Range");
        if (range == null || (ifRange = request.getFirstHeader("If-Range")) == null) {
            return null;
        }
        String val = ifRange.getValue();
        if (val.startsWith("W/")) {
            return RequestProtocolError.WEAK_ETAG_AND_RANGE_ERROR;
        }
        return null;
    }

    private RequestProtocolError requestHasWeekETagForPUTOrDELETEIfMatch(HttpRequest request) {
        String method = request.getRequestLine().getMethod();
        if (!"PUT".equals(method) && !"DELETE".equals(method)) {
            return null;
        }
        Header ifMatch = request.getFirstHeader("If-Match");
        if (ifMatch != null) {
            String val = ifMatch.getValue();
            if (val.startsWith("W/")) {
                return RequestProtocolError.WEAK_ETAG_ON_PUTDELETE_METHOD_ERROR;
            }
            return null;
        }
        Header ifNoneMatch = request.getFirstHeader("If-None-Match");
        if (ifNoneMatch == null) {
            return null;
        }
        String val2 = ifNoneMatch.getValue();
        if (val2.startsWith("W/")) {
            return RequestProtocolError.WEAK_ETAG_ON_PUTDELETE_METHOD_ERROR;
        }
        return null;
    }

    private RequestProtocolError requestContainsNoCacheDirectiveWithFieldName(HttpRequest request) {
        for (Header h : request.getHeaders("Cache-Control")) {
            for (HeaderElement elt : h.getElements()) {
                if (HeaderConstants.CACHE_CONTROL_NO_CACHE.equalsIgnoreCase(elt.getName()) && elt.getValue() != null) {
                    return RequestProtocolError.NO_CACHE_DIRECTIVE_WITH_FIELD_NAME;
                }
            }
        }
        return null;
    }
}
