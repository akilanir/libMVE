package org.unbescape.html;

import java.io.IOException;
import java.io.Writer;

/* loaded from: unbescape-1.1.1.RELEASE.jar:org/unbescape/html/HtmlEscape.class */
public final class HtmlEscape {
    public static String escapeHtml5(String text) {
        return escapeHtml(text, HtmlEscapeType.HTML5_NAMED_REFERENCES_DEFAULT_TO_DECIMAL, HtmlEscapeLevel.LEVEL_2_ALL_NON_ASCII_PLUS_MARKUP_SIGNIFICANT);
    }

    public static String escapeHtml5Xml(String text) {
        return escapeHtml(text, HtmlEscapeType.HTML5_NAMED_REFERENCES_DEFAULT_TO_DECIMAL, HtmlEscapeLevel.LEVEL_1_ONLY_MARKUP_SIGNIFICANT);
    }

    public static String escapeHtml4(String text) {
        return escapeHtml(text, HtmlEscapeType.HTML4_NAMED_REFERENCES_DEFAULT_TO_DECIMAL, HtmlEscapeLevel.LEVEL_2_ALL_NON_ASCII_PLUS_MARKUP_SIGNIFICANT);
    }

    public static String escapeHtml4Xml(String text) {
        return escapeHtml(text, HtmlEscapeType.HTML4_NAMED_REFERENCES_DEFAULT_TO_DECIMAL, HtmlEscapeLevel.LEVEL_1_ONLY_MARKUP_SIGNIFICANT);
    }

    public static String escapeHtml(String text, HtmlEscapeType type, HtmlEscapeLevel level) {
        if (type == null) {
            throw new IllegalArgumentException("The 'type' argument cannot be null");
        }
        if (level == null) {
            throw new IllegalArgumentException("The 'level' argument cannot be null");
        }
        return HtmlEscapeUtil.escape(text, type, level);
    }

    public static void escapeHtml5(char[] text, int offset, int len, Writer writer) throws IOException {
        escapeHtml(text, offset, len, writer, HtmlEscapeType.HTML5_NAMED_REFERENCES_DEFAULT_TO_DECIMAL, HtmlEscapeLevel.LEVEL_2_ALL_NON_ASCII_PLUS_MARKUP_SIGNIFICANT);
    }

    public static void escapeHtml5Xml(char[] text, int offset, int len, Writer writer) throws IOException {
        escapeHtml(text, offset, len, writer, HtmlEscapeType.HTML5_NAMED_REFERENCES_DEFAULT_TO_DECIMAL, HtmlEscapeLevel.LEVEL_1_ONLY_MARKUP_SIGNIFICANT);
    }

    public static void escapeHtml4(char[] text, int offset, int len, Writer writer) throws IOException {
        escapeHtml(text, offset, len, writer, HtmlEscapeType.HTML4_NAMED_REFERENCES_DEFAULT_TO_DECIMAL, HtmlEscapeLevel.LEVEL_2_ALL_NON_ASCII_PLUS_MARKUP_SIGNIFICANT);
    }

    public static void escapeHtml4Xml(char[] text, int offset, int len, Writer writer) throws IOException {
        escapeHtml(text, offset, len, writer, HtmlEscapeType.HTML4_NAMED_REFERENCES_DEFAULT_TO_DECIMAL, HtmlEscapeLevel.LEVEL_1_ONLY_MARKUP_SIGNIFICANT);
    }

    public static void escapeHtml(char[] text, int offset, int len, Writer writer, HtmlEscapeType type, HtmlEscapeLevel level) throws IOException {
        if (writer == null) {
            throw new IllegalArgumentException("Argument 'writer' cannot be null");
        }
        if (type == null) {
            throw new IllegalArgumentException("The 'type' argument cannot be null");
        }
        if (level == null) {
            throw new IllegalArgumentException("The 'level' argument cannot be null");
        }
        int textLen = text == null ? 0 : text.length;
        if (offset < 0 || offset > textLen) {
            throw new IllegalArgumentException("Invalid (offset, len). offset=" + offset + ", len=" + len + ", text.length=" + textLen);
        }
        if (len < 0 || offset + len > textLen) {
            throw new IllegalArgumentException("Invalid (offset, len). offset=" + offset + ", len=" + len + ", text.length=" + textLen);
        }
        HtmlEscapeUtil.escape(text, offset, len, writer, type, level);
    }

    public static String unescapeHtml(String text) {
        return HtmlEscapeUtil.unescape(text);
    }

    public static void unescapeHtml(char[] text, int offset, int len, Writer writer) throws IOException {
        if (writer == null) {
            throw new IllegalArgumentException("Argument 'writer' cannot be null");
        }
        int textLen = text == null ? 0 : text.length;
        if (offset < 0 || offset > textLen) {
            throw new IllegalArgumentException("Invalid (offset, len). offset=" + offset + ", len=" + len + ", text.length=" + textLen);
        }
        if (len < 0 || offset + len > textLen) {
            throw new IllegalArgumentException("Invalid (offset, len). offset=" + offset + ", len=" + len + ", text.length=" + textLen);
        }
        HtmlEscapeUtil.unescape(text, offset, len, writer);
    }

    private HtmlEscape() {
    }
}
