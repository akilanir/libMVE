package org.spongycastle.x509;

import java.util.Collection;
import org.spongycastle.util.Selector;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/x509/X509StoreSpi.class */
public abstract class X509StoreSpi {
    public abstract void engineInit(X509StoreParameters x509StoreParameters);

    public abstract Collection engineGetMatches(Selector selector);
}
