package org.spongycastle.asn1;

import java.io.InputStream;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/asn1/ASN1OctetStringParser.class */
public interface ASN1OctetStringParser extends ASN1Encodable, InMemoryRepresentable {
    InputStream getOctetStream();
}
