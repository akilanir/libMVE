package org.spongycastle.util.io.pem;

import java.io.IOException;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/util/io/pem/PemObjectParser.class */
public interface PemObjectParser {
    Object parseObject(PemObject pemObject) throws IOException;
}
