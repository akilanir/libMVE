package org.unbescape.json;

import java.io.IOException;
import java.io.Writer;

/* loaded from: unbescape-1.1.1.RELEASE.jar:org/unbescape/json/JsonEscape.class */
public final class JsonEscape {
    public static String escapeJsonMinimal(String text) {
        return escapeJson(text, JsonEscapeType.SINGLE_ESCAPE_CHARS_DEFAULT_TO_UHEXA, JsonEscapeLevel.LEVEL_1_BASIC_ESCAPE_SET);
    }

    public static String escapeJson(String text) {
        return escapeJson(text, JsonEscapeType.SINGLE_ESCAPE_CHARS_DEFAULT_TO_UHEXA, JsonEscapeLevel.LEVEL_2_ALL_NON_ASCII_PLUS_BASIC_ESCAPE_SET);
    }

    public static String escapeJson(String text, JsonEscapeType type, JsonEscapeLevel level) {
        if (type == null) {
            throw new IllegalArgumentException("The 'type' argument cannot be null");
        }
        if (level == null) {
            throw new IllegalArgumentException("The 'level' argument cannot be null");
        }
        return JsonEscapeUtil.escape(text, type, level);
    }

    public static void escapeJsonMinimal(char[] text, int offset, int len, Writer writer) throws IOException {
        escapeJson(text, offset, len, writer, JsonEscapeType.SINGLE_ESCAPE_CHARS_DEFAULT_TO_UHEXA, JsonEscapeLevel.LEVEL_1_BASIC_ESCAPE_SET);
    }

    public static void escapeJson(char[] text, int offset, int len, Writer writer) throws IOException {
        escapeJson(text, offset, len, writer, JsonEscapeType.SINGLE_ESCAPE_CHARS_DEFAULT_TO_UHEXA, JsonEscapeLevel.LEVEL_2_ALL_NON_ASCII_PLUS_BASIC_ESCAPE_SET);
    }

    public static void escapeJson(char[] text, int offset, int len, Writer writer, JsonEscapeType type, JsonEscapeLevel level) throws IOException {
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
        JsonEscapeUtil.escape(text, offset, len, writer, type, level);
    }

    public static String unescapeJson(String text) {
        return JsonEscapeUtil.unescape(text);
    }

    public static void unescapeJson(char[] text, int offset, int len, Writer writer) throws IOException {
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
        JsonEscapeUtil.unescape(text, offset, len, writer);
    }

    private JsonEscape() {
    }
}
