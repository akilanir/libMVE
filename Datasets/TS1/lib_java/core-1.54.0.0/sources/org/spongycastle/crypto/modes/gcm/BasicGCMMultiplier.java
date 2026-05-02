package org.spongycastle.crypto.modes.gcm;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/modes/gcm/BasicGCMMultiplier.class */
public class BasicGCMMultiplier implements GCMMultiplier {
    private int[] H;

    @Override // org.spongycastle.crypto.modes.gcm.GCMMultiplier
    public void init(byte[] H) {
        this.H = GCMUtil.asInts(H);
    }

    @Override // org.spongycastle.crypto.modes.gcm.GCMMultiplier
    public void multiplyH(byte[] x) {
        int[] t = GCMUtil.asInts(x);
        GCMUtil.multiply(t, this.H);
        GCMUtil.asBytes(t, x);
    }
}
