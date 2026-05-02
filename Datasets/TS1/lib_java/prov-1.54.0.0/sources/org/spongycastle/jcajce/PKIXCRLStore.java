package org.spongycastle.jcajce;

import java.security.cert.CRL;
import java.util.Collection;
import org.spongycastle.util.Selector;
import org.spongycastle.util.Store;
import org.spongycastle.util.StoreException;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/PKIXCRLStore.class */
public interface PKIXCRLStore<T extends CRL> extends Store<T> {
    Collection<T> getMatches(Selector<T> selector) throws StoreException;
}
