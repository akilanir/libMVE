.class public Lch/qos/logback/classic/joran/action/ConfigurationAction;
.super Lch/qos/logback/core/joran/action/Action;


# static fields
.field static final DEBUG_SYSTEM_PROPERTY_KEY:Ljava/lang/String; = "logback.debug"

.field static final INTERNAL_DEBUG_ATTR:Ljava/lang/String; = "debug"

.field static final SCAN_ATTR:Ljava/lang/String; = "scan"

.field static final SCAN_PERIOD_ATTR:Ljava/lang/String; = "scanPeriod"


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lch/qos/logback/core/joran/action/Action;-><init>()V

    return-void
.end method


# virtual methods
.method public begin(Lch/qos/logback/core/joran/spi/InterpretationContext;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .registers 6

    const-string v0, "logback.debug"

    invoke-static {v0}, Lch/qos/logback/core/util/OptionHelper;->getSystemProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_12

    const-string v0, "debug"

    invoke-interface {p3, v0}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lch/qos/logback/core/joran/spi/InterpretationContext;->subst(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_12
    invoke-static {v0}, Lch/qos/logback/core/util/OptionHelper;->isEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_28

    const-string v1, "false"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_28

    const-string v1, "null"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_42

    :cond_28
    const-string v0, "debug attribute not set"

    invoke-virtual {p0, v0}, Lch/qos/logback/classic/joran/action/ConfigurationAction;->addInfo(Ljava/lang/String;)V

    :goto_2d
    invoke-virtual {p0, p1, p3}, Lch/qos/logback/classic/joran/action/ConfigurationAction;->processScanAttrib(Lch/qos/logback/core/joran/spi/InterpretationContext;Lorg/xml/sax/Attributes;)V

    new-instance v0, Lch/qos/logback/core/util/ContextUtil;

    iget-object v1, p0, Lch/qos/logback/classic/joran/action/ConfigurationAction;->context:Lch/qos/logback/core/Context;

    invoke-direct {v0, v1}, Lch/qos/logback/core/util/ContextUtil;-><init>(Lch/qos/logback/core/Context;)V

    invoke-virtual {v0}, Lch/qos/logback/core/util/ContextUtil;->addHostNameAsProperty()V

    invoke-virtual {p0}, Lch/qos/logback/classic/joran/action/ConfigurationAction;->getContext()Lch/qos/logback/core/Context;

    move-result-object v0

    invoke-virtual {p1, v0}, Lch/qos/logback/core/joran/spi/InterpretationContext;->pushObject(Ljava/lang/Object;)V

    return-void

    :cond_42
    iget-object v0, p0, Lch/qos/logback/classic/joran/action/ConfigurationAction;->context:Lch/qos/logback/core/Context;

    invoke-static {v0}, Lch/qos/logback/core/status/OnConsoleStatusListener;->addNewInstanceToContext(Lch/qos/logback/core/Context;)V

    goto :goto_2d
.end method

.method public end(Lch/qos/logback/core/joran/spi/InterpretationContext;Ljava/lang/String;)V
    .registers 4

    const-string v0, "End of configuration."

    invoke-virtual {p0, v0}, Lch/qos/logback/classic/joran/action/ConfigurationAction;->addInfo(Ljava/lang/String;)V

    invoke-virtual {p1}, Lch/qos/logback/core/joran/spi/InterpretationContext;->popObject()Ljava/lang/Object;

    return-void
.end method

.method getSystemProperty(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    :try_start_0
    invoke-static {p1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;
    :try_end_3
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v0

    :goto_4
    return-object v0

    :catch_5
    move-exception v0

    const/4 v0, 0x0

    goto :goto_4
.end method

.method processScanAttrib(Lch/qos/logback/core/joran/spi/InterpretationContext;Lorg/xml/sax/Attributes;)V
    .registers 8

    const-string v0, "scan"

    invoke-interface {p2, v0}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lch/qos/logback/core/joran/spi/InterpretationContext;->subst(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lch/qos/logback/core/util/OptionHelper;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_62

    const-string v0, "false"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_62

    new-instance v2, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;

    invoke-direct {v2}, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;-><init>()V

    iget-object v0, p0, Lch/qos/logback/classic/joran/action/ConfigurationAction;->context:Lch/qos/logback/core/Context;

    invoke-virtual {v2, v0}, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->setContext(Lch/qos/logback/core/Context;)V

    const-string v0, "scanPeriod"

    invoke-interface {p2, v0}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lch/qos/logback/core/joran/spi/InterpretationContext;->subst(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lch/qos/logback/core/util/OptionHelper;->isEmpty(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_53

    :try_start_32
    invoke-static {v0}, Lch/qos/logback/core/util/Duration;->valueOf(Ljava/lang/String;)Lch/qos/logback/core/util/Duration;

    move-result-object v0

    invoke-virtual {v0}, Lch/qos/logback/core/util/Duration;->getMilliseconds()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->setRefreshPeriod(J)V

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Setting ReconfigureOnChangeFilter scanning period to "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/classic/joran/action/ConfigurationAction;->addInfo(Ljava/lang/String;)V
    :try_end_53
    .catch Ljava/lang/NumberFormatException; {:try_start_32 .. :try_end_53} :catch_63

    :cond_53
    :goto_53
    invoke-virtual {v2}, Lch/qos/logback/classic/turbo/ReconfigureOnChangeFilter;->start()V

    iget-object v0, p0, Lch/qos/logback/classic/joran/action/ConfigurationAction;->context:Lch/qos/logback/core/Context;

    check-cast v0, Lch/qos/logback/classic/LoggerContext;

    const-string v1, "Adding ReconfigureOnChangeFilter as a turbo filter"

    invoke-virtual {p0, v1}, Lch/qos/logback/classic/joran/action/ConfigurationAction;->addInfo(Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Lch/qos/logback/classic/LoggerContext;->addTurboFilter(Lch/qos/logback/classic/turbo/TurboFilter;)V

    :cond_62
    return-void

    :catch_63
    move-exception v0

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Error while converting ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "] to long"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v0}, Lch/qos/logback/classic/joran/action/ConfigurationAction;->addError(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_53
.end method
