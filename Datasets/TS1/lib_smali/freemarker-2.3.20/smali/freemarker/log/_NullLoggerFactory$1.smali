.class final Lfreemarker/log/_NullLoggerFactory$1;
.super Lfreemarker/log/Logger;
.source "_NullLoggerFactory.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 73
    invoke-direct {p0}, Lfreemarker/log/Logger;-><init>()V

    return-void
.end method


# virtual methods
.method public debug(Ljava/lang/String;)V
    .registers 2
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 76
    return-void
.end method

.method public debug(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 3
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 80
    return-void
.end method

.method public error(Ljava/lang/String;)V
    .registers 2
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 84
    return-void
.end method

.method public error(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 3
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 88
    return-void
.end method

.method public info(Ljava/lang/String;)V
    .registers 2
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 92
    return-void
.end method

.method public info(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 3
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 96
    return-void
.end method

.method public isDebugEnabled()Z
    .registers 2

    .prologue
    .line 108
    const/4 v0, 0x0

    return v0
.end method

.method public isErrorEnabled()Z
    .registers 2

    .prologue
    .line 123
    const/4 v0, 0x0

    return v0
.end method

.method public isFatalEnabled()Z
    .registers 2

    .prologue
    .line 128
    const/4 v0, 0x0

    return v0
.end method

.method public isInfoEnabled()Z
    .registers 2

    .prologue
    .line 113
    const/4 v0, 0x0

    return v0
.end method

.method public isWarnEnabled()Z
    .registers 2

    .prologue
    .line 118
    const/4 v0, 0x0

    return v0
.end method

.method public warn(Ljava/lang/String;)V
    .registers 2
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 100
    return-void
.end method

.method public warn(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 3
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 104
    return-void
.end method
