.class Lfreemarker/log/_JDK14LoggerFactory$JDK14Logger;
.super Lfreemarker/log/Logger;
.source "_JDK14LoggerFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/log/_JDK14LoggerFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "JDK14Logger"
.end annotation


# instance fields
.field private final logger:Ljava/util/logging/Logger;


# direct methods
.method constructor <init>(Ljava/util/logging/Logger;)V
    .registers 2
    .param p1, "logger"    # Ljava/util/logging/Logger;

    .prologue
    .line 77
    invoke-direct {p0}, Lfreemarker/log/Logger;-><init>()V

    .line 78
    iput-object p1, p0, Lfreemarker/log/_JDK14LoggerFactory$JDK14Logger;->logger:Ljava/util/logging/Logger;

    .line 79
    return-void
.end method


# virtual methods
.method public debug(Ljava/lang/String;)V
    .registers 4
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 83
    iget-object v0, p0, Lfreemarker/log/_JDK14LoggerFactory$JDK14Logger;->logger:Ljava/util/logging/Logger;

    sget-object v1, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v0, v1, p1}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;)V

    .line 84
    return-void
.end method

.method public debug(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 5
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 88
    iget-object v0, p0, Lfreemarker/log/_JDK14LoggerFactory$JDK14Logger;->logger:Ljava/util/logging/Logger;

    sget-object v1, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v0, v1, p1, p2}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 89
    return-void
.end method

.method public error(Ljava/lang/String;)V
    .registers 4
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 93
    iget-object v0, p0, Lfreemarker/log/_JDK14LoggerFactory$JDK14Logger;->logger:Ljava/util/logging/Logger;

    sget-object v1, Ljava/util/logging/Level;->SEVERE:Ljava/util/logging/Level;

    invoke-virtual {v0, v1, p1}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;)V

    .line 94
    return-void
.end method

.method public error(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 5
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 98
    iget-object v0, p0, Lfreemarker/log/_JDK14LoggerFactory$JDK14Logger;->logger:Ljava/util/logging/Logger;

    sget-object v1, Ljava/util/logging/Level;->SEVERE:Ljava/util/logging/Level;

    invoke-virtual {v0, v1, p1, p2}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 99
    return-void
.end method

.method public info(Ljava/lang/String;)V
    .registers 4
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 103
    iget-object v0, p0, Lfreemarker/log/_JDK14LoggerFactory$JDK14Logger;->logger:Ljava/util/logging/Logger;

    sget-object v1, Ljava/util/logging/Level;->INFO:Ljava/util/logging/Level;

    invoke-virtual {v0, v1, p1}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;)V

    .line 104
    return-void
.end method

.method public info(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 5
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 108
    iget-object v0, p0, Lfreemarker/log/_JDK14LoggerFactory$JDK14Logger;->logger:Ljava/util/logging/Logger;

    sget-object v1, Ljava/util/logging/Level;->INFO:Ljava/util/logging/Level;

    invoke-virtual {v0, v1, p1, p2}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 109
    return-void
.end method

.method public isDebugEnabled()Z
    .registers 3

    .prologue
    .line 123
    iget-object v0, p0, Lfreemarker/log/_JDK14LoggerFactory$JDK14Logger;->logger:Ljava/util/logging/Logger;

    sget-object v1, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v0

    return v0
.end method

.method public isErrorEnabled()Z
    .registers 3

    .prologue
    .line 138
    iget-object v0, p0, Lfreemarker/log/_JDK14LoggerFactory$JDK14Logger;->logger:Ljava/util/logging/Logger;

    sget-object v1, Ljava/util/logging/Level;->SEVERE:Ljava/util/logging/Level;

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v0

    return v0
.end method

.method public isFatalEnabled()Z
    .registers 3

    .prologue
    .line 143
    iget-object v0, p0, Lfreemarker/log/_JDK14LoggerFactory$JDK14Logger;->logger:Ljava/util/logging/Logger;

    sget-object v1, Ljava/util/logging/Level;->SEVERE:Ljava/util/logging/Level;

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v0

    return v0
.end method

.method public isInfoEnabled()Z
    .registers 3

    .prologue
    .line 128
    iget-object v0, p0, Lfreemarker/log/_JDK14LoggerFactory$JDK14Logger;->logger:Ljava/util/logging/Logger;

    sget-object v1, Ljava/util/logging/Level;->INFO:Ljava/util/logging/Level;

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v0

    return v0
.end method

.method public isWarnEnabled()Z
    .registers 3

    .prologue
    .line 133
    iget-object v0, p0, Lfreemarker/log/_JDK14LoggerFactory$JDK14Logger;->logger:Ljava/util/logging/Logger;

    sget-object v1, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v0

    return v0
.end method

.method public warn(Ljava/lang/String;)V
    .registers 4
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 113
    iget-object v0, p0, Lfreemarker/log/_JDK14LoggerFactory$JDK14Logger;->logger:Ljava/util/logging/Logger;

    sget-object v1, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    invoke-virtual {v0, v1, p1}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;)V

    .line 114
    return-void
.end method

.method public warn(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 5
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 118
    iget-object v0, p0, Lfreemarker/log/_JDK14LoggerFactory$JDK14Logger;->logger:Ljava/util/logging/Logger;

    sget-object v1, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    invoke-virtual {v0, v1, p1, p2}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 119
    return-void
.end method
