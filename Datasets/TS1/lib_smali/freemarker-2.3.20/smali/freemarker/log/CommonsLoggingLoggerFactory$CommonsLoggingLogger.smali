.class Lfreemarker/log/CommonsLoggingLoggerFactory$CommonsLoggingLogger;
.super Lfreemarker/log/Logger;
.source "CommonsLoggingLoggerFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/log/CommonsLoggingLoggerFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CommonsLoggingLogger"
.end annotation


# instance fields
.field private final logger:Lorg/apache/commons/logging/Log;


# direct methods
.method constructor <init>(Lorg/apache/commons/logging/Log;)V
    .registers 2
    .param p1, "logger"    # Lorg/apache/commons/logging/Log;

    .prologue
    .line 71
    invoke-direct {p0}, Lfreemarker/log/Logger;-><init>()V

    .line 72
    iput-object p1, p0, Lfreemarker/log/CommonsLoggingLoggerFactory$CommonsLoggingLogger;->logger:Lorg/apache/commons/logging/Log;

    .line 73
    return-void
.end method


# virtual methods
.method public debug(Ljava/lang/String;)V
    .registers 3
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 76
    iget-object v0, p0, Lfreemarker/log/CommonsLoggingLoggerFactory$CommonsLoggingLogger;->logger:Lorg/apache/commons/logging/Log;

    invoke-interface {v0, p1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 77
    return-void
.end method

.method public debug(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 4
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 80
    iget-object v0, p0, Lfreemarker/log/CommonsLoggingLoggerFactory$CommonsLoggingLogger;->logger:Lorg/apache/commons/logging/Log;

    invoke-interface {v0, p1, p2}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 81
    return-void
.end method

.method public error(Ljava/lang/String;)V
    .registers 3
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 100
    iget-object v0, p0, Lfreemarker/log/CommonsLoggingLoggerFactory$CommonsLoggingLogger;->logger:Lorg/apache/commons/logging/Log;

    invoke-interface {v0, p1}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;)V

    .line 101
    return-void
.end method

.method public error(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 4
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 104
    iget-object v0, p0, Lfreemarker/log/CommonsLoggingLoggerFactory$CommonsLoggingLogger;->logger:Lorg/apache/commons/logging/Log;

    invoke-interface {v0, p1, p2}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 105
    return-void
.end method

.method public info(Ljava/lang/String;)V
    .registers 3
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 84
    iget-object v0, p0, Lfreemarker/log/CommonsLoggingLoggerFactory$CommonsLoggingLogger;->logger:Lorg/apache/commons/logging/Log;

    invoke-interface {v0, p1}, Lorg/apache/commons/logging/Log;->info(Ljava/lang/Object;)V

    .line 85
    return-void
.end method

.method public info(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 4
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 88
    iget-object v0, p0, Lfreemarker/log/CommonsLoggingLoggerFactory$CommonsLoggingLogger;->logger:Lorg/apache/commons/logging/Log;

    invoke-interface {v0, p1, p2}, Lorg/apache/commons/logging/Log;->info(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 89
    return-void
.end method

.method public isDebugEnabled()Z
    .registers 2

    .prologue
    .line 108
    iget-object v0, p0, Lfreemarker/log/CommonsLoggingLoggerFactory$CommonsLoggingLogger;->logger:Lorg/apache/commons/logging/Log;

    invoke-interface {v0}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v0

    return v0
.end method

.method public isErrorEnabled()Z
    .registers 2

    .prologue
    .line 120
    iget-object v0, p0, Lfreemarker/log/CommonsLoggingLoggerFactory$CommonsLoggingLogger;->logger:Lorg/apache/commons/logging/Log;

    invoke-interface {v0}, Lorg/apache/commons/logging/Log;->isErrorEnabled()Z

    move-result v0

    return v0
.end method

.method public isFatalEnabled()Z
    .registers 2

    .prologue
    .line 124
    iget-object v0, p0, Lfreemarker/log/CommonsLoggingLoggerFactory$CommonsLoggingLogger;->logger:Lorg/apache/commons/logging/Log;

    invoke-interface {v0}, Lorg/apache/commons/logging/Log;->isFatalEnabled()Z

    move-result v0

    return v0
.end method

.method public isInfoEnabled()Z
    .registers 2

    .prologue
    .line 112
    iget-object v0, p0, Lfreemarker/log/CommonsLoggingLoggerFactory$CommonsLoggingLogger;->logger:Lorg/apache/commons/logging/Log;

    invoke-interface {v0}, Lorg/apache/commons/logging/Log;->isInfoEnabled()Z

    move-result v0

    return v0
.end method

.method public isWarnEnabled()Z
    .registers 2

    .prologue
    .line 116
    iget-object v0, p0, Lfreemarker/log/CommonsLoggingLoggerFactory$CommonsLoggingLogger;->logger:Lorg/apache/commons/logging/Log;

    invoke-interface {v0}, Lorg/apache/commons/logging/Log;->isWarnEnabled()Z

    move-result v0

    return v0
.end method

.method public warn(Ljava/lang/String;)V
    .registers 3
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 92
    iget-object v0, p0, Lfreemarker/log/CommonsLoggingLoggerFactory$CommonsLoggingLogger;->logger:Lorg/apache/commons/logging/Log;

    invoke-interface {v0, p1}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;)V

    .line 93
    return-void
.end method

.method public warn(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 4
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 96
    iget-object v0, p0, Lfreemarker/log/CommonsLoggingLoggerFactory$CommonsLoggingLogger;->logger:Lorg/apache/commons/logging/Log;

    invoke-interface {v0, p1, p2}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 97
    return-void
.end method
