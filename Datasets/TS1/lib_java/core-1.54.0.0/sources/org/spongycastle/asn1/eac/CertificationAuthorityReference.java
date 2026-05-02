package org.spongycastle.asn1.eac;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/asn1/eac/CertificationAuthorityReference.class */
public class CertificationAuthorityReference extends CertificateHolderReference {
    public CertificationAuthorityReference(String countryCode, String holderMnemonic, String sequenceNumber) {
        super(countryCode, holderMnemonic, sequenceNumber);
    }

    CertificationAuthorityReference(byte[] contents) {
        super(contents);
    }
}
