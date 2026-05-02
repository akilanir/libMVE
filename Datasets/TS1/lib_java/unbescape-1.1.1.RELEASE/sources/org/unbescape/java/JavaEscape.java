package org.unbescape.java;

import java.io.IOException;
import java.io.Writer;

/* loaded from: unbescape-1.1.1.RELEASE.jar:org/unbescape/java/JavaEscape.class */
public final class JavaEscape {
    public static String escapeJavaMinimal(String text) {
        return escapeJava(text, JavaEscapeLevel.LEVEL_1_BASIC_ESCAPE_SET);
    }

    public static String escapeJava(String text) {
        return escapeJava(text, JavaEscapeLevel.LEVEL_2_ALL_NON_ASCII_PLUS_BASIC_ESCAPE_SET);
    }

    public static String escapeJava(String text, JavaEscapeLevel level) {
        if (level == null) {
            throw new IllegalArgumentException("The 'level' argument cannot be null");
        }
        return JavaEscapeUtil.escape(text, level);
    }

    public static void escapeJavaMinimal(char[] text, int offset, int len, Writer writer) throws IOException {
        escapeJava(text, offset, len, writer, JavaEscapeLevel.LEVEL_1_BASIC_ESCAPE_SET);
    }

    public static void escapeJava(char[] text, int offset, int len, Writer writer) throws IOException {
        escapeJava(text, offset, len, writer, JavaEscapeLevel.LEVEL_2_ALL_NON_ASCII_PLUS_BASIC_ESCAPE_SET);
    }

    public static void escapeJava(char[] text, int offset, int len, Writer writer, JavaEscapeLevel level) throws IOException {
        if (writer == null) {
            throw new IllegalArgumentException("Argument 'writer' cannot be null");
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
        JavaEscapeUtil.escape(text, offset, len, writer, level);
    }

    public static String unescapeJava(String text) {
        return JavaEscapeUtil.unescape(text);
    }

    public static void unescapeJava(char[] text, int offset, int len, Writer writer) throws IOException {
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
        JavaEscapeUtil.unescape(text, offset, len, writer);
    }

    private JavaEscape() {
    }
}
