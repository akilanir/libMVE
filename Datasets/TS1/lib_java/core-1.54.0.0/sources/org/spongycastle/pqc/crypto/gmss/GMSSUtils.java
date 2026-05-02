package org.spongycastle.pqc.crypto.gmss;

import java.util.Enumeration;
import java.util.Vector;
import org.spongycastle.util.Arrays;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/pqc/crypto/gmss/GMSSUtils.class */
class GMSSUtils {
    GMSSUtils() {
    }

    static GMSSLeaf[] clone(GMSSLeaf[] data) {
        if (data == null) {
            return null;
        }
        GMSSLeaf[] copy = new GMSSLeaf[data.length];
        System.arraycopy(data, 0, copy, 0, data.length);
        return copy;
    }

    static GMSSRootCalc[] clone(GMSSRootCalc[] data) {
        if (data == null) {
            return null;
        }
        GMSSRootCalc[] copy = new GMSSRootCalc[data.length];
        System.arraycopy(data, 0, copy, 0, data.length);
        return copy;
    }

    static GMSSRootSig[] clone(GMSSRootSig[] data) {
        if (data == null) {
            return null;
        }
        GMSSRootSig[] copy = new GMSSRootSig[data.length];
        System.arraycopy(data, 0, copy, 0, data.length);
        return copy;
    }

    /* JADX WARN: Type inference failed for: r0v3, types: [byte[], byte[][]] */
    static byte[][] clone(byte[][] data) {
        if (data == null) {
            return (byte[][]) null;
        }
        ?? r0 = new byte[data.length];
        for (int i = 0; i != data.length; i++) {
            r0[i] = Arrays.clone(data[i]);
        }
        return r0;
    }

    /* JADX WARN: Type inference failed for: r0v3, types: [byte[][], byte[][][]] */
    static byte[][][] clone(byte[][][] data) {
        if (data == null) {
            return (byte[][][]) null;
        }
        ?? r0 = new byte[data.length][];
        for (int i = 0; i != data.length; i++) {
            r0[i] = clone(data[i]);
        }
        return r0;
    }

    static Treehash[] clone(Treehash[] data) {
        if (data == null) {
            return null;
        }
        Treehash[] copy = new Treehash[data.length];
        System.arraycopy(data, 0, copy, 0, data.length);
        return copy;
    }

    /* JADX WARN: Type inference failed for: r0v3, types: [org.spongycastle.pqc.crypto.gmss.Treehash[], org.spongycastle.pqc.crypto.gmss.Treehash[][]] */
    static Treehash[][] clone(Treehash[][] data) {
        if (data == null) {
            return (Treehash[][]) null;
        }
        ?? r0 = new Treehash[data.length];
        for (int i = 0; i != data.length; i++) {
            r0[i] = clone(data[i]);
        }
        return r0;
    }

    static Vector[] clone(Vector[] data) {
        if (data == null) {
            return null;
        }
        Vector[] copy = new Vector[data.length];
        for (int i = 0; i != data.length; i++) {
            copy[i] = new Vector();
            Enumeration en = data[i].elements();
            while (en.hasMoreElements()) {
                copy[i].addElement(en.nextElement());
            }
        }
        return copy;
    }

    /* JADX WARN: Type inference failed for: r0v3, types: [java.util.Vector[], java.util.Vector[][]] */
    static Vector[][] clone(Vector[][] data) {
        if (data == null) {
            return (Vector[][]) null;
        }
        ?? r0 = new Vector[data.length];
        for (int i = 0; i != data.length; i++) {
            r0[i] = clone(data[i]);
        }
        return r0;
    }
}
