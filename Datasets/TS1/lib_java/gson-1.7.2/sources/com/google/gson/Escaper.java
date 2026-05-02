package com.google.gson;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

/* loaded from: gson-1.7.2.jar:com/google/gson/Escaper.class */
final class Escaper {
    private static final char[] HEX_CHARS = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};
    private static final Set<Character> JS_ESCAPE_CHARS;
    private static final Set<Character> HTML_ESCAPE_CHARS;
    private final boolean escapeHtmlCharacters;

    static {
        Set<Character> mandatoryEscapeSet = new HashSet<>();
        mandatoryEscapeSet.add('\"');
        mandatoryEscapeSet.add('\\');
        JS_ESCAPE_CHARS = Collections.unmodifiableSet(mandatoryEscapeSet);
        Set<Character> htmlEscapeSet = new HashSet<>();
        htmlEscapeSet.add('<');
        htmlEscapeSet.add('>');
        htmlEscapeSet.add('&');
        htmlEscapeSet.add('=');
        htmlEscapeSet.add('\'');
        HTML_ESCAPE_CHARS = Collections.unmodifiableSet(htmlEscapeSet);
    }

    Escaper(boolean escapeHtmlCharacters) {
        this.escapeHtmlCharacters = escapeHtmlCharacters;
    }

    public String escapeJsonString(CharSequence plainText) {
        StringBuilder escapedString = new StringBuilder(plainText.length() + 20);
        try {
            escapeJsonString(plainText, escapedString);
            return escapedString.toString();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void escapeJsonString(CharSequence plainText, StringBuilder out) throws IOException {
        int pos = 0;
        int len = plainText.length();
        int i = 0;
        while (true) {
            int i2 = i;
            if (i2 < len) {
                int codePoint = Character.codePointAt(plainText, i2);
                int charCount = Character.charCount(codePoint);
                if (isControlCharacter(codePoint) || mustEscapeCharInJsString(codePoint)) {
                    out.append(plainText, pos, i2);
                    pos = i2 + charCount;
                    switch (codePoint) {
                        case 8:
                            out.append("\\b");
                            break;
                        case 9:
                            out.append("\\t");
                            break;
                        case 10:
                            out.append("\\n");
                            break;
                        case 12:
                            out.append("\\f");
                            break;
                        case 13:
                            out.append("\\r");
                            break;
                        case 34:
                            out.append("\\\"");
                            break;
                        case 47:
                            out.append("\\/");
                            break;
                        case 92:
                            out.append("\\\\");
                            break;
                        default:
                            appendHexJavaScriptRepresentation(codePoint, out);
                            break;
                    }
                }
                i = i2 + charCount;
            } else {
                out.append(plainText, pos, len);
                return;
            }
        }
    }

    private boolean mustEscapeCharInJsString(int codepoint) {
        if (!Character.isSupplementaryCodePoint(codepoint)) {
            char c = (char) codepoint;
            return JS_ESCAPE_CHARS.contains(Character.valueOf(c)) || (this.escapeHtmlCharacters && HTML_ESCAPE_CHARS.contains(Character.valueOf(c)));
        }
        return false;
    }

    private static boolean isControlCharacter(int codePoint) {
        return codePoint < 32 || codePoint == 8232 || codePoint == 8233 || (codePoint >= 127 && codePoint <= 159);
    }

    private static void appendHexJavaScriptRepresentation(int codePoint, Appendable out) throws IOException {
        if (Character.isSupplementaryCodePoint(codePoint)) {
            char[] surrogates = Character.toChars(codePoint);
            appendHexJavaScriptRepresentation(surrogates[0], out);
            appendHexJavaScriptRepresentation(surrogates[1], out);
            return;
        }
        out.append("\\u").append(HEX_CHARS[(codePoint >>> 12) & 15]).append(HEX_CHARS[(codePoint >>> 8) & 15]).append(HEX_CHARS[(codePoint >>> 4) & 15]).append(HEX_CHARS[codePoint & 15]);
    }
}
