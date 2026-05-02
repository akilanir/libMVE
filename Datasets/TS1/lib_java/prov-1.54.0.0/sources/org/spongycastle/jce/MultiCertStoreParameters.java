package org.spongycastle.jce;

import java.security.cert.CertStoreParameters;
import java.util.Collection;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/jce/MultiCertStoreParameters.class */
public class MultiCertStoreParameters implements CertStoreParameters {
    private Collection certStores;
    private boolean searchAllStores;

    public MultiCertStoreParameters(Collection certStores) {
        this(certStores, true);
    }

    public MultiCertStoreParameters(Collection certStores, boolean searchAllStores) {
        this.certStores = certStores;
        this.searchAllStores = searchAllStores;
    }

    public Collection getCertStores() {
        return this.certStores;
    }

    public boolean getSearchAllStores() {
        return this.searchAllStores;
    }

    @Override // java.security.cert.CertStoreParameters
    public Object clone() {
        return this;
    }
}
