package org.jsoup.parser;

import java.util.ArrayList;

/* loaded from: jsoup-1.8.2.jar:org/jsoup/parser/ParseErrorList.class */
class ParseErrorList extends ArrayList<ParseError> {
    private static final int INITIAL_CAPACITY = 16;
    private final int maxSize;

    ParseErrorList(int initialCapacity, int maxSize) {
        super(initialCapacity);
        this.maxSize = maxSize;
    }

    boolean canAddError() {
        return size() < this.maxSize;
    }

    int getMaxSize() {
        return this.maxSize;
    }

    static ParseErrorList noTracking() {
        return new ParseErrorList(0, 0);
    }

    static ParseErrorList tracking(int maxSize) {
        return new ParseErrorList(INITIAL_CAPACITY, maxSize);
    }
}
