package org.spongycastle.asn1;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/asn1/DERObjectIdentifier.class */
public class DERObjectIdentifier extends ASN1ObjectIdentifier {
    public DERObjectIdentifier(String identifier) {
        super(identifier);
    }

    DERObjectIdentifier(byte[] bytes) {
        super(bytes);
    }

    DERObjectIdentifier(ASN1ObjectIdentifier oid, String branch) {
        super(oid, branch);
    }
}
