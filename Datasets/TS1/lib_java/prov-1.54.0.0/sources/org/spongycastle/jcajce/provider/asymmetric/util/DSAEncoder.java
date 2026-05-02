package org.spongycastle.jcajce.provider.asymmetric.util;

import java.io.IOException;
import java.math.BigInteger;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/util/DSAEncoder.class */
public interface DSAEncoder {
    byte[] encode(BigInteger bigInteger, BigInteger bigInteger2) throws IOException;

    BigInteger[] decode(byte[] bArr) throws IOException;
}
