package com.google.zxing.oned.rss.expanded.decoders;

/* loaded from: core-3.2.1.jar:com/google/zxing/oned/rss/expanded/decoders/DecodedChar.class */
final class DecodedChar extends DecodedObject {
    private final char value;
    static final char FNC1 = '$';

    DecodedChar(int newPosition, char value) {
        super(newPosition);
        this.value = value;
    }

    char getValue() {
        return this.value;
    }

    boolean isFNC1() {
        return this.value == FNC1;
    }
}
