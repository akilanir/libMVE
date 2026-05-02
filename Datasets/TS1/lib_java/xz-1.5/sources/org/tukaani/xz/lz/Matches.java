package org.tukaani.xz.lz;

/* loaded from: xz-1.5.jar:org/tukaani/xz/lz/Matches.class */
public final class Matches {
    public final int[] len;
    public final int[] dist;
    public int count = 0;

    Matches(int i) {
        this.len = new int[i];
        this.dist = new int[i];
    }
}
