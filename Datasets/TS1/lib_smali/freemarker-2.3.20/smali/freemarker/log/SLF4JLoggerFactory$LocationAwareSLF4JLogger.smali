.class final Lfreemarker/log/SLF4JLoggerFactory$LocationAwareSLF4JLogger;
.super Lfreemarker/log/Logger;
.source "SLF4JLoggerFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/log/SLF4JLoggerFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "LocationAwareSLF4JLogger"
.end annotation


# static fields
.field private static final ADAPTER_FQCN:Ljava/lang/String;


# instance fields
.field private final logger:Lorg/slf4j/spi/LocationAwareLogger;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 79
    sget-object v0, Lfreemarker/log/SLF4JLoggerFactory;->class$freemarker$log$SLF4JLoggerFactory$LocationAwareSLF4JLogger:Ljava/lang/Class;

    if-nez v0, :cond_13

    const-string v0, "freemarker.log.SLF4JLoggerFactory$LocationAwareSLF4JLogger"

    invoke-static {v0}, Lfreemarker/log/SLF4JLoggerFactory;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/log/SLF4JLoggerFactory;->class$freemarker$log$SLF4JLoggerFactory$LocationAwareSLF4JLogger:Ljava/lang/Class;

    :goto_c
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lfreemarker/log/SLF4JLoggerFactory$LocationAwareSLF4JLogger;->ADAPTER_FQCN:Ljava/lang/String;

    return-void

    :cond_13
    sget-object v0, Lfreemarker/log/SLF4JLoggerFactory;->class$freemarker$log$SLF4JLoggerFactory$LocationAwareSLF4JLogger:Ljava/lang/Class;

    goto :goto_c
.end method

.method constructor <init>(Lorg/slf4j/spi/LocationAwareLogger;)V
    .registers 2
    .param p1, "logger"    # Lorg/slf4j/spi/LocationAwareLogger;

    .prologue
    .line 84
    invoke-direct {p0}, Lfreemarker/log/Logger;-><init>()V

    .line 85
    iput-object p1, p0, Lfreemarker/log/SLF4JLoggerFactory$LocationAwareSLF4JLogger;->logger:Lorg/slf4j/spi/LocationAwareLogger;

    .line 86
    return-void
.end method


# virtual methods
.method public debug(Ljava/lang/String;)V
    .registers 3
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 89
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lfreemarker/log/SLF4JLoggerFactory$LocationAwareSLF4JLogger;->debug(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 90
    return-void
.end method

.method public debug(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 10
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "t"    # Ljava/lang/Throwable;

    .prologue
    const/4 v1, 0x0

    .line 93
    iget-object v0, p0, Lfreemarker/log/SLF4JLoggerFactory$LocationAwareSLF4JLogger;->logger:Lorg/slf4j/spi/LocationAwareLogger;

    sget-object v2, Lfreemarker/log/SLF4JLoggerFactory$LocationAwareSLF4JLogger;->ADAPTER_FQCN:Ljava/lang/String;

    const/16 v3, 0xa

    move-object v4, p1

    move-object v5, v1

    move-object v6, p2

    invoke-interface/range {v0 .. v6}, Lorg/slf4j/spi/LocationAwareLogger;->log(Lorg/slf4j/Marker;Ljava/lang/String;ILjava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 95
    return-void
.end method

.method public error(Ljava/lang/String;)V
    .registers 3
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 116
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lfreemarker/log/SLF4JLoggerFactory$LocationAwareSLF4JLogger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 117
    return-void
.end method

.method public error(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 10
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "t"    # Ljava/lang/Throwable;

    .prologue
    const/4 v1, 0x0

    .line 120
    iget-object v0, p0, Lfreemarker/log/SLF4JLoggerFactory$LocationAwareSLF4JLogger;->logger:Lorg/slf4j/spi/LocationAwareLogger;

    sget-object v2, Lfreemarker/log/SLF4JLoggerFactory$LocationAwareSLF4JLogger;->ADAPTER_FQCN:Ljava/lang/String;

    const/16 v3, 0x28

    move-object v4, p1

    move-object v5, v1

    move-object v6, p2

    invoke-interface/range {v0 .. v6}, Lorg/slf4j/spi/LocationAwareLogger;->log(Lorg/slf4j/Marker;Ljava/lang/String;ILjava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 122
    return-void
.end method

.method public info(Ljava/lang/String;)V
    .registers 3
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 98
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lfreemarker/log/SLF4JLoggerFactory$LocationAwareSLF4JLogger;->info(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 99
    return-void
.end method

.method public info(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 10
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "t"    # Ljava/lang/Throwable;

    .prologue
    const/4 v1, 0x0

    .line 102
    iget-object v0, p0, Lfreemarker/log/SLF4JLoggerFactory$LocationAwareSLF4JLogger;->logger:Lorg/slf4j/spi/LocationAwareLogger;

    sget-object v2, Lfreemarker/log/SLF4JLoggerFactory$LocationAwareSLF4JLogger;->ADAPTER_FQCN:Ljava/lang/String;

    const/16 v3, 0x14

    move-object v4, p1

    move-object v5, v1

    move-object v6, p2

    invoke-interface/range {v0 .. v6}, Lorg/slf4j/spi/LocationAwareLogger;->log(Lorg/slf4j/Marker;Ljava/lang/String;ILjava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 104
    return-void
.end method

.method public isDebugEnabled()Z
    .registers 2

    .prologue
    .line 125
    iget-object v0, p0, Lfreemarker/log/SLF4JLoggerFactory$LocationAwareSLF4JLogger;->logger:Lorg/slf4j/spi/LocationAwareLogger;

    invoke-interface {v0}, Lorg/slf4j/spi/LocationAwareLogger;->isDebugEnabled()Z

    move-result v0

    return v0
.end method

.method public isErrorEnabled()Z
    .registers 2

    .prologue
    .line 137
    iget-object v0, p0, Lfreemarker/log/SLF4JLoggerFactory$LocationAwareSLF4JLogger;->logger:Lorg/slf4j/spi/LocationAwareLogger;

    invoke-interface {v0}, Lorg/slf4j/spi/LocationAwareLogger;->isErrorEnabled()Z

    move-result v0

    return v0
.end method

.method public isFatalEnabled()Z
    .registers 2

    .prologue
    .line 141
    iget-object v0, p0, Lfreemarker/log/SLF4JLoggerFactory$LocationAwareSLF4JLogger;->logger:Lorg/slf4j/spi/LocationAwareLogger;

    invoke-interface {v0}, Lorg/slf4j/spi/LocationAwareLogger;->isErrorEnabled()Z

    move-result v0

    return v0
.end method

.method public isInfoEnabled()Z
    .registers 2

    .prologue
    .line 129
    iget-object v0, p0, Lfreemarker/log/SLF4JLoggerFactory$LocationAwareSLF4JLogger;->logger:Lorg/slf4j/spi/LocationAwareLogger;

    invoke-interface {v0}, Lorg/slf4j/spi/LocationAwareLogger;->isInfoEnabled()Z

    move-result v0

    return v0
.end method

.method public isWarnEnabled()Z
    .registers 2

    .prologue
    .line 133
    iget-object v0, p0, Lfreemarker/log/SLF4JLoggerFactory$LocationAwareSLF4JLogger;->logger:Lorg/slf4j/spi/LocationAwareLogger;

    invoke-interface {v0}, Lorg/slf4j/spi/LocationAwareLogger;->isWarnEnabled()Z

    move-result v0

    return v0
.end method

.method public warn(Ljava/lang/String;)V
    .registers 3
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 107
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lfreemarker/log/SLF4JLoggerFactory$LocationAwareSLF4JLogger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 108
    return-void
.end method

.method public warn(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 10
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "t"    # Ljava/lang/Throwable;

    .prologue
    const/4 v1, 0x0

    .line 111
    iget-object v0, p0, Lfreemarker/log/SLF4JLoggerFactory$LocationAwareSLF4JLogger;->logger:Lorg/slf4j/spi/LocationAwareLogger;

    sget-object v2, Lfreemarker/log/SLF4JLoggerFactory$LocationAwareSLF4JLogger;->ADAPTER_FQCN:Ljava/lang/String;

    const/16 v3, 0x1e

    move-object v4, p1

    move-object v5, v1

    move-object v6, p2

    invoke-interface/range {v0 .. v6}, Lorg/slf4j/spi/LocationAwareLogger;->log(Lorg/slf4j/Marker;Ljava/lang/String;ILjava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 113
    return-void
.end method
