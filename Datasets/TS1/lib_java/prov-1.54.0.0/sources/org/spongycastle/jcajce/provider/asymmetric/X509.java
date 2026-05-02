package org.spongycastle.jcajce.provider.asymmetric;

import org.spongycastle.jcajce.provider.config.ConfigurableProvider;
import org.spongycastle.jcajce.provider.util.AsymmetricAlgorithmProvider;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/X509.class */
public class X509 {

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/X509$Mappings.class */
    public static class Mappings extends AsymmetricAlgorithmProvider {
        @Override // org.spongycastle.jcajce.provider.util.AlgorithmProvider
        public void configure(ConfigurableProvider provider) {
            provider.addAlgorithm("KeyFactory.X.509", "org.spongycastle.jcajce.provider.asymmetric.x509.KeyFactory");
            provider.addAlgorithm("Alg.Alias.KeyFactory.X509", "X.509");
            provider.addAlgorithm("CertificateFactory.X.509", "org.spongycastle.jcajce.provider.asymmetric.x509.CertificateFactory");
            provider.addAlgorithm("Alg.Alias.CertificateFactory.X509", "X.509");
        }
    }
}
