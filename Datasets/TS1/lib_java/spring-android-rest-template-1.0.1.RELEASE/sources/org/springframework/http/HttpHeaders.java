package org.springframework.http;

import java.net.URI;
import java.nio.charset.Charset;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.EnumSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.TimeZone;
import org.springframework.util.Assert;
import org.springframework.util.LinkedCaseInsensitiveMap;
import org.springframework.util.MultiValueMap;
import org.springframework.util.StringUtils;

/* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/http/HttpHeaders.class */
public class HttpHeaders implements MultiValueMap<String, String> {
    private static final String ACCEPT = "Accept";
    private static final String ACCEPT_CHARSET = "Accept-Charset";
    private static final String ACCEPT_ENCODING = "Accept-Encoding";
    private static final String ACCEPT_LANGUAGE = "Accept-Language";
    private static final String ALLOW = "Allow";
    private static final String AUTHORIZATION = "Authorization";
    private static final String CACHE_CONTROL = "Cache-Control";
    private static final String CONTENT_DISPOSITION = "Content-Disposition";
    private static final String CONTENT_ENCODING = "Content-Encoding";
    private static final String CONTENT_LENGTH = "Content-Length";
    private static final String CONTENT_TYPE = "Content-Type";
    private static final String DATE = "Date";
    private static final String ETAG = "ETag";
    private static final String EXPIRES = "Expires";
    private static final String IF_MODIFIED_SINCE = "If-Modified-Since";
    private static final String IF_NONE_MATCH = "If-None-Match";
    private static final String LAST_MODIFIED = "Last-Modified";
    private static final String LOCATION = "Location";
    private static final String PRAGMA = "Pragma";
    private static final String USER_AGENT = "User-Agent";
    private static final String[] DATE_FORMATS = {"EEE, dd MMM yyyy HH:mm:ss zzz", "EEE, dd-MMM-yy HH:mm:ss zzz", "EEE MMM dd HH:mm:ss yyyy"};
    private static TimeZone GMT = TimeZone.getTimeZone("GMT");
    private final Map<String, List<String>> headers;

    private HttpHeaders(Map<String, List<String>> headers, boolean readOnly) {
        Assert.notNull(headers, "'headers' must not be null");
        if (readOnly) {
            LinkedCaseInsensitiveMap linkedCaseInsensitiveMap = new LinkedCaseInsensitiveMap(headers.size(), Locale.ENGLISH);
            for (Map.Entry<String, List<String>> entry : headers.entrySet()) {
                List<String> values = Collections.unmodifiableList(entry.getValue());
                linkedCaseInsensitiveMap.put(entry.getKey(), values);
            }
            this.headers = Collections.unmodifiableMap(linkedCaseInsensitiveMap);
            return;
        }
        this.headers = headers;
    }

    public HttpHeaders() {
        this(new LinkedCaseInsensitiveMap(8, Locale.ENGLISH), false);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static HttpHeaders readOnlyHttpHeaders(HttpHeaders httpHeaders) {
        return new HttpHeaders(httpHeaders, true);
    }

    public void setAccept(List<MediaType> acceptableMediaTypes) {
        set(ACCEPT, MediaType.toString(acceptableMediaTypes));
    }

    public List<MediaType> getAccept() {
        String value = getFirst(ACCEPT);
        return value != null ? MediaType.parseMediaTypes(value) : Collections.emptyList();
    }

    public void setAcceptCharset(List<Charset> acceptableCharsets) {
        StringBuilder builder = new StringBuilder();
        Iterator<Charset> iterator = acceptableCharsets.iterator();
        while (iterator.hasNext()) {
            Charset charset = iterator.next();
            builder.append(charset.name().toLowerCase(Locale.ENGLISH));
            if (iterator.hasNext()) {
                builder.append(", ");
            }
        }
        set(ACCEPT_CHARSET, builder.toString());
    }

    public List<Charset> getAcceptCharset() {
        String charsetName;
        List<Charset> result = new ArrayList<>();
        String value = getFirst(ACCEPT_CHARSET);
        if (value != null) {
            String[] tokens = value.split(",\\s*");
            for (String token : tokens) {
                int paramIdx = token.indexOf(59);
                if (paramIdx == -1) {
                    charsetName = token;
                } else {
                    charsetName = token.substring(0, paramIdx);
                }
                if (!charsetName.equals(ContentCodingType.ALL_VALUE)) {
                    result.add(Charset.forName(charsetName));
                }
            }
        }
        return result;
    }

    public void setAcceptEncoding(List<ContentCodingType> acceptableEncodingTypes) {
        set(ACCEPT_ENCODING, ContentCodingType.toString(acceptableEncodingTypes));
    }

    public void setAcceptEncoding(ContentCodingType acceptableEncodingType) {
        setAcceptEncoding(Collections.singletonList(acceptableEncodingType));
    }

    public List<ContentCodingType> getAcceptEncoding() {
        String value = getFirst(ACCEPT_ENCODING);
        return value != null ? ContentCodingType.parseCodingTypes(value) : Collections.emptyList();
    }

    public void setAcceptLanguage(String acceptLanguage) {
        set(ACCEPT_LANGUAGE, acceptLanguage);
    }

    public String getAcceptLanguage() {
        return getFirst(ACCEPT_LANGUAGE);
    }

    public void setAllow(Set<HttpMethod> allowedMethods) {
        set(ALLOW, StringUtils.collectionToCommaDelimitedString(allowedMethods));
    }

    public Set<HttpMethod> getAllow() {
        String value = getFirst(ALLOW);
        if (value != null) {
            List<HttpMethod> allowedMethod = new ArrayList<>(5);
            String[] tokens = value.split(",\\s*");
            for (String token : tokens) {
                allowedMethod.add(HttpMethod.valueOf(token));
            }
            return EnumSet.copyOf((Collection) allowedMethod);
        }
        return EnumSet.noneOf(HttpMethod.class);
    }

    public void setAuthorization(HttpAuthentication httpAuthentication) {
        set(AUTHORIZATION, httpAuthentication.getHeaderValue());
    }

    public String getAuthorization() {
        return getFirst(AUTHORIZATION);
    }

    public void setCacheControl(String cacheControl) {
        set(CACHE_CONTROL, cacheControl);
    }

    public String getCacheControl() {
        return getFirst(CACHE_CONTROL);
    }

    public void setContentDispositionFormData(String name, String filename) {
        Assert.notNull(name, "'name' must not be null");
        StringBuilder builder = new StringBuilder("form-data; name=\"");
        builder.append(name).append('\"');
        if (filename != null) {
            builder.append("; filename=\"");
            builder.append(filename).append('\"');
        }
        set(CONTENT_DISPOSITION, builder.toString());
    }

    public void setContentEncoding(List<ContentCodingType> contentEncodingTypes) {
        set(CONTENT_ENCODING, ContentCodingType.toString(contentEncodingTypes));
    }

    public void setContentEncoding(ContentCodingType contentEncodingType) {
        setContentEncoding(Collections.singletonList(contentEncodingType));
    }

    public List<ContentCodingType> getContentEncoding() {
        String value = getFirst(CONTENT_ENCODING);
        return value != null ? ContentCodingType.parseCodingTypes(value) : Collections.emptyList();
    }

    public void setContentLength(long contentLength) {
        set(CONTENT_LENGTH, Long.toString(contentLength));
    }

    public long getContentLength() {
        String value = getFirst(CONTENT_LENGTH);
        if (value != null) {
            return Long.parseLong(value);
        }
        return -1L;
    }

    public void setContentType(MediaType mediaType) {
        Assert.isTrue(!mediaType.isWildcardType(), "'Content-Type' cannot contain wildcard type '*'");
        Assert.isTrue(!mediaType.isWildcardSubtype(), "'Content-Type' cannot contain wildcard subtype '*'");
        set(CONTENT_TYPE, mediaType.toString());
    }

    public MediaType getContentType() {
        String value = getFirst(CONTENT_TYPE);
        if (value != null) {
            return MediaType.parseMediaType(value);
        }
        return null;
    }

    public void setDate(long date) {
        setDate(DATE, date);
    }

    public long getDate() {
        return getFirstDate(DATE);
    }

    public void setETag(String eTag) {
        if (eTag != null) {
            Assert.isTrue(eTag.startsWith("\"") || eTag.startsWith("W/"), "Invalid eTag, does not start with W/ or \"");
            Assert.isTrue(eTag.endsWith("\""), "Invalid eTag, does not end with \"");
        }
        set(ETAG, eTag);
    }

    public String getETag() {
        return getFirst(ETAG);
    }

    public void setExpires(long expires) {
        setDate(EXPIRES, expires);
    }

    public long getExpires() {
        return getFirstDate(EXPIRES);
    }

    public void setIfModifiedSince(long ifModifiedSince) {
        setDate(IF_MODIFIED_SINCE, ifModifiedSince);
    }

    public long getIfNotModifiedSince() {
        return getFirstDate(IF_MODIFIED_SINCE);
    }

    public void setIfNoneMatch(String ifNoneMatch) {
        set(IF_NONE_MATCH, ifNoneMatch);
    }

    public void setIfNoneMatch(List<String> ifNoneMatchList) {
        StringBuilder builder = new StringBuilder();
        Iterator<String> iterator = ifNoneMatchList.iterator();
        while (iterator.hasNext()) {
            String ifNoneMatch = iterator.next();
            builder.append(ifNoneMatch);
            if (iterator.hasNext()) {
                builder.append(", ");
            }
        }
        set(IF_NONE_MATCH, builder.toString());
    }

    public List<String> getIfNoneMatch() {
        List<String> result = new ArrayList<>();
        String value = getFirst(IF_NONE_MATCH);
        if (value != null) {
            String[] tokens = value.split(",\\s*");
            for (String token : tokens) {
                result.add(token);
            }
        }
        return result;
    }

    public void setLastModified(long lastModified) {
        setDate(LAST_MODIFIED, lastModified);
    }

    public long getLastModified() {
        return getFirstDate(LAST_MODIFIED);
    }

    public void setLocation(URI location) {
        set(LOCATION, location.toASCIIString());
    }

    public URI getLocation() {
        String value = getFirst(LOCATION);
        if (value != null) {
            return URI.create(value);
        }
        return null;
    }

    public void setPragma(String pragma) {
        set(PRAGMA, pragma);
    }

    public String getPragma() {
        return getFirst(PRAGMA);
    }

    public void setUserAgent(String userAgent) {
        set(USER_AGENT, userAgent);
    }

    public String getUserAgent() {
        return getFirst(USER_AGENT);
    }

    private long getFirstDate(String headerName) {
        String headerValue = getFirst(headerName);
        if (headerValue == null) {
            return -1L;
        }
        String[] arr$ = DATE_FORMATS;
        for (String dateFormat : arr$) {
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat(dateFormat, Locale.US);
            simpleDateFormat.setTimeZone(GMT);
            try {
                return simpleDateFormat.parse(headerValue).getTime();
            } catch (ParseException e) {
            }
        }
        throw new IllegalArgumentException("Cannot parse date value \"" + headerValue + "\" for \"" + headerName + "\" header");
    }

    private void setDate(String headerName, long date) {
        SimpleDateFormat dateFormat = new SimpleDateFormat(DATE_FORMATS[0], Locale.US);
        dateFormat.setTimeZone(GMT);
        set(headerName, dateFormat.format(new Date(date)));
    }

    public String getFirst(String headerName) {
        List<String> headerValues = this.headers.get(headerName);
        if (headerValues != null) {
            return headerValues.get(0);
        }
        return null;
    }

    public void add(String headerName, String headerValue) {
        List<String> headerValues = this.headers.get(headerName);
        if (headerValues == null) {
            headerValues = new LinkedList();
            this.headers.put(headerName, headerValues);
        }
        headerValues.add(headerValue);
    }

    public void set(String headerName, String headerValue) {
        List<String> headerValues = new LinkedList<>();
        headerValues.add(headerValue);
        this.headers.put(headerName, headerValues);
    }

    public void setAll(Map<String, String> values) {
        for (Map.Entry<String, String> entry : values.entrySet()) {
            set(entry.getKey(), entry.getValue());
        }
    }

    public Map<String, String> toSingleValueMap() {
        LinkedHashMap<String, String> singleValueMap = new LinkedHashMap<>(this.headers.size());
        for (Map.Entry<String, List<String>> entry : this.headers.entrySet()) {
            singleValueMap.put(entry.getKey(), entry.getValue().get(0));
        }
        return singleValueMap;
    }

    public int size() {
        return this.headers.size();
    }

    public boolean isEmpty() {
        return this.headers.isEmpty();
    }

    public boolean containsKey(Object key) {
        return this.headers.containsKey(key);
    }

    public boolean containsValue(Object value) {
        return this.headers.containsValue(value);
    }

    /* renamed from: get, reason: merged with bridge method [inline-methods] */
    public List<String> m4get(Object key) {
        return this.headers.get(key);
    }

    public List<String> put(String key, List<String> value) {
        return this.headers.put(key, value);
    }

    /* renamed from: remove, reason: merged with bridge method [inline-methods] */
    public List<String> m3remove(Object key) {
        return this.headers.remove(key);
    }

    public void putAll(Map<? extends String, ? extends List<String>> m) {
        this.headers.putAll(m);
    }

    public void clear() {
        this.headers.clear();
    }

    public Set<String> keySet() {
        return this.headers.keySet();
    }

    public Collection<List<String>> values() {
        return this.headers.values();
    }

    public Set<Map.Entry<String, List<String>>> entrySet() {
        return this.headers.entrySet();
    }

    public boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof HttpHeaders)) {
            return false;
        }
        HttpHeaders otherHeaders = (HttpHeaders) other;
        return this.headers.equals(otherHeaders.headers);
    }

    public int hashCode() {
        return this.headers.hashCode();
    }

    public String toString() {
        return this.headers.toString();
    }
}
