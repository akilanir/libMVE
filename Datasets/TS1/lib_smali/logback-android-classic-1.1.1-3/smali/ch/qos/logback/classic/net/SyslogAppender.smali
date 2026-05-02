.class public Lch/qos/logback/classic/net/SyslogAppender;
.super Lch/qos/logback/core/net/SyslogAppenderBase;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lch/qos/logback/core/net/SyslogAppenderBase",
        "<",
        "Lch/qos/logback/classic/spi/ILoggingEvent;",
        ">;"
    }
.end annotation


# static fields
.field public static final DEFAULT_STACKTRACE_PATTERN:Ljava/lang/String; = "\t"

.field public static final DEFAULT_SUFFIX_PATTERN:Ljava/lang/String; = "[%thread] %logger %msg"


# instance fields
.field stackTraceLayout:Lch/qos/logback/classic/PatternLayout;

.field stackTracePattern:Ljava/lang/String;

.field throwableExcluded:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Lch/qos/logback/core/net/SyslogAppenderBase;-><init>()V

    new-instance v0, Lch/qos/logback/classic/PatternLayout;

    invoke-direct {v0}, Lch/qos/logback/classic/PatternLayout;-><init>()V

    iput-object v0, p0, Lch/qos/logback/classic/net/SyslogAppender;->stackTraceLayout:Lch/qos/logback/classic/PatternLayout;

    const-string v0, "\t"

    iput-object v0, p0, Lch/qos/logback/classic/net/SyslogAppender;->stackTracePattern:Ljava/lang/String;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lch/qos/logback/classic/net/SyslogAppender;->throwableExcluded:Z

    return-void
.end method

.method private handleThrowableFirstLine(Ljava/io/OutputStream;Lch/qos/logback/classic/spi/IThrowableProxy;Ljava/lang/String;Z)V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    if-nez p4, :cond_10

    const-string v1, "Caused by: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_10
    invoke-interface {p2}, Lch/qos/logback/classic/spi/IThrowableProxy;->getClassName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {p2}, Lch/qos/logback/classic/spi/IThrowableProxy;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    invoke-virtual {p1}, Ljava/io/OutputStream;->flush()V

    return-void
.end method

.method private setupStackTraceLayout()V
    .registers 4

    iget-object v0, p0, Lch/qos/logback/classic/net/SyslogAppender;->stackTraceLayout:Lch/qos/logback/classic/PatternLayout;

    invoke-virtual {v0}, Lch/qos/logback/classic/PatternLayout;->getInstanceConverterMap()Ljava/util/Map;

    move-result-object v0

    const-string v1, "syslogStart"

    const-class v2, Lch/qos/logback/classic/pattern/SyslogStartConverter;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lch/qos/logback/classic/net/SyslogAppender;->stackTraceLayout:Lch/qos/logback/classic/PatternLayout;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lch/qos/logback/classic/net/SyslogAppender;->getPrefixPattern()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lch/qos/logback/classic/net/SyslogAppender;->stackTracePattern:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lch/qos/logback/classic/PatternLayout;->setPattern(Ljava/lang/String;)V

    iget-object v0, p0, Lch/qos/logback/classic/net/SyslogAppender;->stackTraceLayout:Lch/qos/logback/classic/PatternLayout;

    invoke-virtual {p0}, Lch/qos/logback/classic/net/SyslogAppender;->getContext()Lch/qos/logback/core/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lch/qos/logback/classic/PatternLayout;->setContext(Lch/qos/logback/core/Context;)V

    iget-object v0, p0, Lch/qos/logback/classic/net/SyslogAppender;->stackTraceLayout:Lch/qos/logback/classic/PatternLayout;

    invoke-virtual {v0}, Lch/qos/logback/classic/PatternLayout;->start()V

    return-void
.end method


# virtual methods
.method public buildLayout()Lch/qos/logback/core/Layout;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lch/qos/logback/core/Layout",
            "<",
            "Lch/qos/logback/classic/spi/ILoggingEvent;",
            ">;"
        }
    .end annotation

    new-instance v0, Lch/qos/logback/classic/PatternLayout;

    invoke-direct {v0}, Lch/qos/logback/classic/PatternLayout;-><init>()V

    invoke-virtual {v0}, Lch/qos/logback/classic/PatternLayout;->getInstanceConverterMap()Ljava/util/Map;

    move-result-object v1

    const-string v2, "syslogStart"

    const-class v3, Lch/qos/logback/classic/pattern/SyslogStartConverter;

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lch/qos/logback/classic/net/SyslogAppender;->suffixPattern:Ljava/lang/String;

    if-nez v1, :cond_1c

    const-string v1, "[%thread] %logger %msg"

    iput-object v1, p0, Lch/qos/logback/classic/net/SyslogAppender;->suffixPattern:Ljava/lang/String;

    :cond_1c
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lch/qos/logback/classic/net/SyslogAppender;->getPrefixPattern()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lch/qos/logback/classic/net/SyslogAppender;->suffixPattern:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lch/qos/logback/classic/PatternLayout;->setPattern(Ljava/lang/String;)V

    invoke-virtual {p0}, Lch/qos/logback/classic/net/SyslogAppender;->getContext()Lch/qos/logback/core/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lch/qos/logback/classic/PatternLayout;->setContext(Lch/qos/logback/core/Context;)V

    invoke-virtual {v0}, Lch/qos/logback/classic/PatternLayout;->start()V

    return-object v0
.end method

.method getPrefixPattern()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "%syslogStart{"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lch/qos/logback/classic/net/SyslogAppender;->getFacility()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "}%nopex{}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSeverityForEvent(Ljava/lang/Object;)I
    .registers 3

    check-cast p1, Lch/qos/logback/classic/spi/ILoggingEvent;

    invoke-static {p1}, Lch/qos/logback/classic/util/LevelToSyslogSeverity;->convert(Lch/qos/logback/classic/spi/ILoggingEvent;)I

    move-result v0

    return v0
.end method

.method public getStackTracePattern()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/classic/net/SyslogAppender;->stackTracePattern:Ljava/lang/String;

    return-object v0
.end method

.method public isThrowableExcluded()Z
    .registers 2

    iget-boolean v0, p0, Lch/qos/logback/classic/net/SyslogAppender;->throwableExcluded:Z

    return v0
.end method

.method protected postProcess(Ljava/lang/Object;Ljava/io/OutputStream;)V
    .registers 12

    const/4 v1, 0x0

    iget-boolean v0, p0, Lch/qos/logback/classic/net/SyslogAppender;->throwableExcluded:Z

    if-eqz v0, :cond_6

    :cond_5
    :goto_5
    return-void

    :cond_6
    check-cast p1, Lch/qos/logback/classic/spi/ILoggingEvent;

    invoke-interface {p1}, Lch/qos/logback/classic/spi/ILoggingEvent;->getThrowableProxy()Lch/qos/logback/classic/spi/IThrowableProxy;

    move-result-object v2

    if-eqz v2, :cond_5

    iget-object v0, p0, Lch/qos/logback/classic/net/SyslogAppender;->stackTraceLayout:Lch/qos/logback/classic/PatternLayout;

    invoke-virtual {v0, p1}, Lch/qos/logback/classic/PatternLayout;->doLayout(Lch/qos/logback/classic/spi/ILoggingEvent;)Ljava/lang/String;

    move-result-object v3

    const/4 v0, 0x1

    :goto_15
    if-eqz v2, :cond_5

    invoke-interface {v2}, Lch/qos/logback/classic/spi/IThrowableProxy;->getStackTraceElementProxyArray()[Lch/qos/logback/classic/spi/StackTraceElementProxy;

    move-result-object v4

    :try_start_1b
    invoke-direct {p0, p2, v2, v3, v0}, Lch/qos/logback/classic/net/SyslogAppender;->handleThrowableFirstLine(Ljava/io/OutputStream;Lch/qos/logback/classic/spi/IThrowableProxy;Ljava/lang/String;Z)V

    array-length v5, v4

    move v0, v1

    :goto_20
    if-ge v0, v5, :cond_41

    aget-object v6, v4, v0

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->getBytes()[B

    move-result-object v6

    invoke-virtual {p2, v6}, Ljava/io/OutputStream;->write([B)V

    invoke-virtual {p2}, Ljava/io/OutputStream;->flush()V
    :try_end_3e
    .catch Ljava/io/IOException; {:try_start_1b .. :try_end_3e} :catch_48

    add-int/lit8 v0, v0, 0x1

    goto :goto_20

    :cond_41
    invoke-interface {v2}, Lch/qos/logback/classic/spi/IThrowableProxy;->getCause()Lch/qos/logback/classic/spi/IThrowableProxy;

    move-result-object v0

    move-object v2, v0

    move v0, v1

    goto :goto_15

    :catch_48
    move-exception v0

    goto :goto_5
.end method

.method public setStackTracePattern(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lch/qos/logback/classic/net/SyslogAppender;->stackTracePattern:Ljava/lang/String;

    return-void
.end method

.method public setThrowableExcluded(Z)V
    .registers 2

    iput-boolean p1, p0, Lch/qos/logback/classic/net/SyslogAppender;->throwableExcluded:Z

    return-void
.end method

.method stackTraceHeaderLine(Ljava/lang/StringBuilder;Z)Z
    .registers 4

    const/4 v0, 0x0

    return v0
.end method

.method public start()V
    .registers 1

    invoke-super {p0}, Lch/qos/logback/core/net/SyslogAppenderBase;->start()V

    invoke-direct {p0}, Lch/qos/logback/classic/net/SyslogAppender;->setupStackTraceLayout()V

    return-void
.end method
