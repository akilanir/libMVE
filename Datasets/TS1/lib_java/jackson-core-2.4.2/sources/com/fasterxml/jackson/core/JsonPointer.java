package com.fasterxml.jackson.core;

import com.fasterxml.jackson.core.io.NumberInput;

/* loaded from: jackson-core-2.4.2.jar:com/fasterxml/jackson/core/JsonPointer.class */
public class JsonPointer {
    protected static final JsonPointer EMPTY = new JsonPointer();
    protected final JsonPointer _nextSegment;
    protected final String _asString;
    protected final String _matchingPropertyName;
    protected final int _matchingElementIndex;

    protected JsonPointer() {
        this._nextSegment = null;
        this._matchingPropertyName = "";
        this._matchingElementIndex = -1;
        this._asString = "";
    }

    protected JsonPointer(String fullString, String segment, JsonPointer next) {
        this._asString = fullString;
        this._nextSegment = next;
        this._matchingPropertyName = segment;
        this._matchingElementIndex = _parseIndex(segment);
    }

    public static JsonPointer compile(String input) throws IllegalArgumentException {
        if (input == null || input.length() == 0) {
            return EMPTY;
        }
        if (input.charAt(0) != '/') {
            throw new IllegalArgumentException("Invalid input: JSON Pointer expression must start with '/': \"" + input + "\"");
        }
        return _parseTail(input);
    }

    public static JsonPointer valueOf(String input) {
        return compile(input);
    }

    public boolean matches() {
        return this._nextSegment == null;
    }

    public String getMatchingProperty() {
        return this._matchingPropertyName;
    }

    public int getMatchingIndex() {
        return this._matchingElementIndex;
    }

    public boolean mayMatchProperty() {
        return this._matchingPropertyName != null;
    }

    public boolean mayMatchElement() {
        return this._matchingElementIndex >= 0;
    }

    public JsonPointer matchProperty(String name) {
        if (this._nextSegment == null || !this._matchingPropertyName.equals(name)) {
            return null;
        }
        return this._nextSegment;
    }

    public JsonPointer matchElement(int index) {
        if (index != this._matchingElementIndex || index < 0) {
            return null;
        }
        return this._nextSegment;
    }

    public JsonPointer tail() {
        return this._nextSegment;
    }

    public String toString() {
        return this._asString;
    }

    public int hashCode() {
        return this._asString.hashCode();
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o != null && (o instanceof JsonPointer)) {
            return this._asString.equals(((JsonPointer) o)._asString);
        }
        return false;
    }

    private static final int _parseIndex(String str) {
        int len = str.length();
        if (len == 0 || len > 10) {
            return -1;
        }
        int i = 0;
        while (i < len) {
            int i2 = i;
            int i3 = i + 1;
            char c = str.charAt(i2);
            if (c <= '9' && c >= '0') {
                i = i3 + 1;
            } else {
                return -1;
            }
        }
        if (len == 10) {
            long l = NumberInput.parseLong(str);
            if (l > 2147483647L) {
                return -1;
            }
        }
        return NumberInput.parseInt(str);
    }

    protected static JsonPointer _parseTail(String input) {
        int end = input.length();
        int i = 1;
        while (i < end) {
            char c = input.charAt(i);
            if (c == '/') {
                return new JsonPointer(input, input.substring(1, i), _parseTail(input.substring(i)));
            }
            i++;
            if (c == '~' && i < end) {
                return _parseQuotedTail(input, i);
            }
        }
        return new JsonPointer(input, input.substring(1), EMPTY);
    }

    protected static JsonPointer _parseQuotedTail(String input, int i) {
        int end = input.length();
        StringBuilder sb = new StringBuilder(Math.max(16, end));
        if (i > 2) {
            sb.append((CharSequence) input, 1, i - 1);
        }
        int i2 = i + 1;
        _appendEscape(sb, input.charAt(i));
        while (i2 < end) {
            char c = input.charAt(i2);
            if (c == '/') {
                return new JsonPointer(input, sb.toString(), _parseTail(input.substring(i2)));
            }
            i2++;
            if (c == '~' && i2 < end) {
                i2++;
                _appendEscape(sb, input.charAt(i2));
            } else {
                sb.append(c);
            }
        }
        return new JsonPointer(input, sb.toString(), EMPTY);
    }

    private static void _appendEscape(StringBuilder sb, char c) {
        if (c == '0') {
            c = '~';
        } else if (c == '1') {
            c = '/';
        } else {
            sb.append('~');
        }
        sb.append(c);
    }
}
