package org.tukaani.xz.lzma;

/* loaded from: xz-1.5.jar:org/tukaani/xz/lzma/Optimum.class */
final class Optimum {
    private static final int INFINITY_PRICE = 1073741824;
    final State state = new State();
    final int[] reps = new int[4];
    int price;
    int optPrev;
    int backPrev;
    boolean prev1IsLiteral;
    boolean hasPrev2;
    int optPrev2;
    int backPrev2;

    Optimum() {
    }

    void reset() {
        this.price = INFINITY_PRICE;
    }

    void set1(int i, int i2, int i3) {
        this.price = i;
        this.optPrev = i2;
        this.backPrev = i3;
        this.prev1IsLiteral = false;
    }

    void set2(int i, int i2, int i3) {
        this.price = i;
        this.optPrev = i2 + 1;
        this.backPrev = i3;
        this.prev1IsLiteral = true;
        this.hasPrev2 = false;
    }

    void set3(int i, int i2, int i3, int i4, int i5) {
        this.price = i;
        this.optPrev = i2 + i4 + 1;
        this.backPrev = i5;
        this.prev1IsLiteral = true;
        this.hasPrev2 = true;
        this.optPrev2 = i2;
        this.backPrev2 = i3;
    }
}
