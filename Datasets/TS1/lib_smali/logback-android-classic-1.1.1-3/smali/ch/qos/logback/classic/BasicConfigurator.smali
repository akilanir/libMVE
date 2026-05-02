.class public Lch/qos/logback/classic/BasicConfigurator;
.super Ljava/lang/Object;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field static final hiddenSingleton:Lch/qos/logback/classic/BasicConfigurator;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lch/qos/logback/classic/BasicConfigurator;

    invoke-direct {v0}, Lch/qos/logback/classic/BasicConfigurator;-><init>()V

    sput-object v0, Lch/qos/logback/classic/BasicConfigurator;->hiddenSingleton:Lch/qos/logback/classic/BasicConfigurator;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static configure(Lch/qos/logback/classic/LoggerContext;)V
    .registers 4

    invoke-virtual {p0}, Lch/qos/logback/classic/LoggerContext;->getStatusManager()Lch/qos/logback/core/status/StatusManager;

    move-result-object v0

    if-eqz v0, :cond_10

    new-instance v1, Lch/qos/logback/core/status/InfoStatus;

    const-string v2, "Setting up default configuration."

    invoke-direct {v1, v2, p0}, Lch/qos/logback/core/status/InfoStatus;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Lch/qos/logback/core/status/StatusManager;->add(Lch/qos/logback/core/status/Status;)V

    :cond_10
    new-instance v0, Lch/qos/logback/core/ConsoleAppender;

    invoke-direct {v0}, Lch/qos/logback/core/ConsoleAppender;-><init>()V

    invoke-virtual {v0, p0}, Lch/qos/logback/core/ConsoleAppender;->setContext(Lch/qos/logback/core/Context;)V

    const-string v1, "console"

    invoke-virtual {v0, v1}, Lch/qos/logback/core/ConsoleAppender;->setName(Ljava/lang/String;)V

    new-instance v1, Lch/qos/logback/classic/encoder/PatternLayoutEncoder;

    invoke-direct {v1}, Lch/qos/logback/classic/encoder/PatternLayoutEncoder;-><init>()V

    invoke-virtual {v1, p0}, Lch/qos/logback/classic/encoder/PatternLayoutEncoder;->setContext(Lch/qos/logback/core/Context;)V

    const-string v2, "%d{HH:mm:ss.SSS} [%thread] %-5level %logger{36} - %msg%n"

    invoke-virtual {v1, v2}, Lch/qos/logback/classic/encoder/PatternLayoutEncoder;->setPattern(Ljava/lang/String;)V

    invoke-virtual {v1}, Lch/qos/logback/classic/encoder/PatternLayoutEncoder;->start()V

    invoke-virtual {v0, v1}, Lch/qos/logback/core/ConsoleAppender;->setEncoder(Lch/qos/logback/core/encoder/Encoder;)V

    invoke-virtual {v0}, Lch/qos/logback/core/ConsoleAppender;->start()V

    const-string v1, "ROOT"

    invoke-virtual {p0, v1}, Lch/qos/logback/classic/LoggerContext;->getLogger(Ljava/lang/String;)Lch/qos/logback/classic/Logger;

    move-result-object v1

    invoke-virtual {v1, v0}, Lch/qos/logback/classic/Logger;->addAppender(Lch/qos/logback/core/Appender;)V

    return-void
.end method

.method public static configureDefaultContext()V
    .registers 1

    invoke-static {}, Lorg/slf4j/LoggerFactory;->getILoggerFactory()Lorg/slf4j/ILoggerFactory;

    move-result-object v0

    check-cast v0, Lch/qos/logback/classic/LoggerContext;

    invoke-static {v0}, Lch/qos/logback/classic/BasicConfigurator;->configure(Lch/qos/logback/classic/LoggerContext;)V

    return-void
.end method
