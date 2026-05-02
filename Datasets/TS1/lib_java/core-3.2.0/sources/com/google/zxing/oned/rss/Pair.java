package com.google.zxing.oned.rss;

/* loaded from: core-3.2.0.jar:com/google/zxing/oned/rss/Pair.class */
final class Pair extends DataCharacter {
    private final FinderPattern finderPattern;
    private int count;

    Pair(int value, int checksumPortion, FinderPattern finderPattern) {
        super(value, checksumPortion);
        this.finderPattern = finderPattern;
    }

    FinderPattern getFinderPattern() {
        return this.finderPattern;
    }

    int getCount() {
        return this.count;
    }

    void incrementCount() {
        this.count++;
    }
}
