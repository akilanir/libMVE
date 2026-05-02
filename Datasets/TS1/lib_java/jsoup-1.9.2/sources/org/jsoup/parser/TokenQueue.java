package org.jsoup.parser;

import org.jsoup.helper.StringUtil;
import org.jsoup.helper.Validate;

/* loaded from: jsoup-1.9.2.jar:org/jsoup/parser/TokenQueue.class */
public class TokenQueue {
    private String queue;
    private int pos = 0;
    private static final char ESC = '\\';

    public TokenQueue(String data) {
        Validate.notNull(data);
        this.queue = data;
    }

    public boolean isEmpty() {
        return remainingLength() == 0;
    }

    private int remainingLength() {
        return this.queue.length() - this.pos;
    }

    public char peek() {
        if (isEmpty()) {
            return (char) 0;
        }
        return this.queue.charAt(this.pos);
    }

    public void addFirst(Character c) {
        addFirst(c.toString());
    }

    public void addFirst(String seq) {
        this.queue = seq + this.queue.substring(this.pos);
        this.pos = 0;
    }

    public boolean matches(String seq) {
        return this.queue.regionMatches(true, this.pos, seq, 0, seq.length());
    }

    public boolean matchesCS(String seq) {
        return this.queue.startsWith(seq, this.pos);
    }

    public boolean matchesAny(String... seq) {
        for (String s : seq) {
            if (matches(s)) {
                return true;
            }
        }
        return false;
    }

    public boolean matchesAny(char... seq) {
        if (isEmpty()) {
            return false;
        }
        for (char c : seq) {
            if (this.queue.charAt(this.pos) == c) {
                return true;
            }
        }
        return false;
    }

    public boolean matchesStartTag() {
        return remainingLength() >= 2 && this.queue.charAt(this.pos) == '<' && Character.isLetter(this.queue.charAt(this.pos + 1));
    }

    public boolean matchChomp(String seq) {
        if (matches(seq)) {
            this.pos += seq.length();
            return true;
        }
        return false;
    }

    public boolean matchesWhitespace() {
        return !isEmpty() && StringUtil.isWhitespace(this.queue.charAt(this.pos));
    }

    public boolean matchesWord() {
        return !isEmpty() && Character.isLetterOrDigit(this.queue.charAt(this.pos));
    }

    public void advance() {
        if (!isEmpty()) {
            this.pos++;
        }
    }

    public char consume() {
        String str = this.queue;
        int i = this.pos;
        this.pos = i + 1;
        return str.charAt(i);
    }

    public void consume(String seq) {
        if (!matches(seq)) {
            throw new IllegalStateException("Queue did not match expected sequence");
        }
        int len = seq.length();
        if (len > remainingLength()) {
            throw new IllegalStateException("Queue not long enough to consume sequence");
        }
        this.pos += len;
    }

    public String consumeTo(String seq) {
        int offset = this.queue.indexOf(seq, this.pos);
        if (offset != -1) {
            String consumed = this.queue.substring(this.pos, offset);
            this.pos += consumed.length();
            return consumed;
        }
        return remainder();
    }

    public String consumeToIgnoreCase(String seq) {
        int start = this.pos;
        String first = seq.substring(0, 1);
        boolean canScan = first.toLowerCase().equals(first.toUpperCase());
        while (!isEmpty() && !matches(seq)) {
            if (canScan) {
                int skip = this.queue.indexOf(first, this.pos) - this.pos;
                if (skip == 0) {
                    this.pos++;
                } else if (skip < 0) {
                    this.pos = this.queue.length();
                } else {
                    this.pos += skip;
                }
            } else {
                this.pos++;
            }
        }
        return this.queue.substring(start, this.pos);
    }

    public String consumeToAny(String... seq) {
        int start = this.pos;
        while (!isEmpty() && !matchesAny(seq)) {
            this.pos++;
        }
        return this.queue.substring(start, this.pos);
    }

    public String chompTo(String seq) {
        String data = consumeTo(seq);
        matchChomp(seq);
        return data;
    }

    public String chompToIgnoreCase(String seq) {
        String data = consumeToIgnoreCase(seq);
        matchChomp(seq);
        return data;
    }

    /* JADX WARN: Removed duplicated region for block: B:46:0x00ab A[EDGE_INSN: B:46:0x00ab->B:40:0x00ab BREAK  A[LOOP:0: B:3:0x000e->B:47:?], SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:47:? A[LOOP:0: B:3:0x000e->B:47:?, LOOP_END, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.String chompBalanced(char r5, char r6) {
        /*
            r4 = this;
            r0 = -1
            r7 = r0
            r0 = -1
            r8 = r0
            r0 = 0
            r9 = r0
            r0 = 0
            r10 = r0
            r0 = 0
            r11 = r0
        Le:
            r0 = r4
            boolean r0 = r0.isEmpty()
            if (r0 == 0) goto L18
            goto Lab
        L18:
            r0 = r4
            char r0 = r0.consume()
            java.lang.Character r0 = java.lang.Character.valueOf(r0)
            r12 = r0
            r0 = r10
            if (r0 == 0) goto L2d
            r0 = r10
            r1 = 92
            if (r0 == r1) goto L8f
        L2d:
            r0 = r12
            r1 = 39
            java.lang.Character r1 = java.lang.Character.valueOf(r1)
            boolean r0 = r0.equals(r1)
            if (r0 != 0) goto L47
            r0 = r12
            r1 = 34
            java.lang.Character r1 = java.lang.Character.valueOf(r1)
            boolean r0 = r0.equals(r1)
            if (r0 == 0) goto L5c
        L47:
            r0 = r12
            char r0 = r0.charValue()
            r1 = r5
            if (r0 == r1) goto L5c
            r0 = r11
            if (r0 != 0) goto L59
            r0 = 1
            goto L5a
        L59:
            r0 = 0
        L5a:
            r11 = r0
        L5c:
            r0 = r11
            if (r0 == 0) goto L64
            goto La6
        L64:
            r0 = r12
            r1 = r5
            java.lang.Character r1 = java.lang.Character.valueOf(r1)
            boolean r0 = r0.equals(r1)
            if (r0 == 0) goto L80
            int r9 = r9 + 1
            r0 = r7
            r1 = -1
            if (r0 != r1) goto L8f
            r0 = r4
            int r0 = r0.pos
            r7 = r0
            goto L8f
        L80:
            r0 = r12
            r1 = r6
            java.lang.Character r1 = java.lang.Character.valueOf(r1)
            boolean r0 = r0.equals(r1)
            if (r0 == 0) goto L8f
            int r9 = r9 + (-1)
        L8f:
            r0 = r9
            if (r0 <= 0) goto L9f
            r0 = r10
            if (r0 == 0) goto L9f
            r0 = r4
            int r0 = r0.pos
            r8 = r0
        L9f:
            r0 = r12
            char r0 = r0.charValue()
            r10 = r0
        La6:
            r0 = r9
            if (r0 > 0) goto Le
        Lab:
            r0 = r8
            if (r0 < 0) goto Lbd
            r0 = r4
            java.lang.String r0 = r0.queue
            r1 = r7
            r2 = r8
            java.lang.String r0 = r0.substring(r1, r2)
            goto Lbf
        Lbd:
            java.lang.String r0 = ""
        Lbf:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: org.jsoup.parser.TokenQueue.chompBalanced(char, char):java.lang.String");
    }

    public static String unescape(String in) {
        StringBuilder out = new StringBuilder();
        char last = 0;
        for (char c : in.toCharArray()) {
            if (c == ESC) {
                if (last != 0 && last == ESC) {
                    out.append(c);
                }
            } else {
                out.append(c);
            }
            last = c;
        }
        return out.toString();
    }

    public boolean consumeWhitespace() {
        boolean z = false;
        while (true) {
            boolean seen = z;
            if (matchesWhitespace()) {
                this.pos++;
                z = true;
            } else {
                return seen;
            }
        }
    }

    public String consumeWord() {
        int start = this.pos;
        while (matchesWord()) {
            this.pos++;
        }
        return this.queue.substring(start, this.pos);
    }

    public String consumeTagName() {
        int start = this.pos;
        while (!isEmpty() && (matchesWord() || matchesAny(':', '_', '-'))) {
            this.pos++;
        }
        return this.queue.substring(start, this.pos);
    }

    public String consumeElementSelector() {
        int start = this.pos;
        while (!isEmpty() && (matchesWord() || matchesAny('|', '_', '-'))) {
            this.pos++;
        }
        return this.queue.substring(start, this.pos);
    }

    public String consumeCssIdentifier() {
        int start = this.pos;
        while (!isEmpty() && (matchesWord() || matchesAny('-', '_'))) {
            this.pos++;
        }
        return this.queue.substring(start, this.pos);
    }

    public String consumeAttributeKey() {
        int start = this.pos;
        while (!isEmpty() && (matchesWord() || matchesAny('-', '_', ':'))) {
            this.pos++;
        }
        return this.queue.substring(start, this.pos);
    }

    public String remainder() {
        String remainder = this.queue.substring(this.pos, this.queue.length());
        this.pos = this.queue.length();
        return remainder;
    }

    public String toString() {
        return this.queue.substring(this.pos);
    }
}
