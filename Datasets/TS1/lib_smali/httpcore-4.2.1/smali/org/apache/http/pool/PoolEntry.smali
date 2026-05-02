.class public abstract Lorg/apache/http/pool/PoolEntry;
.super Ljava/lang/Object;
.source "PoolEntry.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "C:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation

.annotation build Lorg/apache/http/annotation/ThreadSafe;
.end annotation


# instance fields
.field private final conn:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TC;"
        }
    .end annotation
.end field

.field private final created:J

.field private expiry:J
    .annotation build Lorg/apache/http/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private final id:Ljava/lang/String;

.field private final route:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private volatile state:Ljava/lang/Object;

.field private updated:J
    .annotation build Lorg/apache/http/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private final validUnit:J


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 11
    .param p1, "id"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "TT;TC;)V"
        }
    .end annotation

    .prologue
    .line 109
    .local p0, "this":Lorg/apache/http/pool/PoolEntry;, "Lorg/apache/http/pool/PoolEntry<TT;TC;>;"
    .local p2, "route":Ljava/lang/Object;, "TT;"
    .local p3, "conn":Ljava/lang/Object;, "TC;"
    const-wide/16 v4, 0x0

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    invoke-direct/range {v0 .. v6}, Lorg/apache/http/pool/PoolEntry;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;)V

    .line 110
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;)V
    .registers 11
    .param p1, "id"    # Ljava/lang/String;
    .param p4, "timeToLive"    # J
    .param p6, "tunit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "TT;TC;J",
            "Ljava/util/concurrent/TimeUnit;",
            ")V"
        }
    .end annotation

    .prologue
    .line 79
    .local p0, "this":Lorg/apache/http/pool/PoolEntry;, "Lorg/apache/http/pool/PoolEntry<TT;TC;>;"
    .local p2, "route":Ljava/lang/Object;, "TT;"
    .local p3, "conn":Ljava/lang/Object;, "TC;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 80
    if-nez p2, :cond_d

    .line 81
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Route may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 83
    :cond_d
    if-nez p3, :cond_17

    .line 84
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Connection may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 86
    :cond_17
    if-nez p6, :cond_21

    .line 87
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Time unit may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 89
    :cond_21
    iput-object p1, p0, Lorg/apache/http/pool/PoolEntry;->id:Ljava/lang/String;

    .line 90
    iput-object p2, p0, Lorg/apache/http/pool/PoolEntry;->route:Ljava/lang/Object;

    .line 91
    iput-object p3, p0, Lorg/apache/http/pool/PoolEntry;->conn:Ljava/lang/Object;

    .line 92
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/apache/http/pool/PoolEntry;->created:J

    .line 93
    const-wide/16 v0, 0x0

    cmp-long v0, p4, v0

    if-lez v0, :cond_41

    .line 94
    iget-wide v0, p0, Lorg/apache/http/pool/PoolEntry;->created:J

    invoke-virtual {p6, p4, p5}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v2

    add-long/2addr v0, v2

    iput-wide v0, p0, Lorg/apache/http/pool/PoolEntry;->validUnit:J

    .line 98
    :goto_3c
    iget-wide v0, p0, Lorg/apache/http/pool/PoolEntry;->validUnit:J

    iput-wide v0, p0, Lorg/apache/http/pool/PoolEntry;->expiry:J

    .line 99
    return-void

    .line 96
    :cond_41
    const-wide v0, 0x7fffffffffffffffL

    iput-wide v0, p0, Lorg/apache/http/pool/PoolEntry;->validUnit:J

    goto :goto_3c
.end method


# virtual methods
.method public abstract close()V
.end method

.method public getConnection()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TC;"
        }
    .end annotation

    .prologue
    .line 121
    .local p0, "this":Lorg/apache/http/pool/PoolEntry;, "Lorg/apache/http/pool/PoolEntry<TT;TC;>;"
    iget-object v0, p0, Lorg/apache/http/pool/PoolEntry;->conn:Ljava/lang/Object;

    return-object v0
.end method

.method public getCreated()J
    .registers 3

    .prologue
    .line 125
    .local p0, "this":Lorg/apache/http/pool/PoolEntry;, "Lorg/apache/http/pool/PoolEntry<TT;TC;>;"
    iget-wide v0, p0, Lorg/apache/http/pool/PoolEntry;->created:J

    return-wide v0
.end method

.method public declared-synchronized getExpiry()J
    .registers 3

    .prologue
    .line 145
    .local p0, "this":Lorg/apache/http/pool/PoolEntry;, "Lorg/apache/http/pool/PoolEntry<TT;TC;>;"
    monitor-enter p0

    :try_start_1
    iget-wide v0, p0, Lorg/apache/http/pool/PoolEntry;->expiry:J
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return-wide v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 113
    .local p0, "this":Lorg/apache/http/pool/PoolEntry;, "Lorg/apache/http/pool/PoolEntry<TT;TC;>;"
    iget-object v0, p0, Lorg/apache/http/pool/PoolEntry;->id:Ljava/lang/String;

    return-object v0
.end method

.method public getRoute()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 117
    .local p0, "this":Lorg/apache/http/pool/PoolEntry;, "Lorg/apache/http/pool/PoolEntry<TT;TC;>;"
    iget-object v0, p0, Lorg/apache/http/pool/PoolEntry;->route:Ljava/lang/Object;

    return-object v0
.end method

.method public getState()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 133
    .local p0, "this":Lorg/apache/http/pool/PoolEntry;, "Lorg/apache/http/pool/PoolEntry<TT;TC;>;"
    iget-object v0, p0, Lorg/apache/http/pool/PoolEntry;->state:Ljava/lang/Object;

    return-object v0
.end method

.method public declared-synchronized getUpdated()J
    .registers 3

    .prologue
    .line 141
    .local p0, "this":Lorg/apache/http/pool/PoolEntry;, "Lorg/apache/http/pool/PoolEntry<TT;TC;>;"
    monitor-enter p0

    :try_start_1
    iget-wide v0, p0, Lorg/apache/http/pool/PoolEntry;->updated:J
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return-wide v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getValidUnit()J
    .registers 3

    .prologue
    .line 129
    .local p0, "this":Lorg/apache/http/pool/PoolEntry;, "Lorg/apache/http/pool/PoolEntry<TT;TC;>;"
    iget-wide v0, p0, Lorg/apache/http/pool/PoolEntry;->validUnit:J

    return-wide v0
.end method

.method public abstract isClosed()Z
.end method

.method public declared-synchronized isExpired(J)Z
    .registers 5
    .param p1, "now"    # J

    .prologue
    .line 163
    .local p0, "this":Lorg/apache/http/pool/PoolEntry;, "Lorg/apache/http/pool/PoolEntry<TT;TC;>;"
    monitor-enter p0

    :try_start_1
    iget-wide v0, p0, Lorg/apache/http/pool/PoolEntry;->expiry:J
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_c

    cmp-long v0, p1, v0

    if-ltz v0, :cond_a

    const/4 v0, 0x1

    :goto_8
    monitor-exit p0

    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_8

    :catchall_c
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setState(Ljava/lang/Object;)V
    .registers 2
    .param p1, "state"    # Ljava/lang/Object;

    .prologue
    .line 137
    .local p0, "this":Lorg/apache/http/pool/PoolEntry;, "Lorg/apache/http/pool/PoolEntry<TT;TC;>;"
    iput-object p1, p0, Lorg/apache/http/pool/PoolEntry;->state:Ljava/lang/Object;

    .line 138
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 179
    .local p0, "this":Lorg/apache/http/pool/PoolEntry;, "Lorg/apache/http/pool/PoolEntry<TT;TC;>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 180
    .local v0, "buffer":Ljava/lang/StringBuilder;
    const-string v1, "[id:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 181
    iget-object v1, p0, Lorg/apache/http/pool/PoolEntry;->id:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 182
    const-string v1, "][route:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 183
    iget-object v1, p0, Lorg/apache/http/pool/PoolEntry;->route:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 184
    const-string v1, "][state:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 185
    iget-object v1, p0, Lorg/apache/http/pool/PoolEntry;->state:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 186
    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 187
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public declared-synchronized updateExpiry(JLjava/util/concurrent/TimeUnit;)V
    .registers 10
    .param p1, "time"    # J
    .param p3, "tunit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 149
    .local p0, "this":Lorg/apache/http/pool/PoolEntry;, "Lorg/apache/http/pool/PoolEntry<TT;TC;>;"
    monitor-enter p0

    if-nez p3, :cond_e

    .line 150
    :try_start_3
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Time unit may not be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_b
    .catchall {:try_start_3 .. :try_end_b} :catchall_b

    .line 149
    :catchall_b
    move-exception v2

    monitor-exit p0

    throw v2

    .line 152
    :cond_e
    :try_start_e
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, p0, Lorg/apache/http/pool/PoolEntry;->updated:J

    .line 154
    const-wide/16 v2, 0x0

    cmp-long v2, p1, v2

    if-lez v2, :cond_2c

    .line 155
    iget-wide v2, p0, Lorg/apache/http/pool/PoolEntry;->updated:J

    invoke-virtual {p3, p1, p2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v4

    add-long v0, v2, v4

    .line 159
    .local v0, "newExpiry":J
    :goto_22
    iget-wide v2, p0, Lorg/apache/http/pool/PoolEntry;->validUnit:J

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v2

    iput-wide v2, p0, Lorg/apache/http/pool/PoolEntry;->expiry:J
    :try_end_2a
    .catchall {:try_start_e .. :try_end_2a} :catchall_b

    .line 160
    monitor-exit p0

    return-void

    .line 157
    .end local v0    # "newExpiry":J
    :cond_2c
    const-wide v0, 0x7fffffffffffffffL

    .restart local v0    # "newExpiry":J
    goto :goto_22
.end method
