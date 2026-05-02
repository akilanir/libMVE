.class public Lch/qos/logback/classic/sift/SiftingJoranConfigurator;
.super Lch/qos/logback/core/sift/SiftingJoranConfiguratorBase;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lch/qos/logback/core/sift/SiftingJoranConfiguratorBase",
        "<",
        "Lch/qos/logback/classic/spi/ILoggingEvent;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0, p1, p2, p3}, Lch/qos/logback/core/sift/SiftingJoranConfiguratorBase;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method


# virtual methods
.method protected addDefaultNestedComponentRegistryRules(Lch/qos/logback/core/joran/spi/DefaultNestedComponentRegistry;)V
    .registers 2

    invoke-static {p1}, Lch/qos/logback/classic/util/DefaultNestedComponentRules;->addDefaultNestedComponentRegistryRules(Lch/qos/logback/core/joran/spi/DefaultNestedComponentRegistry;)V

    return-void
.end method

.method protected addInstanceRules(Lch/qos/logback/core/joran/spi/RuleStore;)V
    .registers 4

    invoke-super {p0, p1}, Lch/qos/logback/core/sift/SiftingJoranConfiguratorBase;->addInstanceRules(Lch/qos/logback/core/joran/spi/RuleStore;)V

    new-instance v0, Lch/qos/logback/core/joran/spi/ElementSelector;

    const-string v1, "configuration/appender"

    invoke-direct {v0, v1}, Lch/qos/logback/core/joran/spi/ElementSelector;-><init>(Ljava/lang/String;)V

    new-instance v1, Lch/qos/logback/core/joran/action/AppenderAction;

    invoke-direct {v1}, Lch/qos/logback/core/joran/action/AppenderAction;-><init>()V

    invoke-interface {p1, v0, v1}, Lch/qos/logback/core/joran/spi/RuleStore;->addRule(Lch/qos/logback/core/joran/spi/ElementSelector;Lch/qos/logback/core/joran/action/Action;)V

    return-void
.end method

.method protected buildInterpreter()V
    .registers 4

    invoke-super {p0}, Lch/qos/logback/core/sift/SiftingJoranConfiguratorBase;->buildInterpreter()V

    iget-object v0, p0, Lch/qos/logback/classic/sift/SiftingJoranConfigurator;->interpreter:Lch/qos/logback/core/joran/spi/Interpreter;

    invoke-virtual {v0}, Lch/qos/logback/core/joran/spi/Interpreter;->getInterpretationContext()Lch/qos/logback/core/joran/spi/InterpretationContext;

    move-result-object v0

    invoke-virtual {v0}, Lch/qos/logback/core/joran/spi/InterpretationContext;->getObjectMap()Ljava/util/Map;

    move-result-object v0

    const-string v1, "APPENDER_BAG"

    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "FILTER_CHAIN_BAG"

    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iget-object v1, p0, Lch/qos/logback/classic/sift/SiftingJoranConfigurator;->parentPropertyMap:Ljava/util/Map;

    invoke-interface {v0, v1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    iget-object v1, p0, Lch/qos/logback/classic/sift/SiftingJoranConfigurator;->key:Ljava/lang/String;

    iget-object v2, p0, Lch/qos/logback/classic/sift/SiftingJoranConfigurator;->value:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lch/qos/logback/classic/sift/SiftingJoranConfigurator;->interpreter:Lch/qos/logback/core/joran/spi/Interpreter;

    invoke-virtual {v1, v0}, Lch/qos/logback/core/joran/spi/Interpreter;->setInterpretationContextPropertiesMap(Ljava/util/Map;)V

    return-void
.end method

.method public getAppender()Lch/qos/logback/core/Appender;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lch/qos/logback/core/Appender",
            "<",
            "Lch/qos/logback/classic/spi/ILoggingEvent;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lch/qos/logback/classic/sift/SiftingJoranConfigurator;->interpreter:Lch/qos/logback/core/joran/spi/Interpreter;

    invoke-virtual {v0}, Lch/qos/logback/core/joran/spi/Interpreter;->getInterpretationContext()Lch/qos/logback/core/joran/spi/InterpretationContext;

    move-result-object v0

    invoke-virtual {v0}, Lch/qos/logback/core/joran/spi/InterpretationContext;->getObjectMap()Ljava/util/Map;

    move-result-object v0

    const-string v1, "APPENDER_BAG"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    invoke-virtual {p0, v0}, Lch/qos/logback/classic/sift/SiftingJoranConfigurator;->oneAndOnlyOneCheck(Ljava/util/Map;)V

    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->size()I

    move-result v1

    if-nez v1, :cond_21

    const/4 v0, 0x0

    :goto_20
    return-object v0

    :cond_21
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lch/qos/logback/core/Appender;

    goto :goto_20
.end method

.method protected initialElementPath()Lch/qos/logback/core/joran/spi/ElementPath;
    .registers 3

    new-instance v0, Lch/qos/logback/core/joran/spi/ElementPath;

    const-string v1, "configuration"

    invoke-direct {v0, v1}, Lch/qos/logback/core/joran/spi/ElementPath;-><init>(Ljava/lang/String;)V

    return-object v0
.end method
