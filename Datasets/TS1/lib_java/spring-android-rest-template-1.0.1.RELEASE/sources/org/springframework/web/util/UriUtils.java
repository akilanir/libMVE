package org.springframework.web.util;

import java.io.ByteArrayOutputStream;
import java.io.UnsupportedEncodingException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.springframework.util.Assert;
import org.springframework.web.util.UriComponents;

/* loaded from: spring-android-rest-template-1.0.1.RELEASE.jar:org/springframework/web/util/UriUtils.class */
public abstract class UriUtils {
    private static final String SCHEME_PATTERN = "([^:/?#]+):";
    private static final String HTTP_PATTERN = "(http|https):";
    private static final String USERINFO_PATTERN = "([^@/]*)";
    private static final String HOST_PATTERN = "([^/?#:]*)";
    private static final String PORT_PATTERN = "(\\d*)";
    private static final String PATH_PATTERN = "([^?#]*)";
    private static final String QUERY_PATTERN = "([^#]*)";
    private static final String LAST_PATTERN = "(.*)";
    private static final Pattern URI_PATTERN = Pattern.compile("^(([^:/?#]+):)?(//(([^@/]*)@)?([^/?#:]*)(:(\\d*))?)?([^?#]*)(\\?([^#]*))?(#(.*))?");
    private static final Pattern HTTP_URL_PATTERN = Pattern.compile("^(http|https):(//(([^@/]*)@)?([^/?#:]*)(:(\\d*))?)?([^?#]*)(\\?(.*))?");

    public static String encodeUri(String uri, String encoding) throws UnsupportedEncodingException {
        Assert.notNull(uri, "'uri' must not be null");
        Assert.hasLength(encoding, "'encoding' must not be empty");
        Matcher m = URI_PATTERN.matcher(uri);
        if (m.matches()) {
            String scheme = m.group(2);
            String authority = m.group(3);
            String userinfo = m.group(5);
            String host = m.group(6);
            String port = m.group(8);
            String path = m.group(9);
            String query = m.group(11);
            String fragment = m.group(13);
            return encodeUriComponents(scheme, authority, userinfo, host, port, path, query, fragment, encoding);
        }
        throw new IllegalArgumentException("[" + uri + "] is not a valid URI");
    }

    public static String encodeHttpUrl(String httpUrl, String encoding) throws UnsupportedEncodingException {
        Assert.notNull(httpUrl, "'httpUrl' must not be null");
        Assert.hasLength(encoding, "'encoding' must not be empty");
        Matcher m = HTTP_URL_PATTERN.matcher(httpUrl);
        if (m.matches()) {
            String scheme = m.group(1);
            String authority = m.group(2);
            String userinfo = m.group(4);
            String host = m.group(5);
            String portString = m.group(7);
            String path = m.group(8);
            String query = m.group(10);
            return encodeUriComponents(scheme, authority, userinfo, host, portString, path, query, null, encoding);
        }
        throw new IllegalArgumentException("[" + httpUrl + "] is not a valid HTTP URL");
    }

    public static String encodeUriComponents(String scheme, String authority, String userInfo, String host, String port, String path, String query, String fragment, String encoding) throws UnsupportedEncodingException {
        Assert.hasLength(encoding, "'encoding' must not be empty");
        StringBuilder sb = new StringBuilder();
        if (scheme != null) {
            sb.append(encodeScheme(scheme, encoding));
            sb.append(':');
        }
        if (authority != null) {
            sb.append("//");
            if (userInfo != null) {
                sb.append(encodeUserInfo(userInfo, encoding));
                sb.append('@');
            }
            if (host != null) {
                sb.append(encodeHost(host, encoding));
            }
            if (port != null) {
                sb.append(':');
                sb.append(encodePort(port, encoding));
            }
        }
        sb.append(encodePath(path, encoding));
        if (query != null) {
            sb.append('?');
            sb.append(encodeQuery(query, encoding));
        }
        if (fragment != null) {
            sb.append('#');
            sb.append(encodeFragment(fragment, encoding));
        }
        return sb.toString();
    }

    public static String encodeScheme(String scheme, String encoding) throws UnsupportedEncodingException {
        return UriComponents.encodeUriComponent(scheme, encoding, UriComponents.Type.SCHEME);
    }

    public static String encodeAuthority(String authority, String encoding) throws UnsupportedEncodingException {
        return UriComponents.encodeUriComponent(authority, encoding, UriComponents.Type.AUTHORITY);
    }

    public static String encodeUserInfo(String userInfo, String encoding) throws UnsupportedEncodingException {
        return UriComponents.encodeUriComponent(userInfo, encoding, UriComponents.Type.USER_INFO);
    }

    public static String encodeHost(String host, String encoding) throws UnsupportedEncodingException {
        return UriComponents.encodeUriComponent(host, encoding, UriComponents.Type.HOST);
    }

    public static String encodePort(String port, String encoding) throws UnsupportedEncodingException {
        return UriComponents.encodeUriComponent(port, encoding, UriComponents.Type.PORT);
    }

    public static String encodePath(String path, String encoding) throws UnsupportedEncodingException {
        return UriComponents.encodeUriComponent(path, encoding, UriComponents.Type.PATH);
    }

    public static String encodePathSegment(String segment, String encoding) throws UnsupportedEncodingException {
        return UriComponents.encodeUriComponent(segment, encoding, UriComponents.Type.PATH_SEGMENT);
    }

    public static String encodeQuery(String query, String encoding) throws UnsupportedEncodingException {
        return UriComponents.encodeUriComponent(query, encoding, UriComponents.Type.QUERY);
    }

    public static String encodeQueryParam(String queryParam, String encoding) throws UnsupportedEncodingException {
        return UriComponents.encodeUriComponent(queryParam, encoding, UriComponents.Type.QUERY_PARAM);
    }

    public static String encodeFragment(String fragment, String encoding) throws UnsupportedEncodingException {
        return UriComponents.encodeUriComponent(fragment, encoding, UriComponents.Type.FRAGMENT);
    }

    public static String decode(String source, String encoding) throws UnsupportedEncodingException {
        Assert.notNull(source, "'source' must not be null");
        Assert.hasLength(encoding, "'encoding' must not be empty");
        int length = source.length();
        ByteArrayOutputStream bos = new ByteArrayOutputStream(length);
        boolean changed = false;
        int i = 0;
        while (i < length) {
            int ch = source.charAt(i);
            if (ch == 37) {
                if (i + 2 < length) {
                    char hex1 = source.charAt(i + 1);
                    char hex2 = source.charAt(i + 2);
                    int u = Character.digit(hex1, 16);
                    int l = Character.digit(hex2, 16);
                    if (u == -1 || l == -1) {
                        throw new IllegalArgumentException("Invalid encoded sequence \"" + source.substring(i) + "\"");
                    }
                    bos.write((char) ((u << 4) + l));
                    i += 2;
                    changed = true;
                } else {
                    throw new IllegalArgumentException("Invalid encoded sequence \"" + source.substring(i) + "\"");
                }
            } else {
                bos.write(ch);
            }
            i++;
        }
        return changed ? new String(bos.toByteArray(), encoding) : source;
    }
}
