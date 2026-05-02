package org.spongycastle.pqc.jcajce.provider;

import java.io.IOException;
import java.security.AccessController;
import java.security.PrivateKey;
import java.security.PrivilegedAction;
import java.security.Provider;
import java.security.PublicKey;
import java.util.HashMap;
import java.util.Map;
import org.spongycastle.asn1.ASN1ObjectIdentifier;
import org.spongycastle.asn1.pkcs.PrivateKeyInfo;
import org.spongycastle.asn1.x509.SubjectPublicKeyInfo;
import org.spongycastle.jcajce.provider.config.ConfigurableProvider;
import org.spongycastle.jcajce.provider.config.ProviderConfiguration;
import org.spongycastle.jcajce.provider.util.AlgorithmProvider;
import org.spongycastle.jcajce.provider.util.AsymmetricKeyInfoConverter;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/pqc/jcajce/provider/BouncyCastlePQCProvider.class */
public class BouncyCastlePQCProvider extends Provider implements ConfigurableProvider {
    private static final String ALGORITHM_PACKAGE = "org.spongycastle.pqc.jcajce.provider.";
    private static String info = "BouncyCastle Post-Quantum Security Provider v1.54";
    public static String PROVIDER_NAME = "BCPQC";
    public static final ProviderConfiguration CONFIGURATION = null;
    private static final Map keyInfoConverters = new HashMap();
    private static final String[] ALGORITHMS = {"Rainbow", "McEliece"};

    public BouncyCastlePQCProvider() {
        super(PROVIDER_NAME, 1.54d, info);
        AccessController.doPrivileged(new PrivilegedAction() { // from class: org.spongycastle.pqc.jcajce.provider.BouncyCastlePQCProvider.1
            @Override // java.security.PrivilegedAction
            public Object run() {
                BouncyCastlePQCProvider.this.setup();
                return null;
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setup() {
        loadAlgorithms(ALGORITHM_PACKAGE, ALGORITHMS);
    }

    private void loadAlgorithms(String packageName, String[] names) {
        for (int i = 0; i != names.length; i++) {
            Class clazz = null;
            try {
                ClassLoader loader = getClass().getClassLoader();
                if (loader != null) {
                    clazz = loader.loadClass(packageName + names[i] + "$Mappings");
                } else {
                    clazz = Class.forName(packageName + names[i] + "$Mappings");
                }
            } catch (ClassNotFoundException e) {
            }
            if (clazz != null) {
                try {
                    ((AlgorithmProvider) clazz.newInstance()).configure(this);
                } catch (Exception e2) {
                    throw new InternalError("cannot create instance of " + packageName + names[i] + "$Mappings : " + e2);
                }
            }
        }
    }

    @Override // org.spongycastle.jcajce.provider.config.ConfigurableProvider
    public void setParameter(String parameterName, Object parameter) {
        synchronized (CONFIGURATION) {
        }
    }

    @Override // org.spongycastle.jcajce.provider.config.ConfigurableProvider
    public boolean hasAlgorithm(String type, String name) {
        return containsKey(new StringBuilder().append(type).append(".").append(name).toString()) || containsKey(new StringBuilder().append("Alg.Alias.").append(type).append(".").append(name).toString());
    }

    @Override // org.spongycastle.jcajce.provider.config.ConfigurableProvider
    public void addAlgorithm(String key, String value) {
        if (containsKey(key)) {
            throw new IllegalStateException("duplicate provider key (" + key + ") found");
        }
        put(key, value);
    }

    @Override // org.spongycastle.jcajce.provider.config.ConfigurableProvider
    public void addAlgorithm(String type, ASN1ObjectIdentifier oid, String className) {
        if (!containsKey(type + "." + className)) {
            throw new IllegalStateException("primary key (" + type + "." + className + ") not found");
        }
        addAlgorithm(type + "." + oid, className);
        addAlgorithm(type + ".OID." + oid, className);
    }

    @Override // org.spongycastle.jcajce.provider.config.ConfigurableProvider
    public void addKeyInfoConverter(ASN1ObjectIdentifier oid, AsymmetricKeyInfoConverter keyInfoConverter) {
        keyInfoConverters.put(oid, keyInfoConverter);
    }

    public static PublicKey getPublicKey(SubjectPublicKeyInfo publicKeyInfo) throws IOException {
        AsymmetricKeyInfoConverter converter = (AsymmetricKeyInfoConverter) keyInfoConverters.get(publicKeyInfo.getAlgorithm().getAlgorithm());
        if (converter == null) {
            return null;
        }
        return converter.generatePublic(publicKeyInfo);
    }

    public static PrivateKey getPrivateKey(PrivateKeyInfo privateKeyInfo) throws IOException {
        AsymmetricKeyInfoConverter converter = (AsymmetricKeyInfoConverter) keyInfoConverters.get(privateKeyInfo.getPrivateKeyAlgorithm().getAlgorithm());
        if (converter == null) {
            return null;
        }
        return converter.generatePrivate(privateKeyInfo);
    }
}
