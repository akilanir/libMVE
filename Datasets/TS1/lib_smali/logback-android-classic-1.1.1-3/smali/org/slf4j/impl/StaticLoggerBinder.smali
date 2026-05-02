.class public Lorg/slf4j/impl/StaticLoggerBinder;
.super Ljava/lang/Object;

# interfaces
.implements Lorg/slf4j/spi/LoggerFactoryBinder;


# static fields
.field private static KEY:Ljava/lang/Object; = null

.field static final NULL_CS_URL:Ljava/lang/String; = "http://logback.qos.ch/codes.html#null_CS"

.field public static REQUESTED_API_VERSION:Ljava/lang/String;

.field private static SINGLETON:Lorg/slf4j/impl/StaticLoggerBinder;


# instance fields
.field private final contextSelectorBinder:Lch/qos/logback/classic/util/ContextSelectorStaticBinder;

.field private defaultLoggerContext:Lch/qos/logback/classic/LoggerContext;

.field private initialized:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const-string v0, "1.6"

    sput-object v0, Lorg/slf4j/impl/StaticLoggerBinder;->REQUESTED_API_VERSION:Ljava/lang/String;

    new-instance v0, Lorg/slf4j/impl/StaticLoggerBinder;

    invoke-direct {v0}, Lorg/slf4j/impl/StaticLoggerBinder;-><init>()V

    sput-object v0, Lorg/slf4j/impl/StaticLoggerBinder;->SINGLETON:Lorg/slf4j/impl/StaticLoggerBinder;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lorg/slf4j/impl/StaticLoggerBinder;->KEY:Ljava/lang/Object;

    sget-object v0, Lorg/slf4j/impl/StaticLoggerBinder;->SINGLETON:Lorg/slf4j/impl/StaticLoggerBinder;

    invoke-virtual {v0}, Lorg/slf4j/impl/StaticLoggerBinder;->init()V

    return-void
.end method

.method private constructor <init>()V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/slf4j/impl/StaticLoggerBinder;->initialized:Z

    new-instance v0, Lch/qos/logback/classic/LoggerContext;

    invoke-direct {v0}, Lch/qos/logback/classic/LoggerContext;-><init>()V

    iput-object v0, p0, Lorg/slf4j/impl/StaticLoggerBinder;->defaultLoggerContext:Lch/qos/logback/classic/LoggerContext;

    invoke-static {}, Lch/qos/logback/classic/util/ContextSelectorStaticBinder;->getSingleton()Lch/qos/logback/classic/util/ContextSelectorStaticBinder;

    move-result-object v0

    iput-object v0, p0, Lorg/slf4j/impl/StaticLoggerBinder;->contextSelectorBinder:Lch/qos/logback/classic/util/ContextSelectorStaticBinder;

    iget-object v0, p0, Lorg/slf4j/impl/StaticLoggerBinder;->defaultLoggerContext:Lch/qos/logback/classic/LoggerContext;

    const-string v1, "default"

    invoke-virtual {v0, v1}, Lch/qos/logback/classic/LoggerContext;->setName(Ljava/lang/String;)V

    return-void
.end method

.method public static getSingleton()Lorg/slf4j/impl/StaticLoggerBinder;
    .registers 1

    sget-object v0, Lorg/slf4j/impl/StaticLoggerBinder;->SINGLETON:Lorg/slf4j/impl/StaticLoggerBinder;

    return-object v0
.end method

.method static reset()V
    .registers 1

    new-instance v0, Lorg/slf4j/impl/StaticLoggerBinder;

    invoke-direct {v0}, Lorg/slf4j/impl/StaticLoggerBinder;-><init>()V

    sput-object v0, Lorg/slf4j/impl/StaticLoggerBinder;->SINGLETON:Lorg/slf4j/impl/StaticLoggerBinder;

    sget-object v0, Lorg/slf4j/impl/StaticLoggerBinder;->SINGLETON:Lorg/slf4j/impl/StaticLoggerBinder;

    invoke-virtual {v0}, Lorg/slf4j/impl/StaticLoggerBinder;->init()V

    return-void
.end method


# virtual methods
.method public getLoggerFactory()Lorg/slf4j/ILoggerFactory;
    .registers 3

    iget-boolean v0, p0, Lorg/slf4j/impl/StaticLoggerBinder;->initialized:Z

    if-nez v0, :cond_7

    iget-object v0, p0, Lorg/slf4j/impl/StaticLoggerBinder;->defaultLoggerContext:Lch/qos/logback/classic/LoggerContext;

    :goto_6
    return-object v0

    :cond_7
    iget-object v0, p0, Lorg/slf4j/impl/StaticLoggerBinder;->contextSelectorBinder:Lch/qos/logback/classic/util/ContextSelectorStaticBinder;

    invoke-virtual {v0}, Lch/qos/logback/classic/util/ContextSelectorStaticBinder;->getContextSelector()Lch/qos/logback/classic/selector/ContextSelector;

    move-result-object v0

    if-nez v0, :cond_17

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "contextSelector cannot be null. See also http://logback.qos.ch/codes.html#null_CS"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_17
    iget-object v0, p0, Lorg/slf4j/impl/StaticLoggerBinder;->contextSelectorBinder:Lch/qos/logback/classic/util/ContextSelectorStaticBinder;

    invoke-virtual {v0}, Lch/qos/logback/classic/util/ContextSelectorStaticBinder;->getContextSelector()Lch/qos/logback/classic/selector/ContextSelector;

    move-result-object v0

    invoke-interface {v0}, Lch/qos/logback/classic/selector/ContextSelector;->getLoggerContext()Lch/qos/logback/classic/LoggerContext;

    move-result-object v0

    goto :goto_6
.end method

.method public getLoggerFactoryClassStr()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lorg/slf4j/impl/StaticLoggerBinder;->contextSelectorBinder:Lch/qos/logback/classic/util/ContextSelectorStaticBinder;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method init()V
    .registers 4

    :try_start_0
    new-instance v0, Lch/qos/logback/classic/util/ContextInitializer;

    iget-object v1, p0, Lorg/slf4j/impl/StaticLoggerBinder;->defaultLoggerContext:Lch/qos/logback/classic/LoggerContext;

    invoke-direct {v0, v1}, Lch/qos/logback/classic/util/ContextInitializer;-><init>(Lch/qos/logback/classic/LoggerContext;)V

    invoke-virtual {v0}, Lch/qos/logback/classic/util/ContextInitializer;->autoConfig()V
    :try_end_a
    .catch Lch/qos/logback/core/joran/spi/JoranException; {:try_start_0 .. :try_end_a} :catch_24
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_a} :catch_2b

    :goto_a
    :try_start_a
    iget-object v0, p0, Lorg/slf4j/impl/StaticLoggerBinder;->defaultLoggerContext:Lch/qos/logback/classic/LoggerContext;

    invoke-static {v0}, Lch/qos/logback/core/status/StatusUtil;->contextHasStatusListener(Lch/qos/logback/core/Context;)Z

    move-result v0

    if-nez v0, :cond_17

    iget-object v0, p0, Lorg/slf4j/impl/StaticLoggerBinder;->defaultLoggerContext:Lch/qos/logback/classic/LoggerContext;

    invoke-static {v0}, Lch/qos/logback/core/util/StatusPrinter;->printInCaseOfErrorsOrWarnings(Lch/qos/logback/core/Context;)V

    :cond_17
    iget-object v0, p0, Lorg/slf4j/impl/StaticLoggerBinder;->contextSelectorBinder:Lch/qos/logback/classic/util/ContextSelectorStaticBinder;

    iget-object v1, p0, Lorg/slf4j/impl/StaticLoggerBinder;->defaultLoggerContext:Lch/qos/logback/classic/LoggerContext;

    sget-object v2, Lorg/slf4j/impl/StaticLoggerBinder;->KEY:Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Lch/qos/logback/classic/util/ContextSelectorStaticBinder;->init(Lch/qos/logback/classic/LoggerContext;Ljava/lang/Object;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/slf4j/impl/StaticLoggerBinder;->initialized:Z

    :goto_23
    return-void

    :catch_24
    move-exception v0

    const-string v1, "Failed to auto configure default logger context"

    invoke-static {v1, v0}, Lorg/slf4j/helpers/Util;->report(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2a
    .catch Ljava/lang/Throwable; {:try_start_a .. :try_end_2a} :catch_2b

    goto :goto_a

    :catch_2b
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Failed to instantiate ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-class v2, Lch/qos/logback/classic/LoggerContext;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v0}, Lorg/slf4j/helpers/Util;->report(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_23
.end method
