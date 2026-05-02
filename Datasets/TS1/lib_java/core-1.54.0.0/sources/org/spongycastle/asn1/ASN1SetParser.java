package org.spongycastle.asn1;

import java.io.IOException;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/asn1/ASN1SetParser.class */
public interface ASN1SetParser extends ASN1Encodable, InMemoryRepresentable {
    ASN1Encodable readObject() throws IOException;
}
