.class public Lch/qos/logback/classic/turbo/DynamicThresholdFilter;
.super Lch/qos/logback/classic/turbo/TurboFilter;


# instance fields
.field private defaultThreshold:Lch/qos/logback/classic/Level;

.field private key:Ljava/lang/String;

.field private onHigherOrEqual:Lch/qos/logback/core/spi/FilterReply;

.field private onLower:Lch/qos/logback/core/spi/FilterReply;

.field private valueLevelMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lch/qos/logback/classic/Level;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Lch/qos/logback/classic/turbo/TurboFilter;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lch/qos/logback/classic/turbo/DynamicThresholdFilter;->valueLevelMap:Ljava/util/Map;

    sget-object v0, Lch/qos/logback/classic/Level;->ERROR:Lch/qos/logback/classic/Level;

    iput-object v0, p0, Lch/qos/logback/classic/turbo/DynamicThresholdFilter;->defaultThreshold:Lch/qos/logback/classic/Level;

    sget-object v0, Lch/qos/logback/core/spi/FilterReply;->NEUTRAL:Lch/qos/logback/core/spi/FilterReply;

    iput-object v0, p0, Lch/qos/logback/classic/turbo/DynamicThresholdFilter;->onHigherOrEqual:Lch/qos/logback/core/spi/FilterReply;

    sget-object v0, Lch/qos/logback/core/spi/FilterReply;->DENY:Lch/qos/logback/core/spi/FilterReply;

    iput-object v0, p0, Lch/qos/logback/classic/turbo/DynamicThresholdFilter;->onLower:Lch/qos/logback/core/spi/FilterReply;

    return-void
.end method


# virtual methods
.method public addMDCValueLevelPair(Lch/qos/logback/classic/turbo/MDCValueLevelPair;)V
    .registers 5

    iget-object v0, p0, Lch/qos/logback/classic/turbo/DynamicThresholdFilter;->valueLevelMap:Ljava/util/Map;

    invoke-virtual {p1}, Lch/qos/logback/classic/turbo/MDCValueLevelPair;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_27

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lch/qos/logback/classic/turbo/MDCValueLevelPair;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " has been already set"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/classic/turbo/DynamicThresholdFilter;->addError(Ljava/lang/String;)V

    :goto_26
    return-void

    :cond_27
    iget-object v0, p0, Lch/qos/logback/classic/turbo/DynamicThresholdFilter;->valueLevelMap:Ljava/util/Map;

    invoke-virtual {p1}, Lch/qos/logback/classic/turbo/MDCValueLevelPair;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lch/qos/logback/classic/turbo/MDCValueLevelPair;->getLevel()Lch/qos/logback/classic/Level;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_26
.end method

.method public decide(Lorg/slf4j/Marker;Lch/qos/logback/classic/Logger;Lch/qos/logback/classic/Level;Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)Lch/qos/logback/core/spi/FilterReply;
    .registers 9

    iget-object v0, p0, Lch/qos/logback/classic/turbo/DynamicThresholdFilter;->key:Ljava/lang/String;

    invoke-static {v0}, Lorg/slf4j/MDC;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lch/qos/logback/classic/turbo/DynamicThresholdFilter;->isStarted()Z

    move-result v0

    if-nez v0, :cond_f

    sget-object v0, Lch/qos/logback/core/spi/FilterReply;->NEUTRAL:Lch/qos/logback/core/spi/FilterReply;

    :goto_e
    return-object v0

    :cond_f
    const/4 v0, 0x0

    if-eqz v1, :cond_1a

    iget-object v0, p0, Lch/qos/logback/classic/turbo/DynamicThresholdFilter;->valueLevelMap:Ljava/util/Map;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lch/qos/logback/classic/Level;

    :cond_1a
    if-nez v0, :cond_1e

    iget-object v0, p0, Lch/qos/logback/classic/turbo/DynamicThresholdFilter;->defaultThreshold:Lch/qos/logback/classic/Level;

    :cond_1e
    invoke-virtual {p3, v0}, Lch/qos/logback/classic/Level;->isGreaterOrEqual(Lch/qos/logback/classic/Level;)Z

    move-result v0

    if-eqz v0, :cond_27

    iget-object v0, p0, Lch/qos/logback/classic/turbo/DynamicThresholdFilter;->onHigherOrEqual:Lch/qos/logback/core/spi/FilterReply;

    goto :goto_e

    :cond_27
    iget-object v0, p0, Lch/qos/logback/classic/turbo/DynamicThresholdFilter;->onLower:Lch/qos/logback/core/spi/FilterReply;

    goto :goto_e
.end method

.method public getDefaultThreshold()Lch/qos/logback/classic/Level;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/classic/turbo/DynamicThresholdFilter;->defaultThreshold:Lch/qos/logback/classic/Level;

    return-object v0
.end method

.method public getKey()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/classic/turbo/DynamicThresholdFilter;->key:Ljava/lang/String;

    return-object v0
.end method

.method public getOnHigherOrEqual()Lch/qos/logback/core/spi/FilterReply;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/classic/turbo/DynamicThresholdFilter;->onHigherOrEqual:Lch/qos/logback/core/spi/FilterReply;

    return-object v0
.end method

.method public getOnLower()Lch/qos/logback/core/spi/FilterReply;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/classic/turbo/DynamicThresholdFilter;->onLower:Lch/qos/logback/core/spi/FilterReply;

    return-object v0
.end method

.method public setDefaultThreshold(Lch/qos/logback/classic/Level;)V
    .registers 2

    iput-object p1, p0, Lch/qos/logback/classic/turbo/DynamicThresholdFilter;->defaultThreshold:Lch/qos/logback/classic/Level;

    return-void
.end method

.method public setKey(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lch/qos/logback/classic/turbo/DynamicThresholdFilter;->key:Ljava/lang/String;

    return-void
.end method

.method public setOnHigherOrEqual(Lch/qos/logback/core/spi/FilterReply;)V
    .registers 2

    iput-object p1, p0, Lch/qos/logback/classic/turbo/DynamicThresholdFilter;->onHigherOrEqual:Lch/qos/logback/core/spi/FilterReply;

    return-void
.end method

.method public setOnLower(Lch/qos/logback/core/spi/FilterReply;)V
    .registers 2

    iput-object p1, p0, Lch/qos/logback/classic/turbo/DynamicThresholdFilter;->onLower:Lch/qos/logback/core/spi/FilterReply;

    return-void
.end method

.method public start()V
    .registers 2

    iget-object v0, p0, Lch/qos/logback/classic/turbo/DynamicThresholdFilter;->key:Ljava/lang/String;

    if-nez v0, :cond_9

    const-string v0, "No key name was specified"

    invoke-virtual {p0, v0}, Lch/qos/logback/classic/turbo/DynamicThresholdFilter;->addError(Ljava/lang/String;)V

    :cond_9
    invoke-super {p0}, Lch/qos/logback/classic/turbo/TurboFilter;->start()V

    return-void
.end method
