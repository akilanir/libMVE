.class Lokhttp3/ConnectionPool$1;
.super Ljava/lang/Object;
.source "ConnectionPool.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lokhttp3/ConnectionPool;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lokhttp3/ConnectionPool;


# direct methods
.method constructor <init>(Lokhttp3/ConnectionPool;)V
    .registers 2
    .param p1, "this$0"    # Lokhttp3/ConnectionPool;

    .prologue
    .line 55
    iput-object p1, p0, Lokhttp3/ConnectionPool$1;->this$0:Lokhttp3/ConnectionPool;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 10

    .prologue
    const-wide/32 v7, 0xf4240

    .line 58
    :cond_3
    :goto_3
    iget-object v4, p0, Lokhttp3/ConnectionPool$1;->this$0:Lokhttp3/ConnectionPool;

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v5

    invoke-virtual {v4, v5, v6}, Lokhttp3/ConnectionPool;->cleanup(J)J

    move-result-wide v2

    .line 59
    .local v2, "waitNanos":J
    const-wide/16 v4, -0x1

    cmp-long v4, v2, v4

    if-nez v4, :cond_14

    return-void

    .line 60
    :cond_14
    const-wide/16 v4, 0x0

    cmp-long v4, v2, v4

    if-lez v4, :cond_3

    .line 61
    div-long v0, v2, v7

    .line 62
    .local v0, "waitMillis":J
    mul-long v4, v0, v7

    sub-long/2addr v2, v4

    .line 63
    iget-object v5, p0, Lokhttp3/ConnectionPool$1;->this$0:Lokhttp3/ConnectionPool;

    monitor-enter v5

    .line 65
    :try_start_22
    iget-object v4, p0, Lokhttp3/ConnectionPool$1;->this$0:Lokhttp3/ConnectionPool;

    long-to-int v6, v2

    invoke-virtual {v4, v0, v1, v6}, Ljava/lang/Object;->wait(JI)V
    :try_end_28
    .catch Ljava/lang/InterruptedException; {:try_start_22 .. :try_end_28} :catch_2d
    .catchall {:try_start_22 .. :try_end_28} :catchall_2a

    .line 68
    :goto_28
    :try_start_28
    monitor-exit v5

    goto :goto_3

    :catchall_2a
    move-exception v4

    monitor-exit v5
    :try_end_2c
    .catchall {:try_start_28 .. :try_end_2c} :catchall_2a

    throw v4

    .line 66
    :catch_2d
    move-exception v4

    goto :goto_28
.end method
