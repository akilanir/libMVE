.class Lfreemarker/log/_AvalonLoggerFactory$AvalonLogger;
.super Lfreemarker/log/Logger;
.source "_AvalonLoggerFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/log/_AvalonLoggerFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "AvalonLogger"
.end annotation


# instance fields
.field private final logger:Lorg/apache/log/Logger;


# direct methods
.method constructor <init>(Lorg/apache/log/Logger;)V
    .registers 2
    .param p1, "logger"    # Lorg/apache/log/Logger;

    .prologue
    .line 77
    invoke-direct {p0}, Lfreemarker/log/Logger;-><init>()V

    .line 78
    iput-object p1, p0, Lfreemarker/log/_AvalonLoggerFactory$AvalonLogger;->logger:Lorg/apache/log/Logger;

    .line 79
    return-void
.end method


# virtual methods
.method public debug(Ljava/lang/String;)V
    .registers 3
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 83
    iget-object v0, p0, Lfreemarker/log/_AvalonLoggerFactory$AvalonLogger;->logger:Lorg/apache/log/Logger;

    invoke-virtual {v0, p1}, Lorg/apache/log/Logger;->debug(Ljava/lang/String;)V

    .line 84
    return-void
.end method

.method public debug(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 4
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 88
    iget-object v0, p0, Lfreemarker/log/_AvalonLoggerFactory$AvalonLogger;->logger:Lorg/apache/log/Logger;

    invoke-virtual {v0, p1, p2}, Lorg/apache/log/Logger;->debug(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 89
    return-void
.end method

.method public error(Ljava/lang/String;)V
    .registers 3
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 93
    iget-object v0, p0, Lfreemarker/log/_AvalonLoggerFactory$AvalonLogger;->logger:Lorg/apache/log/Logger;

    invoke-virtual {v0, p1}, Lorg/apache/log/Logger;->error(Ljava/lang/String;)V

    .line 94
    return-void
.end method

.method public error(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 4
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 98
    iget-object v0, p0, Lfreemarker/log/_AvalonLoggerFactory$AvalonLogger;->logger:Lorg/apache/log/Logger;

    invoke-virtual {v0, p1, p2}, Lorg/apache/log/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 99
    return-void
.end method

.method public info(Ljava/lang/String;)V
    .registers 3
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 103
    iget-object v0, p0, Lfreemarker/log/_AvalonLoggerFactory$AvalonLogger;->logger:Lorg/apache/log/Logger;

    invoke-virtual {v0, p1}, Lorg/apache/log/Logger;->info(Ljava/lang/String;)V

    .line 104
    return-void
.end method

.method public info(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 4
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 108
    iget-object v0, p0, Lfreemarker/log/_AvalonLoggerFactory$AvalonLogger;->logger:Lorg/apache/log/Logger;

    invoke-virtual {v0, p1, p2}, Lorg/apache/log/Logger;->info(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 109
    return-void
.end method

.method public isDebugEnabled()Z
    .registers 2

    .prologue
    .line 123
    iget-object v0, p0, Lfreemarker/log/_AvalonLoggerFactory$AvalonLogger;->logger:Lorg/apache/log/Logger;

    invoke-virtual {v0}, Lorg/apache/log/Logger;->isDebugEnabled()Z

    move-result v0

    return v0
.end method

.method public isErrorEnabled()Z
    .registers 2

    .prologue
    .line 138
    iget-object v0, p0, Lfreemarker/log/_AvalonLoggerFactory$AvalonLogger;->logger:Lorg/apache/log/Logger;

    invoke-virtual {v0}, Lorg/apache/log/Logger;->isErrorEnabled()Z

    move-result v0

    return v0
.end method

.method public isFatalEnabled()Z
    .registers 2

    .prologue
    .line 143
    iget-object v0, p0, Lfreemarker/log/_AvalonLoggerFactory$AvalonLogger;->logger:Lorg/apache/log/Logger;

    invoke-virtual {v0}, Lorg/apache/log/Logger;->isFatalErrorEnabled()Z

    move-result v0

    return v0
.end method

.method public isInfoEnabled()Z
    .registers 2

    .prologue
    .line 128
    iget-object v0, p0, Lfreemarker/log/_AvalonLoggerFactory$AvalonLogger;->logger:Lorg/apache/log/Logger;

    invoke-virtual {v0}, Lorg/apache/log/Logger;->isInfoEnabled()Z

    move-result v0

    return v0
.end method

.method public isWarnEnabled()Z
    .registers 2

    .prologue
    .line 133
    iget-object v0, p0, Lfreemarker/log/_AvalonLoggerFactory$AvalonLogger;->logger:Lorg/apache/log/Logger;

    invoke-virtual {v0}, Lorg/apache/log/Logger;->isWarnEnabled()Z

    move-result v0

    return v0
.end method

.method public warn(Ljava/lang/String;)V
    .registers 3
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 113
    iget-object v0, p0, Lfreemarker/log/_AvalonLoggerFactory$AvalonLogger;->logger:Lorg/apache/log/Logger;

    invoke-virtual {v0, p1}, Lorg/apache/log/Logger;->warn(Ljava/lang/String;)V

    .line 114
    return-void
.end method

.method public warn(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 4
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 118
    iget-object v0, p0, Lfreemarker/log/_AvalonLoggerFactory$AvalonLogger;->logger:Lorg/apache/log/Logger;

    invoke-virtual {v0, p1, p2}, Lorg/apache/log/Logger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 119
    return-void
.end method
