.class public Lcom/facebook/stetho/common/Util;
.super Ljava/lang/Object;
.source "Util.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static awaitUninterruptibly(Ljava/util/concurrent/CountDownLatch;)V
    .registers 2
    .param p0, "latch"    # Ljava/util/concurrent/CountDownLatch;

    .prologue
    .line 117
    :goto_0
    :try_start_0
    invoke-virtual {p0}, Ljava/util/concurrent/CountDownLatch;->await()V
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_3} :catch_4

    .line 118
    return-void

    .line 119
    :catch_4
    move-exception v0

    goto :goto_0
.end method

.method public static close(Ljava/io/Closeable;Z)V
    .registers 4
    .param p0, "closeable"    # Ljava/io/Closeable;
    .param p1, "hideException"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 76
    if-eqz p0, :cond_7

    .line 77
    if-eqz p1, :cond_f

    .line 79
    :try_start_4
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_7} :catch_8

    .line 87
    :cond_7
    :goto_7
    return-void

    .line 80
    :catch_8
    move-exception v0

    .line 81
    .local v0, "e":Ljava/io/IOException;
    const-string v1, "Hiding IOException because another is pending"

    invoke-static {v0, v1}, Lcom/facebook/stetho/common/LogUtil;->e(Ljava/lang/Throwable;Ljava/lang/String;)V

    goto :goto_7

    .line 84
    .end local v0    # "e":Ljava/io/IOException;
    :cond_f
    invoke-interface {p0}, Ljava/io/Closeable;->close()V

    goto :goto_7
.end method

.method public static copy(Ljava/io/InputStream;Ljava/io/OutputStream;[B)V
    .registers 5
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "output"    # Ljava/io/OutputStream;
    .param p2, "buffer"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 70
    :goto_0
    invoke-virtual {p0, p2}, Ljava/io/InputStream;->read([B)I

    move-result v0

    .local v0, "n":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_c

    .line 71
    const/4 v1, 0x0

    invoke-virtual {p1, p2, v1, v0}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_0

    .line 73
    :cond_c
    return-void
.end method

.method public static getUninterruptibly(Ljava/util/concurrent/Future;)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Future",
            "<TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/concurrent/ExecutionException;
        }
    .end annotation

    .prologue
    .line 145
    .local p0, "future":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<TT;>;"
    :goto_0
    :try_start_0
    invoke-interface {p0}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v0

    return-object v0

    .line 146
    :catch_5
    move-exception v0

    goto :goto_0
.end method

.method public static getUninterruptibly(Ljava/util/concurrent/Future;JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;
    .registers 13
    .param p1, "timeout"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Future",
            "<TT;>;J",
            "Ljava/util/concurrent/TimeUnit;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/concurrent/TimeoutException;,
            Ljava/util/concurrent/ExecutionException;
        }
    .end annotation

    .prologue
    .line 129
    .local p0, "future":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<TT;>;"
    invoke-virtual {p3, p1, p2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v3

    .line 130
    .local v3, "remaining":J
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    .line 133
    .local v5, "startTime":J
    :goto_8
    :try_start_8
    sget-object v7, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {p0, v3, v4, v7}, Ljava/util/concurrent/Future;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;
    :try_end_d
    .catch Ljava/lang/InterruptedException; {:try_start_8 .. :try_end_d} :catch_f

    move-result-object v7

    return-object v7

    .line 134
    :catch_f
    move-exception v0

    .line 135
    .local v0, "e":Ljava/lang/InterruptedException;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    sub-long v1, v7, v5

    .line 136
    .local v1, "gotFor":J
    sub-long/2addr v3, v1

    .line 137
    goto :goto_8
.end method

.method public static joinUninterruptibly(Ljava/lang/Thread;)V
    .registers 2
    .param p0, "t"    # Ljava/lang/Thread;

    .prologue
    .line 106
    :goto_0
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Thread;->join()V
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_3} :catch_4

    .line 107
    return-void

    .line 108
    :catch_4
    move-exception v0

    goto :goto_0
.end method

.method public static readAsUTF8(Ljava/io/InputStream;)Ljava/lang/String;
    .registers 3
    .param p0, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 153
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 154
    .local v0, "out":Ljava/io/ByteArrayOutputStream;
    const/16 v1, 0x400

    new-array v1, v1, [B

    invoke-static {p0, v0, v1}, Lcom/facebook/stetho/common/Util;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;[B)V

    .line 155
    const-string v1, "UTF-8"

    invoke-virtual {v0, v1}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static sleepUninterruptibly(J)V
    .registers 11
    .param p0, "millis"    # J

    .prologue
    .line 90
    move-wide v1, p0

    .line 91
    .local v1, "remaining":J
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    .line 94
    .local v5, "startTime":J
    :cond_5
    :try_start_5
    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_8
    .catch Ljava/lang/InterruptedException; {:try_start_5 .. :try_end_8} :catch_9

    .line 101
    :goto_8
    return-void

    .line 96
    :catch_9
    move-exception v0

    .line 97
    .local v0, "e":Ljava/lang/InterruptedException;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    sub-long v3, v7, v5

    .line 98
    .local v3, "sleptFor":J
    sub-long/2addr v1, v3

    .line 100
    const-wide/16 v7, 0x0

    cmp-long v7, v1, v7

    if-gtz v7, :cond_5

    goto :goto_8
.end method

.method public static throwIf(Z)V
    .registers 2
    .param p0, "condition"    # Z

    .prologue
    .line 49
    if-eqz p0, :cond_8

    .line 50
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 52
    :cond_8
    return-void
.end method

.method public static throwIfNot(Z)V
    .registers 2
    .param p0, "condition"    # Z

    .prologue
    .line 55
    if-nez p0, :cond_8

    .line 56
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 58
    :cond_8
    return-void
.end method

.method public static varargs throwIfNot(ZLjava/lang/String;[Ljava/lang/Object;)V
    .registers 5
    .param p0, "condition"    # Z
    .param p1, "format"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 61
    if-nez p0, :cond_c

    .line 62
    invoke-static {p1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 63
    .local v0, "message":Ljava/lang/String;
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 65
    .end local v0    # "message":Ljava/lang/String;
    :cond_c
    return-void
.end method

.method public static throwIfNotNull(Ljava/lang/Object;)V
    .registers 2
    .param p0, "item"    # Ljava/lang/Object;

    .prologue
    .line 43
    if-eqz p0, :cond_8

    .line 44
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 46
    :cond_8
    return-void
.end method

.method public static throwIfNull(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)TT;"
        }
    .end annotation

    .prologue
    .line 25
    .local p0, "item":Ljava/lang/Object;, "TT;"
    if-nez p0, :cond_8

    .line 26
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 28
    :cond_8
    return-object p0
.end method

.method public static throwIfNull(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            "T2:",
            "Ljava/lang/Object;",
            ">(TT1;TT2;)V"
        }
    .end annotation

    .prologue
    .line 32
    .local p0, "item1":Ljava/lang/Object;, "TT1;"
    .local p1, "item2":Ljava/lang/Object;, "TT2;"
    invoke-static {p0}, Lcom/facebook/stetho/common/Util;->throwIfNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    invoke-static {p1}, Lcom/facebook/stetho/common/Util;->throwIfNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    return-void
.end method

.method public static throwIfNull(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            "T2:",
            "Ljava/lang/Object;",
            "T3:",
            "Ljava/lang/Object;",
            ">(TT1;TT2;TT3;)V"
        }
    .end annotation

    .prologue
    .line 37
    .local p0, "item1":Ljava/lang/Object;, "TT1;"
    .local p1, "item2":Ljava/lang/Object;, "TT2;"
    .local p2, "item3":Ljava/lang/Object;, "TT3;"
    invoke-static {p0}, Lcom/facebook/stetho/common/Util;->throwIfNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    invoke-static {p1}, Lcom/facebook/stetho/common/Util;->throwIfNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    invoke-static {p2}, Lcom/facebook/stetho/common/Util;->throwIfNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    return-void
.end method
