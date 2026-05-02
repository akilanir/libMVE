package org.jsoup.parser;

import java.util.Arrays;
import java.util.Locale;
import org.jsoup.helper.Validate;

/* loaded from: jsoup-1.8.3.jar:org/jsoup/parser/CharacterReader.class */
final class CharacterReader {
    static final char EOF = 65535;
    private static final int maxCacheLen = 12;
    private final char[] input;
    private final int length;
    private int pos = 0;
    private int mark = 0;
    private final String[] stringCache = new String[512];

    CharacterReader(String input) {
        Validate.notNull(input);
        this.input = input.toCharArray();
        this.length = this.input.length;
    }

    int pos() {
        return this.pos;
    }

    boolean isEmpty() {
        return this.pos >= this.length;
    }

    char current() {
        if (this.pos >= this.length) {
            return (char) 65535;
        }
        return this.input[this.pos];
    }

    char consume() {
        char val = this.pos >= this.length ? (char) 65535 : this.input[this.pos];
        this.pos++;
        return val;
    }

    void unconsume() {
        this.pos--;
    }

    void advance() {
        this.pos++;
    }

    void mark() {
        this.mark = this.pos;
    }

    void rewindToMark() {
        this.pos = this.mark;
    }

    String consumeAsString() {
        char[] cArr = this.input;
        int i = this.pos;
        this.pos = i + 1;
        return new String(cArr, i, 1);
    }

    int nextIndexOf(char c) {
        for (int i = this.pos; i < this.length; i++) {
            if (c == this.input[i]) {
                return i - this.pos;
            }
        }
        return -1;
    }

    int nextIndexOf(CharSequence seq) {
        char startChar = seq.charAt(0);
        int offset = this.pos;
        while (offset < this.length) {
            if (startChar != this.input[offset]) {
                do {
                    offset++;
                    if (offset >= this.length) {
                        break;
                    }
                } while (startChar != this.input[offset]);
            }
            int i = offset + 1;
            int last = (i + seq.length()) - 1;
            if (offset < this.length && last <= this.length) {
                for (int j = 1; i < last && seq.charAt(j) == this.input[i]; j++) {
                    i++;
                }
                if (i == last) {
                    return offset - this.pos;
                }
            }
            offset++;
        }
        return -1;
    }

    String consumeTo(char c) {
        int offset = nextIndexOf(c);
        if (offset != -1) {
            String consumed = cacheString(this.pos, offset);
            this.pos += offset;
            return consumed;
        }
        return consumeToEnd();
    }

    String consumeTo(String seq) {
        int offset = nextIndexOf(seq);
        if (offset != -1) {
            String consumed = cacheString(this.pos, offset);
            this.pos += offset;
            return consumed;
        }
        return consumeToEnd();
    }

    String consumeToAny(char... chars) {
        int start = this.pos;
        int remaining = this.length;
        loop0: while (this.pos < remaining) {
            for (char c : chars) {
                if (this.input[this.pos] == c) {
                    break loop0;
                }
            }
            this.pos++;
        }
        return this.pos > start ? cacheString(start, this.pos - start) : "";
    }

    String consumeToAnySorted(char... chars) {
        int start = this.pos;
        int remaining = this.length;
        char[] val = this.input;
        while (this.pos < remaining && Arrays.binarySearch(chars, val[this.pos]) < 0) {
            this.pos++;
        }
        return this.pos > start ? cacheString(start, this.pos - start) : "";
    }

    String consumeData() {
        char c;
        int start = this.pos;
        int remaining = this.length;
        char[] val = this.input;
        while (this.pos < remaining && (c = val[this.pos]) != '&' && c != '<' && c != 0) {
            this.pos++;
        }
        return this.pos > start ? cacheString(start, this.pos - start) : "";
    }

    String consumeTagName() {
        char c;
        int start = this.pos;
        int remaining = this.length;
        char[] val = this.input;
        while (this.pos < remaining && (c = val[this.pos]) != '\t' && c != '\n' && c != '\r' && c != maxCacheLen && c != ' ' && c != '/' && c != '>' && c != 0) {
            this.pos++;
        }
        return this.pos > start ? cacheString(start, this.pos - start) : "";
    }

    String consumeToEnd() {
        String data = cacheString(this.pos, this.length - this.pos);
        this.pos = this.length;
        return data;
    }

    String consumeLetterSequence() {
        char c;
        int start = this.pos;
        while (this.pos < this.length && (((c = this.input[this.pos]) >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z'))) {
            this.pos++;
        }
        return cacheString(start, this.pos - start);
    }

    String consumeLetterThenDigitSequence() {
        char c;
        char c2;
        int start = this.pos;
        while (this.pos < this.length && (((c2 = this.input[this.pos]) >= 'A' && c2 <= 'Z') || (c2 >= 'a' && c2 <= 'z'))) {
            this.pos++;
        }
        while (!isEmpty() && (c = this.input[this.pos]) >= '0' && c <= '9') {
            this.pos++;
        }
        return cacheString(start, this.pos - start);
    }

    String consumeHexSequence() {
        char c;
        int start = this.pos;
        while (this.pos < this.length && (((c = this.input[this.pos]) >= '0' && c <= '9') || ((c >= 'A' && c <= 'F') || (c >= 'a' && c <= 'f')))) {
            this.pos++;
        }
        return cacheString(start, this.pos - start);
    }

    String consumeDigitSequence() {
        char c;
        int start = this.pos;
        while (this.pos < this.length && (c = this.input[this.pos]) >= '0' && c <= '9') {
            this.pos++;
        }
        return cacheString(start, this.pos - start);
    }

    boolean matches(char c) {
        return !isEmpty() && this.input[this.pos] == c;
    }

    boolean matches(String seq) {
        int scanLength = seq.length();
        if (scanLength > this.length - this.pos) {
            return false;
        }
        for (int offset = 0; offset < scanLength; offset++) {
            if (seq.charAt(offset) != this.input[this.pos + offset]) {
                return false;
            }
        }
        return true;
    }

    boolean matchesIgnoreCase(String seq) {
        int scanLength = seq.length();
        if (scanLength > this.length - this.pos) {
            return false;
        }
        for (int offset = 0; offset < scanLength; offset++) {
            char upScan = Character.toUpperCase(seq.charAt(offset));
            char upTarget = Character.toUpperCase(this.input[this.pos + offset]);
            if (upScan != upTarget) {
                return false;
            }
        }
        return true;
    }

    boolean matchesAny(char... seq) {
        if (isEmpty()) {
            return false;
        }
        char c = this.input[this.pos];
        for (char seek : seq) {
            if (seek == c) {
                return true;
            }
        }
        return false;
    }

    boolean matchesAnySorted(char[] seq) {
        return !isEmpty() && Arrays.binarySearch(seq, this.input[this.pos]) >= 0;
    }

    boolean matchesLetter() {
        if (isEmpty()) {
            return false;
        }
        char c = this.input[this.pos];
        return (c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z');
    }

    boolean matchesDigit() {
        char c;
        return !isEmpty() && (c = this.input[this.pos]) >= '0' && c <= '9';
    }

    boolean matchConsume(String seq) {
        if (matches(seq)) {
            this.pos += seq.length();
            return true;
        }
        return false;
    }

    boolean matchConsumeIgnoreCase(String seq) {
        if (matchesIgnoreCase(seq)) {
            this.pos += seq.length();
            return true;
        }
        return false;
    }

    boolean containsIgnoreCase(String seq) {
        String loScan = seq.toLowerCase(Locale.ENGLISH);
        String hiScan = seq.toUpperCase(Locale.ENGLISH);
        return nextIndexOf(loScan) > -1 || nextIndexOf(hiScan) > -1;
    }

    public String toString() {
        return new String(this.input, this.pos, this.length - this.pos);
    }

    private String cacheString(int start, int count) {
        String cached;
        char[] val = this.input;
        String[] cache = this.stringCache;
        if (count > maxCacheLen) {
            return new String(val, start, count);
        }
        int hash = 0;
        int offset = start;
        for (int i = 0; i < count; i++) {
            int i2 = offset;
            offset++;
            hash = (31 * hash) + val[i2];
        }
        int index = hash & (cache.length - 1);
        String cached2 = cache[index];
        if (cached2 == null) {
            cached = new String(val, start, count);
            cache[index] = cached;
        } else {
            if (rangeEquals(start, count, cached2)) {
                return cached2;
            }
            cached = new String(val, start, count);
        }
        return cached;
    }

    boolean rangeEquals(int start, int count, String cached) {
        int i;
        int i2;
        if (count == cached.length()) {
            char[] one = this.input;
            int i3 = start;
            int j = 0;
            do {
                int i4 = count;
                count--;
                if (i4 == 0) {
                    return true;
                }
                i = i3;
                i3++;
                i2 = j;
                j++;
            } while (one[i] == cached.charAt(i2));
            return false;
        }
        return false;
    }
}
