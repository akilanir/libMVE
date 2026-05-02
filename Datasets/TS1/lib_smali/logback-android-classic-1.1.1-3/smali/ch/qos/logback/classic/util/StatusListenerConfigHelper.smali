.class public Lch/qos/logback/classic/util/StatusListenerConfigHelper;
.super Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static addStatusListener(Lch/qos/logback/classic/LoggerContext;Ljava/lang/String;)V
    .registers 3

    invoke-static {p0, p1}, Lch/qos/logback/classic/util/StatusListenerConfigHelper;->createListenerPerClassName(Lch/qos/logback/classic/LoggerContext;Ljava/lang/String;)Lch/qos/logback/core/status/StatusListener;

    move-result-object v0

    invoke-static {p0, v0}, Lch/qos/logback/classic/util/StatusListenerConfigHelper;->initListener(Lch/qos/logback/classic/LoggerContext;Lch/qos/logback/core/status/StatusListener;)V

    return-void
.end method

.method private static createListenerPerClassName(Lch/qos/logback/classic/LoggerContext;Ljava/lang/String;)Lch/qos/logback/core/status/StatusListener;
    .registers 3

    :try_start_0
    const-class v0, Lch/qos/logback/core/status/StatusListener;

    invoke-static {p1, v0, p0}, Lch/qos/logback/core/util/OptionHelper;->instantiateByClassName(Ljava/lang/String;Ljava/lang/Class;Lch/qos/logback/core/Context;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lch/qos/logback/core/status/StatusListener;
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_8} :catch_9

    :goto_8
    return-object v0

    :catch_9
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    const/4 v0, 0x0

    goto :goto_8
.end method

.method private static initListener(Lch/qos/logback/classic/LoggerContext;Lch/qos/logback/core/status/StatusListener;)V
    .registers 3

    if-eqz p1, :cond_1d

    instance-of v0, p1, Lch/qos/logback/core/spi/ContextAware;

    if-eqz v0, :cond_c

    move-object v0, p1

    check-cast v0, Lch/qos/logback/core/spi/ContextAware;

    invoke-interface {v0, p0}, Lch/qos/logback/core/spi/ContextAware;->setContext(Lch/qos/logback/core/Context;)V

    :cond_c
    instance-of v0, p1, Lch/qos/logback/core/spi/LifeCycle;

    if-eqz v0, :cond_16

    move-object v0, p1

    check-cast v0, Lch/qos/logback/core/spi/LifeCycle;

    invoke-interface {v0}, Lch/qos/logback/core/spi/LifeCycle;->start()V

    :cond_16
    invoke-virtual {p0}, Lch/qos/logback/classic/LoggerContext;->getStatusManager()Lch/qos/logback/core/status/StatusManager;

    move-result-object v0

    invoke-interface {v0, p1}, Lch/qos/logback/core/status/StatusManager;->add(Lch/qos/logback/core/status/StatusListener;)V

    :cond_1d
    return-void
.end method

.method static installIfAsked(Lch/qos/logback/classic/LoggerContext;)V
    .registers 3

    const-string v0, "logback.statusListenerClass"

    invoke-static {v0}, Lch/qos/logback/core/util/OptionHelper;->getSystemProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lch/qos/logback/core/util/OptionHelper;->isEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_f

    invoke-static {p0, v0}, Lch/qos/logback/classic/util/StatusListenerConfigHelper;->addStatusListener(Lch/qos/logback/classic/LoggerContext;Ljava/lang/String;)V

    :cond_f
    return-void
.end method
