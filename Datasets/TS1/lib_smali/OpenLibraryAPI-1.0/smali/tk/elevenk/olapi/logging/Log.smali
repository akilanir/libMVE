.class public abstract Ltk/elevenk/olapi/logging/Log;
.super Ljava/lang/Object;
.source "Log.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static d(Ljava/lang/String;)V
    .registers 3
    .param p0, "msg"    # Ljava/lang/String;

    .prologue
    .line 26
    sget-object v0, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const/4 v1, 0x0

    invoke-static {v0, p0, v1}, Ltk/elevenk/olapi/logging/Log;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 27
    return-void
.end method

.method public static e(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 3
    .param p0, "msg"    # Ljava/lang/String;
    .param p1, "thrown"    # Ljava/lang/Throwable;

    .prologue
    .line 22
    sget-object v0, Ljava/util/logging/Level;->SEVERE:Ljava/util/logging/Level;

    invoke-static {v0, p0, p1}, Ltk/elevenk/olapi/logging/Log;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 23
    return-void
.end method

.method private static log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 5
    .param p0, "level"    # Ljava/util/logging/Level;
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "throwable"    # Ljava/lang/Throwable;

    .prologue
    const/4 v1, 0x2

    .line 14
    if-eqz p2, :cond_19

    .line 15
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v0

    aget-object v0, v0, v1

    invoke-virtual {v0}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    invoke-virtual {v0, p0, p1, p2}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 19
    :goto_18
    return-void

    .line 17
    :cond_19
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v0

    aget-object v0, v0, v1

    invoke-virtual {v0}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;)V

    goto :goto_18
.end method
