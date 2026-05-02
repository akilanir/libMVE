package com.squareup.okhttp;

import java.net.IDN;
import java.net.InetAddress;
import java.net.MalformedURLException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import okio.Buffer;

/* loaded from: okhttp-2.5.0.jar:com/squareup/okhttp/HttpUrl.class */
public final class HttpUrl {
    private static final char[] HEX_DIGITS = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};
    static final String USERNAME_ENCODE_SET = " \"':;<=>@[]^`{}|/\\?#";
    static final String PASSWORD_ENCODE_SET = " \"':;<=>@[]^`{}|/\\?#";
    static final String PATH_SEGMENT_ENCODE_SET = " \"<>^`{}|/\\?#";
    static final String QUERY_ENCODE_SET = " \"'<>#";
    static final String QUERY_COMPONENT_ENCODE_SET = " \"'<>#&=";
    static final String FORM_ENCODE_SET = " \"':;<=>@[]^`{}|/\\?#&!$(),~";
    static final String FRAGMENT_ENCODE_SET = "";
    private final String scheme;
    private final String username;
    private final String password;
    private final String host;
    private final int port;
    private final List<String> pathSegments;
    private final List<String> queryNamesAndValues;
    private final String fragment;
    private final String url;

    private HttpUrl(Builder builder) {
        this.scheme = builder.scheme;
        this.username = percentDecode(builder.encodedUsername);
        this.password = percentDecode(builder.encodedPassword);
        this.host = builder.host;
        this.port = builder.effectivePort();
        this.pathSegments = percentDecode(builder.encodedPathSegments);
        this.queryNamesAndValues = builder.encodedQueryNamesAndValues != null ? percentDecode(builder.encodedQueryNamesAndValues) : null;
        this.fragment = builder.encodedFragment != null ? percentDecode(builder.encodedFragment) : null;
        this.url = builder.toString();
    }

    public URL url() {
        try {
            return new URL(this.url);
        } catch (MalformedURLException e) {
            throw new RuntimeException(e);
        }
    }

    public URI uri() {
        try {
            return new URI(this.url);
        } catch (URISyntaxException e) {
            throw new IllegalStateException("not valid as a java.net.URI: " + this.url);
        }
    }

    public String scheme() {
        return this.scheme;
    }

    public boolean isHttps() {
        return this.scheme.equals("https");
    }

    public String encodedUsername() {
        if (this.username.isEmpty()) {
            return FRAGMENT_ENCODE_SET;
        }
        int usernameStart = this.scheme.length() + 3;
        int usernameEnd = delimiterOffset(this.url, usernameStart, this.url.length(), ":@");
        return this.url.substring(usernameStart, usernameEnd);
    }

    public String username() {
        return this.username;
    }

    public String encodedPassword() {
        if (this.password.isEmpty()) {
            return FRAGMENT_ENCODE_SET;
        }
        int passwordStart = this.url.indexOf(58, this.scheme.length() + 3) + 1;
        int passwordEnd = this.url.indexOf(64);
        return this.url.substring(passwordStart, passwordEnd);
    }

    public String password() {
        return this.password;
    }

    public String host() {
        return this.host;
    }

    public int port() {
        return this.port;
    }

    public static int defaultPort(String scheme) {
        if (scheme.equals("http")) {
            return 80;
        }
        if (scheme.equals("https")) {
            return 443;
        }
        return -1;
    }

    public int pathSize() {
        return this.pathSegments.size();
    }

    public String encodedPath() {
        int pathStart = this.url.indexOf(47, this.scheme.length() + 3);
        int pathEnd = delimiterOffset(this.url, pathStart, this.url.length(), "?#");
        return this.url.substring(pathStart, pathEnd);
    }

    static void pathSegmentsToString(StringBuilder out, List<String> pathSegments) {
        int size = pathSegments.size();
        for (int i = 0; i < size; i++) {
            out.append('/');
            out.append(pathSegments.get(i));
        }
    }

    public List<String> encodedPathSegments() {
        int pathStart = this.url.indexOf(47, this.scheme.length() + 3);
        int pathEnd = delimiterOffset(this.url, pathStart, this.url.length(), "?#");
        List<String> result = new ArrayList<>();
        int i = pathStart;
        while (true) {
            int i2 = i;
            if (i2 < pathEnd) {
                int i3 = i2 + 1;
                int segmentEnd = delimiterOffset(this.url, i3, pathEnd, "/");
                result.add(this.url.substring(i3, segmentEnd));
                i = segmentEnd;
            } else {
                return result;
            }
        }
    }

    public List<String> pathSegments() {
        return this.pathSegments;
    }

    public String encodedQuery() {
        if (this.queryNamesAndValues == null) {
            return null;
        }
        int queryStart = this.url.indexOf(63) + 1;
        int queryEnd = delimiterOffset(this.url, queryStart + 1, this.url.length(), "#");
        return this.url.substring(queryStart, queryEnd);
    }

    static void namesAndValuesToQueryString(StringBuilder out, List<String> namesAndValues) {
        int size = namesAndValues.size();
        for (int i = 0; i < size; i += 2) {
            String name = namesAndValues.get(i);
            String value = namesAndValues.get(i + 1);
            if (i > 0) {
                out.append('&');
            }
            out.append(name);
            if (value != null) {
                out.append('=');
                out.append(value);
            }
        }
    }

    static List<String> queryStringToNamesAndValues(String encodedQuery) {
        List<String> result = new ArrayList<>();
        int i = 0;
        while (true) {
            int pos = i;
            if (pos <= encodedQuery.length()) {
                int ampersandOffset = encodedQuery.indexOf(38, pos);
                if (ampersandOffset == -1) {
                    ampersandOffset = encodedQuery.length();
                }
                int equalsOffset = encodedQuery.indexOf(61, pos);
                if (equalsOffset == -1 || equalsOffset > ampersandOffset) {
                    result.add(encodedQuery.substring(pos, ampersandOffset));
                    result.add(null);
                } else {
                    result.add(encodedQuery.substring(pos, equalsOffset));
                    result.add(encodedQuery.substring(equalsOffset + 1, ampersandOffset));
                }
                i = ampersandOffset + 1;
            } else {
                return result;
            }
        }
    }

    public String query() {
        if (this.queryNamesAndValues == null) {
            return null;
        }
        StringBuilder result = new StringBuilder();
        namesAndValuesToQueryString(result, this.queryNamesAndValues);
        return result.toString();
    }

    public int querySize() {
        if (this.queryNamesAndValues != null) {
            return this.queryNamesAndValues.size() / 2;
        }
        return 0;
    }

    public String queryParameter(String name) {
        if (this.queryNamesAndValues == null) {
            return null;
        }
        int size = this.queryNamesAndValues.size();
        for (int i = 0; i < size; i += 2) {
            if (name.equals(this.queryNamesAndValues.get(i))) {
                return this.queryNamesAndValues.get(i + 1);
            }
        }
        return null;
    }

    public Set<String> queryParameterNames() {
        if (this.queryNamesAndValues == null) {
            return Collections.emptySet();
        }
        Set<String> result = new LinkedHashSet<>();
        int size = this.queryNamesAndValues.size();
        for (int i = 0; i < size; i += 2) {
            result.add(this.queryNamesAndValues.get(i));
        }
        return Collections.unmodifiableSet(result);
    }

    public List<String> queryParameterValues(String name) {
        if (this.queryNamesAndValues == null) {
            return Collections.emptyList();
        }
        List<String> result = new ArrayList<>();
        int size = this.queryNamesAndValues.size();
        for (int i = 0; i < size; i += 2) {
            if (name.equals(this.queryNamesAndValues.get(i))) {
                result.add(this.queryNamesAndValues.get(i + 1));
            }
        }
        return Collections.unmodifiableList(result);
    }

    public String queryParameterName(int index) {
        return this.queryNamesAndValues.get(index * 2);
    }

    public String queryParameterValue(int index) {
        return this.queryNamesAndValues.get((index * 2) + 1);
    }

    public String encodedFragment() {
        if (this.fragment == null) {
            return null;
        }
        int fragmentStart = this.url.indexOf(35) + 1;
        return this.url.substring(fragmentStart);
    }

    public String fragment() {
        return this.fragment;
    }

    public HttpUrl resolve(String link) {
        return new Builder().parse(this, link);
    }

    public Builder newBuilder() {
        Builder result = new Builder();
        result.scheme = this.scheme;
        result.encodedUsername = encodedUsername();
        result.encodedPassword = encodedPassword();
        result.host = this.host;
        if (this.port == defaultPort(this.scheme)) {
            result.port = -1;
        } else {
            result.port = this.port;
        }
        result.encodedPathSegments.clear();
        result.encodedPathSegments.addAll(encodedPathSegments());
        result.encodedQuery(encodedQuery());
        result.encodedFragment = encodedFragment();
        return result;
    }

    public static HttpUrl parse(String url) {
        return new Builder().parse(null, url);
    }

    public static HttpUrl get(URL url) {
        return parse(url.toString());
    }

    public static HttpUrl get(URI uri) {
        return parse(uri.toString());
    }

    public boolean equals(Object o) {
        return (o instanceof HttpUrl) && ((HttpUrl) o).url.equals(this.url);
    }

    public int hashCode() {
        return this.url.hashCode();
    }

    public String toString() {
        return this.url;
    }

    /* loaded from: okhttp-2.5.0.jar:com/squareup/okhttp/HttpUrl$Builder.class */
    public static final class Builder {
        String scheme;
        String host;
        List<String> encodedQueryNamesAndValues;
        String encodedFragment;
        String encodedUsername = HttpUrl.FRAGMENT_ENCODE_SET;
        String encodedPassword = HttpUrl.FRAGMENT_ENCODE_SET;
        int port = -1;
        final List<String> encodedPathSegments = new ArrayList();

        public Builder() {
            this.encodedPathSegments.add(HttpUrl.FRAGMENT_ENCODE_SET);
        }

        public Builder scheme(String scheme) {
            if (scheme == null) {
                throw new IllegalArgumentException("scheme == null");
            }
            if (scheme.equalsIgnoreCase("http")) {
                this.scheme = "http";
            } else if (scheme.equalsIgnoreCase("https")) {
                this.scheme = "https";
            } else {
                throw new IllegalArgumentException("unexpected scheme: " + scheme);
            }
            return this;
        }

        public Builder username(String username) {
            if (username == null) {
                throw new IllegalArgumentException("username == null");
            }
            this.encodedUsername = HttpUrl.canonicalize(username, " \"':;<=>@[]^`{}|/\\?#", false, false);
            return this;
        }

        public Builder encodedUsername(String encodedUsername) {
            if (encodedUsername == null) {
                throw new IllegalArgumentException("encodedUsername == null");
            }
            this.encodedUsername = HttpUrl.canonicalize(encodedUsername, " \"':;<=>@[]^`{}|/\\?#", true, false);
            return this;
        }

        public Builder password(String password) {
            if (password == null) {
                throw new IllegalArgumentException("password == null");
            }
            this.encodedPassword = HttpUrl.canonicalize(password, " \"':;<=>@[]^`{}|/\\?#", false, false);
            return this;
        }

        public Builder encodedPassword(String encodedPassword) {
            if (encodedPassword == null) {
                throw new IllegalArgumentException("encodedPassword == null");
            }
            this.encodedPassword = HttpUrl.canonicalize(encodedPassword, " \"':;<=>@[]^`{}|/\\?#", true, false);
            return this;
        }

        public Builder host(String host) {
            if (host == null) {
                throw new IllegalArgumentException("host == null");
            }
            String encoded = canonicalizeHost(host, 0, host.length());
            if (encoded == null) {
                throw new IllegalArgumentException("unexpected host: " + host);
            }
            this.host = encoded;
            return this;
        }

        public Builder port(int port) {
            if (port <= 0 || port > 65535) {
                throw new IllegalArgumentException("unexpected port: " + port);
            }
            this.port = port;
            return this;
        }

        int effectivePort() {
            return this.port != -1 ? this.port : HttpUrl.defaultPort(this.scheme);
        }

        public Builder addPathSegment(String pathSegment) {
            if (pathSegment == null) {
                throw new IllegalArgumentException("pathSegment == null");
            }
            push(pathSegment, 0, pathSegment.length(), false, false);
            return this;
        }

        public Builder addEncodedPathSegment(String encodedPathSegment) {
            if (encodedPathSegment == null) {
                throw new IllegalArgumentException("encodedPathSegment == null");
            }
            push(encodedPathSegment, 0, encodedPathSegment.length(), false, true);
            return this;
        }

        public Builder setPathSegment(int index, String pathSegment) {
            if (pathSegment == null) {
                throw new IllegalArgumentException("pathSegment == null");
            }
            String canonicalPathSegment = HttpUrl.canonicalize(pathSegment, 0, pathSegment.length(), HttpUrl.PATH_SEGMENT_ENCODE_SET, false, false);
            if (isDot(canonicalPathSegment) || isDotDot(canonicalPathSegment)) {
                throw new IllegalArgumentException("unexpected path segment: " + pathSegment);
            }
            this.encodedPathSegments.set(index, canonicalPathSegment);
            return this;
        }

        public Builder setEncodedPathSegment(int index, String encodedPathSegment) {
            if (encodedPathSegment == null) {
                throw new IllegalArgumentException("encodedPathSegment == null");
            }
            String canonicalPathSegment = HttpUrl.canonicalize(encodedPathSegment, 0, encodedPathSegment.length(), HttpUrl.PATH_SEGMENT_ENCODE_SET, true, false);
            this.encodedPathSegments.set(index, canonicalPathSegment);
            if (isDot(canonicalPathSegment) || isDotDot(canonicalPathSegment)) {
                throw new IllegalArgumentException("unexpected path segment: " + encodedPathSegment);
            }
            return this;
        }

        public Builder removePathSegment(int index) {
            this.encodedPathSegments.remove(index);
            if (this.encodedPathSegments.isEmpty()) {
                this.encodedPathSegments.add(HttpUrl.FRAGMENT_ENCODE_SET);
            }
            return this;
        }

        public Builder encodedPath(String encodedPath) {
            if (encodedPath == null) {
                throw new IllegalArgumentException("encodedPath == null");
            }
            if (!encodedPath.startsWith("/")) {
                throw new IllegalArgumentException("unexpected encodedPath: " + encodedPath);
            }
            resolvePath(encodedPath, 0, encodedPath.length());
            return this;
        }

        public Builder query(String query) {
            this.encodedQueryNamesAndValues = query != null ? HttpUrl.queryStringToNamesAndValues(HttpUrl.canonicalize(query, HttpUrl.QUERY_ENCODE_SET, false, true)) : null;
            return this;
        }

        public Builder encodedQuery(String encodedQuery) {
            this.encodedQueryNamesAndValues = encodedQuery != null ? HttpUrl.queryStringToNamesAndValues(HttpUrl.canonicalize(encodedQuery, HttpUrl.QUERY_ENCODE_SET, true, true)) : null;
            return this;
        }

        public Builder addQueryParameter(String name, String value) {
            if (name == null) {
                throw new IllegalArgumentException("name == null");
            }
            if (this.encodedQueryNamesAndValues == null) {
                this.encodedQueryNamesAndValues = new ArrayList();
            }
            this.encodedQueryNamesAndValues.add(HttpUrl.canonicalize(name, HttpUrl.QUERY_COMPONENT_ENCODE_SET, false, true));
            this.encodedQueryNamesAndValues.add(value != null ? HttpUrl.canonicalize(value, HttpUrl.QUERY_COMPONENT_ENCODE_SET, false, true) : null);
            return this;
        }

        public Builder addEncodedQueryParameter(String encodedName, String encodedValue) {
            if (encodedName == null) {
                throw new IllegalArgumentException("encodedName == null");
            }
            if (this.encodedQueryNamesAndValues == null) {
                this.encodedQueryNamesAndValues = new ArrayList();
            }
            this.encodedQueryNamesAndValues.add(HttpUrl.canonicalize(encodedName, HttpUrl.QUERY_COMPONENT_ENCODE_SET, true, true));
            this.encodedQueryNamesAndValues.add(encodedValue != null ? HttpUrl.canonicalize(encodedValue, HttpUrl.QUERY_COMPONENT_ENCODE_SET, true, true) : null);
            return this;
        }

        public Builder setQueryParameter(String name, String value) {
            removeAllQueryParameters(name);
            addQueryParameter(name, value);
            return this;
        }

        public Builder setEncodedQueryParameter(String encodedName, String encodedValue) {
            removeAllEncodedQueryParameters(encodedName);
            addEncodedQueryParameter(encodedName, encodedValue);
            return this;
        }

        public Builder removeAllQueryParameters(String name) {
            if (name == null) {
                throw new IllegalArgumentException("name == null");
            }
            if (this.encodedQueryNamesAndValues == null) {
                return this;
            }
            String nameToRemove = HttpUrl.canonicalize(name, HttpUrl.QUERY_COMPONENT_ENCODE_SET, false, true);
            removeAllCanonicalQueryParameters(nameToRemove);
            return this;
        }

        public Builder removeAllEncodedQueryParameters(String encodedName) {
            if (encodedName == null) {
                throw new IllegalArgumentException("encodedName == null");
            }
            if (this.encodedQueryNamesAndValues == null) {
                return this;
            }
            removeAllCanonicalQueryParameters(HttpUrl.canonicalize(encodedName, HttpUrl.QUERY_COMPONENT_ENCODE_SET, true, true));
            return this;
        }

        private void removeAllCanonicalQueryParameters(String canonicalName) {
            for (int i = this.encodedQueryNamesAndValues.size() - 2; i >= 0; i -= 2) {
                if (canonicalName.equals(this.encodedQueryNamesAndValues.get(i))) {
                    this.encodedQueryNamesAndValues.remove(i + 1);
                    this.encodedQueryNamesAndValues.remove(i);
                    if (this.encodedQueryNamesAndValues.isEmpty()) {
                        this.encodedQueryNamesAndValues = null;
                        return;
                    }
                }
            }
        }

        public Builder fragment(String fragment) {
            if (fragment == null) {
                throw new IllegalArgumentException("fragment == null");
            }
            this.encodedFragment = HttpUrl.canonicalize(fragment, HttpUrl.FRAGMENT_ENCODE_SET, false, false);
            return this;
        }

        public Builder encodedFragment(String encodedFragment) {
            if (encodedFragment == null) {
                throw new IllegalArgumentException("encodedFragment == null");
            }
            this.encodedFragment = HttpUrl.canonicalize(encodedFragment, HttpUrl.FRAGMENT_ENCODE_SET, true, false);
            return this;
        }

        public HttpUrl build() {
            if (this.scheme == null) {
                throw new IllegalStateException("scheme == null");
            }
            if (this.host == null) {
                throw new IllegalStateException("host == null");
            }
            return new HttpUrl(this);
        }

        public String toString() {
            StringBuilder result = new StringBuilder();
            result.append(this.scheme);
            result.append("://");
            if (!this.encodedUsername.isEmpty() || !this.encodedPassword.isEmpty()) {
                result.append(this.encodedUsername);
                if (!this.encodedPassword.isEmpty()) {
                    result.append(':');
                    result.append(this.encodedPassword);
                }
                result.append('@');
            }
            if (this.host.indexOf(58) != -1) {
                result.append('[');
                result.append(this.host);
                result.append(']');
            } else {
                result.append(this.host);
            }
            int effectivePort = effectivePort();
            if (effectivePort != HttpUrl.defaultPort(this.scheme)) {
                result.append(':');
                result.append(effectivePort);
            }
            HttpUrl.pathSegmentsToString(result, this.encodedPathSegments);
            if (this.encodedQueryNamesAndValues != null) {
                result.append('?');
                HttpUrl.namesAndValuesToQueryString(result, this.encodedQueryNamesAndValues);
            }
            if (this.encodedFragment != null) {
                result.append('#');
                result.append(this.encodedFragment);
            }
            return result.toString();
        }

        HttpUrl parse(HttpUrl base, String input) {
            int pos = skipLeadingAsciiWhitespace(input, 0, input.length());
            int limit = skipTrailingAsciiWhitespace(input, pos, input.length());
            int schemeDelimiterOffset = schemeDelimiterOffset(input, pos, limit);
            if (schemeDelimiterOffset != -1) {
                if (input.regionMatches(true, pos, "https:", 0, 6)) {
                    this.scheme = "https";
                    pos += "https:".length();
                } else if (input.regionMatches(true, pos, "http:", 0, 5)) {
                    this.scheme = "http";
                    pos += "http:".length();
                } else {
                    return null;
                }
            } else if (base != null) {
                this.scheme = base.scheme;
            } else {
                return null;
            }
            boolean hasUsername = false;
            boolean hasPassword = false;
            int slashCount = slashCount(input, pos, limit);
            if (slashCount >= 2 || base == null || !base.scheme.equals(this.scheme)) {
                int pos2 = pos + slashCount;
                while (true) {
                    int componentDelimiterOffset = HttpUrl.delimiterOffset(input, pos2, limit, "@/\\?#");
                    int c = componentDelimiterOffset != limit ? input.charAt(componentDelimiterOffset) : -1;
                    switch (c) {
                        case -1:
                        case 35:
                        case 47:
                        case 63:
                        case 92:
                            int portColonOffset = portColonOffset(input, pos2, componentDelimiterOffset);
                            if (portColonOffset + 1 < componentDelimiterOffset) {
                                this.host = canonicalizeHost(input, pos2, portColonOffset);
                                this.port = parsePort(input, portColonOffset + 1, componentDelimiterOffset);
                                if (this.port == -1) {
                                    return null;
                                }
                            } else {
                                this.host = canonicalizeHost(input, pos2, portColonOffset);
                                this.port = HttpUrl.defaultPort(this.scheme);
                            }
                            if (this.host != null) {
                                pos = componentDelimiterOffset;
                                break;
                            } else {
                                return null;
                            }
                        case 64:
                            if (!hasPassword) {
                                int passwordColonOffset = HttpUrl.delimiterOffset(input, pos2, componentDelimiterOffset, ":");
                                String canonicalUsername = HttpUrl.canonicalize(input, pos2, passwordColonOffset, " \"':;<=>@[]^`{}|/\\?#", true, false);
                                this.encodedUsername = hasUsername ? this.encodedUsername + "%40" + canonicalUsername : canonicalUsername;
                                if (passwordColonOffset != componentDelimiterOffset) {
                                    hasPassword = true;
                                    this.encodedPassword = HttpUrl.canonicalize(input, passwordColonOffset + 1, componentDelimiterOffset, " \"':;<=>@[]^`{}|/\\?#", true, false);
                                }
                                hasUsername = true;
                            } else {
                                this.encodedPassword += "%40" + HttpUrl.canonicalize(input, pos2, componentDelimiterOffset, " \"':;<=>@[]^`{}|/\\?#", true, false);
                            }
                            pos2 = componentDelimiterOffset + 1;
                            continue;
                    }
                }
            } else {
                this.encodedUsername = base.encodedUsername();
                this.encodedPassword = base.encodedPassword();
                this.host = base.host;
                this.port = base.port;
                this.encodedPathSegments.clear();
                this.encodedPathSegments.addAll(base.encodedPathSegments());
                if (pos == limit || input.charAt(pos) == '#') {
                    encodedQuery(base.encodedQuery());
                }
            }
            int pathDelimiterOffset = HttpUrl.delimiterOffset(input, pos, limit, "?#");
            resolvePath(input, pos, pathDelimiterOffset);
            int pos3 = pathDelimiterOffset;
            if (pos3 < limit && input.charAt(pos3) == '?') {
                int queryDelimiterOffset = HttpUrl.delimiterOffset(input, pos3, limit, "#");
                this.encodedQueryNamesAndValues = HttpUrl.queryStringToNamesAndValues(HttpUrl.canonicalize(input, pos3 + 1, queryDelimiterOffset, HttpUrl.QUERY_ENCODE_SET, true, true));
                pos3 = queryDelimiterOffset;
            }
            if (pos3 < limit && input.charAt(pos3) == '#') {
                this.encodedFragment = HttpUrl.canonicalize(input, pos3 + 1, limit, HttpUrl.FRAGMENT_ENCODE_SET, true, false);
            }
            return build();
        }

        private void resolvePath(String input, int pos, int limit) {
            if (pos == limit) {
                return;
            }
            char c = input.charAt(pos);
            if (c == '/' || c == '\\') {
                this.encodedPathSegments.clear();
                this.encodedPathSegments.add(HttpUrl.FRAGMENT_ENCODE_SET);
                pos++;
            } else {
                this.encodedPathSegments.set(this.encodedPathSegments.size() - 1, HttpUrl.FRAGMENT_ENCODE_SET);
            }
            int i = pos;
            while (i < limit) {
                int pathSegmentDelimiterOffset = HttpUrl.delimiterOffset(input, i, limit, "/\\");
                boolean segmentHasTrailingSlash = pathSegmentDelimiterOffset < limit;
                push(input, i, pathSegmentDelimiterOffset, segmentHasTrailingSlash, true);
                i = pathSegmentDelimiterOffset;
                if (segmentHasTrailingSlash) {
                    i++;
                }
            }
        }

        private void push(String input, int pos, int limit, boolean addTrailingSlash, boolean alreadyEncoded) {
            String segment = HttpUrl.canonicalize(input, pos, limit, HttpUrl.PATH_SEGMENT_ENCODE_SET, alreadyEncoded, false);
            if (isDot(segment)) {
                return;
            }
            if (isDotDot(segment)) {
                pop();
                return;
            }
            if (this.encodedPathSegments.get(this.encodedPathSegments.size() - 1).isEmpty()) {
                this.encodedPathSegments.set(this.encodedPathSegments.size() - 1, segment);
            } else {
                this.encodedPathSegments.add(segment);
            }
            if (addTrailingSlash) {
                this.encodedPathSegments.add(HttpUrl.FRAGMENT_ENCODE_SET);
            }
        }

        private boolean isDot(String input) {
            return input.equals(".") || input.equalsIgnoreCase("%2e");
        }

        private boolean isDotDot(String input) {
            return input.equals("..") || input.equalsIgnoreCase("%2e.") || input.equalsIgnoreCase(".%2e") || input.equalsIgnoreCase("%2e%2e");
        }

        private void pop() {
            String removed = this.encodedPathSegments.remove(this.encodedPathSegments.size() - 1);
            if (removed.isEmpty() && !this.encodedPathSegments.isEmpty()) {
                this.encodedPathSegments.set(this.encodedPathSegments.size() - 1, HttpUrl.FRAGMENT_ENCODE_SET);
            } else {
                this.encodedPathSegments.add(HttpUrl.FRAGMENT_ENCODE_SET);
            }
        }

        private int skipLeadingAsciiWhitespace(String input, int pos, int limit) {
            for (int i = pos; i < limit; i++) {
                switch (input.charAt(i)) {
                    case '\t':
                    case '\n':
                    case '\f':
                    case '\r':
                    case ' ':
                    default:
                        return i;
                }
            }
            return limit;
        }

        private int skipTrailingAsciiWhitespace(String input, int pos, int limit) {
            for (int i = limit - 1; i >= pos; i--) {
                switch (input.charAt(i)) {
                    case '\t':
                    case '\n':
                    case '\f':
                    case '\r':
                    case ' ':
                    default:
                        return i + 1;
                }
            }
            return pos;
        }

        private static int schemeDelimiterOffset(String input, int pos, int limit) {
            if (limit - pos < 2) {
                return -1;
            }
            char c0 = input.charAt(pos);
            if ((c0 < 'a' || c0 > 'z') && (c0 < 'A' || c0 > 'Z')) {
                return -1;
            }
            for (int i = pos + 1; i < limit; i++) {
                char c = input.charAt(i);
                if ((c < 'a' || c > 'z') && ((c < 'A' || c > 'Z') && c != '+' && c != '-' && c != '.')) {
                    if (c == ':') {
                        return i;
                    }
                    return -1;
                }
            }
            return -1;
        }

        private static int slashCount(String input, int pos, int limit) {
            char c;
            int slashCount = 0;
            while (pos < limit && ((c = input.charAt(pos)) == '\\' || c == '/')) {
                slashCount++;
                pos++;
            }
            return slashCount;
        }

        /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
        private static int portColonOffset(String input, int pos, int limit) {
            int i = pos;
            while (i < limit) {
                switch (input.charAt(i)) {
                    case ':':
                        return i;
                    case '[':
                        do {
                            i++;
                            if (i < limit) {
                            }
                            i++;
                        } while (input.charAt(i) != ']');
                        i++;
                        break;
                    default:
                        i++;
                }
            }
            return limit;
        }

        private static String canonicalizeHost(String input, int pos, int limit) {
            int length;
            String percentDecoded = HttpUrl.percentDecode(input, pos, limit);
            if (percentDecoded.startsWith("[") && percentDecoded.endsWith("]")) {
                InetAddress inetAddress = decodeIpv6(percentDecoded, 1, percentDecoded.length() - 1);
                if (inetAddress == null) {
                    return null;
                }
                byte[] address = inetAddress.getAddress();
                if (address.length == 16) {
                    return inet6AddressToAscii(address);
                }
                throw new AssertionError();
            }
            String idnDecoded = domainToAscii(percentDecoded);
            if (idnDecoded == null || HttpUrl.delimiterOffset(idnDecoded, 0, length, "��\t\n\r #%/:?@[\\]") != (length = idnDecoded.length())) {
                return null;
            }
            return idnDecoded;
        }

        /* JADX WARN: Code restructure failed: missing block: B:49:0x00fc, code lost:
        
            if (r11 == r0.length) goto L60;
         */
        /* JADX WARN: Code restructure failed: missing block: B:51:0x0102, code lost:
        
            if (r12 != (-1)) goto L54;
         */
        /* JADX WARN: Code restructure failed: missing block: B:52:0x0105, code lost:
        
            return null;
         */
        /* JADX WARN: Code restructure failed: missing block: B:54:0x0107, code lost:
        
            java.lang.System.arraycopy(r0, r12, r0, r0.length - (r11 - r12), r11 - r12);
            java.util.Arrays.fill(r0, r12, r12 + (r0.length - r11), (byte) 0);
         */
        /* JADX WARN: Code restructure failed: missing block: B:56:0x012e, code lost:
        
            return java.net.InetAddress.getByAddress(r0);
         */
        /* JADX WARN: Code restructure failed: missing block: B:59:0x0138, code lost:
        
            throw new java.lang.AssertionError();
         */
        /* JADX WARN: Removed duplicated region for block: B:37:0x009b  */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        private static java.net.InetAddress decodeIpv6(java.lang.String r7, int r8, int r9) {
            /*
                Method dump skipped, instructions count: 313
                To view this dump add '--comments-level debug' option
            */
            throw new UnsupportedOperationException("Method not decompiled: com.squareup.okhttp.HttpUrl.Builder.decodeIpv6(java.lang.String, int, int):java.net.InetAddress");
        }

        private static boolean decodeIpv4Suffix(String input, int pos, int limit, byte[] address, int addressOffset) {
            char c;
            int b = addressOffset;
            int i = pos;
            while (i < limit) {
                if (b == address.length) {
                    return false;
                }
                if (b != addressOffset) {
                    if (input.charAt(i) != '.') {
                        return false;
                    }
                    i++;
                }
                int value = 0;
                int groupOffset = i;
                while (i < limit && (c = input.charAt(i)) >= '0' && c <= '9') {
                    if (value == 0 && groupOffset != i) {
                        return false;
                    }
                    value = ((value * 10) + c) - 48;
                    if (value > 255) {
                        return false;
                    }
                    i++;
                }
                int groupLength = i - groupOffset;
                if (groupLength == 0) {
                    return false;
                }
                int i2 = b;
                b++;
                address[i2] = (byte) value;
            }
            return b == addressOffset + 4;
        }

        private static String domainToAscii(String input) {
            try {
                String result = IDN.toASCII(input).toLowerCase(Locale.US);
                if (result.isEmpty()) {
                    return null;
                }
                return result;
            } catch (IllegalArgumentException e) {
                return null;
            }
        }

        private static String inet6AddressToAscii(byte[] address) {
            int longestRunOffset = -1;
            int longestRunLength = 0;
            int i = 0;
            while (i < address.length) {
                int currentRunOffset = i;
                while (i < 16 && address[i] == 0 && address[i + 1] == 0) {
                    i += 2;
                }
                int currentRunLength = i - currentRunOffset;
                if (currentRunLength > longestRunLength) {
                    longestRunOffset = currentRunOffset;
                    longestRunLength = currentRunLength;
                }
                i += 2;
            }
            Buffer result = new Buffer();
            int i2 = 0;
            while (i2 < address.length) {
                if (i2 == longestRunOffset) {
                    result.writeByte(58);
                    i2 += longestRunLength;
                    if (i2 == 16) {
                        result.writeByte(58);
                    }
                } else {
                    if (i2 > 0) {
                        result.writeByte(58);
                    }
                    int group = ((address[i2] & 255) << 8) | (address[i2 + 1] & 255);
                    result.writeHexadecimalUnsignedLong(group);
                    i2 += 2;
                }
            }
            return result.readUtf8();
        }

        private static int parsePort(String input, int pos, int limit) {
            try {
                String portString = HttpUrl.canonicalize(input, pos, limit, HttpUrl.FRAGMENT_ENCODE_SET, false, false);
                int i = Integer.parseInt(portString);
                if (i <= 0 || i > 65535) {
                    return -1;
                }
                return i;
            } catch (NumberFormatException e) {
                return -1;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static int delimiterOffset(String input, int pos, int limit, String delimiters) {
        for (int i = pos; i < limit; i++) {
            if (delimiters.indexOf(input.charAt(i)) != -1) {
                return i;
            }
        }
        return limit;
    }

    static String percentDecode(String encoded) {
        return percentDecode(encoded, 0, encoded.length());
    }

    private List<String> percentDecode(List<String> list) {
        List<String> result = new ArrayList<>(list.size());
        Iterator<String> it = list.iterator();
        while (it.hasNext()) {
            String s = it.next();
            result.add(s != null ? percentDecode(s) : null);
        }
        return Collections.unmodifiableList(result);
    }

    static String percentDecode(String encoded, int pos, int limit) {
        for (int i = pos; i < limit; i++) {
            char c = encoded.charAt(i);
            if (c == '%') {
                Buffer out = new Buffer();
                out.writeUtf8(encoded, pos, i);
                percentDecode(out, encoded, i, limit);
                return out.readUtf8();
            }
        }
        return encoded.substring(pos, limit);
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x0058  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    static void percentDecode(okio.Buffer r4, java.lang.String r5, int r6, int r7) {
        /*
            r0 = r6
            r9 = r0
        L3:
            r0 = r9
            r1 = r7
            if (r0 >= r1) goto L6c
            r0 = r5
            r1 = r9
            int r0 = r0.codePointAt(r1)
            r8 = r0
            r0 = r8
            r1 = 37
            if (r0 != r1) goto L58
            r0 = r9
            r1 = 2
            int r0 = r0 + r1
            r1 = r7
            if (r0 >= r1) goto L58
            r0 = r5
            r1 = r9
            r2 = 1
            int r1 = r1 + r2
            char r0 = r0.charAt(r1)
            int r0 = decodeHexDigit(r0)
            r10 = r0
            r0 = r5
            r1 = r9
            r2 = 2
            int r1 = r1 + r2
            char r0 = r0.charAt(r1)
            int r0 = decodeHexDigit(r0)
            r11 = r0
            r0 = r10
            r1 = -1
            if (r0 == r1) goto L58
            r0 = r11
            r1 = -1
            if (r0 == r1) goto L58
            r0 = r4
            r1 = r10
            r2 = 4
            int r1 = r1 << r2
            r2 = r11
            int r1 = r1 + r2
            okio.Buffer r0 = r0.writeByte(r1)
            int r9 = r9 + 2
            goto L5f
        L58:
            r0 = r4
            r1 = r8
            okio.Buffer r0 = r0.writeUtf8CodePoint(r1)
        L5f:
            r0 = r9
            r1 = r8
            int r1 = java.lang.Character.charCount(r1)
            int r0 = r0 + r1
            r9 = r0
            goto L3
        L6c:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.squareup.okhttp.HttpUrl.percentDecode(okio.Buffer, java.lang.String, int, int):void");
    }

    static int decodeHexDigit(char c) {
        if (c >= '0' && c <= '9') {
            return c - '0';
        }
        if (c >= 'a' && c <= 'f') {
            return (c - 'a') + 10;
        }
        if (c < 'A' || c > 'F') {
            return -1;
        }
        return (c - 'A') + 10;
    }

    static String canonicalize(String input, int pos, int limit, String encodeSet, boolean alreadyEncoded, boolean query) {
        int i;
        int i2 = pos;
        while (true) {
            i = i2;
            if (i < limit) {
                int codePoint = input.codePointAt(i);
                if (codePoint < 32 || codePoint >= 127 || encodeSet.indexOf(codePoint) != -1 || ((codePoint == 37 && !alreadyEncoded) || (query && codePoint == 43))) {
                    break;
                }
                i2 = i + Character.charCount(codePoint);
            } else {
                return input.substring(pos, limit);
            }
        }
        Buffer out = new Buffer();
        out.writeUtf8(input, pos, i);
        canonicalize(out, input, i, limit, encodeSet, alreadyEncoded, query);
        return out.readUtf8();
    }

    static void canonicalize(Buffer out, String input, int pos, int limit, String encodeSet, boolean alreadyEncoded, boolean query) {
        Buffer utf8Buffer = null;
        int i = pos;
        while (true) {
            int i2 = i;
            if (i2 < limit) {
                int codePoint = input.codePointAt(i2);
                if (!alreadyEncoded || (codePoint != 9 && codePoint != 10 && codePoint != 12 && codePoint != 13)) {
                    if (query && codePoint == 43) {
                        out.writeUtf8(alreadyEncoded ? "%20" : "%2B");
                    } else if (codePoint < 32 || codePoint >= 127 || encodeSet.indexOf(codePoint) != -1 || (codePoint == 37 && !alreadyEncoded)) {
                        if (utf8Buffer == null) {
                            utf8Buffer = new Buffer();
                        }
                        utf8Buffer.writeUtf8CodePoint(codePoint);
                        while (!utf8Buffer.exhausted()) {
                            int b = utf8Buffer.readByte() & 255;
                            out.writeByte(37);
                            out.writeByte(HEX_DIGITS[(b >> 4) & 15]);
                            out.writeByte(HEX_DIGITS[b & 15]);
                        }
                    } else {
                        out.writeUtf8CodePoint(codePoint);
                    }
                }
                i = i2 + Character.charCount(codePoint);
            } else {
                return;
            }
        }
    }

    static String canonicalize(String input, String encodeSet, boolean alreadyEncoded, boolean query) {
        return canonicalize(input, 0, input.length(), encodeSet, alreadyEncoded, query);
    }
}
