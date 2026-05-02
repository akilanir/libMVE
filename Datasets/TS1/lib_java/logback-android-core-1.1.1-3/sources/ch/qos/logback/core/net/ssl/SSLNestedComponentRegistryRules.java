package ch.qos.logback.core.net.ssl;

import ch.qos.logback.core.joran.spi.DefaultNestedComponentRegistry;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/net/ssl/SSLNestedComponentRegistryRules.class */
public class SSLNestedComponentRegistryRules {
    public static void addDefaultNestedComponentRegistryRules(DefaultNestedComponentRegistry defaultNestedComponentRegistry) {
        defaultNestedComponentRegistry.add(SSLComponent.class, "ssl", SSLConfiguration.class);
        defaultNestedComponentRegistry.add(SSLConfiguration.class, "parameters", SSLParametersConfiguration.class);
        defaultNestedComponentRegistry.add(SSLConfiguration.class, "keyStore", KeyStoreFactoryBean.class);
        defaultNestedComponentRegistry.add(SSLConfiguration.class, "trustStore", KeyStoreFactoryBean.class);
        defaultNestedComponentRegistry.add(SSLConfiguration.class, "keyManagerFactory", KeyManagerFactoryFactoryBean.class);
        defaultNestedComponentRegistry.add(SSLConfiguration.class, "trustManagerFactory", TrustManagerFactoryFactoryBean.class);
        defaultNestedComponentRegistry.add(SSLConfiguration.class, "secureRandom", SecureRandomFactoryBean.class);
    }
}
