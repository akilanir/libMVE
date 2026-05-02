.class Lfreemarker/log/SLF4JLoggerFactory$LocationUnawareSLF4JLogger;
.super Lfreemarker/log/Logger;
.source "SLF4JLoggerFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/log/SLF4JLoggerFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "LocationUnawareSLF4JLogger"
.end annotation


# instance fields
.field private final logger:Lorg/slf4j/Logger;


# direct methods
.method constructor <init>(Lorg/slf4j/Logger;)V
    .registers 2
    .param p1, "logger"    # Lorg/slf4j/Logger;

    .prologue
    .line 154
    invoke-direct {p0}, Lfreemarker/log/Logger;-><init>()V

    .line 155
    iput-object p1, p0, Lfreemarker/log/SLF4JLoggerFactory$LocationUnawareSLF4JLogger;->logger:Lorg/slf4j/Logger;

    .line 156
    return-void
.end method


# virtual methods
.method public debug(Ljava/lang/String;)V
    .registers 3
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 159
    iget-object v0, p0, Lfreemarker/log/SLF4JLoggerFactory$LocationUnawareSLF4JLogger;->logger:Lorg/slf4j/Logger;

    invoke-interface {v0, p1}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;)V

    .line 160
    return-void
.end method

.method public debug(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 4
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 163
    iget-object v0, p0, Lfreemarker/log/SLF4JLoggerFactory$LocationUnawareSLF4JLogger;->logger:Lorg/slf4j/Logger;

    invoke-interface {v0, p1, p2}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 164
    return-void
.end method

.method public error(Ljava/lang/String;)V
    .registers 3
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 183
    iget-object v0, p0, Lfreemarker/log/SLF4JLoggerFactory$LocationUnawareSLF4JLogger;->logger:Lorg/slf4j/Logger;

    invoke-interface {v0, p1}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 184
    return-void
.end method

.method public error(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 4
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 187
    iget-object v0, p0, Lfreemarker/log/SLF4JLoggerFactory$LocationUnawareSLF4JLogger;->logger:Lorg/slf4j/Logger;

    invoke-interface {v0, p1, p2}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 188
    return-void
.end method

.method public info(Ljava/lang/String;)V
    .registers 3
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 167
    iget-object v0, p0, Lfreemarker/log/SLF4JLoggerFactory$LocationUnawareSLF4JLogger;->logger:Lorg/slf4j/Logger;

    invoke-interface {v0, p1}, Lorg/slf4j/Logger;->info(Ljava/lang/String;)V

    .line 168
    return-void
.end method

.method public info(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 4
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 171
    iget-object v0, p0, Lfreemarker/log/SLF4JLoggerFactory$LocationUnawareSLF4JLogger;->logger:Lorg/slf4j/Logger;

    invoke-interface {v0, p1, p2}, Lorg/slf4j/Logger;->info(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 172
    return-void
.end method

.method public isDebugEnabled()Z
    .registers 2

    .prologue
    .line 191
    iget-object v0, p0, Lfreemarker/log/SLF4JLoggerFactory$LocationUnawareSLF4JLogger;->logger:Lorg/slf4j/Logger;

    invoke-interface {v0}, Lorg/slf4j/Logger;->isDebugEnabled()Z

    move-result v0

    return v0
.end method

.method public isErrorEnabled()Z
    .registers 2

    .prologue
    .line 203
    iget-object v0, p0, Lfreemarker/log/SLF4JLoggerFactory$LocationUnawareSLF4JLogger;->logger:Lorg/slf4j/Logger;

    invoke-interface {v0}, Lorg/slf4j/Logger;->isErrorEnabled()Z

    move-result v0

    return v0
.end method

.method public isFatalEnabled()Z
    .registers 2

    .prologue
    .line 207
    iget-object v0, p0, Lfreemarker/log/SLF4JLoggerFactory$LocationUnawareSLF4JLogger;->logger:Lorg/slf4j/Logger;

    invoke-interface {v0}, Lorg/slf4j/Logger;->isErrorEnabled()Z

    move-result v0

    return v0
.end method

.method public isInfoEnabled()Z
    .registers 2

    .prologue
    .line 195
    iget-object v0, p0, Lfreemarker/log/SLF4JLoggerFactory$LocationUnawareSLF4JLogger;->logger:Lorg/slf4j/Logger;

    invoke-interface {v0}, Lorg/slf4j/Logger;->isInfoEnabled()Z

    move-result v0

    return v0
.end method

.method public isWarnEnabled()Z
    .registers 2

    .prologue
    .line 199
    iget-object v0, p0, Lfreemarker/log/SLF4JLoggerFactory$LocationUnawareSLF4JLogger;->logger:Lorg/slf4j/Logger;

    invoke-interface {v0}, Lorg/slf4j/Logger;->isWarnEnabled()Z

    move-result v0

    return v0
.end method

.method public warn(Ljava/lang/String;)V
    .registers 3
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 175
    iget-object v0, p0, Lfreemarker/log/SLF4JLoggerFactory$LocationUnawareSLF4JLogger;->logger:Lorg/slf4j/Logger;

    invoke-interface {v0, p1}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 176
    return-void
.end method

.method public warn(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 4
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 179
    iget-object v0, p0, Lfreemarker/log/SLF4JLoggerFactory$LocationUnawareSLF4JLogger;->logger:Lorg/slf4j/Logger;

    invoke-interface {v0, p1, p2}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 180
    return-void
.end method
