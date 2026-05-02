.class public Lch/qos/logback/core/net/ssl/SSLNestedComponentRegistryRules;
.super Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static addDefaultNestedComponentRegistryRules(Lch/qos/logback/core/joran/spi/DefaultNestedComponentRegistry;)V
    .registers 4

    const-class v0, Lch/qos/logback/core/net/ssl/SSLComponent;

    const-string v1, "ssl"

    const-class v2, Lch/qos/logback/core/net/ssl/SSLConfiguration;

    invoke-virtual {p0, v0, v1, v2}, Lch/qos/logback/core/joran/spi/DefaultNestedComponentRegistry;->add(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Class;)V

    const-class v0, Lch/qos/logback/core/net/ssl/SSLConfiguration;

    const-string v1, "parameters"

    const-class v2, Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;

    invoke-virtual {p0, v0, v1, v2}, Lch/qos/logback/core/joran/spi/DefaultNestedComponentRegistry;->add(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Class;)V

    const-class v0, Lch/qos/logback/core/net/ssl/SSLConfiguration;

    const-string v1, "keyStore"

    const-class v2, Lch/qos/logback/core/net/ssl/KeyStoreFactoryBean;

    invoke-virtual {p0, v0, v1, v2}, Lch/qos/logback/core/joran/spi/DefaultNestedComponentRegistry;->add(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Class;)V

    const-class v0, Lch/qos/logback/core/net/ssl/SSLConfiguration;

    const-string v1, "trustStore"

    const-class v2, Lch/qos/logback/core/net/ssl/KeyStoreFactoryBean;

    invoke-virtual {p0, v0, v1, v2}, Lch/qos/logback/core/joran/spi/DefaultNestedComponentRegistry;->add(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Class;)V

    const-class v0, Lch/qos/logback/core/net/ssl/SSLConfiguration;

    const-string v1, "keyManagerFactory"

    const-class v2, Lch/qos/logback/core/net/ssl/KeyManagerFactoryFactoryBean;

    invoke-virtual {p0, v0, v1, v2}, Lch/qos/logback/core/joran/spi/DefaultNestedComponentRegistry;->add(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Class;)V

    const-class v0, Lch/qos/logback/core/net/ssl/SSLConfiguration;

    const-string v1, "trustManagerFactory"

    const-class v2, Lch/qos/logback/core/net/ssl/TrustManagerFactoryFactoryBean;

    invoke-virtual {p0, v0, v1, v2}, Lch/qos/logback/core/joran/spi/DefaultNestedComponentRegistry;->add(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Class;)V

    const-class v0, Lch/qos/logback/core/net/ssl/SSLConfiguration;

    const-string v1, "secureRandom"

    const-class v2, Lch/qos/logback/core/net/ssl/SecureRandomFactoryBean;

    invoke-virtual {p0, v0, v1, v2}, Lch/qos/logback/core/joran/spi/DefaultNestedComponentRegistry;->add(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Class;)V

    return-void
.end method
