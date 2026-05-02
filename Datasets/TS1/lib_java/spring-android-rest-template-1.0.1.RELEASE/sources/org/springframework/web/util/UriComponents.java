package org.springframework.web.util;

import java.io.ByteArrayOutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.springframework.util.Assert;
import org.springframework.util.CollectionUtils;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.util.StringUtils;

/* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/web/util/UriComponents.class */
public final class UriComponents {
    private static final String DEFAULT_ENCODING = "UTF-8";
    private static final char PATH_DELIMITER = '/';
    private final String scheme;
    private final String userInfo;
    private final String host;
    private final int port;
    private final PathComponent path;
    private final MultiValueMap<String, String> queryParams;
    private final String fragment;
    private final boolean encoded;
    private static final Pattern NAMES_PATTERN = Pattern.compile("\\{([^/]+?)\\}");
    static final PathComponent NULL_PATH_COMPONENT = new PathComponent() { // from class: org.springframework.web.util.UriComponents.1
        @Override // org.springframework.web.util.UriComponents.PathComponent
        public String getPath() {
            return null;
        }

        @Override // org.springframework.web.util.UriComponents.PathComponent
        public List<String> getPathSegments() {
            return Collections.emptyList();
        }

        @Override // org.springframework.web.util.UriComponents.PathComponent
        public PathComponent encode(String encoding) throws UnsupportedEncodingException {
            return this;
        }

        @Override // org.springframework.web.util.UriComponents.PathComponent
        public void verify() {
        }

        @Override // org.springframework.web.util.UriComponents.PathComponent
        public PathComponent expand(UriTemplateVariables uriVariables) {
            return this;
        }

        public boolean equals(Object o) {
            return this == o;
        }

        public int hashCode() {
            return 42;
        }
    };

    /* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/web/util/UriComponents$PathComponent.class */
    interface PathComponent {
        String getPath();

        List<String> getPathSegments();

        PathComponent encode(String str) throws UnsupportedEncodingException;

        void verify();

        PathComponent expand(UriTemplateVariables uriTemplateVariables);
    }

    /* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/web/util/UriComponents$UriTemplateVariables.class */
    private interface UriTemplateVariables {
        Object getValue(String str);
    }

    UriComponents(String scheme, String userInfo, String host, int port, PathComponent path, MultiValueMap<String, String> queryParams, String fragment, boolean encoded, boolean verify) {
        this.scheme = scheme;
        this.userInfo = userInfo;
        this.host = host;
        this.port = port;
        this.path = path != null ? path : NULL_PATH_COMPONENT;
        this.queryParams = CollectionUtils.unmodifiableMultiValueMap(queryParams != null ? queryParams : new LinkedMultiValueMap<>(0));
        this.fragment = fragment;
        this.encoded = encoded;
        if (verify) {
            verify();
        }
    }

    public String getScheme() {
        return this.scheme;
    }

    public String getUserInfo() {
        return this.userInfo;
    }

    public String getHost() {
        return this.host;
    }

    public int getPort() {
        return this.port;
    }

    public String getPath() {
        return this.path.getPath();
    }

    public List<String> getPathSegments() {
        return this.path.getPathSegments();
    }

    public String getQuery() {
        if (!this.queryParams.isEmpty()) {
            StringBuilder queryBuilder = new StringBuilder();
            for (Map.Entry<String, List<String>> entry : this.queryParams.entrySet()) {
                String name = entry.getKey();
                List<String> values = entry.getValue();
                if (CollectionUtils.isEmpty(values)) {
                    if (queryBuilder.length() != 0) {
                        queryBuilder.append('&');
                    }
                    queryBuilder.append(name);
                } else {
                    for (Object value : values) {
                        if (queryBuilder.length() != 0) {
                            queryBuilder.append('&');
                        }
                        queryBuilder.append(name);
                        if (value != null) {
                            queryBuilder.append('=');
                            queryBuilder.append(value.toString());
                        }
                    }
                }
            }
            return queryBuilder.toString();
        }
        return null;
    }

    public MultiValueMap<String, String> getQueryParams() {
        return this.queryParams;
    }

    public String getFragment() {
        return this.fragment;
    }

    public UriComponents encode() {
        try {
            return encode(DEFAULT_ENCODING);
        } catch (UnsupportedEncodingException e) {
            throw new InternalError("\"UTF-8\" not supported");
        }
    }

    public UriComponents encode(String encoding) throws UnsupportedEncodingException {
        Assert.hasLength(encoding, "'encoding' must not be empty");
        if (this.encoded) {
            return this;
        }
        String encodedScheme = encodeUriComponent(this.scheme, encoding, Type.SCHEME);
        String encodedUserInfo = encodeUriComponent(this.userInfo, encoding, Type.USER_INFO);
        String encodedHost = encodeUriComponent(this.host, encoding, Type.HOST);
        PathComponent encodedPath = this.path.encode(encoding);
        LinkedMultiValueMap linkedMultiValueMap = new LinkedMultiValueMap(this.queryParams.size());
        for (Map.Entry<String, List<String>> entry : this.queryParams.entrySet()) {
            String encodedName = encodeUriComponent(entry.getKey(), encoding, Type.QUERY_PARAM);
            List<String> encodedValues = new ArrayList<>(entry.getValue().size());
            for (String value : entry.getValue()) {
                String encodedValue = encodeUriComponent(value, encoding, Type.QUERY_PARAM);
                encodedValues.add(encodedValue);
            }
            linkedMultiValueMap.put(encodedName, encodedValues);
        }
        String encodedFragment = encodeUriComponent(this.fragment, encoding, Type.FRAGMENT);
        return new UriComponents(encodedScheme, encodedUserInfo, encodedHost, this.port, encodedPath, linkedMultiValueMap, encodedFragment, true, false);
    }

    static String encodeUriComponent(String source, String encoding, Type type) throws UnsupportedEncodingException {
        if (source == null) {
            return null;
        }
        Assert.hasLength(encoding, "'encoding' must not be empty");
        byte[] bytes = encodeBytes(source.getBytes(encoding), type);
        return new String(bytes, "US-ASCII");
    }

    private static byte[] encodeBytes(byte[] source, Type type) {
        Assert.notNull(source, "'source' must not be null");
        Assert.notNull(type, "'type' must not be null");
        ByteArrayOutputStream bos = new ByteArrayOutputStream(source.length);
        for (int i = 0; i < source.length; i++) {
            int b = source[i];
            if (b < 0) {
                b += 256;
            }
            if (type.isAllowed(b)) {
                bos.write(b);
            } else {
                bos.write(37);
                char hex1 = Character.toUpperCase(Character.forDigit((b >> 4) & 15, 16));
                char hex2 = Character.toUpperCase(Character.forDigit(b & 15, 16));
                bos.write(hex1);
                bos.write(hex2);
            }
        }
        return bos.toByteArray();
    }

    private void verify() {
        if (!this.encoded) {
            return;
        }
        verifyUriComponent(this.scheme, Type.SCHEME);
        verifyUriComponent(this.userInfo, Type.USER_INFO);
        verifyUriComponent(this.host, Type.HOST);
        this.path.verify();
        for (Map.Entry<String, List<String>> entry : this.queryParams.entrySet()) {
            verifyUriComponent(entry.getKey(), Type.QUERY_PARAM);
            for (String value : entry.getValue()) {
                verifyUriComponent(value, Type.QUERY_PARAM);
            }
        }
        verifyUriComponent(this.fragment, Type.FRAGMENT);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void verifyUriComponent(String source, Type type) {
        if (source == null) {
            return;
        }
        int length = source.length();
        int i = 0;
        while (i < length) {
            char ch = source.charAt(i);
            if (ch == '%') {
                if (i + 2 < length) {
                    char hex1 = source.charAt(i + 1);
                    char hex2 = source.charAt(i + 2);
                    int u = Character.digit(hex1, 16);
                    int l = Character.digit(hex2, 16);
                    if (u == -1 || l == -1) {
                        throw new IllegalArgumentException("Invalid encoded sequence \"" + source.substring(i) + "\"");
                    }
                    i += 2;
                } else {
                    throw new IllegalArgumentException("Invalid encoded sequence \"" + source.substring(i) + "\"");
                }
            } else if (!type.isAllowed(ch)) {
                throw new IllegalArgumentException("Invalid character '" + ch + "' for " + type.name() + " in \"" + source + "\"");
            }
            i++;
        }
    }

    public UriComponents expand(Map<String, ?> uriVariables) {
        Assert.notNull(uriVariables, "'uriVariables' must not be null");
        return expandInternal(new MapTemplateVariables(uriVariables));
    }

    public UriComponents expand(Object... uriVariableValues) {
        Assert.notNull(uriVariableValues, "'uriVariableValues' must not be null");
        return expandInternal(new VarArgsTemplateVariables(uriVariableValues));
    }

    private UriComponents expandInternal(UriTemplateVariables uriVariables) {
        Assert.state(!this.encoded, "Cannot expand an already encoded UriComponents object");
        String expandedScheme = expandUriComponent(this.scheme, uriVariables);
        String expandedUserInfo = expandUriComponent(this.userInfo, uriVariables);
        String expandedHost = expandUriComponent(this.host, uriVariables);
        PathComponent expandedPath = this.path.expand(uriVariables);
        LinkedMultiValueMap linkedMultiValueMap = new LinkedMultiValueMap(this.queryParams.size());
        for (Map.Entry<String, List<String>> entry : this.queryParams.entrySet()) {
            String expandedName = expandUriComponent(entry.getKey(), uriVariables);
            List<String> expandedValues = new ArrayList<>(entry.getValue().size());
            for (String value : entry.getValue()) {
                String expandedValue = expandUriComponent(value, uriVariables);
                expandedValues.add(expandedValue);
            }
            linkedMultiValueMap.put(expandedName, expandedValues);
        }
        String expandedFragment = expandUriComponent(this.fragment, uriVariables);
        return new UriComponents(expandedScheme, expandedUserInfo, expandedHost, this.port, expandedPath, linkedMultiValueMap, expandedFragment, false, false);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static String expandUriComponent(String source, UriTemplateVariables uriVariables) {
        if (source == null) {
            return null;
        }
        if (source.indexOf(123) == -1) {
            return source;
        }
        Matcher matcher = NAMES_PATTERN.matcher(source);
        StringBuffer sb = new StringBuffer();
        while (matcher.find()) {
            String match = matcher.group(1);
            String variableName = getVariableName(match);
            Object variableValue = uriVariables.getValue(variableName);
            String variableValueString = getVariableValueAsString(variableValue);
            String replacement = Matcher.quoteReplacement(variableValueString);
            matcher.appendReplacement(sb, replacement);
        }
        matcher.appendTail(sb);
        return sb.toString();
    }

    private static String getVariableName(String match) {
        int colonIdx = match.indexOf(58);
        return colonIdx == -1 ? match : match.substring(0, colonIdx);
    }

    private static String getVariableValueAsString(Object variableValue) {
        return variableValue != null ? variableValue.toString() : "";
    }

    public UriComponents normalize() {
        String normalizedPath = StringUtils.cleanPath(getPath());
        return new UriComponents(this.scheme, this.userInfo, this.host, this.port, new FullPathComponent(normalizedPath), this.queryParams, this.fragment, this.encoded, false);
    }

    public String toUriString() {
        StringBuilder uriBuilder = new StringBuilder();
        if (this.scheme != null) {
            uriBuilder.append(this.scheme);
            uriBuilder.append(':');
        }
        if (this.userInfo != null || this.host != null) {
            uriBuilder.append("//");
            if (this.userInfo != null) {
                uriBuilder.append(this.userInfo);
                uriBuilder.append('@');
            }
            if (this.host != null) {
                uriBuilder.append(this.host);
            }
            if (this.port != -1) {
                uriBuilder.append(':');
                uriBuilder.append(this.port);
            }
        }
        String path = getPath();
        if (StringUtils.hasLength(path)) {
            if (uriBuilder.length() != 0 && path.charAt(0) != PATH_DELIMITER) {
                uriBuilder.append('/');
            }
            uriBuilder.append(path);
        }
        String query = getQuery();
        if (query != null) {
            uriBuilder.append('?');
            uriBuilder.append(query);
        }
        if (this.fragment != null) {
            uriBuilder.append('#');
            uriBuilder.append(this.fragment);
        }
        return uriBuilder.toString();
    }

    public URI toUri() {
        try {
            if (this.encoded) {
                return new URI(toUriString());
            }
            String path = getPath();
            if (StringUtils.hasLength(path) && path.charAt(0) != PATH_DELIMITER) {
                path = '/' + path;
            }
            return new URI(getScheme(), getUserInfo(), getHost(), getPort(), path, getQuery(), getFragment());
        } catch (URISyntaxException ex) {
            throw new IllegalStateException("Could not create URI object: " + ex.getMessage(), ex);
        }
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o instanceof UriComponents) {
            UriComponents other = (UriComponents) o;
            if (this.scheme != null) {
                if (!this.scheme.equals(other.scheme)) {
                    return false;
                }
            } else if (other.scheme != null) {
                return false;
            }
            if (this.userInfo != null) {
                if (!this.userInfo.equals(other.userInfo)) {
                    return false;
                }
            } else if (other.userInfo != null) {
                return false;
            }
            if (this.host != null) {
                if (!this.host.equals(other.host)) {
                    return false;
                }
            } else if (other.host != null) {
                return false;
            }
            if (this.port != other.port || !this.path.equals(other.path) || !this.queryParams.equals(other.queryParams)) {
                return false;
            }
            if (this.fragment != null) {
                if (!this.fragment.equals(other.fragment)) {
                    return false;
                }
                return true;
            }
            if (other.fragment != null) {
                return false;
            }
            return true;
        }
        return false;
    }

    public int hashCode() {
        int result = this.scheme != null ? this.scheme.hashCode() : 0;
        return (31 * ((31 * ((31 * ((31 * ((31 * ((31 * result) + (this.userInfo != null ? this.userInfo.hashCode() : 0))) + (this.host != null ? this.host.hashCode() : 0))) + this.port)) + this.path.hashCode())) + this.queryParams.hashCode())) + (this.fragment != null ? this.fragment.hashCode() : 0);
    }

    public String toString() {
        return toUriString();
    }

    /* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/web/util/UriComponents$Type.class */
    enum Type {
        SCHEME { // from class: org.springframework.web.util.UriComponents.Type.1
            @Override // org.springframework.web.util.UriComponents.Type
            public boolean isAllowed(int c) {
                return isAlpha(c) || isDigit(c) || 43 == c || 45 == c || 46 == c;
            }
        },
        AUTHORITY { // from class: org.springframework.web.util.UriComponents.Type.2
            @Override // org.springframework.web.util.UriComponents.Type
            public boolean isAllowed(int c) {
                return isUnreserved(c) || isSubDelimiter(c) || 58 == c || 64 == c;
            }
        },
        USER_INFO { // from class: org.springframework.web.util.UriComponents.Type.3
            @Override // org.springframework.web.util.UriComponents.Type
            public boolean isAllowed(int c) {
                return isUnreserved(c) || isSubDelimiter(c) || 58 == c;
            }
        },
        HOST { // from class: org.springframework.web.util.UriComponents.Type.4
            @Override // org.springframework.web.util.UriComponents.Type
            public boolean isAllowed(int c) {
                return isUnreserved(c) || isSubDelimiter(c);
            }
        },
        PORT { // from class: org.springframework.web.util.UriComponents.Type.5
            @Override // org.springframework.web.util.UriComponents.Type
            public boolean isAllowed(int c) {
                return isDigit(c);
            }
        },
        PATH { // from class: org.springframework.web.util.UriComponents.Type.6
            @Override // org.springframework.web.util.UriComponents.Type
            public boolean isAllowed(int c) {
                return isPchar(c) || UriComponents.PATH_DELIMITER == c;
            }
        },
        PATH_SEGMENT { // from class: org.springframework.web.util.UriComponents.Type.7
            @Override // org.springframework.web.util.UriComponents.Type
            public boolean isAllowed(int c) {
                return isPchar(c);
            }
        },
        QUERY { // from class: org.springframework.web.util.UriComponents.Type.8
            @Override // org.springframework.web.util.UriComponents.Type
            public boolean isAllowed(int c) {
                return isPchar(c) || UriComponents.PATH_DELIMITER == c || 63 == c;
            }
        },
        QUERY_PARAM { // from class: org.springframework.web.util.UriComponents.Type.9
            @Override // org.springframework.web.util.UriComponents.Type
            public boolean isAllowed(int c) {
                if (61 == c || 43 == c || 38 == c) {
                    return false;
                }
                return isPchar(c) || UriComponents.PATH_DELIMITER == c || 63 == c;
            }
        },
        FRAGMENT { // from class: org.springframework.web.util.UriComponents.Type.10
            @Override // org.springframework.web.util.UriComponents.Type
            public boolean isAllowed(int c) {
                return isPchar(c) || UriComponents.PATH_DELIMITER == c || 63 == c;
            }
        };

        public abstract boolean isAllowed(int i);

        protected boolean isAlpha(int c) {
            return (c >= 97 && c <= 122) || (c >= 65 && c <= 90);
        }

        protected boolean isDigit(int c) {
            return c >= 48 && c <= 57;
        }

        protected boolean isGenericDelimiter(int c) {
            return 58 == c || UriComponents.PATH_DELIMITER == c || 63 == c || 35 == c || 91 == c || 93 == c || 64 == c;
        }

        protected boolean isSubDelimiter(int c) {
            return 33 == c || 36 == c || 38 == c || 39 == c || 40 == c || 41 == c || 42 == c || 43 == c || 44 == c || 59 == c || 61 == c;
        }

        protected boolean isReserved(char c) {
            return isGenericDelimiter(c) || isReserved(c);
        }

        protected boolean isUnreserved(int c) {
            return isAlpha(c) || isDigit(c) || 45 == c || 46 == c || 95 == c || 126 == c;
        }

        protected boolean isPchar(int c) {
            return isUnreserved(c) || isSubDelimiter(c) || 58 == c || 64 == c;
        }
    }

    /* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/web/util/UriComponents$FullPathComponent.class */
    static final class FullPathComponent implements PathComponent {
        private final String path;

        FullPathComponent(String path) {
            this.path = path;
        }

        @Override // org.springframework.web.util.UriComponents.PathComponent
        public String getPath() {
            return this.path;
        }

        @Override // org.springframework.web.util.UriComponents.PathComponent
        public List<String> getPathSegments() {
            String delimiter = "/";
            String[] pathSegments = StringUtils.tokenizeToStringArray(this.path, delimiter);
            return Collections.unmodifiableList(Arrays.asList(pathSegments));
        }

        @Override // org.springframework.web.util.UriComponents.PathComponent
        public PathComponent encode(String encoding) throws UnsupportedEncodingException {
            String encodedPath = UriComponents.encodeUriComponent(getPath(), encoding, Type.PATH);
            return new FullPathComponent(encodedPath);
        }

        @Override // org.springframework.web.util.UriComponents.PathComponent
        public void verify() {
            UriComponents.verifyUriComponent(this.path, Type.PATH);
        }

        @Override // org.springframework.web.util.UriComponents.PathComponent
        public PathComponent expand(UriTemplateVariables uriVariables) {
            String expandedPath = UriComponents.expandUriComponent(getPath(), uriVariables);
            return new FullPathComponent(expandedPath);
        }

        public boolean equals(Object o) {
            if (this == o) {
                return true;
            }
            if (o instanceof FullPathComponent) {
                FullPathComponent other = (FullPathComponent) o;
                return getPath().equals(other.getPath());
            }
            return false;
        }

        public int hashCode() {
            return getPath().hashCode();
        }
    }

    /* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/web/util/UriComponents$PathSegmentComponent.class */
    static final class PathSegmentComponent implements PathComponent {
        private final List<String> pathSegments;

        PathSegmentComponent(List<String> pathSegments) {
            this.pathSegments = Collections.unmodifiableList(pathSegments);
        }

        @Override // org.springframework.web.util.UriComponents.PathComponent
        public String getPath() {
            StringBuilder pathBuilder = new StringBuilder();
            pathBuilder.append('/');
            Iterator<String> iterator = this.pathSegments.iterator();
            while (iterator.hasNext()) {
                String pathSegment = iterator.next();
                pathBuilder.append(pathSegment);
                if (iterator.hasNext()) {
                    pathBuilder.append('/');
                }
            }
            return pathBuilder.toString();
        }

        @Override // org.springframework.web.util.UriComponents.PathComponent
        public List<String> getPathSegments() {
            return this.pathSegments;
        }

        @Override // org.springframework.web.util.UriComponents.PathComponent
        public PathComponent encode(String encoding) throws UnsupportedEncodingException {
            List<String> pathSegments = getPathSegments();
            List<String> encodedPathSegments = new ArrayList<>(pathSegments.size());
            for (String pathSegment : pathSegments) {
                String encodedPathSegment = UriComponents.encodeUriComponent(pathSegment, encoding, Type.PATH_SEGMENT);
                encodedPathSegments.add(encodedPathSegment);
            }
            return new PathSegmentComponent(encodedPathSegments);
        }

        @Override // org.springframework.web.util.UriComponents.PathComponent
        public void verify() {
            for (String pathSegment : getPathSegments()) {
                UriComponents.verifyUriComponent(pathSegment, Type.PATH_SEGMENT);
            }
        }

        @Override // org.springframework.web.util.UriComponents.PathComponent
        public PathComponent expand(UriTemplateVariables uriVariables) {
            List<String> pathSegments = getPathSegments();
            List<String> expandedPathSegments = new ArrayList<>(pathSegments.size());
            for (String pathSegment : pathSegments) {
                String expandedPathSegment = UriComponents.expandUriComponent(pathSegment, uriVariables);
                expandedPathSegments.add(expandedPathSegment);
            }
            return new PathSegmentComponent(expandedPathSegments);
        }

        public boolean equals(Object o) {
            if (this == o) {
                return true;
            }
            if (o instanceof PathSegmentComponent) {
                PathSegmentComponent other = (PathSegmentComponent) o;
                return getPathSegments().equals(other.getPathSegments());
            }
            return false;
        }

        public int hashCode() {
            return getPathSegments().hashCode();
        }
    }

    /* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/web/util/UriComponents$PathComponentComposite.class */
    static final class PathComponentComposite implements PathComponent {
        private final List<PathComponent> pathComponents;

        PathComponentComposite(List<PathComponent> pathComponents) {
            this.pathComponents = pathComponents;
        }

        @Override // org.springframework.web.util.UriComponents.PathComponent
        public String getPath() {
            StringBuilder pathBuilder = new StringBuilder();
            for (PathComponent pathComponent : this.pathComponents) {
                pathBuilder.append(pathComponent.getPath());
            }
            return pathBuilder.toString();
        }

        @Override // org.springframework.web.util.UriComponents.PathComponent
        public List<String> getPathSegments() {
            List<String> result = new ArrayList<>();
            for (PathComponent pathComponent : this.pathComponents) {
                result.addAll(pathComponent.getPathSegments());
            }
            return result;
        }

        @Override // org.springframework.web.util.UriComponents.PathComponent
        public PathComponent encode(String encoding) throws UnsupportedEncodingException {
            List<PathComponent> encodedComponents = new ArrayList<>(this.pathComponents.size());
            for (PathComponent pathComponent : this.pathComponents) {
                encodedComponents.add(pathComponent.encode(encoding));
            }
            return new PathComponentComposite(encodedComponents);
        }

        @Override // org.springframework.web.util.UriComponents.PathComponent
        public void verify() {
            for (PathComponent pathComponent : this.pathComponents) {
                pathComponent.verify();
            }
        }

        @Override // org.springframework.web.util.UriComponents.PathComponent
        public PathComponent expand(UriTemplateVariables uriVariables) {
            List<PathComponent> expandedComponents = new ArrayList<>(this.pathComponents.size());
            for (PathComponent pathComponent : this.pathComponents) {
                expandedComponents.add(pathComponent.expand(uriVariables));
            }
            return new PathComponentComposite(expandedComponents);
        }
    }

    /* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/web/util/UriComponents$MapTemplateVariables.class */
    private static class MapTemplateVariables implements UriTemplateVariables {
        private final Map<String, ?> uriVariables;

        public MapTemplateVariables(Map<String, ?> uriVariables) {
            this.uriVariables = uriVariables;
        }

        @Override // org.springframework.web.util.UriComponents.UriTemplateVariables
        public Object getValue(String name) {
            if (!this.uriVariables.containsKey(name)) {
                throw new IllegalArgumentException("Map has no value for '" + name + "'");
            }
            return this.uriVariables.get(name);
        }
    }

    /* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/web/util/UriComponents$VarArgsTemplateVariables.class */
    private static class VarArgsTemplateVariables implements UriTemplateVariables {
        private final Iterator<Object> valueIterator;

        public VarArgsTemplateVariables(Object... uriVariableValues) {
            this.valueIterator = Arrays.asList(uriVariableValues).iterator();
        }

        @Override // org.springframework.web.util.UriComponents.UriTemplateVariables
        public Object getValue(String name) {
            if (!this.valueIterator.hasNext()) {
                throw new IllegalArgumentException("Not enough variable values available to expand '" + name + "'");
            }
            return this.valueIterator.next();
        }
    }
}
