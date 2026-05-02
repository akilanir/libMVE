package org.spongycastle.asn1.x9;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/asn1/x9/X9ECParametersHolder.class */
public abstract class X9ECParametersHolder {
    private X9ECParameters params;

    protected abstract X9ECParameters createParameters();

    public synchronized X9ECParameters getParameters() {
        if (this.params == null) {
            this.params = createParameters();
        }
        return this.params;
    }
}
