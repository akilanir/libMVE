package org.unbescape.xml;

import java.io.IOException;
import java.io.Writer;

/* loaded from: unbescape-1.1.1.RELEASE.jar:org/unbescape/xml/XmlEscape.class */
public final class XmlEscape {
    public static String escapeXml10Minimal(String text) {
        return escapeXml(text, XmlEscapeSymbols.XML10_SYMBOLS, XmlEscapeType.CHARACTER_ENTITY_REFERENCES_DEFAULT_TO_HEXA, XmlEscapeLevel.LEVEL_1_ONLY_MARKUP_SIGNIFICANT);
    }

    public static String escapeXml11Minimal(String text) {
        return escapeXml(text, XmlEscapeSymbols.XML11_SYMBOLS, XmlEscapeType.CHARACTER_ENTITY_REFERENCES_DEFAULT_TO_HEXA, XmlEscapeLevel.LEVEL_1_ONLY_MARKUP_SIGNIFICANT);
    }

    public static String escapeXml10(String text) {
        return escapeXml(text, XmlEscapeSymbols.XML10_SYMBOLS, XmlEscapeType.CHARACTER_ENTITY_REFERENCES_DEFAULT_TO_HEXA, XmlEscapeLevel.LEVEL_2_ALL_NON_ASCII_PLUS_MARKUP_SIGNIFICANT);
    }

    public static String escapeXml11(String text) {
        return escapeXml(text, XmlEscapeSymbols.XML11_SYMBOLS, XmlEscapeType.CHARACTER_ENTITY_REFERENCES_DEFAULT_TO_HEXA, XmlEscapeLevel.LEVEL_2_ALL_NON_ASCII_PLUS_MARKUP_SIGNIFICANT);
    }

    public static String escapeXml10(String text, XmlEscapeType type, XmlEscapeLevel level) {
        return escapeXml(text, XmlEscapeSymbols.XML10_SYMBOLS, type, level);
    }

    public static String escapeXml11(String text, XmlEscapeType type, XmlEscapeLevel level) {
        return escapeXml(text, XmlEscapeSymbols.XML11_SYMBOLS, type, level);
    }

    private static String escapeXml(String text, XmlEscapeSymbols symbols, XmlEscapeType type, XmlEscapeLevel level) {
        if (type == null) {
            throw new IllegalArgumentException("The 'type' argument cannot be null");
        }
        if (level == null) {
            throw new IllegalArgumentException("The 'level' argument cannot be null");
        }
        return XmlEscapeUtil.escape(text, symbols, type, level);
    }

    public static void escapeXml10Minimal(char[] text, int offset, int len, Writer writer) throws IOException {
        escapeXml(text, offset, len, writer, XmlEscapeSymbols.XML10_SYMBOLS, XmlEscapeType.CHARACTER_ENTITY_REFERENCES_DEFAULT_TO_HEXA, XmlEscapeLevel.LEVEL_1_ONLY_MARKUP_SIGNIFICANT);
    }

    public static void escapeXml11Minimal(char[] text, int offset, int len, Writer writer) throws IOException {
        escapeXml(text, offset, len, writer, XmlEscapeSymbols.XML11_SYMBOLS, XmlEscapeType.CHARACTER_ENTITY_REFERENCES_DEFAULT_TO_HEXA, XmlEscapeLevel.LEVEL_1_ONLY_MARKUP_SIGNIFICANT);
    }

    public static void escapeXml10(char[] text, int offset, int len, Writer writer) throws IOException {
        escapeXml(text, offset, len, writer, XmlEscapeSymbols.XML10_SYMBOLS, XmlEscapeType.CHARACTER_ENTITY_REFERENCES_DEFAULT_TO_HEXA, XmlEscapeLevel.LEVEL_2_ALL_NON_ASCII_PLUS_MARKUP_SIGNIFICANT);
    }

    public static void escapeXml11(char[] text, int offset, int len, Writer writer) throws IOException {
        escapeXml(text, offset, len, writer, XmlEscapeSymbols.XML11_SYMBOLS, XmlEscapeType.CHARACTER_ENTITY_REFERENCES_DEFAULT_TO_HEXA, XmlEscapeLevel.LEVEL_2_ALL_NON_ASCII_PLUS_MARKUP_SIGNIFICANT);
    }

    public static void escapeXml10(char[] text, int offset, int len, Writer writer, XmlEscapeType type, XmlEscapeLevel level) throws IOException {
        escapeXml(text, offset, len, writer, XmlEscapeSymbols.XML10_SYMBOLS, type, level);
    }

    public static void escapeXml11(char[] text, int offset, int len, Writer writer, XmlEscapeType type, XmlEscapeLevel level) throws IOException {
        escapeXml(text, offset, len, writer, XmlEscapeSymbols.XML11_SYMBOLS, type, level);
    }

    private static void escapeXml(char[] text, int offset, int len, Writer writer, XmlEscapeSymbols symbols, XmlEscapeType type, XmlEscapeLevel level) throws IOException {
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
        XmlEscapeUtil.escape(text, offset, len, writer, symbols, type, level);
    }

    public static String unescapeXml(String text) {
        return XmlEscapeUtil.unescape(text, XmlEscapeSymbols.XML11_SYMBOLS);
    }

    public static void unescapeXml(char[] text, int offset, int len, Writer writer) throws IOException {
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
        XmlEscapeUtil.unescape(text, offset, len, writer, XmlEscapeSymbols.XML11_SYMBOLS);
    }

    private XmlEscape() {
    }
}
