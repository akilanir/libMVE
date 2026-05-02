package com.google.zxing.oned.rss.expanded.decoders;

/* loaded from: core-3.2.1.jar:com/google/zxing/oned/rss/expanded/decoders/DecodedObject.class */
abstract class DecodedObject {
    private final int newPosition;

    DecodedObject(int newPosition) {
        this.newPosition = newPosition;
    }

    final int getNewPosition() {
        return this.newPosition;
    }
}
