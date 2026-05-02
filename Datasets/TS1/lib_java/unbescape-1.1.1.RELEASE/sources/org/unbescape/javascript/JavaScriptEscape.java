package org.unbescape.javascript;

import java.io.IOException;
import java.io.Writer;

/* loaded from: unbescape-1.1.1.RELEASE.jar:org/unbescape/javascript/JavaScriptEscape.class */
public final class JavaScriptEscape {
    public static String escapeJavaScriptMinimal(String text) {
        return escapeJavaScript(text, JavaScriptEscapeType.SINGLE_ESCAPE_CHARS_DEFAULT_TO_XHEXA_AND_UHEXA, JavaScriptEscapeLevel.LEVEL_1_BASIC_ESCAPE_SET);
    }

    public static String escapeJavaScript(String text) {
        return escapeJavaScript(text, JavaScriptEscapeType.SINGLE_ESCAPE_CHARS_DEFAULT_TO_XHEXA_AND_UHEXA, JavaScriptEscapeLevel.LEVEL_2_ALL_NON_ASCII_PLUS_BASIC_ESCAPE_SET);
    }

    public static String escapeJavaScript(String text, JavaScriptEscapeType type, JavaScriptEscapeLevel level) {
        if (type == null) {
            throw new IllegalArgumentException("The 'type' argument cannot be null");
        }
        if (level == null) {
            throw new IllegalArgumentException("The 'level' argument cannot be null");
        }
        return JavaScriptEscapeUtil.escape(text, type, level);
    }

    public static void escapeJavaScriptMinimal(char[] text, int offset, int len, Writer writer) throws IOException {
        escapeJavaScript(text, offset, len, writer, JavaScriptEscapeType.SINGLE_ESCAPE_CHARS_DEFAULT_TO_XHEXA_AND_UHEXA, JavaScriptEscapeLevel.LEVEL_1_BASIC_ESCAPE_SET);
    }

    public static void escapeJavaScript(char[] text, int offset, int len, Writer writer) throws IOException {
        escapeJavaScript(text, offset, len, writer, JavaScriptEscapeType.SINGLE_ESCAPE_CHARS_DEFAULT_TO_XHEXA_AND_UHEXA, JavaScriptEscapeLevel.LEVEL_2_ALL_NON_ASCII_PLUS_BASIC_ESCAPE_SET);
    }

    public static void escapeJavaScript(char[] text, int offset, int len, Writer writer, JavaScriptEscapeType type, JavaScriptEscapeLevel level) throws IOException {
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
        JavaScriptEscapeUtil.escape(text, offset, len, writer, type, level);
    }

    public static String unescapeJavaScript(String text) {
        return JavaScriptEscapeUtil.unescape(text);
    }

    public static void unescapeJavaScript(char[] text, int offset, int len, Writer writer) throws IOException {
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
        JavaScriptEscapeUtil.unescape(text, offset, len, writer);
    }

    private JavaScriptEscape() {
    }
}
