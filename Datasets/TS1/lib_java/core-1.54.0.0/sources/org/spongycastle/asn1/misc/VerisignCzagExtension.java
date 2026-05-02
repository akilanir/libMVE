package org.spongycastle.asn1.misc;

import org.spongycastle.asn1.DERIA5String;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/asn1/misc/VerisignCzagExtension.class */
public class VerisignCzagExtension extends DERIA5String {
    public VerisignCzagExtension(DERIA5String str) {
        super(str.getString());
    }

    @Override // org.spongycastle.asn1.DERIA5String
    public String toString() {
        return "VerisignCzagExtension: " + getString();
    }
}
