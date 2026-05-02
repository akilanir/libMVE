.class Lcom/mongodb/LatencyMinimizingServerSelector;
.super Ljava/lang/Object;
.source "LatencyMinimizingServerSelector.java"

# interfaces
.implements Lcom/mongodb/ServerSelector;


# instance fields
.field private final acceptableLatencyDifferenceNanos:J


# direct methods
.method constructor <init>(JLjava/util/concurrent/TimeUnit;)V
    .registers 6
    .param p1, "acceptableLatencyDifference"    # J
    .param p3, "timeUnit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    sget-object v0, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, p1, p2, p3}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/mongodb/LatencyMinimizingServerSelector;->acceptableLatencyDifferenceNanos:J

    .line 33
    return-void
.end method

.method private getBestLatencyNanos(Ljava/util/Set;)J
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Lcom/mongodb/ServerDescription;",
            ">;)J"
        }
    .end annotation

    .prologue
    .line 48
    .local p1, "members":Ljava/util/Set;, "Ljava/util/Set<Lcom/mongodb/ServerDescription;>;"
    const-wide v0, 0x7fffffffffffffffL

    .line 49
    .local v0, "bestPingTime":J
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :cond_9
    :goto_9
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_28

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mongodb/ServerDescription;

    .line 50
    .local v2, "cur":Lcom/mongodb/ServerDescription;
    invoke-virtual {v2}, Lcom/mongodb/ServerDescription;->isOk()Z

    move-result v4

    if-eqz v4, :cond_9

    .line 53
    invoke-virtual {v2}, Lcom/mongodb/ServerDescription;->getAverageLatencyNanos()J

    move-result-wide v4

    cmp-long v4, v4, v0

    if-gez v4, :cond_9

    .line 54
    invoke-virtual {v2}, Lcom/mongodb/ServerDescription;->getAverageLatencyNanos()J

    move-result-wide v0

    goto :goto_9

    .line 57
    .end local v2    # "cur":Lcom/mongodb/ServerDescription;
    :cond_28
    return-wide v0
.end method

.method private getServersWithAcceptableLatencyDifference(Ljava/util/Set;J)Ljava/util/List;
    .registers 11
    .param p2, "bestPingTime"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Lcom/mongodb/ServerDescription;",
            ">;J)",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/ServerDescription;",
            ">;"
        }
    .end annotation

    .prologue
    .line 62
    .local p1, "servers":Ljava/util/Set;, "Ljava/util/Set<Lcom/mongodb/ServerDescription;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-interface {p1}, Ljava/util/Set;->size()I

    move-result v3

    invoke-direct {v1, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 63
    .local v1, "goodSecondaries":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/ServerDescription;>;"
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_d
    :goto_d
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2e

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/ServerDescription;

    .line 64
    .local v0, "cur":Lcom/mongodb/ServerDescription;
    invoke-virtual {v0}, Lcom/mongodb/ServerDescription;->isOk()Z

    move-result v3

    if-eqz v3, :cond_d

    .line 67
    invoke-virtual {v0}, Lcom/mongodb/ServerDescription;->getAverageLatencyNanos()J

    move-result-wide v3

    iget-wide v5, p0, Lcom/mongodb/LatencyMinimizingServerSelector;->acceptableLatencyDifferenceNanos:J

    sub-long/2addr v3, v5

    cmp-long v3, v3, p2

    if-gtz v3, :cond_d

    .line 68
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_d

    .line 71
    .end local v0    # "cur":Lcom/mongodb/ServerDescription;
    :cond_2e
    return-object v1
.end method


# virtual methods
.method public choose(Lcom/mongodb/ClusterDescription;)Ljava/util/List;
    .registers 5
    .param p1, "clusterDescription"    # Lcom/mongodb/ClusterDescription;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mongodb/ClusterDescription;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/ServerDescription;",
            ">;"
        }
    .end annotation

    .prologue
    .line 37
    invoke-virtual {p1}, Lcom/mongodb/ClusterDescription;->getAll()Ljava/util/Set;

    move-result-object v0

    invoke-virtual {p1}, Lcom/mongodb/ClusterDescription;->getAll()Ljava/util/Set;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/mongodb/LatencyMinimizingServerSelector;->getBestLatencyNanos(Ljava/util/Set;)J

    move-result-wide v1

    invoke-direct {p0, v0, v1, v2}, Lcom/mongodb/LatencyMinimizingServerSelector;->getServersWithAcceptableLatencyDifference(Ljava/util/Set;J)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 6

    .prologue
    .line 42
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "LatencyMinimizingServerSelector{acceptableLatencyDifference="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    iget-wide v2, p0, Lcom/mongodb/LatencyMinimizingServerSelector;->acceptableLatencyDifferenceNanos:J

    sget-object v4, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v1, v2, v3, v4}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ms"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
