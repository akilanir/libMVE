package org.spongycastle.util;

import java.util.Collection;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/util/Store.class */
public interface Store<T> {
    Collection<T> getMatches(Selector<T> selector) throws StoreException;
}
