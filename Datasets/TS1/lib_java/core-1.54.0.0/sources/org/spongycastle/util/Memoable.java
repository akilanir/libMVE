package org.spongycastle.util;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/util/Memoable.class */
public interface Memoable {
    Memoable copy();

    void reset(Memoable memoable);
}
