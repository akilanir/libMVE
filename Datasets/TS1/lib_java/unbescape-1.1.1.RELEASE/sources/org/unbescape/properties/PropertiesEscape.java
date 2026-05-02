package org.unbescape.properties;

import java.io.IOException;
import java.io.Writer;

/* loaded from: unbescape-1.1.1.RELEASE.jar:org/unbescape/properties/PropertiesEscape.class */
public final class PropertiesEscape {
    public static String escapePropertiesValueMinimal(String text) {
        return escapePropertiesValue(text, PropertiesValueEscapeLevel.LEVEL_1_BASIC_ESCAPE_SET);
    }

    public static String escapePropertiesValue(String text) {
        return escapePropertiesValue(text, PropertiesValueEscapeLevel.LEVEL_2_ALL_NON_ASCII_PLUS_BASIC_ESCAPE_SET);
    }

    public static String escapePropertiesValue(String text, PropertiesValueEscapeLevel level) {
        if (level == null) {
            throw new IllegalArgumentException("The 'level' argument cannot be null");
        }
        return PropertiesValueEscapeUtil.escape(text, level);
    }

    public static void escapePropertiesValueMinimal(char[] text, int offset, int len, Writer writer) throws IOException {
        escapePropertiesValue(text, offset, len, writer, PropertiesValueEscapeLevel.LEVEL_1_BASIC_ESCAPE_SET);
    }

    public static void escapePropertiesValue(char[] text, int offset, int len, Writer writer) throws IOException {
        escapePropertiesValue(text, offset, len, writer, PropertiesValueEscapeLevel.LEVEL_2_ALL_NON_ASCII_PLUS_BASIC_ESCAPE_SET);
    }

    public static void escapePropertiesValue(char[] text, int offset, int len, Writer writer, PropertiesValueEscapeLevel level) throws IOException {
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
        PropertiesValueEscapeUtil.escape(text, offset, len, writer, level);
    }

    public static String escapePropertiesKeyMinimal(String text) {
        return escapePropertiesKey(text, PropertiesKeyEscapeLevel.LEVEL_1_BASIC_ESCAPE_SET);
    }

    public static String escapePropertiesKey(String text) {
        return escapePropertiesKey(text, PropertiesKeyEscapeLevel.LEVEL_2_ALL_NON_ASCII_PLUS_BASIC_ESCAPE_SET);
    }

    public static String escapePropertiesKey(String text, PropertiesKeyEscapeLevel level) {
        if (level == null) {
            throw new IllegalArgumentException("The 'level' argument cannot be null");
        }
        return PropertiesKeyEscapeUtil.escape(text, level);
    }

    public static void escapePropertiesKeyMinimal(char[] text, int offset, int len, Writer writer) throws IOException {
        escapePropertiesKey(text, offset, len, writer, PropertiesKeyEscapeLevel.LEVEL_1_BASIC_ESCAPE_SET);
    }

    public static void escapePropertiesKey(char[] text, int offset, int len, Writer writer) throws IOException {
        escapePropertiesKey(text, offset, len, writer, PropertiesKeyEscapeLevel.LEVEL_2_ALL_NON_ASCII_PLUS_BASIC_ESCAPE_SET);
    }

    public static void escapePropertiesKey(char[] text, int offset, int len, Writer writer, PropertiesKeyEscapeLevel level) throws IOException {
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
        PropertiesKeyEscapeUtil.escape(text, offset, len, writer, level);
    }

    public static String unescapeProperties(String text) {
        return PropertiesUnescapeUtil.unescape(text);
    }

    public static void unescapeProperties(char[] text, int offset, int len, Writer writer) throws IOException {
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
        PropertiesUnescapeUtil.unescape(text, offset, len, writer);
    }

    private PropertiesEscape() {
    }
}
