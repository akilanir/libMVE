package org.mozilla.javascript.regexp;

/* compiled from: NativeRegExp.java */
/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/regexp/RENode.class */
class RENode {
    byte op;
    RENode next;
    RENode kid;
    RENode kid2;
    int parenIndex;
    int min;
    int max;
    int parenCount;
    boolean greedy;
    int startIndex;
    int kidlen;
    int bmsize;
    int index;
    boolean sense;
    char chr;
    int length;
    int flatIndex;

    RENode(byte op) {
        this.op = op;
    }
}
