package org.spongycastle.asn1;

import java.io.IOException;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/asn1/InMemoryRepresentable.class */
public interface InMemoryRepresentable {
    ASN1Primitive getLoadedObject() throws IOException;
}
