package org.springframework.web.util;

import java.net.URI;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.springframework.util.Assert;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.util.ObjectUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.util.UriComponents;

/* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/web/util/UriComponentsBuilder.class */
public class UriComponentsBuilder {
    private static final String SCHEME_PATTERN = "([^:/?#]+):";
    private static final String HTTP_PATTERN = "(http|https):";
    private static final String USERINFO_PATTERN = "([^@/]*)";
    private static final String HOST_PATTERN = "([^/?#:]*)";
    private static final String PORT_PATTERN = "(\\d*)";
    private static final String PATH_PATTERN = "([^?#]*)";
    private static final String QUERY_PATTERN = "([^#]*)";
    private static final String LAST_PATTERN = "(.*)";
    private String scheme;
    private String userInfo;
    private String host;
    private int port = -1;
    private PathComponentBuilder pathBuilder = NULL_PATH_COMPONENT_BUILDER;
    private final MultiValueMap<String, String> queryParams = new LinkedMultiValueMap();
    private String fragment;
    private static final Pattern QUERY_PARAM_PATTERN = Pattern.compile("([^&=]+)=?([^&=]+)?");
    private static final Pattern URI_PATTERN = Pattern.compile("^(([^:/?#]+):)?(//(([^@/]*)@)?([^/?#:]*)(:(\\d*))?)?([^?#]*)(\\?([^#]*))?(#(.*))?");
    private static final Pattern HTTP_URL_PATTERN = Pattern.compile("^(http|https):(//(([^@/]*)@)?([^/?#:]*)(:(\\d*))?)?([^?#]*)(\\?(.*))?");
    private static PathComponentBuilder NULL_PATH_COMPONENT_BUILDER = new PathComponentBuilder() { // from class: org.springframework.web.util.UriComponentsBuilder.1
        @Override // org.springframework.web.util.UriComponentsBuilder.PathComponentBuilder
        public UriComponents.PathComponent build() {
            return UriComponents.NULL_PATH_COMPONENT;
        }

        @Override // org.springframework.web.util.UriComponentsBuilder.PathComponentBuilder
        public PathComponentBuilder appendPath(String path) {
            return new FullPathComponentBuilder(path);
        }

        @Override // org.springframework.web.util.UriComponentsBuilder.PathComponentBuilder
        public PathComponentBuilder appendPathSegments(String... pathSegments) {
            return new PathSegmentComponentBuilder(pathSegments);
        }
    };

    /* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/web/util/UriComponentsBuilder$PathComponentBuilder.class */
    private interface PathComponentBuilder {
        UriComponents.PathComponent build();

        PathComponentBuilder appendPath(String str);

        PathComponentBuilder appendPathSegments(String... strArr);
    }

    protected UriComponentsBuilder() {
    }

    public static UriComponentsBuilder newInstance() {
        return new UriComponentsBuilder();
    }

    public static UriComponentsBuilder fromPath(String path) {
        UriComponentsBuilder builder = new UriComponentsBuilder();
        builder.path(path);
        return builder;
    }

    public static UriComponentsBuilder fromUri(URI uri) {
        UriComponentsBuilder builder = new UriComponentsBuilder();
        builder.uri(uri);
        return builder;
    }

    public static UriComponentsBuilder fromUriString(String uri) {
        Assert.hasLength(uri, "'uri' must not be empty");
        Matcher m = URI_PATTERN.matcher(uri);
        if (m.matches()) {
            UriComponentsBuilder builder = new UriComponentsBuilder();
            builder.scheme(m.group(2));
            builder.userInfo(m.group(5));
            builder.host(m.group(6));
            String port = m.group(8);
            if (StringUtils.hasLength(port)) {
                builder.port(Integer.parseInt(port));
            }
            builder.path(m.group(9));
            builder.query(m.group(11));
            builder.fragment(m.group(13));
            return builder;
        }
        throw new IllegalArgumentException("[" + uri + "] is not a valid URI");
    }

    public static UriComponentsBuilder fromHttpUrl(String httpUrl) {
        Assert.notNull(httpUrl, "'httpUrl' must not be null");
        Matcher m = HTTP_URL_PATTERN.matcher(httpUrl);
        if (m.matches()) {
            UriComponentsBuilder builder = new UriComponentsBuilder();
            builder.scheme(m.group(1));
            builder.userInfo(m.group(4));
            builder.host(m.group(5));
            String port = m.group(7);
            if (StringUtils.hasLength(port)) {
                builder.port(Integer.parseInt(port));
            }
            builder.path(m.group(8));
            builder.query(m.group(10));
            return builder;
        }
        throw new IllegalArgumentException("[" + httpUrl + "] is not a valid HTTP URL");
    }

    public UriComponents build() {
        return build(false);
    }

    public UriComponents build(boolean encoded) {
        return new UriComponents(this.scheme, this.userInfo, this.host, this.port, this.pathBuilder.build(), this.queryParams, this.fragment, encoded, true);
    }

    public UriComponents buildAndExpand(Map<String, ?> uriVariables) {
        return build(false).expand(uriVariables);
    }

    public UriComponents buildAndExpand(Object... uriVariableValues) {
        return build(false).expand(uriVariableValues);
    }

    public UriComponentsBuilder uri(URI uri) {
        Assert.notNull(uri, "'uri' must not be null");
        Assert.isTrue(!uri.isOpaque(), "Opaque URI [" + uri + "] not supported");
        this.scheme = uri.getScheme();
        if (uri.getUserInfo() != null) {
            this.userInfo = uri.getUserInfo();
        }
        if (uri.getHost() != null) {
            this.host = uri.getHost();
        }
        if (uri.getPort() != -1) {
            this.port = uri.getPort();
        }
        if (StringUtils.hasLength(uri.getPath())) {
            this.pathBuilder = new FullPathComponentBuilder(uri.getPath());
        }
        if (StringUtils.hasLength(uri.getQuery())) {
            this.queryParams.clear();
            query(uri.getQuery());
        }
        if (uri.getFragment() != null) {
            this.fragment = uri.getFragment();
        }
        return this;
    }

    public UriComponentsBuilder scheme(String scheme) {
        this.scheme = scheme;
        return this;
    }

    public UriComponentsBuilder userInfo(String userInfo) {
        this.userInfo = userInfo;
        return this;
    }

    public UriComponentsBuilder host(String host) {
        this.host = host;
        return this;
    }

    public UriComponentsBuilder port(int port) {
        Assert.isTrue(port >= -1, "'port' must not be < -1");
        this.port = port;
        return this;
    }

    public UriComponentsBuilder path(String path) {
        if (path != null) {
            this.pathBuilder = this.pathBuilder.appendPath(path);
        } else {
            this.pathBuilder = NULL_PATH_COMPONENT_BUILDER;
        }
        return this;
    }

    public UriComponentsBuilder replacePath(String path) {
        this.pathBuilder = NULL_PATH_COMPONENT_BUILDER;
        path(path);
        return this;
    }

    public UriComponentsBuilder pathSegment(String... pathSegments) throws IllegalArgumentException {
        Assert.notNull(pathSegments, "'segments' must not be null");
        this.pathBuilder = this.pathBuilder.appendPathSegments(pathSegments);
        return this;
    }

    public UriComponentsBuilder query(String query) {
        if (query != null) {
            Matcher m = QUERY_PARAM_PATTERN.matcher(query);
            while (m.find()) {
                String name = m.group(1);
                String value = m.group(2);
                queryParam(name, value);
            }
        } else {
            this.queryParams.clear();
        }
        return this;
    }

    public UriComponentsBuilder replaceQuery(String query) {
        this.queryParams.clear();
        query(query);
        return this;
    }

    public UriComponentsBuilder queryParam(String name, Object... values) {
        Assert.notNull(name, "'name' must not be null");
        if (!ObjectUtils.isEmpty(values)) {
            int len$ = values.length;
            for (int i$ = 0; i$ < len$; i$++) {
                Object value = values[i$];
                String valueAsString = value != null ? value.toString() : null;
                this.queryParams.add(name, valueAsString);
            }
        } else {
            this.queryParams.add(name, (Object) null);
        }
        return this;
    }

    public UriComponentsBuilder replaceQueryParam(String name, Object... values) {
        Assert.notNull(name, "'name' must not be null");
        this.queryParams.remove(name);
        if (!ObjectUtils.isEmpty(values)) {
            queryParam(name, values);
        }
        return this;
    }

    public UriComponentsBuilder fragment(String fragment) {
        if (fragment != null) {
            Assert.hasLength(fragment, "'fragment' must not be empty");
            this.fragment = fragment;
        } else {
            this.fragment = null;
        }
        return this;
    }

    /* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/web/util/UriComponentsBuilder$FullPathComponentBuilder.class */
    private static class FullPathComponentBuilder implements PathComponentBuilder {
        private final StringBuilder path;

        private FullPathComponentBuilder(String path) {
            this.path = new StringBuilder(path);
        }

        @Override // org.springframework.web.util.UriComponentsBuilder.PathComponentBuilder
        public UriComponents.PathComponent build() {
            return new UriComponents.FullPathComponent(this.path.toString());
        }

        @Override // org.springframework.web.util.UriComponentsBuilder.PathComponentBuilder
        public PathComponentBuilder appendPath(String path) {
            this.path.append(path);
            return this;
        }

        @Override // org.springframework.web.util.UriComponentsBuilder.PathComponentBuilder
        public PathComponentBuilder appendPathSegments(String... pathSegments) {
            PathComponentCompositeBuilder builder = new PathComponentCompositeBuilder(this);
            builder.appendPathSegments(pathSegments);
            return builder;
        }
    }

    /* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/web/util/UriComponentsBuilder$PathSegmentComponentBuilder.class */
    private static class PathSegmentComponentBuilder implements PathComponentBuilder {
        private final List<String> pathSegments;

        private PathSegmentComponentBuilder(String... pathSegments) {
            this.pathSegments = new ArrayList();
            this.pathSegments.addAll(removeEmptyPathSegments(pathSegments));
        }

        private Collection<String> removeEmptyPathSegments(String... pathSegments) {
            List<String> result = new ArrayList<>();
            for (String segment : pathSegments) {
                if (StringUtils.hasText(segment)) {
                    result.add(segment);
                }
            }
            return result;
        }

        @Override // org.springframework.web.util.UriComponentsBuilder.PathComponentBuilder
        public UriComponents.PathComponent build() {
            return new UriComponents.PathSegmentComponent(this.pathSegments);
        }

        @Override // org.springframework.web.util.UriComponentsBuilder.PathComponentBuilder
        public PathComponentBuilder appendPath(String path) {
            PathComponentCompositeBuilder builder = new PathComponentCompositeBuilder(this);
            builder.appendPath(path);
            return builder;
        }

        @Override // org.springframework.web.util.UriComponentsBuilder.PathComponentBuilder
        public PathComponentBuilder appendPathSegments(String... pathSegments) {
            this.pathSegments.addAll(removeEmptyPathSegments(pathSegments));
            return this;
        }
    }

    /* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/web/util/UriComponentsBuilder$PathComponentCompositeBuilder.class */
    private static class PathComponentCompositeBuilder implements PathComponentBuilder {
        private final List<PathComponentBuilder> pathComponentBuilders;

        private PathComponentCompositeBuilder(PathComponentBuilder builder) {
            this.pathComponentBuilders = new ArrayList();
            this.pathComponentBuilders.add(builder);
        }

        @Override // org.springframework.web.util.UriComponentsBuilder.PathComponentBuilder
        public UriComponents.PathComponent build() {
            List<UriComponents.PathComponent> pathComponents = new ArrayList<>(this.pathComponentBuilders.size());
            for (PathComponentBuilder pathComponentBuilder : this.pathComponentBuilders) {
                pathComponents.add(pathComponentBuilder.build());
            }
            return new UriComponents.PathComponentComposite(pathComponents);
        }

        @Override // org.springframework.web.util.UriComponentsBuilder.PathComponentBuilder
        public PathComponentBuilder appendPath(String path) {
            this.pathComponentBuilders.add(new FullPathComponentBuilder(path));
            return this;
        }

        @Override // org.springframework.web.util.UriComponentsBuilder.PathComponentBuilder
        public PathComponentBuilder appendPathSegments(String... pathSegments) {
            this.pathComponentBuilders.add(new PathSegmentComponentBuilder(pathSegments));
            return this;
        }
    }
}
