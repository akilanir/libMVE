package com.google.zxing.oned.rss.expanded.decoders;

/* loaded from: core-3.2.1.jar:com/google/zxing/oned/rss/expanded/decoders/DecodedInformation.class */
final class DecodedInformation extends DecodedObject {
    private final String newString;
    private final int remainingValue;
    private final boolean remaining;

    DecodedInformation(int newPosition, String newString) {
        super(newPosition);
        this.newString = newString;
        this.remaining = false;
        this.remainingValue = 0;
    }

    DecodedInformation(int newPosition, String newString, int remainingValue) {
        super(newPosition);
        this.remaining = true;
        this.remainingValue = remainingValue;
        this.newString = newString;
    }

    String getNewString() {
        return this.newString;
    }

    boolean isRemaining() {
        return this.remaining;
    }

    int getRemainingValue() {
        return this.remainingValue;
    }
}
