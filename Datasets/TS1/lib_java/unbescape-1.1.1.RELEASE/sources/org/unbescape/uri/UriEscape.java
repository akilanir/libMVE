package org.unbescape.uri;

import java.io.IOException;
import java.io.Writer;
import org.unbescape.uri.UriEscapeUtil;

/* loaded from: unbescape-1.1.1.RELEASE.jar:org/unbescape/uri/UriEscape.class */
public final class UriEscape {
    public static final String DEFAULT_ENCODING = "UTF-8";

    public static String escapeUriPath(String text) {
        return escapeUriPath(text, DEFAULT_ENCODING);
    }

    public static String escapeUriPath(String text, String encoding) {
        if (encoding == null) {
            throw new IllegalArgumentException("Argument 'encoding' cannot be null");
        }
        return UriEscapeUtil.escape(text, UriEscapeUtil.UriEscapeType.PATH, encoding);
    }

    public static String escapeUriPathSegment(String text) {
        return escapeUriPathSegment(text, DEFAULT_ENCODING);
    }

    public static String escapeUriPathSegment(String text, String encoding) {
        if (encoding == null) {
            throw new IllegalArgumentException("Argument 'encoding' cannot be null");
        }
        return UriEscapeUtil.escape(text, UriEscapeUtil.UriEscapeType.PATH_SEGMENT, encoding);
    }

    public static String escapeUriQueryParam(String text) {
        return escapeUriQueryParam(text, DEFAULT_ENCODING);
    }

    public static String escapeUriQueryParam(String text, String encoding) {
        if (encoding == null) {
            throw new IllegalArgumentException("Argument 'encoding' cannot be null");
        }
        return UriEscapeUtil.escape(text, UriEscapeUtil.UriEscapeType.QUERY_PARAM, encoding);
    }

    public static String escapeUriFragmentId(String text) {
        return escapeUriFragmentId(text, DEFAULT_ENCODING);
    }

    public static String escapeUriFragmentId(String text, String encoding) {
        if (encoding == null) {
            throw new IllegalArgumentException("Argument 'encoding' cannot be null");
        }
        return UriEscapeUtil.escape(text, UriEscapeUtil.UriEscapeType.FRAGMENT_ID, encoding);
    }

    public static void escapeUriPath(char[] text, int offset, int len, Writer writer) throws IOException {
        escapeUriPath(text, offset, len, writer, DEFAULT_ENCODING);
    }

    public static void escapeUriPath(char[] text, int offset, int len, Writer writer, String encoding) throws IOException {
        if (writer == null) {
            throw new IllegalArgumentException("Argument 'writer' cannot be null");
        }
        if (encoding == null) {
            throw new IllegalArgumentException("Argument 'encoding' cannot be null");
        }
        int textLen = text == null ? 0 : text.length;
        if (offset < 0 || offset > textLen) {
            throw new IllegalArgumentException("Invalid (offset, len). offset=" + offset + ", len=" + len + ", text.length=" + textLen);
        }
        if (len < 0 || offset + len > textLen) {
            throw new IllegalArgumentException("Invalid (offset, len). offset=" + offset + ", len=" + len + ", text.length=" + textLen);
        }
        UriEscapeUtil.escape(text, offset, len, writer, UriEscapeUtil.UriEscapeType.PATH, encoding);
    }

    public static void escapeUriPathSegment(char[] text, int offset, int len, Writer writer) throws IOException {
        escapeUriPathSegment(text, offset, len, writer, DEFAULT_ENCODING);
    }

    public static void escapeUriPathSegment(char[] text, int offset, int len, Writer writer, String encoding) throws IOException {
        if (writer == null) {
            throw new IllegalArgumentException("Argument 'writer' cannot be null");
        }
        if (encoding == null) {
            throw new IllegalArgumentException("Argument 'encoding' cannot be null");
        }
        int textLen = text == null ? 0 : text.length;
        if (offset < 0 || offset > textLen) {
            throw new IllegalArgumentException("Invalid (offset, len). offset=" + offset + ", len=" + len + ", text.length=" + textLen);
        }
        if (len < 0 || offset + len > textLen) {
            throw new IllegalArgumentException("Invalid (offset, len). offset=" + offset + ", len=" + len + ", text.length=" + textLen);
        }
        UriEscapeUtil.escape(text, offset, len, writer, UriEscapeUtil.UriEscapeType.PATH_SEGMENT, encoding);
    }

    public static void escapeUriQueryParam(char[] text, int offset, int len, Writer writer) throws IOException {
        escapeUriQueryParam(text, offset, len, writer, DEFAULT_ENCODING);
    }

    public static void escapeUriQueryParam(char[] text, int offset, int len, Writer writer, String encoding) throws IOException {
        if (writer == null) {
            throw new IllegalArgumentException("Argument 'writer' cannot be null");
        }
        if (encoding == null) {
            throw new IllegalArgumentException("Argument 'encoding' cannot be null");
        }
        int textLen = text == null ? 0 : text.length;
        if (offset < 0 || offset > textLen) {
            throw new IllegalArgumentException("Invalid (offset, len). offset=" + offset + ", len=" + len + ", text.length=" + textLen);
        }
        if (len < 0 || offset + len > textLen) {
            throw new IllegalArgumentException("Invalid (offset, len). offset=" + offset + ", len=" + len + ", text.length=" + textLen);
        }
        UriEscapeUtil.escape(text, offset, len, writer, UriEscapeUtil.UriEscapeType.QUERY_PARAM, encoding);
    }

    public static void escapeUriFragmentId(char[] text, int offset, int len, Writer writer) throws IOException {
        escapeUriFragmentId(text, offset, len, writer, DEFAULT_ENCODING);
    }

    public static void escapeUriFragmentId(char[] text, int offset, int len, Writer writer, String encoding) throws IOException {
        if (writer == null) {
            throw new IllegalArgumentException("Argument 'writer' cannot be null");
        }
        if (encoding == null) {
            throw new IllegalArgumentException("Argument 'encoding' cannot be null");
        }
        int textLen = text == null ? 0 : text.length;
        if (offset < 0 || offset > textLen) {
            throw new IllegalArgumentException("Invalid (offset, len). offset=" + offset + ", len=" + len + ", text.length=" + textLen);
        }
        if (len < 0 || offset + len > textLen) {
            throw new IllegalArgumentException("Invalid (offset, len). offset=" + offset + ", len=" + len + ", text.length=" + textLen);
        }
        UriEscapeUtil.escape(text, offset, len, writer, UriEscapeUtil.UriEscapeType.FRAGMENT_ID, encoding);
    }

    public static String unescapeUriPath(String text) {
        return unescapeUriPath(text, DEFAULT_ENCODING);
    }

    public static String unescapeUriPath(String text, String encoding) {
        if (encoding == null) {
            throw new IllegalArgumentException("Argument 'encoding' cannot be null");
        }
        return UriEscapeUtil.unescape(text, UriEscapeUtil.UriEscapeType.PATH, encoding);
    }

    public static String unescapeUriPathSegment(String text) {
        return unescapeUriPathSegment(text, DEFAULT_ENCODING);
    }

    public static String unescapeUriPathSegment(String text, String encoding) {
        if (encoding == null) {
            throw new IllegalArgumentException("Argument 'encoding' cannot be null");
        }
        return UriEscapeUtil.unescape(text, UriEscapeUtil.UriEscapeType.PATH_SEGMENT, encoding);
    }

    public static String unescapeUriQueryParam(String text) {
        return unescapeUriQueryParam(text, DEFAULT_ENCODING);
    }

    public static String unescapeUriQueryParam(String text, String encoding) {
        if (encoding == null) {
            throw new IllegalArgumentException("Argument 'encoding' cannot be null");
        }
        return UriEscapeUtil.unescape(text, UriEscapeUtil.UriEscapeType.QUERY_PARAM, encoding);
    }

    public static String unescapeUriFragmentId(String text) {
        return unescapeUriFragmentId(text, DEFAULT_ENCODING);
    }

    public static String unescapeUriFragmentId(String text, String encoding) {
        if (encoding == null) {
            throw new IllegalArgumentException("Argument 'encoding' cannot be null");
        }
        return UriEscapeUtil.unescape(text, UriEscapeUtil.UriEscapeType.FRAGMENT_ID, encoding);
    }

    public static void unescapeUriPath(char[] text, int offset, int len, Writer writer) throws IOException {
        unescapeUriPath(text, offset, len, writer, DEFAULT_ENCODING);
    }

    public static void unescapeUriPath(char[] text, int offset, int len, Writer writer, String encoding) throws IOException {
        if (writer == null) {
            throw new IllegalArgumentException("Argument 'writer' cannot be null");
        }
        if (encoding == null) {
            throw new IllegalArgumentException("Argument 'encoding' cannot be null");
        }
        int textLen = text == null ? 0 : text.length;
        if (offset < 0 || offset > textLen) {
            throw new IllegalArgumentException("Invalid (offset, len). offset=" + offset + ", len=" + len + ", text.length=" + textLen);
        }
        if (len < 0 || offset + len > textLen) {
            throw new IllegalArgumentException("Invalid (offset, len). offset=" + offset + ", len=" + len + ", text.length=" + textLen);
        }
        UriEscapeUtil.unescape(text, offset, len, writer, UriEscapeUtil.UriEscapeType.PATH, encoding);
    }

    public static void unescapeUriPathSegment(char[] text, int offset, int len, Writer writer) throws IOException {
        unescapeUriPathSegment(text, offset, len, writer, DEFAULT_ENCODING);
    }

    public static void unescapeUriPathSegment(char[] text, int offset, int len, Writer writer, String encoding) throws IOException {
        if (writer == null) {
            throw new IllegalArgumentException("Argument 'writer' cannot be null");
        }
        if (encoding == null) {
            throw new IllegalArgumentException("Argument 'encoding' cannot be null");
        }
        int textLen = text == null ? 0 : text.length;
        if (offset < 0 || offset > textLen) {
            throw new IllegalArgumentException("Invalid (offset, len). offset=" + offset + ", len=" + len + ", text.length=" + textLen);
        }
        if (len < 0 || offset + len > textLen) {
            throw new IllegalArgumentException("Invalid (offset, len). offset=" + offset + ", len=" + len + ", text.length=" + textLen);
        }
        UriEscapeUtil.unescape(text, offset, len, writer, UriEscapeUtil.UriEscapeType.PATH_SEGMENT, encoding);
    }

    public static void unescapeUriQueryParam(char[] text, int offset, int len, Writer writer) throws IOException {
        unescapeUriQueryParam(text, offset, len, writer, DEFAULT_ENCODING);
    }

    public static void unescapeUriQueryParam(char[] text, int offset, int len, Writer writer, String encoding) throws IOException {
        if (writer == null) {
            throw new IllegalArgumentException("Argument 'writer' cannot be null");
        }
        if (encoding == null) {
            throw new IllegalArgumentException("Argument 'encoding' cannot be null");
        }
        int textLen = text == null ? 0 : text.length;
        if (offset < 0 || offset > textLen) {
            throw new IllegalArgumentException("Invalid (offset, len). offset=" + offset + ", len=" + len + ", text.length=" + textLen);
        }
        if (len < 0 || offset + len > textLen) {
            throw new IllegalArgumentException("Invalid (offset, len). offset=" + offset + ", len=" + len + ", text.length=" + textLen);
        }
        UriEscapeUtil.unescape(text, offset, len, writer, UriEscapeUtil.UriEscapeType.QUERY_PARAM, encoding);
    }

    public static void unescapeUriFragmentId(char[] text, int offset, int len, Writer writer) throws IOException {
        unescapeUriFragmentId(text, offset, len, writer, DEFAULT_ENCODING);
    }

    public static void unescapeUriFragmentId(char[] text, int offset, int len, Writer writer, String encoding) throws IOException {
        if (writer == null) {
            throw new IllegalArgumentException("Argument 'writer' cannot be null");
        }
        if (encoding == null) {
            throw new IllegalArgumentException("Argument 'encoding' cannot be null");
        }
        int textLen = text == null ? 0 : text.length;
        if (offset < 0 || offset > textLen) {
            throw new IllegalArgumentException("Invalid (offset, len). offset=" + offset + ", len=" + len + ", text.length=" + textLen);
        }
        if (len < 0 || offset + len > textLen) {
            throw new IllegalArgumentException("Invalid (offset, len). offset=" + offset + ", len=" + len + ", text.length=" + textLen);
        }
        UriEscapeUtil.unescape(text, offset, len, writer, UriEscapeUtil.UriEscapeType.FRAGMENT_ID, encoding);
    }

    private UriEscape() {
    }
}
