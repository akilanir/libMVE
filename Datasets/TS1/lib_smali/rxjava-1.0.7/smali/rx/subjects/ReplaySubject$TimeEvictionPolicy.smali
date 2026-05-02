.class final Lrx/subjects/ReplaySubject$TimeEvictionPolicy;
.super Ljava/lang/Object;
.source "ReplaySubject.java"

# interfaces
.implements Lrx/subjects/ReplaySubject$EvictionPolicy;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/subjects/ReplaySubject;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "TimeEvictionPolicy"
.end annotation


# instance fields
.field final maxAgeMillis:J

.field final scheduler:Lrx/Scheduler;


# direct methods
.method public constructor <init>(JLrx/Scheduler;)V
    .registers 4
    .param p1, "maxAgeMillis"    # J
    .param p3, "scheduler"    # Lrx/Scheduler;

    .prologue
    .line 850
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 851
    iput-wide p1, p0, Lrx/subjects/ReplaySubject$TimeEvictionPolicy;->maxAgeMillis:J

    .line 852
    iput-object p3, p0, Lrx/subjects/ReplaySubject$TimeEvictionPolicy;->scheduler:Lrx/Scheduler;

    .line 853
    return-void
.end method


# virtual methods
.method public evict(Lrx/subjects/ReplaySubject$NodeList;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/subjects/ReplaySubject$NodeList",
            "<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 857
    .local p1, "t1":Lrx/subjects/ReplaySubject$NodeList;, "Lrx/subjects/ReplaySubject$NodeList<Ljava/lang/Object;>;"
    iget-object v3, p0, Lrx/subjects/ReplaySubject$TimeEvictionPolicy;->scheduler:Lrx/Scheduler;

    invoke-virtual {v3}, Lrx/Scheduler;->now()J

    move-result-wide v1

    .line 858
    .local v1, "now":J
    :goto_6
    invoke-virtual {p1}, Lrx/subjects/ReplaySubject$NodeList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1c

    .line 859
    iget-object v3, p1, Lrx/subjects/ReplaySubject$NodeList;->head:Lrx/subjects/ReplaySubject$NodeList$Node;

    iget-object v0, v3, Lrx/subjects/ReplaySubject$NodeList$Node;->next:Lrx/subjects/ReplaySubject$NodeList$Node;

    .line 860
    .local v0, "n":Lrx/subjects/ReplaySubject$NodeList$Node;, "Lrx/subjects/ReplaySubject$NodeList$Node<Ljava/lang/Object;>;"
    iget-object v3, v0, Lrx/subjects/ReplaySubject$NodeList$Node;->value:Ljava/lang/Object;

    invoke-virtual {p0, v3, v1, v2}, Lrx/subjects/ReplaySubject$TimeEvictionPolicy;->test(Ljava/lang/Object;J)Z

    move-result v3

    if-eqz v3, :cond_1c

    .line 861
    invoke-virtual {p1}, Lrx/subjects/ReplaySubject$NodeList;->removeFirst()Ljava/lang/Object;

    goto :goto_6

    .line 866
    .end local v0    # "n":Lrx/subjects/ReplaySubject$NodeList$Node;, "Lrx/subjects/ReplaySubject$NodeList$Node<Ljava/lang/Object;>;"
    :cond_1c
    return-void
.end method

.method public evictFinal(Lrx/subjects/ReplaySubject$NodeList;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/subjects/ReplaySubject$NodeList",
            "<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 870
    .local p1, "t1":Lrx/subjects/ReplaySubject$NodeList;, "Lrx/subjects/ReplaySubject$NodeList<Ljava/lang/Object;>;"
    iget-object v3, p0, Lrx/subjects/ReplaySubject$TimeEvictionPolicy;->scheduler:Lrx/Scheduler;

    invoke-virtual {v3}, Lrx/Scheduler;->now()J

    move-result-wide v1

    .line 871
    .local v1, "now":J
    :goto_6
    iget v3, p1, Lrx/subjects/ReplaySubject$NodeList;->size:I

    const/4 v4, 0x1

    if-le v3, v4, :cond_1b

    .line 872
    iget-object v3, p1, Lrx/subjects/ReplaySubject$NodeList;->head:Lrx/subjects/ReplaySubject$NodeList$Node;

    iget-object v0, v3, Lrx/subjects/ReplaySubject$NodeList$Node;->next:Lrx/subjects/ReplaySubject$NodeList$Node;

    .line 873
    .local v0, "n":Lrx/subjects/ReplaySubject$NodeList$Node;, "Lrx/subjects/ReplaySubject$NodeList$Node<Ljava/lang/Object;>;"
    iget-object v3, v0, Lrx/subjects/ReplaySubject$NodeList$Node;->value:Ljava/lang/Object;

    invoke-virtual {p0, v3, v1, v2}, Lrx/subjects/ReplaySubject$TimeEvictionPolicy;->test(Ljava/lang/Object;J)Z

    move-result v3

    if-eqz v3, :cond_1b

    .line 874
    invoke-virtual {p1}, Lrx/subjects/ReplaySubject$NodeList;->removeFirst()Ljava/lang/Object;

    goto :goto_6

    .line 879
    .end local v0    # "n":Lrx/subjects/ReplaySubject$NodeList$Node;, "Lrx/subjects/ReplaySubject$NodeList$Node<Ljava/lang/Object;>;"
    :cond_1b
    return-void
.end method

.method public test(Ljava/lang/Object;J)Z
    .registers 9
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "now"    # J

    .prologue
    .line 883
    move-object v0, p1

    check-cast v0, Lrx/schedulers/Timestamped;

    .line 884
    .local v0, "ts":Lrx/schedulers/Timestamped;, "Lrx/schedulers/Timestamped<*>;"
    invoke-virtual {v0}, Lrx/schedulers/Timestamped;->getTimestampMillis()J

    move-result-wide v1

    iget-wide v3, p0, Lrx/subjects/ReplaySubject$TimeEvictionPolicy;->maxAgeMillis:J

    sub-long v3, p2, v3

    cmp-long v1, v1, v3

    if-gtz v1, :cond_11

    const/4 v1, 0x1

    :goto_10
    return v1

    :cond_11
    const/4 v1, 0x0

    goto :goto_10
.end method
