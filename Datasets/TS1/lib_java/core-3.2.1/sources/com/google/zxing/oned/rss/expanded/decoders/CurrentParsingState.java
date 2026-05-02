package com.google.zxing.oned.rss.expanded.decoders;

/* loaded from: core-3.2.1.jar:com/google/zxing/oned/rss/expanded/decoders/CurrentParsingState.class */
final class CurrentParsingState {
    private int position = 0;
    private State encoding = State.NUMERIC;

    /* loaded from: core-3.2.1.jar:com/google/zxing/oned/rss/expanded/decoders/CurrentParsingState$State.class */
    private enum State {
        NUMERIC,
        ALPHA,
        ISO_IEC_646
    }

    CurrentParsingState() {
    }

    int getPosition() {
        return this.position;
    }

    void setPosition(int position) {
        this.position = position;
    }

    void incrementPosition(int delta) {
        this.position += delta;
    }

    boolean isAlpha() {
        return this.encoding == State.ALPHA;
    }

    boolean isNumeric() {
        return this.encoding == State.NUMERIC;
    }

    boolean isIsoIec646() {
        return this.encoding == State.ISO_IEC_646;
    }

    void setNumeric() {
        this.encoding = State.NUMERIC;
    }

    void setAlpha() {
        this.encoding = State.ALPHA;
    }

    void setIsoIec646() {
        this.encoding = State.ISO_IEC_646;
    }
}
