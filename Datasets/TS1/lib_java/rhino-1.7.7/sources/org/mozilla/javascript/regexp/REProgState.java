package org.mozilla.javascript.regexp;

/* compiled from: NativeRegExp.java */
/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/regexp/REProgState.class */
class REProgState {
    final REProgState previous;
    final int min;
    final int max;
    final int index;
    final int continuationOp;
    final int continuationPc;
    final REBackTrackData backTrack;

    REProgState(REProgState previous, int min, int max, int index, REBackTrackData backTrack, int continuationOp, int continuationPc) {
        this.previous = previous;
        this.min = min;
        this.max = max;
        this.index = index;
        this.continuationOp = continuationOp;
        this.continuationPc = continuationPc;
        this.backTrack = backTrack;
    }
}
