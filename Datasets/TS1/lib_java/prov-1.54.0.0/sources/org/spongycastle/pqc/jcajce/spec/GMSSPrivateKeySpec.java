package org.spongycastle.pqc.jcajce.spec;

import java.security.spec.KeySpec;
import java.util.Vector;
import org.spongycastle.pqc.crypto.gmss.GMSSLeaf;
import org.spongycastle.pqc.crypto.gmss.GMSSParameters;
import org.spongycastle.pqc.crypto.gmss.GMSSRootCalc;
import org.spongycastle.pqc.crypto.gmss.GMSSRootSig;
import org.spongycastle.pqc.crypto.gmss.Treehash;
import org.spongycastle.util.Arrays;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/pqc/jcajce/spec/GMSSPrivateKeySpec.class */
public class GMSSPrivateKeySpec implements KeySpec {
    private int[] index;
    private byte[][] currentSeed;
    private byte[][] nextNextSeed;
    private byte[][][] currentAuthPath;
    private byte[][][] nextAuthPath;
    private Treehash[][] currentTreehash;
    private Treehash[][] nextTreehash;
    private Vector[] currentStack;
    private Vector[] nextStack;
    private Vector[][] currentRetain;
    private Vector[][] nextRetain;
    private byte[][][] keep;
    private GMSSLeaf[] nextNextLeaf;
    private GMSSLeaf[] upperLeaf;
    private GMSSLeaf[] upperTreehashLeaf;
    private int[] minTreehash;
    private GMSSParameters gmssPS;
    private byte[][] nextRoot;
    private GMSSRootCalc[] nextNextRoot;
    private byte[][] currentRootSig;
    private GMSSRootSig[] nextRootSig;

    public GMSSPrivateKeySpec(int[] index, byte[][] currentSeed, byte[][] nextNextSeed, byte[][][] currentAuthPath, byte[][][] nextAuthPath, Treehash[][] currentTreehash, Treehash[][] nextTreehash, Vector[] currentStack, Vector[] nextStack, Vector[][] currentRetain, Vector[][] nextRetain, byte[][][] keep, GMSSLeaf[] nextNextLeaf, GMSSLeaf[] upperLeaf, GMSSLeaf[] upperTreehashLeaf, int[] minTreehash, byte[][] nextRoot, GMSSRootCalc[] nextNextRoot, byte[][] currentRootSig, GMSSRootSig[] nextRootSig, GMSSParameters gmssParameterset) {
        this.index = index;
        this.currentSeed = currentSeed;
        this.nextNextSeed = nextNextSeed;
        this.currentAuthPath = currentAuthPath;
        this.nextAuthPath = nextAuthPath;
        this.currentTreehash = currentTreehash;
        this.nextTreehash = nextTreehash;
        this.currentStack = currentStack;
        this.nextStack = nextStack;
        this.currentRetain = currentRetain;
        this.nextRetain = nextRetain;
        this.keep = keep;
        this.nextNextLeaf = nextNextLeaf;
        this.upperLeaf = upperLeaf;
        this.upperTreehashLeaf = upperTreehashLeaf;
        this.minTreehash = minTreehash;
        this.nextRoot = nextRoot;
        this.nextNextRoot = nextNextRoot;
        this.currentRootSig = currentRootSig;
        this.nextRootSig = nextRootSig;
        this.gmssPS = gmssParameterset;
    }

    public int[] getIndex() {
        return Arrays.clone(this.index);
    }

    public byte[][] getCurrentSeed() {
        return clone(this.currentSeed);
    }

    public byte[][] getNextNextSeed() {
        return clone(this.nextNextSeed);
    }

    public byte[][][] getCurrentAuthPath() {
        return clone(this.currentAuthPath);
    }

    public byte[][][] getNextAuthPath() {
        return clone(this.nextAuthPath);
    }

    public Treehash[][] getCurrentTreehash() {
        return clone(this.currentTreehash);
    }

    public Treehash[][] getNextTreehash() {
        return clone(this.nextTreehash);
    }

    public byte[][][] getKeep() {
        return clone(this.keep);
    }

    public Vector[] getCurrentStack() {
        return clone(this.currentStack);
    }

    public Vector[] getNextStack() {
        return clone(this.nextStack);
    }

    public Vector[][] getCurrentRetain() {
        return clone(this.currentRetain);
    }

    public Vector[][] getNextRetain() {
        return clone(this.nextRetain);
    }

    public GMSSLeaf[] getNextNextLeaf() {
        return clone(this.nextNextLeaf);
    }

    public GMSSLeaf[] getUpperLeaf() {
        return clone(this.upperLeaf);
    }

    public GMSSLeaf[] getUpperTreehashLeaf() {
        return clone(this.upperTreehashLeaf);
    }

    public int[] getMinTreehash() {
        return Arrays.clone(this.minTreehash);
    }

    public GMSSRootSig[] getNextRootSig() {
        return clone(this.nextRootSig);
    }

    public GMSSParameters getGmssPS() {
        return this.gmssPS;
    }

    public byte[][] getNextRoot() {
        return clone(this.nextRoot);
    }

    public GMSSRootCalc[] getNextNextRoot() {
        return clone(this.nextNextRoot);
    }

    public byte[][] getCurrentRootSig() {
        return clone(this.currentRootSig);
    }

    private static GMSSLeaf[] clone(GMSSLeaf[] data) {
        if (data == null) {
            return null;
        }
        GMSSLeaf[] copy = new GMSSLeaf[data.length];
        System.arraycopy(data, 0, copy, 0, data.length);
        return copy;
    }

    private static GMSSRootCalc[] clone(GMSSRootCalc[] data) {
        if (data == null) {
            return null;
        }
        GMSSRootCalc[] copy = new GMSSRootCalc[data.length];
        System.arraycopy(data, 0, copy, 0, data.length);
        return copy;
    }

    private static GMSSRootSig[] clone(GMSSRootSig[] data) {
        if (data == null) {
            return null;
        }
        GMSSRootSig[] copy = new GMSSRootSig[data.length];
        System.arraycopy(data, 0, copy, 0, data.length);
        return copy;
    }

    /* JADX WARN: Type inference failed for: r0v3, types: [byte[], byte[][]] */
    private static byte[][] clone(byte[][] data) {
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
    private static byte[][][] clone(byte[][][] data) {
        if (data == null) {
            return (byte[][][]) null;
        }
        ?? r0 = new byte[data.length][];
        for (int i = 0; i != data.length; i++) {
            r0[i] = clone(data[i]);
        }
        return r0;
    }

    private static Treehash[] clone(Treehash[] data) {
        if (data == null) {
            return null;
        }
        Treehash[] copy = new Treehash[data.length];
        System.arraycopy(data, 0, copy, 0, data.length);
        return copy;
    }

    /* JADX WARN: Type inference failed for: r0v3, types: [org.spongycastle.pqc.crypto.gmss.Treehash[], org.spongycastle.pqc.crypto.gmss.Treehash[][]] */
    private static Treehash[][] clone(Treehash[][] data) {
        if (data == null) {
            return (Treehash[][]) null;
        }
        ?? r0 = new Treehash[data.length];
        for (int i = 0; i != data.length; i++) {
            r0[i] = clone(data[i]);
        }
        return r0;
    }

    private static Vector[] clone(Vector[] data) {
        if (data == null) {
            return null;
        }
        Vector[] copy = new Vector[data.length];
        for (int i = 0; i != data.length; i++) {
            copy[i] = new Vector(data[i]);
        }
        return copy;
    }

    /* JADX WARN: Type inference failed for: r0v3, types: [java.util.Vector[], java.util.Vector[][]] */
    private static Vector[][] clone(Vector[][] data) {
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
