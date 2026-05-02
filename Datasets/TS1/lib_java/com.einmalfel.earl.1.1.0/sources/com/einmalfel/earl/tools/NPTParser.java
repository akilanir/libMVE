package com.einmalfel.earl.tools;

import java.text.ParseException;

/* loaded from: com.einmalfel.earl.1.1.0.jar:com/einmalfel/earl/tools/NPTParser.class */
public class NPTParser {
    private final String text;
    private final int length;
    private int currentIndex = -1;
    private char current;
    private static final char EOF = 0;

    public NPTParser(String text) {
        this.text = text;
        this.length = text.length();
        next();
    }

    public long parse() throws ParseException {
        long ms;
        int first = parseNumber();
        if (this.current == ':') {
            next();
            long minutes = parseNumber();
            assertCurrentIs(':');
            next();
            long seconds = parseNumber();
            ms = ((((first * 60) + minutes) * 60) + seconds) * 1000;
        } else {
            ms = first * 1000;
        }
        if (this.current == '.') {
            next();
            int exp = 100;
            int i = 0;
            while (i <= 3 && isDigit()) {
                ms += exp * digitValue();
                next();
                i++;
                exp /= 10;
            }
            parseNumber();
        }
        assertCurrentIs((char) 0);
        return ms;
    }

    private int parseNumber() {
        int retval = 0;
        while (isDigit()) {
            retval = (retval * 10) + digitValue();
            next();
        }
        return retval;
    }

    private int digitValue() {
        return this.current - '0';
    }

    private boolean isDigit() {
        return this.current >= '0' && this.current <= '9';
    }

    private void assertCurrentIs(char c) throws ParseException {
        if (c != this.current) {
            throw new ParseException("Unexpected character", this.currentIndex);
        }
    }

    private void next() {
        this.currentIndex++;
        if (this.currentIndex >= this.length) {
            this.current = (char) 0;
        } else {
            this.current = this.text.charAt(this.currentIndex);
        }
    }
}
