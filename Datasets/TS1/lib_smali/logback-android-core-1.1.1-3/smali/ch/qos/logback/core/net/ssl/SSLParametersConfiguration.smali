.class public Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;
.super Lch/qos/logback/core/spi/ContextAwareBase;


# instance fields
.field private enabledCipherSuites:[Ljava/lang/String;

.field private enabledProtocols:[Ljava/lang/String;

.field private excludedCipherSuites:Ljava/lang/String;

.field private excludedProtocols:Ljava/lang/String;

.field private includedCipherSuites:Ljava/lang/String;

.field private includedProtocols:Ljava/lang/String;

.field private needClientAuth:Ljava/lang/Boolean;

.field private wantClientAuth:Ljava/lang/Boolean;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lch/qos/logback/core/spi/ContextAwareBase;-><init>()V

    return-void
.end method

.method private enabledCipherSuites([Ljava/lang/String;[Ljava/lang/String;)[Ljava/lang/String;
    .registers 9

    iget-object v0, p0, Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;->enabledCipherSuites:[Ljava/lang/String;

    if-nez v0, :cond_51

    invoke-virtual {p0}, Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;->getIncludedCipherSuites()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lch/qos/logback/core/util/OptionHelper;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_42

    invoke-virtual {p0}, Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;->getExcludedCipherSuites()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lch/qos/logback/core/util/OptionHelper;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_42

    array-length v0, p2

    invoke-static {p2, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    iput-object v0, p0, Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;->enabledCipherSuites:[Ljava/lang/String;

    :goto_21
    iget-object v1, p0, Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;->enabledCipherSuites:[Ljava/lang/String;

    array-length v2, v1

    const/4 v0, 0x0

    :goto_25
    if-ge v0, v2, :cond_51

    aget-object v3, v1, v0

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "enabled cipher suite: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;->addInfo(Ljava/lang/String;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_25

    :cond_42
    invoke-virtual {p0}, Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;->getIncludedCipherSuites()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;->getExcludedCipherSuites()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, p1, v0, v1}, Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;->includedStrings([Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;->enabledCipherSuites:[Ljava/lang/String;

    goto :goto_21

    :cond_51
    iget-object v0, p0, Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;->enabledCipherSuites:[Ljava/lang/String;

    return-object v0
.end method

.method private enabledProtocols([Ljava/lang/String;[Ljava/lang/String;)[Ljava/lang/String;
    .registers 9

    iget-object v0, p0, Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;->enabledProtocols:[Ljava/lang/String;

    if-nez v0, :cond_51

    invoke-virtual {p0}, Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;->getIncludedProtocols()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lch/qos/logback/core/util/OptionHelper;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_42

    invoke-virtual {p0}, Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;->getExcludedProtocols()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lch/qos/logback/core/util/OptionHelper;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_42

    array-length v0, p2

    invoke-static {p2, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    iput-object v0, p0, Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;->enabledProtocols:[Ljava/lang/String;

    :goto_21
    iget-object v1, p0, Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;->enabledProtocols:[Ljava/lang/String;

    array-length v2, v1

    const/4 v0, 0x0

    :goto_25
    if-ge v0, v2, :cond_51

    aget-object v3, v1, v0

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "enabled protocol: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;->addInfo(Ljava/lang/String;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_25

    :cond_42
    invoke-virtual {p0}, Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;->getIncludedProtocols()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;->getExcludedProtocols()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, p1, v0, v1}, Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;->includedStrings([Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;->enabledProtocols:[Ljava/lang/String;

    goto :goto_21

    :cond_51
    iget-object v0, p0, Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;->enabledProtocols:[Ljava/lang/String;

    return-object v0
.end method

.method private includedStrings([Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;
    .registers 6

    new-instance v0, Ljava/util/ArrayList;

    array-length v1, p1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    if-eqz p2, :cond_16

    invoke-direct {p0, p2}, Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;->stringToArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lch/qos/logback/core/util/StringCollectionUtil;->retainMatching(Ljava/util/Collection;[Ljava/lang/String;)V

    :cond_16
    if-eqz p3, :cond_1f

    invoke-direct {p0, p3}, Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;->stringToArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lch/qos/logback/core/util/StringCollectionUtil;->removeMatching(Ljava/util/Collection;[Ljava/lang/String;)V

    :cond_1f
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    new-array v1, v1, [Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    return-object v0
.end method

.method private stringToArray(Ljava/lang/String;)[Ljava/lang/String;
    .registers 3

    const-string v0, "\\s*,\\s*"

    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public configure(Lch/qos/logback/core/net/ssl/SSLConfigurable;)V
    .registers 4

    invoke-interface {p1}, Lch/qos/logback/core/net/ssl/SSLConfigurable;->getSupportedProtocols()[Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1}, Lch/qos/logback/core/net/ssl/SSLConfigurable;->getDefaultProtocols()[Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;->enabledProtocols([Ljava/lang/String;[Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0}, Lch/qos/logback/core/net/ssl/SSLConfigurable;->setEnabledProtocols([Ljava/lang/String;)V

    invoke-interface {p1}, Lch/qos/logback/core/net/ssl/SSLConfigurable;->getSupportedCipherSuites()[Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1}, Lch/qos/logback/core/net/ssl/SSLConfigurable;->getDefaultCipherSuites()[Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;->enabledCipherSuites([Ljava/lang/String;[Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0}, Lch/qos/logback/core/net/ssl/SSLConfigurable;->setEnabledCipherSuites([Ljava/lang/String;)V

    invoke-virtual {p0}, Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;->isNeedClientAuth()Ljava/lang/Boolean;

    move-result-object v0

    if-eqz v0, :cond_2f

    invoke-virtual {p0}, Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;->isNeedClientAuth()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    invoke-interface {p1, v0}, Lch/qos/logback/core/net/ssl/SSLConfigurable;->setNeedClientAuth(Z)V

    :cond_2f
    invoke-virtual {p0}, Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;->isWantClientAuth()Ljava/lang/Boolean;

    move-result-object v0

    if-eqz v0, :cond_40

    invoke-virtual {p0}, Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;->isWantClientAuth()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    invoke-interface {p1, v0}, Lch/qos/logback/core/net/ssl/SSLConfigurable;->setWantClientAuth(Z)V

    :cond_40
    return-void
.end method

.method public getExcludedCipherSuites()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;->excludedCipherSuites:Ljava/lang/String;

    return-object v0
.end method

.method public getExcludedProtocols()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;->excludedProtocols:Ljava/lang/String;

    return-object v0
.end method

.method public getIncludedCipherSuites()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;->includedCipherSuites:Ljava/lang/String;

    return-object v0
.end method

.method public getIncludedProtocols()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;->includedProtocols:Ljava/lang/String;

    return-object v0
.end method

.method public isNeedClientAuth()Ljava/lang/Boolean;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;->needClientAuth:Ljava/lang/Boolean;

    return-object v0
.end method

.method public isWantClientAuth()Ljava/lang/Boolean;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;->wantClientAuth:Ljava/lang/Boolean;

    return-object v0
.end method

.method public setExcludedCipherSuites(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;->excludedCipherSuites:Ljava/lang/String;

    return-void
.end method

.method public setExcludedProtocols(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;->excludedProtocols:Ljava/lang/String;

    return-void
.end method

.method public setIncludedCipherSuites(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;->includedCipherSuites:Ljava/lang/String;

    return-void
.end method

.method public setIncludedProtocols(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;->includedProtocols:Ljava/lang/String;

    return-void
.end method

.method public setNeedClientAuth(Ljava/lang/Boolean;)V
    .registers 2

    iput-object p1, p0, Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;->needClientAuth:Ljava/lang/Boolean;

    return-void
.end method

.method public setWantClientAuth(Ljava/lang/Boolean;)V
    .registers 2

    iput-object p1, p0, Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;->wantClientAuth:Ljava/lang/Boolean;

    return-void
.end method
