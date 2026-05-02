package org.spongycastle.crypto;

import java.io.IOException;
import java.io.InputStream;
import org.spongycastle.crypto.params.AsymmetricKeyParameter;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/KeyParser.class */
public interface KeyParser {
    AsymmetricKeyParameter readKey(InputStream inputStream) throws IOException;
}
