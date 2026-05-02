package org.spongycastle.math.ec;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/math/ec/FixedPointPreCompInfo.class */
public class FixedPointPreCompInfo implements PreCompInfo {
    protected ECPoint[] preComp = null;
    protected int width = -1;

    public ECPoint[] getPreComp() {
        return this.preComp;
    }

    public void setPreComp(ECPoint[] preComp) {
        this.preComp = preComp;
    }

    public int getWidth() {
        return this.width;
    }

    public void setWidth(int width) {
        this.width = width;
    }
}
