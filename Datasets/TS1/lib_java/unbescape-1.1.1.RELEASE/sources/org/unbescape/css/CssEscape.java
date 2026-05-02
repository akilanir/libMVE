package org.unbescape.css;

import java.io.IOException;
import java.io.Writer;

/* loaded from: unbescape-1.1.1.RELEASE.jar:org/unbescape/css/CssEscape.class */
public final class CssEscape {
    public static String escapeCssStringMinimal(String text) {
        return escapeCssString(text, CssStringEscapeType.BACKSLASH_ESCAPES_DEFAULT_TO_COMPACT_HEXA, CssStringEscapeLevel.LEVEL_1_BASIC_ESCAPE_SET);
    }

    public static String escapeCssString(String text) {
        return escapeCssString(text, CssStringEscapeType.BACKSLASH_ESCAPES_DEFAULT_TO_COMPACT_HEXA, CssStringEscapeLevel.LEVEL_2_ALL_NON_ASCII_PLUS_BASIC_ESCAPE_SET);
    }

    public static String escapeCssString(String text, CssStringEscapeType type, CssStringEscapeLevel level) {
        if (type == null) {
            throw new IllegalArgumentException("The 'type' argument cannot be null");
        }
        if (level == null) {
            throw new IllegalArgumentException("The 'level' argument cannot be null");
        }
        return CssStringEscapeUtil.escape(text, type, level);
    }

    public static void escapeCssStringMinimal(char[] text, int offset, int len, Writer writer) throws IOException {
        escapeCssString(text, offset, len, writer, CssStringEscapeType.BACKSLASH_ESCAPES_DEFAULT_TO_COMPACT_HEXA, CssStringEscapeLevel.LEVEL_1_BASIC_ESCAPE_SET);
    }

    public static void escapeCssString(char[] text, int offset, int len, Writer writer) throws IOException {
        escapeCssString(text, offset, len, writer, CssStringEscapeType.BACKSLASH_ESCAPES_DEFAULT_TO_COMPACT_HEXA, CssStringEscapeLevel.LEVEL_2_ALL_NON_ASCII_PLUS_BASIC_ESCAPE_SET);
    }

    public static void escapeCssString(char[] text, int offset, int len, Writer writer, CssStringEscapeType type, CssStringEscapeLevel level) throws IOException {
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
        CssStringEscapeUtil.escape(text, offset, len, writer, type, level);
    }

    public static String escapeCssIdentifierMinimal(String text) {
        return escapeCssIdentifier(text, CssIdentifierEscapeType.BACKSLASH_ESCAPES_DEFAULT_TO_COMPACT_HEXA, CssIdentifierEscapeLevel.LEVEL_1_BASIC_ESCAPE_SET);
    }

    public static String escapeCssIdentifier(String text) {
        return escapeCssIdentifier(text, CssIdentifierEscapeType.BACKSLASH_ESCAPES_DEFAULT_TO_COMPACT_HEXA, CssIdentifierEscapeLevel.LEVEL_2_ALL_NON_ASCII_PLUS_BASIC_ESCAPE_SET);
    }

    public static String escapeCssIdentifier(String text, CssIdentifierEscapeType type, CssIdentifierEscapeLevel level) {
        if (type == null) {
            throw new IllegalArgumentException("The 'type' argument cannot be null");
        }
        if (level == null) {
            throw new IllegalArgumentException("The 'level' argument cannot be null");
        }
        return CssIdentifierEscapeUtil.escape(text, type, level);
    }

    public static void escapeCssIdentifierMinimal(char[] text, int offset, int len, Writer writer) throws IOException {
        escapeCssIdentifier(text, offset, len, writer, CssIdentifierEscapeType.BACKSLASH_ESCAPES_DEFAULT_TO_COMPACT_HEXA, CssIdentifierEscapeLevel.LEVEL_1_BASIC_ESCAPE_SET);
    }

    public static void escapeCssIdentifier(char[] text, int offset, int len, Writer writer) throws IOException {
        escapeCssIdentifier(text, offset, len, writer, CssIdentifierEscapeType.BACKSLASH_ESCAPES_DEFAULT_TO_COMPACT_HEXA, CssIdentifierEscapeLevel.LEVEL_2_ALL_NON_ASCII_PLUS_BASIC_ESCAPE_SET);
    }

    public static void escapeCssIdentifier(char[] text, int offset, int len, Writer writer, CssIdentifierEscapeType type, CssIdentifierEscapeLevel level) throws IOException {
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
        CssIdentifierEscapeUtil.escape(text, offset, len, writer, type, level);
    }

    public static String unescapeCss(String text) {
        return CssUnescapeUtil.unescape(text);
    }

    public static void unescapeCss(char[] text, int offset, int len, Writer writer) throws IOException {
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
        CssUnescapeUtil.unescape(text, offset, len, writer);
    }

    private CssEscape() {
    }
}
