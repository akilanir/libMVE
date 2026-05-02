package org.spongycastle.jce.provider;

import java.security.Permission;
import javax.crypto.spec.DHParameterSpec;
import org.spongycastle.jcajce.provider.asymmetric.util.EC5Util;
import org.spongycastle.jcajce.provider.config.ConfigurableProvider;
import org.spongycastle.jcajce.provider.config.ProviderConfiguration;
import org.spongycastle.jcajce.provider.config.ProviderConfigurationPermission;
import org.spongycastle.jce.spec.ECParameterSpec;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/jce/provider/BouncyCastleProviderConfiguration.class */
class BouncyCastleProviderConfiguration implements ProviderConfiguration {
    private static Permission BC_EC_LOCAL_PERMISSION = new ProviderConfigurationPermission(BouncyCastleProvider.PROVIDER_NAME, ConfigurableProvider.THREAD_LOCAL_EC_IMPLICITLY_CA);
    private static Permission BC_EC_PERMISSION = new ProviderConfigurationPermission(BouncyCastleProvider.PROVIDER_NAME, ConfigurableProvider.EC_IMPLICITLY_CA);
    private static Permission BC_DH_LOCAL_PERMISSION = new ProviderConfigurationPermission(BouncyCastleProvider.PROVIDER_NAME, ConfigurableProvider.THREAD_LOCAL_DH_DEFAULT_PARAMS);
    private static Permission BC_DH_PERMISSION = new ProviderConfigurationPermission(BouncyCastleProvider.PROVIDER_NAME, ConfigurableProvider.DH_DEFAULT_PARAMS);
    private ThreadLocal ecThreadSpec = new ThreadLocal();
    private ThreadLocal dhThreadSpec = new ThreadLocal();
    private volatile ECParameterSpec ecImplicitCaParams;
    private volatile Object dhDefaultParams;

    BouncyCastleProviderConfiguration() {
    }

    void setParameter(String parameterName, Object parameter) {
        ECParameterSpec curveSpec;
        SecurityManager securityManager = System.getSecurityManager();
        if (parameterName.equals(ConfigurableProvider.THREAD_LOCAL_EC_IMPLICITLY_CA)) {
            if (securityManager != null) {
                securityManager.checkPermission(BC_EC_LOCAL_PERMISSION);
            }
            if ((parameter instanceof ECParameterSpec) || parameter == null) {
                curveSpec = (ECParameterSpec) parameter;
            } else {
                curveSpec = EC5Util.convertSpec((java.security.spec.ECParameterSpec) parameter, false);
            }
            if (curveSpec == null) {
                this.ecThreadSpec.remove();
                return;
            } else {
                this.ecThreadSpec.set(curveSpec);
                return;
            }
        }
        if (parameterName.equals(ConfigurableProvider.EC_IMPLICITLY_CA)) {
            if (securityManager != null) {
                securityManager.checkPermission(BC_EC_PERMISSION);
            }
            if ((parameter instanceof ECParameterSpec) || parameter == null) {
                this.ecImplicitCaParams = (ECParameterSpec) parameter;
                return;
            } else {
                this.ecImplicitCaParams = EC5Util.convertSpec((java.security.spec.ECParameterSpec) parameter, false);
                return;
            }
        }
        if (parameterName.equals(ConfigurableProvider.THREAD_LOCAL_DH_DEFAULT_PARAMS)) {
            if (securityManager != null) {
                securityManager.checkPermission(BC_DH_LOCAL_PERMISSION);
            }
            if (!(parameter instanceof DHParameterSpec) && !(parameter instanceof DHParameterSpec[]) && parameter != null) {
                throw new IllegalArgumentException("not a valid DHParameterSpec");
            }
            if (parameter != null) {
                this.dhThreadSpec.set(parameter);
                return;
            } else {
                this.dhThreadSpec.remove();
                return;
            }
        }
        if (parameterName.equals(ConfigurableProvider.DH_DEFAULT_PARAMS)) {
            if (securityManager != null) {
                securityManager.checkPermission(BC_DH_PERMISSION);
            }
            if ((parameter instanceof DHParameterSpec) || (parameter instanceof DHParameterSpec[]) || parameter == null) {
                this.dhDefaultParams = parameter;
                return;
            }
            throw new IllegalArgumentException("not a valid DHParameterSpec or DHParameterSpec[]");
        }
    }

    @Override // org.spongycastle.jcajce.provider.config.ProviderConfiguration
    public ECParameterSpec getEcImplicitlyCa() {
        ECParameterSpec spec = (ECParameterSpec) this.ecThreadSpec.get();
        if (spec != null) {
            return spec;
        }
        return this.ecImplicitCaParams;
    }

    @Override // org.spongycastle.jcajce.provider.config.ProviderConfiguration
    public DHParameterSpec getDHDefaultParameters(int keySize) {
        Object params = this.dhThreadSpec.get();
        if (params == null) {
            params = this.dhDefaultParams;
        }
        if (params instanceof DHParameterSpec) {
            DHParameterSpec spec = (DHParameterSpec) params;
            if (spec.getP().bitLength() == keySize) {
                return spec;
            }
            return null;
        }
        if (params instanceof DHParameterSpec[]) {
            DHParameterSpec[] specs = (DHParameterSpec[]) params;
            for (int i = 0; i != specs.length; i++) {
                if (specs[i].getP().bitLength() == keySize) {
                    return specs[i];
                }
            }
            return null;
        }
        return null;
    }
}
