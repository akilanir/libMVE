package org.spongycastle.asn1;

import java.io.OutputStream;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/asn1/ASN1Generator.class */
public abstract class ASN1Generator {
    protected OutputStream _out;

    public abstract OutputStream getRawOutputStream();

    public ASN1Generator(OutputStream out) {
        this._out = out;
    }
}
