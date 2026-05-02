package org.spongycastle.util;

import java.io.IOException;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/util/Encodable.class */
public interface Encodable {
    byte[] getEncoded() throws IOException;
}
